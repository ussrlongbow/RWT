// dummy function for onLBSelChanged EH
private ["_idc","_index","_idc_num","_name_new","_name_old","_cursel","_mass_diff","_capacity"];
// control we handle
_idc = _this select 0;
// selection within control
_index = _this select 1;
// number of control
_idc_num = ctrlIDC _idc;

// Check if trigger was fired by initial choice
// or user clicked on already selected item
_cursel = lbValue [_idc_num,0];
if (_cursel == _index) exitWith {true};

// _cursel - index of item selected before EH (old)
// _index - index of item user clicked on (new)
// _mass_diff - difference in mass
// read newly selected item class name
_name_new = lbData [_idc_num,_index];
// read current item class name
_name_old = lbData [_idc_num,_cursel];
// find items mass difference
_mass_diff = ([_name_old] call RWT_fnc_getItemMass) - ([_name_new] call RWT_fnc_getItemMass);
// find avail capacity
_capacity = ([player] call RWT_fnc_getUnitFreeSpace) call RWT_fnc_arrayMaxValue;
// replace if fits inventory
if (_mass_diff < _capacity) then {
	player removeItem _name_new;
	player removePrimaryWeaponItem _name_old;
	player addPrimaryWeaponItem _name_new;
	player addItem _name_old;
	lbSetValue [_idc_num,0,_index];
} else {
	lbSetCurSel [_idc_num,_cursel];
	"Item does not fit inventory" call RWT_fnc_spawnNotification;
};

true