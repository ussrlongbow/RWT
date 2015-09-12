/*
RWT Smart Menu toggle
Example:

_mode = 2;
_mode call RWT_fnc_smartMenuToggle;

0 call RWT_fnc_smartMenuToggle

0 - disable
1 - disable after time out if RWT_SMART_MENU_ENV = 0
2 - self-interaction
3 - ext-interaction

*/
private ["_mode","_count","_icon_positions","_display"];
_mode = _this;

// Destroy Smart Menu if it is opened.
//if (_mode == 0) then {
if (_mode isEqualTo []) then {
	// disable EHs
	inGameUISetEventHandler ["PrevAction", RWT_IGUI_EH_PRE];
	inGameUISetEventHandler ["Action", RWT_IGUI_EH_ACT];
	inGameUISetEventHandler ["NextAction", RWT_IGUI_EH_NEX];
	disableSerialization;
	_display = uiNamespace getVariable "RWT_SM_display";
	for "_i" from 1 to 9 do {
		(_display displayCtrl (66300 + _i)) ctrlSetText "";
		(_display displayCtrl (66300 + _i)) ctrlSetTextColor RWT_SM_COLOR_DISABLED;
	};
	(_display displayCtrl 66300) ctrlSetText "";
	RWT_SM_VALID_ACTIONS = [];
	RWT_SM_ACTIONS_INDEX = [];
};



// Draw self-interaction menu
if ((count _mode) == 9) then {
	//"Entered mode 2" call BIS_fnc_log;
	//RWT_SM_VALID_ACTIONS = [2,3,4,5,6,7,8,9,10];
	RWT_SM_VALID_ACTIONS = _mode;
	//systemchat format ["Valid actions are: %1",RWT_SM_VALID_ACTIONS];
	RWT_SM_ACTIONS_INDEX = [1,2,3,4,5,6,7,8,9];
	_count = count RWT_SM_VALID_ACTIONS;
	//systemchat format ["Count is %1",_count];
	_display = uiNamespace getVariable "RWT_SM_display";
	for "_i" from 1 to 9 do {
		//(_display displayCtrl (66300 + _i)) ctrlSetPosition ((RWT_SM_ACTION_ICONS_LOCATIONS_OLD select (_count - 1)) select (_i - 1));
		(_display displayCtrl (66300 + _i)) ctrlSetPosition (RWT_SM_SELF_ACTION_ICONS_LOCATIONS select (_i - 1));
		(_display displayCtrl (66300 + _i)) ctrlSetText call ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select (_i - 1))) select 1);
		if (call ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select (_i-1))) select 3)) then {
			(_display displayCtrl (66300 + _i)) ctrlSetTextColor RWT_SM_COLOR_DEFAULT;
		} else {
			(_display displayCtrl (66300 + _i)) ctrlSetTextColor RWT_SM_COLOR_DISABLED;
		};
		(_display displayCtrl (66300 + _i)) ctrlSetScale 2;
		(_display displayCtrl (66300 + _i)) ctrlCommit 0;
	};
	// perform initial selection
	(_display displayCtrl 66300) ctrlSetText ((RWT_SM_SELF_ACTIONS_LIB select (RWT_SM_VALID_ACTIONS select ((RWT_SM_ACTIONS_INDEX select 0)-1))) select 0);
	(_display displayCtrl (66300 + (RWT_SM_ACTIONS_INDEX select 0))) ctrlSetTextColor RWT_SM_COLOR_SELECTED;
	inGameUISetEventHandler ["PrevAction", "[false] call RWT_fnc_smartMenuScroll"];
	inGameUISetEventHandler ["Action", "call RWT_fnc_smartMenuAct"];
	inGameUISetEventHandler ["NextAction", "[true] call RWT_fnc_smartMenuScroll"];
};
