private ["_mags","_mines","_bombs","_veh_bombs"];
_mags = magazines player;
_mines = false;
_bombs = false;
_veh_bombs = false;

if (count ([_mags,RWT_EXPLOSIVES_MINES,0] call RWT_fnc_arrayUniqueIntersect) > 0) then {_mines = true};
if (count ([_mags,RWT_EXPLOSIVES_BOMBS,0] call RWT_fnc_arrayUniqueIntersect) > 0) then {_bombs = true};
if (count ([_mags,RWT_EXPLOSIVES_VEH,0] call RWT_fnc_arrayUniqueIntersect) > 0) then {_veh_bombs = true};

[_mines,_bombs,_veh_bombs];