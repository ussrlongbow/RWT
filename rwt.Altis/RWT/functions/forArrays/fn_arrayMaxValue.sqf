/*****************************************************************************
Function name: RWT_fnc_arrayMaxValue;
Authors: longbow
Version: 0.1
Dependencies:
	NONE

Changelog:
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Function returns maximum value from array of numbers.

Arguments: Array

Example #1:
array1 = [1,2,2,2,3,4];
max_value = array1 call RWT_fnc_arrayMaxValue;

// max_value is now 4

*****************************************************************************/
private ["_array","_max"];
_max = _this select 0;

{
	if (_x > _max) then {
		_max = _x;
	};
} forEach _this;
_max