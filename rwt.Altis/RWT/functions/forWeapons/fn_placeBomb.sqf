/*****************************************************************************
Function name: RWT_fnc_placeBomb;
Authors: longbow
Revision: 0.3
Dependencies:
	NONE

Changelog:
	=== 0.3 === 12-Sep-2015
		Initial release

Description:
	Placing bomb to location positioned in 3d explosives interface

Arguments: NONE

Example:
[] call RWT_fnc_ifaceExplosives;
// Will place the bomb if allowed and close 3d interface

*****************************************************************************/

private ["_bomb","_bomb_type","_new_bomb","_pos","_pos2","_vectordir","_vectorup","_target","_act"];

// if we attaching bomb to object, get this object
_target = player getVariable ["rwt_explosives_target",objNull];

// Prohibit placing bombs on men
if (_target isKindOf "Man") exitWith {systemChat "Cannot place bombs on men!"};

// turn of 3d interface
["rwt_explosives_iface","onEachFrame"] call BIS_fnc_removeStackedEventHandler;

// Get the local bomb object from 3d interface
_bomb = player getVariable ["rwt_explosives_curr",objNull];
// remove reference to local bomb object from player's vars
player setVariable ["rwt_explosives_curr",objNull,false];
_bomb_type = typeOf _bomb;

// Set initial values for bomb position, direction and up vector
_pos = getPosATL _bomb;
_vectordir = vectorDir _bomb;
_vectorup = vectorUp _bomb;
_pos2 = [];


deleteVehicle _bomb;

// Store the type of ammo, used in config dialog for localization
player setVariable ["rwt_explosives_curr_type",_bomb_type];

if (isNull _target) then {
	// if no target, place bomb on the ground
	_new_bomb = _bomb_type createVehicle [(_pos select 0),(_pos select 1),0];
	_new_bomb setVectorDirAndUp [_vectordir,_vectorup];
	player removeMagazine (getText (configFile >> "CfgAmmo" >> _bomb_type >> "defaultMagazine"));
	// Add temporary action to detonate bomb, to be replaced in future
	_act = player addAction [
		"Detonate",
		{
			detach (_this select 3);
			(_this select 3) setDamage 1;
			player removeAction (_this select 2)},
		_new_bomb,5,false];
	player setUserActionText [_act,format ["Detonate #%1",_act]];
} else {
	// placing on target
	_new_bomb = _bomb_type createVehicle _pos;
	_pos2 = _target worldToModel _pos;
	_new_bomb attachTo [_target,_pos2];
	_new_bomb setVectorUp _vectorup;
	player removeMagazine (getText (configFile >> "CfgAmmo" >> _bomb_type >> "defaultMagazine"));
	_act = player addAction [
		"Detonate",
		{
			//detach (_this select 3);
			(_this select 3) setDamage 1;
			player removeAction (_this select 2)},
		_new_bomb,5,false];
	player setUserActionText [_act,format ["Detonate #%1",_act]];
};

// store placed bomb object to be referenced by config dialog
player setVariable ["rwt_explosives_curr",_new_bomb,false];
// set interface presence var to false
player setVariable ["rwt_explosives_iface",false,false];
// restore EHs for mouse wheel
inGameUISetEventHandler ["PrevAction", RWT_IGUI_EH_PRE];
inGameUISetEventHandler ["NextAction", RWT_IGUI_EH_NEX];
inGameUISetEventHandler ["Action", RWT_IGUI_EH_ACT];

// Launch explosives configuration dialog
createDialog "RWT_UI_Explosives_Config";