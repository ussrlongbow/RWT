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

private ["_bomb","_new_bomb","_pos","_vectordir","_vectorup","_target","_act"];
//systemchat "Placing ordnance";

_pos = [];
_vectordir = [];
_vectorup = [];
// if we attaching bomb to object, get this object
_target = player getVariable ["rwt_explosives_target",objNull];

// Prohibit placing bombs on men
if (_target isKindOf "Man") exitWith {systemChat "Cannot place bombs on men!"};

// Get the local bomb object from 3d interface
_bomb = player getVariable ["rwt_explosives_curr",objNull];

// if no target, place bomb on the ground
if (isNull _target) then {
	//systemChat "Placing bomb without attach";
	_pos = getPos _bomb;
	_vectordir = vectorDir _bomb;
	_vectorup = vectorUp _bomb;
	_new_bomb = (typeOf _bomb) createVehicle _pos;
	_new_bomb setVectorDirAndUp [_vectordir,_vectorup];
	player removeMagazine (getText (configFile >> "CfgAmmo" >> (typeOf _bomb) >> "defaultMagazine"));
	deleteVehicle _bomb;
	// Add temporary action to detonate bomb, to be replaced in future
	_act = player addAction ["Detonate",{detach (_this select 3); (_this select 3) setDamage 1; removeAllActions player},_target,5,false];
	// Store the id of detonate action
	player setVariable ["rwt_detonate_act",_act,false];
// placing on target
} else {
	//systemChat "Placing bomb with attach";
	_pos = getPos _bomb;
	//_vectordir = vectorDir _bomb;
	_vectorup = vectorUp _bomb;
	_pos = _target worldToModelVisual _pos;
	_new_bomb = (typeOf _bomb) createVehicle [0,0,0];
	_new_bomb attachTo [_target,_pos];
	_new_bomb setVectorUp _vectorup;
	player removeMagazine (getText (configFile >> "CfgAmmo" >> (typeOf _bomb) >> "defaultMagazine"));
	deleteVehicle _bomb;
	_act = player addAction ["Detonate",{detach (_this select 3); (_this select 3) setDamage 1; removeAllActions player},_target,5,false];
	player setVariable ["rwt_detonate_act",_act,false];
};

// just in case delete local bomb object
deleteVehicle (player getVariable ["rwt_explosives_curr",objNull]);
// set interface presence var to false
player setVariable ["rwt_explosives_iface",false,false];
// remove local bomb object from player's var
player setVariable ["rwt_explosives_curr",objNull,false];
// restore EHs for mouse wheel
inGameUISetEventHandler ["PrevAction", RWT_IGUI_EH_PRE];
inGameUISetEventHandler ["NextAction", RWT_IGUI_EH_NEX];
inGameUISetEventHandler ["Action", RWT_IGUI_EH_ACT];
// turn of 3d interface
["rwt_explosives_iface","onEachFrame"] call BIS_fnc_removeStackedEventHandler;