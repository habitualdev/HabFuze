params ["_projectile", "_guidanceArgs"];

// gyro waits for downward movement
if (((velocity _projectile) select 2) > -2) exitWith { false };
_shooterInfo = _guidanceArgs select 1;
_laserInfo = _shooterInfo select 5;
_laserCode = _laserInfo select 0;

_seekerFOV = 90;
_seekerRange = 2000;

private _seekerWavelength = [1550, 1550]; // Common for laser-guided rounds

// Get projectile position and direction
private _posProj = getPosASL _projectile;
private _dirProj = velocity _projectile; // Seeker looks forward
    private _laserDataArgs = [
        _posProj,
        _dirProj,
        _seekerFOV,
        _seekerRange,
        _seekerWavelength,
        _laserCode,
        objNull, // Ignore first object (e.g., player's vehicle)
        objNull, // Ignore second object (e.g., attached object)
        []       // List of owners to ignore
    ];

    _laserData = _laserDataArgs call ace_laser_fnc_seekerFindLaserSpot;
    systemChat str _laserData;
    // Check if a laser spot was found
    if !(_laserData isEqualTo [[], objNull]) then {
        private _laserPos = _laserData select 0;
        private _laserOwner = _laserData select 1;

        if (!isNull _laserOwner) then {
            // OPTIONAL: Trigger detonation or submunition deployment
            //_projectile setDamage 1; // Uncomment to detonate
            true
        } else {
            false
        };
    } else {
        false
    };