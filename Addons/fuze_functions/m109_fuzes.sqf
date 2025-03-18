	fn_HabFuze_WP_155_smoke = {
            private ["_smokegen", "_smokegen2", "_pos", "_pos2"];

            if (!hasinterface) exitwith {};

            _pos = [(_this select 0), _this select 1, 0];
            _pos2 = [((_this select 0)+5), _this select 1, 0];

            _smokegen = "#particlesource" createvehicle _pos;
            _smokegen setPosATL _pos;
            _smokegen setParticleClass "HabFuze_WPLinger_155";

            sleep 75.0;
            deletevehicle _smokegen;
        };

    fn_HabFuze_HC_155_smoke = {
                private ["_smokegen", "_smokegen2", "_pos", "_pos2"];

                if (!hasinterface) exitwith {};

                _pos = [(_this select 0), _this select 1, 0];
                _pos2 = [((_this select 0)+5), _this select 1, 0];

                _smokegen = "#particlesource" createvehicle _pos;
                _smokegen setPosATL _pos;
                _smokegen setParticleClass "HabFuze_HCLinger_155";

                sleep 75.0;
                deletevehicle _smokegen;
            };

	thisgun = _this select 0;
	private _gunName = getObjectID thisgun;
	explosionType = "Sh_155mm_AMOS";
	
	missionNamespace setVariable [_gunName,["IMPACT",1.0],true];
	
	thisgun addAction ["Edit Fuze Settings", {
		disableSerialization;
		private _thisObject = _this select 0;
		gunName = getObjectID _thisObject;
		publicVariable "gunName";
		private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
		private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
		private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
		private _fuze = missionNamespace getVariable gunName;
		IDD_EDIT_BOX = 123;
		private _ctrlEdit = _display ctrlCreate ["RscEditMulti", IDD_EDIT_BOX, _ctrlGroup];
		private _impactButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
		private _timedButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
		private _proxButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
		_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
		_ctrlGroup ctrlCommit 0;
		_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.3];
		_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
		
		private _fuzeMod = _fuze select 1;
		private _fuzeType = _fuze select 0;
		
		_ctrlBackground ctrlSetText str _fuzeMod + "|" + _fuzeType;
		_ctrlBackground ctrlEnable false;
		_ctrlBackground ctrlCommit 0;
		_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.48, 0.1];
		_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
		_ctrlEdit ctrlCommit 0;
		
		_impactButton ctrlSetPosition [0.05, 0.21, 0.13, 0.05];
		_impactButton ctrlCommit 0;
		_impactButton ctrlSetText "IMPACT";
		_impactButton ctrlAddEventHandler ["ButtonClick",
		{
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
			if (_text == "") then { _text = "10.0" };
			missionNamespace setVariable [gunName,["IMPACT", parseNumber _text],true];
		
			_display closeDisplay 1;
		}];
		
		_proxButton ctrlSetPosition [0.19, 0.21, 0.13, 0.05];
		_proxButton ctrlCommit 0;
		_proxButton ctrlSetText "PROX";
		_proxButton ctrlAddEventHandler ["ButtonClick",
		{
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
			if (_text == "") then { _text = "10.0" };
			missionNamespace setVariable [gunName,["PROX", parseNumber _text],true];
			
			_display closeDisplay 1;
		}];
		
		_timedButton ctrlSetPosition [0.33, 0.21, 0.13, 0.05];
		_timedButton ctrlCommit 0;
		_timedButton ctrlSetText "TIMED";
		_timedButton ctrlAddEventHandler ["ButtonClick",
		{
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
			if (_text == "") then { _text = "10.0" };
			
			missionNamespace setVariable [gunName,["TIMED", parseNumber _text],true];
		
			
			_display closeDisplay 1;
		}];
		
		ctrlSetFocus _ctrlEdit;
		_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
		_ctrlGroup ctrlCommit 0.1;
		playSound "Hint3";
	}];
	
	
	
	thisgun addEventHandler ["Fired", 
	{_this spawn {
			_gun = _this select 0;
			_ammo = _this select 4;
			private _projectile = _this select 6;
			gunName = getObjectID _gun;
			private _fuze = missionNamespace getVariable gunName;
            if ((typeOf _projectile) isEqualTo "Sh_155mm_AMOS") then {
            _fuzeName = _fuze select 0;
            switch (_fuzeName) do {
                case "IMPACT":{
                    if (true) exitWith {};
                    };
                case "PROX":{
                    private _thisGun =  _this select 0;
                    private _gunPosition = getPosATL _thisGun;
                    private _shell = _this select 6;
                    private _explosionType = "Sh_155mm_AMOS";
                    private _proxDistance = _fuze select 1;
                    waitUntil {
                        private _shellPos = getPos _shell;
                        private _distance = _shellPos distance _gunPosition;
                        _distance > 100;
                    };

                    while {alive _shell} do {
                        private _shellPos = getPos _shell;
                        private _shellGroundAlt = getPosATL _shell select 2;

                        if (_shellGroundAlt <= _proxDistance) then {
                            _explosion = _explosionType createVehicle _shellPos;
                            "habfuze_155mm" createVehicle _shellPos;
                            deleteVehicle _shell;
                            deleteVehicle _explosion;
                        };

                        sleep 0.01;
                    };
                };
                case "TIMED":{
                    private _shell = _this select 6;
                    private _proxDistance = _fuze select 1;
                    sleep _proxDistance;
                     private _shellPos = getPos _shell;
                    _explosion = explosionType createVehicle _shellPos;
                    "habfuze_155mm" createVehicle _shellPos;
                    deleteVehicle _shell;
                    deleteVehicle _explosion;

                };

            };
            };
        };
	    }];

