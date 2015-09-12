private ["_veh","_mags","_nades","_hasnades","_currentnade"];
_veh = _this select 0;
_nades = [];
_hasnades = [];
_currentnade = "";
_mags = magazinesAmmoFull _veh;


// get the list of nades in inventory and store to _nades
{
	_sel = str (_x select 3);
	_push = (_x select 0);
	if (_sel == "0") then {[_nades,_push] call BIS_fnc_arrayPush};
} forEach _mags;
_nades = _nades call BIS_fnc_sortAlphabetically;


// get the list of nades for update
_hasnades = profileNamespace getVariable "hasNade";


// from new list remove items we already know about
{
	_element = [_nades,_x] call BIS_fnc_arrayFindDeep;
	nul = _nades deleteAt _element;
} forEach _hasnades;

// merge arrays
_hasnades = _hasnades + _nades;

// store list of grenades
profileNamespace setVariable ["hasNade",_hasnades];
_currentnade = profileNamespace getVariable "curNade";
player sidechat _currentnade;
/*
if ((count _hasnades) > 0) then {
	if (!(_curnade in _hasnades)) then {
		_curnade = _hasnades select 0;
		profileNamespace setVariable ["curNade",_curnade];
	};
};

/*

*/