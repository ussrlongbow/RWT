/*****************************************************************************
Function name: RWT_fnc_arrayUniqueIntersect;
Authors: longbow
Version: 0.1
Dependencies:
	NONE

Changelog:
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Function returns array of unique items present in two source arrays.

Arguments: [Array,Array,Integer]

Example #1:
array1 = [1,2,2,2,3,4];
array2 = [2,3,3,3,3];
mode = 0;
resulting_array = [array1,array2,mode] call RWT_fnc_arrayUniqueIntersect;

// resulting_array is now [2,3]
// Set 3rd parameter to 1 if you need case insensitive check for strings.

*****************************************************************************/
private ["_array","_array1","_array2","_mode"];

_array1 = _this select 0;
_array2 = _this select 1;
_array = [];
_mode = _this select 2;
if (_mode == 1) then {
	{
		_array = _array + [toLower _x]
	} forEach _array1;
	_array1 = + _array;
	_array = [];
	{
		_array = _array + [toLower _x]
	} forEach _array2;
	_array2 = + _array;
	_array = [];
};
{
	if (_x in _array2) then {
		if not (_x in _array) then {
			_array = _array + [_x];
		};
	};
} forEach _array1;
_array