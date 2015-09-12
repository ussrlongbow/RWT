private ["_veh"];
_veh = _this select 0;

// add handlers
// display handler
waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call RWT_fnc_keyDown;}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call RWT_fnc_keyUp;}];
(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call RWT_fnc_ctrlDown;}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call RWT_fnc_ctrlUp;}];

RWT_IGUI_EH_PRE = "[false] call RWT_fnc_doorMove;";
RWT_IGUI_EH_ACT = "";
RWT_IGUI_EH_NEX = "[true] call RWT_fnc_doorMove;";

inGameUISetEventHandler ["PrevAction", RWT_IGUI_EH_PRE];
inGameUISetEventHandler ["NextAction", RWT_IGUI_EH_NEX];
inGameUISetEventHandler ["Action", RWT_IGUI_EH_ACT];