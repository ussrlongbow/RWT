/*****************************************************************************
Function name: RWT_fnc_arrayRotate;
Authors: longbow
Version: 0.1
Dependencies:
	NONE

Changelog:
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Function rotates array in both directions and returns resulting array.

Arguments: [Array,Boolean]

Example #1:
array1 = [1,2,3,4];
array2 = [array1,true] call RWT_fnc_arrayRotate;

// array2 is now [2,3,4,1]

Example #2:
array1 = [1,2,3,4];
array2 = [array1,false] call RWT_fnc_arrayRotate;

// array2 is now [4,1,2,3]

*****************************************************************************/
private ["_array","_direction","_shift"];
_array = _this select 0;
_direction = _this select 1;

if (_direction) then {
	// take first element of array
	_shift = [_array] call BIS_fnc_arrayShift;
	// put element in the end of array
	_array = [_array,_shift] call BIS_fnc_arrayPush;
	} else {
	// take last element of array
	_shift = _array call BIS_fnc_arrayPop;
	// put element in the beginning of array
	_array = [_array,[_shift],0] call BIS_fnc_arrayInsert;
};
_array