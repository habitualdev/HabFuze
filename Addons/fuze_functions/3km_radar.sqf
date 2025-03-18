activeMarkers = [];
radar3km = _this select 0;
[radar3km, true, [0, 2, 0], 45, true, true] call ace_dragging_fnc_setDraggable;
detectionRange = 3000;
trackedPlayers = [];

addPlayerToTrackedList = {
    params ["_player"];
    if (!(_player in trackedPlayers)) then {
        trackedPlayers pushBack _player;
    };
};

removePlayerFromTrackedList = {
    params ["_player"];
    if (_player in trackedPlayers) then {
        trackedPlayers deleteAt (trackedPlayers find _player);
    };
};

radar3km addAction ["Add Player to Tracked List", {
    params ["_target", "_caller"];
    [_caller] call addPlayerToTrackedList;
}];

radar3km addAction ["Remove Player from Tracked List", {
    params ["_target", "_caller"];
    [_caller] call removePlayerFromTrackedList;
}];

adjustMarkerAlpha = {
    {
        if ((markerText _x == "Estimated Shell Origin") ||(markerText _x == "Unk. Shell") ||(markerText _x == "Unk. Missile") ||(markerText _x == "Unk. Submunition")|| (markerText _x == "Unk. Munition") || (markerText _x == "Estimated Missile Origin") || (markerText _x == "Estimated Submunition Origin") )  then {
            private _markerPos = getMarkerPos _x;
                [_x, 0.7] remoteExec ["setMarkerAlphaLocal", trackedPlayers];
        };
    } forEach allMapMarkers;
};

originEstimate = {
    params ["_currentProjectile"];

    private _currentPosition = getPos _currentProjectile;
    private _velocity = velocity _currentProjectile;
    private _gravity = 9.81;
    private _time = 0.1;
    private _maxTime = 10;
    private _originPoint = _currentPosition;

    for "_time" from 0.1 to _maxTime step 0.1 do {
        private _newPosition = [
            (_currentPosition select 0) - (_velocity select 0 * _time),
            (_currentPosition select 1) - (_velocity select 1 * _time),
            (_currentPosition select 2) - (0.5 * _gravity * _time * _time)
        ];

        if ((getTerrainHeightASL[_currentPosition select 0, _currentPosition select 1]) > (_currentPosition select 2)) then {
            _originPoint = _newPosition;
            break;
        };
    };

    private _markerName = format ["originEstimateMarker_%1", time];
    private _marker = createMarker [_markerName, _originPoint];
    _marker setMarkerType "mil_circle";
    if (_currentProjectile isKindOf "ShellBase") then {
        _marker setMarkerText "Estimated Shell Origin";
        _marker setMarkerSize [.1, .1];
        _marker setMarkerColor "ColorRed";
    };

    if (_currentProjectile isKindOf "MissileBase") then {
        _marker setMarkerText "Estimated Missile Origin";
        _marker setMarkerSize [.1, .1];
        _marker setMarkerColor "ColorBlue";
    };

    if (_currentProjectile isKindOf "SubmunitionBase") then {
        _marker setMarkerText "Estimated Submunition Origin";
        _marker setMarkerSize [.1, .1];
        _marker setMarkerColor "ColorOrange";
    };
    _marker setMarkerAlpha 0;
};
missionNamespace setVariable ["roundsInFlight", []];
[] spawn {
    while {true} do {
        if (!alive radar3km) exitWith {};
        _list = missionNamespace getVariable "roundsInFlight";
        {
                private _markerName = format ["shellInFlightMarker_%1", _x];

                if (!(_markerName in activeMarkers)) then {
                    if (getPos radar3km distance getPos _x < detectionRange) then {
                        _ins = terrainIntersect [getPos radar3km, getPos _x];
                        if !(_ins) then {
                            activeMarkers pushBack _markerName;
                            _marker = createMarker [_markerName, getPos _x, 1, objNull];
                            _marker setMarkerType "mil_triangle";
                            if (_x isKindOf "ShellBase") then {
                                _marker setMarkerText "Unk. Shell";
                                _marker setMarkerColor "ColorOrange";
                            };
                            if (_x isKindOf "MissileBase") then {
                                _marker setMarkerText "Unk. Missile";
                                _marker setMarkerColor "ColorRed";
                            };
                            if (_x isKindOf "SubmunitionBase") then {
                                _marker setMarkerText "Unk. Submunition";
                                _marker setMarkerColor "ColorOrange";
                            };
                            _marker setMarkerAlpha 0;

                            private _currentProjectile = _x;
                            [_x] call originEstimate;
                            [_currentProjectile, _markerName] spawn {
                                params ["_proj", "_marker"];

                                while {alive _proj} do {
                                    if (getPos radar3km distance getPos _proj >= detectionRange) then {
                                        deleteMarker _marker;
                                        activeMarkers deleteAt (activeMarkers find _marker);
                                        break;
                                    };
                                    _marker setMarkerPos getPos _proj;
                                    sleep 0.1;
                                };
                                deleteMarker _marker;
                                activeMarkers deleteAt (activeMarkers find _marker);
                            };
                        };
                    };
                };
        } forEach _list;
        [] call adjustMarkerAlpha;
        sleep .25;
    };
};

removeAllOriginMarkers = {
    {
        if ((markerText _x == "Estimated Shell Origin") || (markerText _x == "Estimated Missile Origin") || (markerText _x == "Estimated Submunition Origin")) then {
            deleteMarker _x;
        };
    } forEach allMapMarkers;
};

radar3km addAction ["Remove All Estimated Origin Markers", {
    [] call removeAllOriginMarkers;
}, nil, 1.5, true, true, "", "true", 5, false, "",""];