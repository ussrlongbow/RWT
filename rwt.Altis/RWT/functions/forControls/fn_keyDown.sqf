private ["_handled","_control","_dikcode","_keyshift","_keyctrl","_keyalt","_dialog"];
_control = _this select 0;
_dikcode = _this select 1;
_keyshift = _this select 2;
_keyctrl = _this select 3;
_keyalt = _this select 4;

_handled = false;

if ((str _dikcode) == RWT_SMART_KEY) then {
	if (player getVariable ["rwt_explosives_iface",false]) exitWith {
		deleteVehicle (player getVariable ["rwt_explosives_curr",objNull]);
		player setVariable ["rwt_explosives_iface",false,false];
		player setVariable ["rwt_explosives_curr",objNull,false];
		inGameUISetEventHandler ["PrevAction", RWT_IGUI_EH_PRE];
		inGameUISetEventHandler ["NextAction", RWT_IGUI_EH_NEX];
		inGameUISetEventHandler ["Action", RWT_IGUI_EH_ACT];
		["rwt_explosives_iface","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		true
	};
	[] call RWT_fnc_smartMenuToggle;
	switch true do {
		case ((!dialog) && _keyctrl): {[2,3,4,5,6,7,8,9,10] call RWT_fnc_smartMenuToggle;};
		case ((!dialog) && _keyalt): {[16,17,18,19,20,21,22,23,24] call RWT_fnc_smartMenuToggle;};
		default {systemchat "Starting smart menu"};
	};
	/*
	// OBSOLETE CODE FOR DOUBLE TAP DETECTION
	if (_handled) exitWith {true};
	0 call RWT_fnc_smartMenuToggle;
	
	// processing single/double tap and hold
	// Check if smart key was released within last 110 ms
	if (RWT_SMART_KEY_RELEASED) then {
		// process as double tap
		RWT_SMART_KEY_RELEASED = false;
		RWT_SMART_KEY_PRESSED = false;
		if (!dialog) then {
			systemchat "Starting double tap action";
			// function for double tap action
			_handled = true;
		};
		//if (_handled) exitWith {true};
	} else {
		// processing single tap
		[] spawn {
			sleep (RWT_DOUBLE_TAP_LAG * RWT_SMART_KEY_SENSITIVITY ) ;
			if (RWT_SMART_KEY_RELEASED && RWT_SMART_KEY_PRESSED) then {
				RWT_SMART_KEY_RELEASED = false;
				RWT_SMART_KEY_PRESSED = false;
				if (!dialog) then {
					systemchat "Starting single tap action";
					// function for single tap action
					_handled = true;
				};
				//if (_handled) exitWith {true};
			};
		};
		if (!RWT_SMART_KEY_PRESSED) then {
			[] spawn {
				sleep RWT_HOLD_KEY_LAG;
				if (!RWT_SMART_KEY_RELEASED && RWT_SMART_KEY_PRESSED) then {
					RWT_SMART_KEY_RELEASED = false;
					RWT_SMART_KEY_PRESSED = false;
					if (!dialog) then {
						systemchat "Starting smart menu";
						createDialog "rwt_dummy_ui2";
						_handled = true;
					};
					//if (_handled) exitWith {true};
				};
			};
		};
		RWT_SMART_KEY_PRESSED = true;
	};
	*/
};


// Exiting event handler