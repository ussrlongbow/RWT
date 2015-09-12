/*
	Simple magazine repack script by longbow
*/

private ["_soldier","_cur_mag","_max_count","_all_mags","_count","_mag"];
_soldier = _this select 0;
// get class name of currently loaded magazine
_cur_mag = currentMagazine _soldier;
// get max ammo count for this mag
_max_count = getNumber (configfile >> "CfgMagazines" >> _cur_mag >> "count");
// all magazines with ammo count
_all_mags = magazinesAmmo _soldier;
// total bullets in all mags of given type
_count = 0;
// total magazines of given type
_mags = 0;

// count magazines and bullets

{
	// read magazine name
	_mag = _x select 0;
	// if type equal to current magazine, increment counters
	if (_mag == _cur_mag) then {
		_mags = _mags + 1;
		_count = _count + (_x select 1);
	};
} forEach _all_mags;

if ((_mags * _max_count) > _count) then {
	// number of full mags to add
	_mags = floor (_count / _max_count);
	// ammo count for remaining mag
	_count = _count % _max_count;
	// remove all magazines
	_soldier removeMagazines _cur_mag;
	// add full mags
	_soldier addMagazines [_cur_mag, _mags];
	if (_count > 0) then {_soldier addMagazine [_cur_mag, _count];};
};
"Magazines were re-packed" call RWT_fnc_spawnNotification;