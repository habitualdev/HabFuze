activeMarkers = [];
radar10km = _this select 0;
detectionRange = 10000;
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

radar10km addAction ["Add Player to Tracked List", {
    params ["_target", "_caller"];
    [_caller] call addPlayerToTrackedList;
}];

radar10km addAction ["Remove Player from Tracked List", {
    params ["_target", "_caller"];
    [_caller] call removePlayerFromTrackedList;
}];

adjustMarkerAlpha = {
    {
        if ((markerText _x == "Estimated Origin") ||(markerText _x == "Unk. Shell") || (markerText _x == "Unk. Munition")) then {
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
    hint format ["_velocity: %1      _currentPosition: %2", _velocity, _currentPosition];
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
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText "Estimated Origin";
    _marker setMarkerSize [.1, .1];
    _marker setMarkerAlpha 0;
};




[] spawn {
    while {true} do {
        if (!alive radar10km) exitWith {};
        _listShell = radar10km nearObjects ["ShellBase", detectionRange];
        _listRocket = radar10km nearObjects ["SubmunitionBase", detectionRange];
        _list = _listShell + _listRocket;


        {
                        private _markerName = format ["shellInFlightMarker_%1", _x];

                        if (!(_markerName in activeMarkers)) then {
                            if (getPos radar10km distance getPos _x < detectionRange) then {
                                _ins = terrainIntersect [getPos radar10km, getPos _x];
                                if !(_ins) then {
                                    activeMarkers pushBack _markerName;
                                    _marker = createMarker [_markerName, getPos _x, 1, objNull];
                                    _marker setMarkerType "mil_triangle";
                                    _marker setMarkerColor "ColorOrange";
                                    _marker setMarkerText "Unk. Munition";
                                    _marker setMarkerAlpha 0;

                                    private _currentProjectile = _x;
                                    [_x] call originEstimate;
                                    [_currentProjectile, _markerName] spawn {
                                        params ["_proj", "_marker"];

                                        while {alive _proj} do {
                                            if (getPos radar10km distance getPos _proj >= detectionRange) then {
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
        if (markerText _x == "Estimated Origin") then {
            deleteMarker _x;
        };
    } forEach allMapMarkers;
};

radar10km addAction ["Remove All Estimated Origin Markers", {
    [] call removeAllOriginMarkers;
}, nil, 1.5, true, true, "", "true", 5, false, "",""];