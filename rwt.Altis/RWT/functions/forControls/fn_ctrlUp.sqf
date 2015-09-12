private ["_control","_dikcode","_keyshift","_keyctrl","_keyalt"];
_control = _this select 0;
_dikcode = _this select 1;
_keyshift = _this select 2;
_keyctrl = _this select 3;
_keyalt = _this select 4;

if (_dikcode == 42) then {
	// Control key has been released
	RWT_SMART_CTRL_PRESSED = false;
};

// Exiting event handler
false;