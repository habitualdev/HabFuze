_thisCrate = _this;
detachCrate = {
    _crate = _this select 0;
    detach _crate;
    _crate enableSimulation false;
    _crate enableSimulation true;
    };

attachCrate = {
    _player = _this select 1;
    _crate = _this select 0;
    _crate attachTo [_player,[0,-.19,0], "spine3", true];
    _crate setVectorUp [0,1,.2];
    _crate setVectorDir (vectorDir _crate);
    _crate setPosWorld getPosWorld _crate;
    };

_attachCondition = {
_crate = _this select 0;
_player = _this select 1;
_hasBackpack = backpack _player;
if (_hasBackpack != "") then {
    false
} else {
    _attachedObject = attachedTo _crate;
    if !(isNull _attachedObject) then {
        if (typeOf _attachedObject == "ace_csw_mortarBaseplate") then {
            true
        }
        else {
            false
        }
    } else {
        true
    }
}
    };

_detachCondition = {
    _crate = _this select 0;
    !(isNull attachedTo _crate)
    };

attachBaseplate = {
    _crate = _this select 0;
    _nearestBaseplateList = position _crate nearObjects ["ace_csw_mortarBaseplate", 2];
    if (count _nearestBaseplateList == 0) exitWith {};
    _nearestBaseplate = _nearestBaseplateList select 0;
    _crate setVariable ["attachedBaseplate", _nearestBaseplate];
    _crate setVariable ["isBaseplateAttached", true];
    _nearestBaseplate attachTo [_crate,[0,0,-0.05]];
    _nearestBaseplate setVectorUp [0,1,0];
    _nearestBaseplate setPosWorld getPosWorld _nearestBaseplate;
    };

_attachBaseplateCondition = {
    _crate = _this select 0;
    _attachedBaseplate = _crate getVariable ["isBaseplateAttached", false];
    if (_attachedBaseplate) then {
        false
    } else {
        true
    }
    };

detachBaseplate = {
    _crate = _this select 0;
    _attachedBaseplate = _crate getVariable ["attachedBaseplate", nil];
    _isAttached = _crate getVariable ["isBaseplateAttached", false];
    if (!_isAttached) exitWith {};
    detach _attachedBaseplate;
    _attachedBaseplate enableSimulation false;
    _attachedBaseplate enableSimulation true;
    _crate setVariable ["attachedBaseplate", nil];
    _crate setVariable ["isBaseplateAttached", false];
    };

_detachBaseplateCondition = {
    _crate = _this select 0;
    _attachedBaseplate = _crate getVariable ["isBaseplateAttached", false];
    if (_attachedBaseplate) then {
        true
    } else {
        false
    }
    };


_actionCarry = ["CarryCrate", "Carry Crate","", attachCrate, _attachCondition,{}] call ace_interact_menu_fnc_createAction;
[_thisCrate, 0, ["ACE_MainActions"], _actionCarry] call ace_interact_menu_fnc_addActionToObject;
_actionDetach = ["DetachCrate", "Drop Crate","", detachCrate, _detachCondition,{}, [parameters],[-1,.5,1]] call ace_interact_menu_fnc_createAction;
[_thisCrate, 0, ["ACE_MainActions"], _actionDetach] call ace_interact_menu_fnc_addActionToObject;
_actionAttach = ["AttachPlate", "Attach Base Plate","", attachBaseplate, _attachBaseplateCondition,{}] call ace_interact_menu_fnc_createAction;
[_thisCrate, 0, ["ACE_MainActions"], _actionAttach] call ace_interact_menu_fnc_addActionToObject;
_actionDetachBaseplate = ["DetachBaseplate", "Detach Baseplate","", detachBaseplate, _detachBaseplateCondition,{}] call ace_interact_menu_fnc_createAction;
[_thisCrate, 0, ["ACE_MainActions"], _actionDetachBaseplate] call ace_interact_menu_fnc_addActionToObject;
