/*****************************************************************************
	Get available weapon items from inventory by longbow

This function returns array of items from unit's inventory suitable
for mounting to current weapon including currently mounted items.

Usage :
array = [_unit] call RWT_fnc_getAvailableWeaponItems;
Example output:
[["muzzle_snd_s"],["acc_flashlight"],["optic_ACO_grn","optic_MRCO"]]

*****************************************************************************/
private ["_soldier","_items_on_weapon","_items_compatible","_inventory","_avail_muzzles","_avail_side","_avail_optics"];
_soldier = _this select 0;

// Get the list of compatible weapon mounts
_items_compatible = [_soldier] call RWT_fnc_getCompatibleWeaponItems;
// Get currently mounted weapon items
_items_on_weapon = primaryWeaponItems _soldier;

// Read the unit's inventory
_inventory = items _soldier;

// build the list of available attachments
// muzzles
_avail_muzzles = [(_inventory + [(_items_on_weapon select 0)]),(_items_compatible select 0),1] call RWT_fnc_arrayUniqueIntersect;
// side mounts
_avail_side = [(_inventory + [(_items_on_weapon select 1)]),(_items_compatible select 1),1] call RWT_fnc_arrayUniqueIntersect;
// optics
_avail_optics = [(_inventory + [(_items_on_weapon select 2)]),(_items_compatible select 2),1] call RWT_fnc_arrayUniqueIntersect;

[_avail_muzzles,_avail_side,_avail_optics]