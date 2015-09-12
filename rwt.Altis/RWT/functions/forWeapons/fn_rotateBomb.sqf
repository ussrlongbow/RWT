/*****************************************************************************
Function name: RWT_fnc_placeBomb;
Authors: longbow
Revision: 0.3
Dependencies:
	NONE

Changelog:
	=== 0.3 === 12-Sep-2015
		Initial release

Description:
	Placing bomb to location positioned in 3d explosives interface

Arguments: NONE

Example:
[] call RWT_fnc_ifaceExplosives;
// Will place the bomb if allowed and close 3d interface

*****************************************************************************/

// direction, true - clock-wise
_chdir = _this select 0;
// get mine object
_ord = player getVariable ["rwt_explosives_curr",objNull];

// exit if not explosive interface present
if (!(player getVariable ["rwt_explosives_iface",false])) exitWith {systemchat "Iface not active"};
// exit if no mine object present
if ((player getVariable ["rwt_explosives_curr",objNull]) == objNull) exitWith {systemchat "No object present"};

if (_chdir) then {
	if (RWT_SMART_CTRL_PRESSED) then {
		_ord setDir ((getDir _ord) + 5);
	} else {
		_ord setDir ((getDir _ord) + 30);
	};
} else {
	if (RWT_SMART_CTRL_PRESSED) then {
		_ord setDir ((getDir _ord) - 5);
	} else {
		_ord setDir ((getDir _ord) - 30);
	};
};