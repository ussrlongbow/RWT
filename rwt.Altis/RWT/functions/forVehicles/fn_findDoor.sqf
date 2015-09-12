private ["_target","_tmp","_door","_range"];

_target = cursorTarget;
_tmp = ([_target,"GEOM"] intersect [(asltoatl (eyepos player)),(screentoworld [0.5,0.5])]) select 0;
_door = _tmp select 0;
_range = _tmp select 1;

if ((_target isKindOf "House_F") && (_range < 2)) then {
	[_target,_door]
} else {[]};