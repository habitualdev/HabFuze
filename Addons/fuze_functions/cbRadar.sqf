params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];
if (_projectile isKindOf "ShellBase" || _projectile isKindOf "SubmunitionBase" || _projectile isKindOf "MissileBase") then {
    rif = missionNamespace getVariable "roundsInFlight";
    rif pushBack _projectile;
    [_projectile] spawn {
        params ["_proj"];
        waitUntil {sleep .1; !(alive _proj)};
        rif = missionNamespace getVariable "roundsInFlight";
        rif = rif deleteAt (rif find _proj);
    };
};