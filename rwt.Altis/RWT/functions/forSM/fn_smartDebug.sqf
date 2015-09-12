/*
RWT SM 3D debug function
*/
private ["_display","_var1","_var2","_begposASL","_endposASL","_intersect","_weap_dir"];

_display = uiNamespace getVariable "RWT_MD_display";

// Get the weapon direction
_weap_dir = player weaponDirection currentWeapon player;
// The beginning of virtual line are player's eyes
_begposASL = eyePos player;
// The end of virtual line in front of player
_endposASL = [
	(_begposASL select 0) + 2*(_weap_dir select 0),
	(_begposASL select 1) + 2*(_weap_dir select 1),
	(_begposASL select 2) + 2*(_weap_dir select 2)
];

_intersect = lineIntersectsSurfaces [_begposASL,_endposASL,objNull,objNull,true,1];

// intersect position
_var1 = ASLToAGL ((_intersect select 0) select 0);
// surface normal
_var2 = (_intersect select 0) select 1;








// write current cursor target
_var1 = cursorTarget;
_var2 = typeOf _var1;
(_display displayCtrl 76501) ctrlSetText (format ["Aimed at %1 Type: %2", _var1, _var2]);

// aimPos player
(_display displayCtrl 76502) ctrlSetText (format ["Aim Pos %1",aimPos player]);

// eye pos
(_display displayCtrl 76503) ctrlSetText (format ["Eye Pos %1",eyePos player]);

// eye dir
(_display displayCtrl 76504) ctrlSetText (format ["Eye Dir %1",eyeDirection player]);

//  player weaponDirection currentWeapon player
(_display displayCtrl 76505) ctrlSetText (format ["Weap Dir %1",player weaponDirection currentWeapon player]);

// obj intersect
//_var1 = (lineIntersectsWith [eyePos player, ATLtoASL screenToWorld [0.5,0.5], objNull, objNull, true]) select 0;
//(_display displayCtrl 76506) ctrlSetText (format ["Obj Int %1",_var1]);

// obj selection
_var2 = [cursortarget,"GEOM"] intersect [(asltoatl (eyepos player)),(screentoworld [0.5,0.5])];
(_display displayCtrl 76507) ctrlSetText (format ["Obj Sel %1",_var2]);