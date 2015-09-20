/*****************************************************************************
Function name: RWT_fnc_scrollNumber;
Authors: longbow
Version: TODO
Dependencies:
	NONE

Changelog:
	=== TODO === TODO //date
		Initial release

Description:
	Function allows to scroll number values entered in CT_EDIT type of control
	with mouse wheel. Must be used from onMouseZChanged UI event handler.
	It is good consideration to disable input in such CT_EDIT control and
	allow value modification via mouse wheel only.

Arguments: [ARRAY,NUMBER,NUMBER,NUMBER]
	ARRAY - _this value supplied by onMouseZChanged event
		ARRAY select 0 - CT_EDIT control idc
		ARRAY select 1 - mouse wheel direction, negative for mouse wheel down
	NUMBER - max number, which triggers reset to zero
	NUMBER - default scroll step
	NUMBER - additional scroll step, depends on external condition (SHIFT key)
	
Output: None

Example:
class MyEditControl: RscEdit {
	...
	onMouseZChanged = "[_this,10,2,1] call RWT_fnc_scrollNumber";
};

If CT_EDIT ctrlText contains invalid values, it is reset to 0, and function
exits, assuming user would repeat scrolling. 2 means that when we rotate the
wheel, value in text field would changed by 2, if value gets more than 10,
we substract 10 from it, if gets negative, we add 10 to it.
If we hold SHIFT key while moving the wheel, value would be changed by 1. 

*****************************************************************************/

private ["_control","_zdir","_max","_array","_step","_valid","_number"];
disableSerialization;

// control idc
_control = _this select 0 select 0;

// scroll direction
_zdir = if ((_this select 0 select 1) > 0) then {1} else {-1};

// Number limit, 24 for hours, 60 for minutes and seconds
_max = _this select 1;

// Scroll step
_step = if (RWT_SMART_CTRL_PRESSED) then {_this select 3} else {_this select 2};

// Converting text value to array of Unicode codes
_array = toArray ctrlText _control;

// Valid Unicode characters, numbers 0-9
_valid = [48,49,50,51,52,53,54,55,56,57];

/*
In my implementation I expect in CT_EDIT control two-digit number.
For now would be hard-coded limit, as function is designed to scroll number of
hours/minutes/seconds of a bomb timer
*/
// Reset text value if have >2 or <1 characters
if (!((count _array) in [1,2])) exitWith {_control ctrlSetText "0"};
// Reset text value if we have invalid characters there
if (({_x in _valid} count _array) != (count _array)) exitWith {_control ctrlSetText "0"};

// Convert ctrlText to number
// for single digit
if ((count _array) == 1) then {
	_number = (_array select 0) - 48;
};
// for two digit
if ((count _array) == 2) then {
	_number = ((_array select 0) - 48) * 10 + (_array select 1) - 48;
};

// Exit if have initial weird values before EH fires
if (_number >= _max) exitWith {_control ctrlSetText "0"};

// Write new number after scrolling
_number = _number + _zdir * _step;


switch true do {
	case (_number >= _max): {_control ctrlSetText str (_number - _max)};
	case (_number < 0): {_control ctrlSetText str (_number + _max)};
	default {_control ctrlSetText str _number};
};
