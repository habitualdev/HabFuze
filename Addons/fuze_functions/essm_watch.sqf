[_this] spawn {
    while {true} do {
    _radar = _this select 0;
    if (!alive _radar) exitWith {
        hint "Radar is dead.";
    };
    _targets = getSensorTargets _radar;
    _filteredTargets = _targets select {
    (_x select 2) isEqualTo "unknown" && ("activeradar" in (_x select 3))
        };

    if (count _filteredTargets == 0) exitWith {
        hint "No suitable targets with activeradar detected.";
    };
    private _radarPos = getPosASL _radar;

    private _closestTarget = _filteredTargets select 0;
    _radar lookAt (_closestTarget select 0);
    _radar doTarget (_closestTarget select 0);
    _radar fireAtTarget [(_closestTarget select 0)];

    sleep .1;
    };
}