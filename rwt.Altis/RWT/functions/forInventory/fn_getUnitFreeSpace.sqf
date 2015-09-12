/*****************************************************************************
	Get Unit Free Space by longbow

This function returns array of available cargo space in uniform, vest and
backpack if they are present.

Example #1:
unit_capacity = [mySoldier] call RWT_fnc_getUnitFreeSpace;

unit_capacity is now [10,20,0]

*****************************************************************************/
private ["_capacity","_u_fs","_v_fs","_b_fs"];
_soldier = _this select 0;

_capacity = [_soldier] call RWT_fnc_getUnitCapacity;

_u_fs = floor ((_capacity select 0) * (1-(loadUniform _soldier)));
_v_fs = floor ((_capacity select 1) * (1-(loadVest _soldier)));
_b_fs = floor ((_capacity select 2) * (1-(loadBackpack _soldier)));

[_u_fs,_v_fs,_b_fs]