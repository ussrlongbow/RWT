/*****************************************************************************
Function name: RWT_fnc_ifaceExplosives;
Authors: longbow
Revision: 0.3
Dependencies:
	RWT_fnc_placeBomb
	RWT_fnc_rotateBomb

Changelog:
	=== 0.3 === 12-Sep-2015
		Initial release

Description:
	Function launches 3d explosive interface allowing precise ordnance placement

Arguments: String
	Must be a valid classname from CfgAmmo

Example:
"DemoCharge_Remote_Ammo_Scripted" call RWT_fnc_ifaceExplosives;
// Will launch 3d interface for C4 charge

*****************************************************************************/

// creating ordnance and disabling simulation for it
_ord = _this createVehicleLocal [0,0,0];
_ord enableSimulation false;

// Variable to track if explosive interface is active
player setVariable ["rwt_explosives_iface",true,false];
// Store local bomb object
player setVariable ["rwt_explosives_curr",_ord,false];

// Mouse wheel up - rotate ordnance counter clock-wise
inGameUISetEventHandler ["PrevAction", "[false] call RWT_fnc_rotateBomb; true"];
// Mouse wheel down - rotate ordnance clock-wise
inGameUISetEventHandler ["NextAction", "[true] call RWT_fnc_rotateBomb; true"];
// Middle mouse button - place bomb
inGameUISetEventHandler ["Action", "[] call RWT_fnc_placeBomb; true"];

// Reposition local bomb object every frame according to environment
// Set position in front of camera if no target within 1.5 meters
["rwt_explosives_iface","onEachFrame", {
	_obj = player getVariable ["rwt_explosives_curr",objNull];
	_ins = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0], 
		AGLToASL positionCameraToWorld [0,0,1.5], 
		player,
		_obj,
		true,
		1,
		"GEOM",
		"NONE"
	];
	if (count _ins == 0) exitWith {
		_obj setPos (positionCameraToWorld [0,0,1.5]);
		_obj setVectorUp [0,0,1];
	};
	_obj setPosASL (_ins select 0 select 0); 
	_obj setVectorUp (_ins select 0 select 1);
	_target = _ins select 0 select 3;
	player setVariable ["rwt_explosives_target",_target,false];
}] call BIS_fnc_addStackedEventHandler;