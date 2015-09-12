// Function to find item mass
// note currently usable only with items from CfgWeapons class

private ["_classname","_mass"];

_classname = _this select 0;
if (isClass (configfile >> "CfgWeapons" >> _classname)) then {
	if (isNumber (configfile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "mass")) then {
		_mass = getNumber (configfile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "mass");
	} else {
		_mass = 0;
	};
} else {
	_mass = 0;
};
_mass