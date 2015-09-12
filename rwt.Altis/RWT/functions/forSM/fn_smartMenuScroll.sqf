/*
RWT Smart Menu create
Example:

_mode = 2;
_mode call RWT_fnc_smartMenuToggle;
// Opens self interaction menu

0 call RWT_fnc_smartMenuToggle
// closes current menu

0 - closed
1 - times out (timer ticking, will be closed after time out if RWT_SMART_MENU_ENV = 0)
2 - opened self-interaction
3 - opened ext-interaction

*/
private ["_dir","_prev","_next"];
_dir = _this select 0;

// current selection
_prev = RWT_SM_ACTIONS_INDEX select 0;
//["prev is ",_prev] call BIS_fnc_log;


_display = uiNamespace getVariable "RWT_SM_display";
(_display displayCtrl (66300 + _prev)) ctrlSetTextColor RWT_SM_COLOR_DEFAULT;
//RWT_SM_VALID_ACTIONS call BIS_fnc_log;
//RWT_SM_ACTIONS_INDEX call BIS_fnc_log;

RWT_SM_VALID_ACTIONS = [RWT_SM_VALID_ACTIONS,_dir] call RWT_fnc_arrayRotate;
RWT_SM_ACTIONS_INDEX = [RWT_SM_ACTIONS_INDEX,_dir] call RWT_fnc_arrayRotate;

while {!(call ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select 0)) select 3))} do {
	RWT_SM_VALID_ACTIONS = [RWT_SM_VALID_ACTIONS,_dir] call RWT_fnc_arrayRotate;
	RWT_SM_ACTIONS_INDEX = [RWT_SM_ACTIONS_INDEX,_dir] call RWT_fnc_arrayRotate;
};
/*
call ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select 0)) select 2);
*/
// new selection
_next = RWT_SM_ACTIONS_INDEX select 0;


//["next is ",_next] call BIS_fnc_log;
//RWT_SM_VALID_ACTIONS call BIS_fnc_log;
//RWT_SM_ACTIONS_INDEX call BIS_fnc_log;

(_display displayCtrl 66300) ctrlSetText ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select 0)) select 0);
(_display displayCtrl (66300 + _next)) ctrlSetTextColor RWT_SM_COLOR_SELECTED;
true