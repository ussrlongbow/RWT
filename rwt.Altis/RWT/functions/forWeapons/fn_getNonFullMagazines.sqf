/*
	Get non-full magazines list by longbow
*/

private ["_soldier","_all_mags","_nonfull_mags","_max_count","_count"];
_soldier = _this select 0;
// all magazines with ammo count
_all_mags = magazinesAmmo _soldier;
// all non-full magazines
_nonfull_mags = [];
{
	// read magazine name
	_mag = _x select 0;
	// get maximum ammo count in magazine
	_max_count = getNumber (configfile >> "CfgMagazines" >> _mag >> "count");
	_count = _x select 1;
	if (_count < _max_count) then {
		_nonfull_mags = _nonfull_mags + [_x];
	};
} forEach _all_mags;

{
	
} forEach _nonfull_mags;