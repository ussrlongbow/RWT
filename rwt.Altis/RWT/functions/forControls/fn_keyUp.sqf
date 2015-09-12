private ["_handled","_control","_dikcode","_keyshift","_keyctrl","_keyalt"];
_control = _this select 0;
_dikcode = _this select 1;
_keyshift = _this select 2;
_keyctrl = _this select 3;
_keyalt = _this select 4;

_handled = false;

if ((str _dikcode) == RWT_SMART_KEY) then {
	// processing smart key release
	/*
	RWT_SMART_KEY_RELEASED = true;
	[] spawn {
		// reset release state after double tap lag time
		sleep RWT_DOUBLE_TAP_LAG;
		RWT_SMART_KEY_RELEASED = false;
		// smart key is not pressed from now
		RWT_SMART_KEY_PRESSED = false;
		_handled = true;
	};
	*/
};

// Exiting event handler
_handled;