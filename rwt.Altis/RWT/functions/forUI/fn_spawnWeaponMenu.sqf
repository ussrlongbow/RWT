private ["_soldier","_avail_items","_index","_cur_weap_items"];
_soldier = _this select 0;
// zeroing variables
_avail_items = [];
_index = 0;
_cur_weapon_items = [];

// Get list of current attachments
_cur_weap_items = primaryWeaponItems _soldier;
// Convert all class names to lower case to ease comparison
// using _avail_items as temp storage
{
	_avail_items = _avail_items + [toLower _x];
	
} forEach _cur_weap_items;
_cur_weap_items = + _avail_items;
// zero our temp storage
_avail_items = [];

// get the list of available attachments
_avail_items = [_soldier] call RWT_fnc_getAvailableWeaponItems;

// draw weapon items menu
createdialog "rwt_weaponitems";

// add default selections for no attachments
// and set default string and number values
lbAdd [1500, "IRON SIGHT"]; // TODO: Localize
lbSetData [1500, 0, ""];
lbSetValue [1500, 0, 0];
lbAdd [1501, "NO SUPRESSOR"]; // TODO: Localize
lbSetData [1501, 0, ""];
lbSetValue [1501, 0, 0];
lbAdd [1502, "NO SIDEMOUNT"]; // TODO: Localize
lbSetData [1502, 0, ""];
lbSetValue [1502, 0, 0];


// add muzzle items to menu list
{
	if (count _x > 0) then {
		// get display name from config file
		_index = lbAdd [1501,(getText (configFile >> "CfgWeapons" >> _x >> "displayName"))];
		// keep class name for this element in hidden string
		lbSetData [1501, _index, _x];
		// if muzzle currently mounted store corresponding lb index in value 
		// of first element, as it is always exist in menu, same for others
		if (_x in _cur_weap_items) then {
			lbSetValue [1501,_index,_x];
			lbSetCurSel [1501,_index];
		};
	};
} forEach (_avail_items select 0);

// add side mount items to menu list
{
	if (count _x > 0) then {
		_index = lbAdd [1502,(getText (configFile >> "CfgWeapons" >> _x >> "displayName"))];
		lbSetData [1502, _index, _x];
		if (_x in _cur_weap_items) then {
			lbSetValue [1502,0,_index];
			lbSetCurSel [1502,_index];
		};
	};
} forEach (_avail_items select 1);

// add optics items to menu list
{
	if (count _x > 0) then {
		_index = lbAdd [1500,(getText (configFile >> "CfgWeapons" >> _x >> "displayName"))];
		lbSetData [1500, _index, _x];
		if (_x in _cur_weap_items) then {
			lbSetValue [1500,0,_index];
			lbSetCurSel [1500,_index];
		};
	};
} forEach (_avail_items select 2);


true