/*****************************************************************************
Function name: RWT_fnc_getCompatibleWeaponItems;
Authors: longbow
Revision: 0.3
Dependencies: NONE

Changelog:
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Get compatible items for current unit's weapon, returns array in format:
	[[Muzzles],[Side mounts],[Scopes]]

Arguments: Object

Example:
	_array = [player] call RWT_fnc_getCompatibleWeaponItems;

*****************************************************************************/
private ["_muzzles","_sidemounts","_scopes","_soldier","_weap"];
_soldier = _this select 0;

// Find base weapon class for current weapon
_weap = [(currentWeapon _soldier)] call BIS_fnc_baseWeapon;

// Query config file for compatible items
_muzzles = getArray (configFile >> "cfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_sidemounts = getArray (configFile >> "cfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_scopes = getArray (configFile >> "cfgWeapons" >> _weap >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

[_muzzles,_sidemounts,_scopes]