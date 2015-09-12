/*****************************************************************************
	Get Unit Capacity by longbow

This function returns array of available cargo space in uniform, vest and
backpack if they are present.

Example #1:
unit_capacity = [mySoldier] call RWT_fnc_getUnitCapacity;

unit_capacity is now [40,100,0]

*****************************************************************************/
private ["_uniform","_vest","_backpack","_u_supply","_v_supply","_u_cap","_v_cap","_b_cap"];
_soldier = _this select 0;

// Find unit's storage containers
_uniform = uniform _soldier;
_vest = vest _soldier;
_backpack = backpack _soldier;

// Find supply types fpr uniform and vest
_u_supply = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "containerClass");
_v_supply = getText (configfile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "containerClass");

// Query config file for containers capacities
_u_cap = getNumber (configfile >> "CfgVehicles" >> _u_supply >> "maximumLoad");
_v_cap = getNumber (configfile >> "CfgVehicles" >> _v_supply >> "maximumLoad");
_b_cap = getNumber (configfile >> "CfgVehicles" >> _backpack >> "maximumLoad");

[_u_cap,_v_cap,_b_cap]