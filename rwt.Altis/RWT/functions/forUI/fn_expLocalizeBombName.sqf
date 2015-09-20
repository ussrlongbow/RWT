// Localize Bomb name
private ["_control","_type","_localized"];

disableSerialization;

_control = _this select 0;

// Get the classname of bomb we planted (from CfgAmmo)
_type = player getVariable ["rwt_explosives_curr_type",""];

// Get localized name of the bomb
_localized = call compile format ["localize 'STR_RWT_UI_%1'",_type];

_control ctrlSetText _localized;