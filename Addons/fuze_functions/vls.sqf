fireAtGrid = {
params ["_gridE", "_gridN", "_launcher"];
private _x = parseNumber (_gridE);
private _y = parseNumber (_gridN);
private _z = getTerrainHeightASL [_x, _y];
private _targetPos = [_x, _y, _z];
hint format ["Target Position: %1", _targetPos];
private _target = "CBA_O_InvisibleTargetVehicle" createVehicle  _targetPos;

west reportRemoteTarget [_target, 3000];
_target confirmSensorTarget [west, true];
if (!isNull _launcher) then {
[_launcher, _target] spawn {
    params ["_launcher", "_target"];
    _i = 0;
    while {_i < 4} do {
        _i = _i + 1;
        playSound "Alarm";
        _sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
        waitUntil {isNull _sound};
    };
    _launcher fireAtTarget [_target, "weapon_vls_01"];
    };
};
};

launcher = _this select 0;

launcher addAction ["Launch At Grid", {
		disableSerialization;
		private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
		private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
		private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
		IDD_EDIT_BOXE = 123;
		IDD_EDIT_BOXN = 124;
		private _ctrlEditE = _display ctrlCreate ["RscEditMulti", IDD_EDIT_BOXE, _ctrlGroup];
		private _ctrlEditN = _display ctrlCreate ["RscEditMulti", IDD_EDIT_BOXN, _ctrlGroup];
		private _launchButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
        private _ctrlEast = _display ctrlCreate ["RscText", -1, _ctrlGroup];
        private _ctrlNorth = _display ctrlCreate ["RscText", -1, _ctrlGroup];

		_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
		_ctrlGroup ctrlCommit 0;
		_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.35];
		_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
        _ctrlBackground ctrlSetText "Enter Grid Coordinates";
		_ctrlBackground ctrlEnable false;
		_ctrlBackground ctrlCommit 0;

		_ctrlEast ctrlSetPosition [0.01, 0.05, 0.48, 0.05];
		_ctrlEast ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_ctrlEast ctrlSetText "Easting";
		_ctrlEast ctrlCommit 0;

		_ctrlEditE ctrlSetPosition [0.01, 0.10, 0.48, 0.05];
		_ctrlEditE ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_ctrlEditE ctrlCommit 0;

        _ctrlNorth ctrlSetPosition [0.01, 0.15, 0.48, 0.05];
        _ctrlNorth ctrlSetBackgroundColor [0, 0, 0, 0.5];
        _ctrlNorth ctrlSetText "Northing";
        _ctrlNorth ctrlCommit 0;

		_ctrlEditN ctrlSetPosition [0.01, 0.20, 0.48, 0.05];
		_ctrlEditN ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_ctrlEditN ctrlCommit 0;




		_launchButton ctrlSetPosition [0.19, 0.25, 0.13, 0.05];
		_launchButton ctrlCommit 0;
		_launchButton ctrlSetText "Launch";
		_launchButton ctrlAddEventHandler ["ButtonClick",
		{
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_textE = ctrlText (_display displayCtrl IDD_EDIT_BOXE);
			if (_textE == "") then { _display closeDisplay 1; } else {
                _textN = ctrlText (_display displayCtrl IDD_EDIT_BOXN);
                if (_textN == "") then { _display closeDisplay 1; } else {
                    [_textE, _textN, launcher] call fireAtGrid;
                    _display closeDisplay 1;
                };
            };


			_display closeDisplay 1;
		}];


		ctrlSetFocus _ctrlEditE;
		_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
		_ctrlGroup ctrlCommit 0.1;
		playSound "Hint3";
	}];