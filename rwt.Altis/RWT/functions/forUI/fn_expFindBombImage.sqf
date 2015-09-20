// Localize Bomb name
private ["_control","_type","_magazine","_image"];

disableSerialization;
_control = _this select 0;

// Get the classname of bomb we planted (from CfgAmmo)
_type = player getVariable ["rwt_explosives_curr_type",""];

// Class name of the magazine (from CfgMagazines)
_magazine = getText (configFile >> "CfgAmmo" >> _type >> "defaultMagazine");
// Get image path from config
_image = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

_control ctrlSetText _image;