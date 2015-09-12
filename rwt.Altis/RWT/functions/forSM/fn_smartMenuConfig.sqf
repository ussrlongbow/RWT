/*****************************************************************************
Function name: RWT_fnc_smartMenuConfig;
Authors: longbow
Revision: 0.3
Dependencies:
	Functions:
		RWT_fnc_ifaceExplosives
		RWT_fnc_toggleEarplugs
		RWT_fnc_toggleLights
		RWT_fnc_smartMenuToggle

Changelog:
	=== 0.3 === 12-Sep-2015
		Changed the format of actions in library
		Menu is now built dynamically
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Initializes Smart Interaction Menu
	Executed in preInit

Arguments: NONE

Example:
"DemoCharge_Remote_Ammo_Scripted" call RWT_fnc_ifaceExplosives;
// Will launch 3d interface for C4 charge

*****************************************************************************/

// Assigning RWT smart key to Left Windows key on keyboard
// refer to DIK codes list to assign different key
// DIK code should be assigned as string!
RWT_SMART_KEY = "219";
// Global variable which checks if Shift key is pressed
RWT_SMART_CTRL_PRESSED = false;

// List of explosives usable inside vehicles
// must be a valid classname from CfgMagazines
RWT_EXPLOSIVES_VEH = [
	"APERSMine_Range_Mag",
	"ATMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag"
];

// List of explosives usable as mines
// must be a valid classname from CfgMagazines
RWT_EXPLOSIVES_MINES = [
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"ATMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag"
];

// List of explosives usable as demolition charges
// must be a valid classname from CfgMagazines
RWT_EXPLOSIVES_BOMBS = [
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"IEDLandBig_Remote_Mag",
	"IEDLandSmall_Remote_Mag",
	"IEDUrbanBig_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag"
];


// OUTDATED
/*
// Sensitivity for double tapping/holding smart key
// delay between key strokes to detect double tap
RWT_DOUBLE_TAP_LAG = 0.11;
// smart key hold time to run external interaction menu
RWT_HOLD_KEY_LAG = 0.71;
// sensitivity to exclude false-positives single taps
// when processing double taps
RWT_SMART_KEY_SENSITIVITY = 1.8;
// default values, changed during mission
// used for double tap and hold key detection
RWT_SMART_KEY_PRESSED = false;
RWT_SMART_KEY_RELEASED = false;
RWT_SMART_MENU_MODE = 0;
RWT_SMART_MENU_ENV = 0;
*/

// true to enable text hints above menu
RWT_SMART_MENU_HINTS = true;
RWT_SMART_MENU_DISPLAY = 0;

// var to track available actions for active menu
RWT_SM_VALID_ACTIONS = [];
RWT_SM_ACTIONS_INDEX = [];

/*
Library of action for Smart menu
Format [STRING,CODE,CODE,CODE]
	STRING - name of the function (displayed text in helper)
	CODE #1 - function to determine an icon for action, must return STRING,
		should be a path to PAA image
	CODE #2 - code to be executed when action requested
	CODE #3 - code which checks if action is available, must return true or false
the action is referenced as index from this array.
*/
RWT_SM_SELF_ACTIONS_LIB = [
	// 0: Dummy action
	["",{""},{false},{false}],
	
	// 1: Close current menu and main self interaction menu
	["Back to self menu",
	{"\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa"},
	{[] call RWT_fnc_smartMenuToggle;[2,3,4,5,6,7,8,9,10] call RWT_fnc_smartMenuToggle;},
	{true}],
	
	// 2: Open medicine menu WIP
	["Medicine",
	{"\A3\ui_f\data\igui\cfg\actions\bandage_ca.paa"},
	{[] call RWT_fnc_smartMenuToggle;[1,11,12,0,0,0,0,0,0] call RWT_fnc_smartMenuToggle;},
	{true}],
	
	// 3: Open explosives menu
	["Explosives",{"\a3\ui_f_curator\data\CfgHints\PlaceMines_ca.paa";},{[] call RWT_fnc_smartMenuToggle;[1,34,35,36,37,38,39,40,41] call RWT_fnc_smartMenuToggle;},{call RWT_fnc_smartShowBombs}],
	// 4: Open weapons menu WIP
	["Weapons",{"\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";},{hint "Weapons"},{true}],
	// 5: Open menu for earplugs and light attachments
	["Attach",{"\A3\ui_f\data\igui\cfg\actions\ico_cpt_col_ON_ca.paa"},{[] call RWT_fnc_smartMenuToggle;[30,13,14,15,25,26,27,28,29] call RWT_fnc_smartMenuToggle;},{true}],
	// 6: Open menu to configure radio WIP
	["Radio",{"\A3\UI_F_MP_Mark\Data\Tasks\Types\Support_ca.paa"},{hint "Radio"},{false}],
	// 7: Drop backpack if present
	["Drop backpack",{"\A3\ui_f\data\map\vehicleicons\iconBackpack_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player action ["PutBag"]},{((vehicle player) == player) && ((backpack player) != "")}],
	// 8: Perform special action
	["Special",{"\A3\ui_f\data\igui\cfg\actions\getingunner_ca.paa"},{hint "Special"},{(vehicle player) == player}],
	// 9: Open gestures menu
	["Gestures",{"\A3\ui_f\data\igui\cfg\actions\take_ca.paa"},{[] call RWT_fnc_smartMenuToggle; [16,17,18,19,20,21,22,23,24] call RWT_fnc_smartMenuToggle;},{(vehicle player) == player}],
	
	// 10: Open vehicle menu if player in vehicle WIP
	["Vehicle",{call RWT_fnc_smartMenuIcon},{hint "Vehicle"},{(vehicle player) != player}],
	// 11: Perform health self-diagnose WIP
	["Check health",{"\a3\Ui_f\data\GUI\Cfg\Hints\Incapacitated_ca.paa"},{hint "Checking health"},{true}],
	// 12: Patch yourself WIP
	["Heal yourself",{"\A3\ui_f\data\igui\cfg\actions\heal_ca.paa"},{hint "Applying medkit"},{true}],
	
	// 13: Toggle earplugs
	["Earplugs",{"RWT\images\icon_earp.paa"},{call RWT_fnc_toggleEarplugs;[] call RWT_fnc_smartMenuToggle;},{true}],
	
	// 14: Attach CSAT IR strobe
	["IR Strobe (CSAT)",
	{"\A3\Weapons_F_EPB\Ammo\Data\UI\gear_O_IRstrobe_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["ir_csat"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("O_IR_Grenade" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 15: Attach NATO IR strobe
	["IR Strobe (NATO)",
	{"\A3\Weapons_F_EPB\Ammo\Data\UI\gear_B_IRstrobe_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["ir_nato"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("B_IR_Grenade" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 16 to 24: Gestures
	["Go",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\G_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureGo";},{true}],
	["Warning",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\W_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureHi";},{true}],
	["Hold fire",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\H_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureCeaseFire";},{true}],
	["Advance",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\A_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureAdvance";},{true}],
	["Follow",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\F_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureFollow";},{true}],
	["Cover",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\D_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureCover";},{true}],
	["No",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\N_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureNo";},{true}],
	["Nod",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\Y_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureNod";},{true}],
	["Freeze",{"\A3\UI_F_MP_Mark\Data\Tasks\Letters\S_ca.paa"},{[] call RWT_fnc_smartMenuToggle; player playAction "gestureFreeze";},{true}],
	
	// 25: Attach AAF IR strobe
	["IR Strobe (AAF)",
	{"\A3\Weapons_F_EPB\Ammo\Data\UI\gear_I_IRstrobe_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["ir_aaf"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("I_IR_Grenade" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 26: Attach yellow chemlight
	["Chemlight Yellow",
	{"\A3\Weapons_F\Data\UI\M_chemlight_yellow_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["c_yellow"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("Chemlight_yellow" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 27: Attach red chemlight
	["Chemlight Red",
	{"\A3\Weapons_F\Data\UI\M_chemlight_red_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["c_red"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("Chemlight_red" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 28: Attach green chemlight
	["Chemlight Green",
	{"\A3\Weapons_F\Data\UI\M_chemlight_green_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["c_green"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("Chemlight_green" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 29: Attach blue chemlight
	["Chemlight Blue",
	{"\A3\Weapons_F\Data\UI\M_chemlight_blue_CA.paa";},
	{[] call RWT_fnc_smartMenuToggle;["c_blue"] call RWT_fnc_toggleLights;},
	{(player == vehicle player) && (("Chemlight_blue" in magazines player) && !(player getVariable ["rwt_status_light",false]))}],
	
	// 30: Detach chemlight or IR strobe
	["Detach",{"A3\ui_f\data\igui\cfg\actions\ico_OFF_ca.paa"},{[] call RWT_fnc_smartMenuToggle;[""] call RWT_fnc_toggleLights},{true}],
	
	// 31 WIP
	["Mines",{"\a3\ui_f\data\gui\cfg\hints\Directional_ca.paa"},{hint "Mines"},{true}],
	// 32 Bombs WIP
	["Bombs",{"\a3\ui_f\data\gui\cfg\hints\IEDs_ca.paa"},{hint "Bombs"},{true}],
	// 33 Grenades WIP
	["Grenades",{"\a3\ui_f\data\gui\cfg\hints\Grenades_ca.paa"},{hint "Grenades"},{true}],
	
	// 34: Use AP mine in 3d explosives interface
	["AP mine",{"\A3\Weapons_F\Data\UI\gear_mine_AP_CA.paa"},{hint "AP mine"},{"APERSMine_Range_Mag" in magazines player}],
	
	// 35: Use AP bouncing mine in 3d explosives interface
	["APB mine",{"\A3\Weapons_F\Data\UI\gear_mine_AP_bouncing_CA.paa"},{hint "APB mine"},{"APERSBoundingMine_Range_Mag" in magazines player}],
	
	// 36: Use tripwire mine in 3d explosives interface
	["Tripwire mine",{"\A3\Weapons_F\Data\UI\gear_mine_AP_tripwire_CA.paa"},{hint "Tripwire mine"},{"APERSTripMine_Wire_Mag" in magazines player}],
	
	// 37: Use AT mine in 3d explosives interface
	["AT mine",{"\A3\Weapons_F\Data\UI\gear_mine_AT_CA.paa"},{hint "AT mine"},{"ATMine_Range_Mag" in magazines player}],
	
	// 38: Use Claymore in 3d explosives interface
	["Claymore",{"\A3\Weapons_F\Data\UI\gear_mine_AP_miniclaymore_CA.paa"},{hint "Claymore"},{"ClaymoreDirectionalMine_Remote_Mag" in magazines player}],
	
	// 39: Use SLAM directional mine in 3d explosives interface
	["SLAM",{"\A3\Weapons_F\Data\UI\gear_mine_SLAM_directional_CA.paa"},{hint "SLAM"},{"SLAMDirectionalMine_Wire_Mag" in magazines player}],
	
	// 40: Use C4 charge in 3d explosives interface
	["C4 charge",
	{"\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa"},
	{[] call RWT_fnc_smartMenuToggle; "DemoCharge_Remote_Ammo_Scripted" call RWT_fnc_ifaceExplosives;},
	{"DemoCharge_Remote_Mag" in magazines player}],
	
	// 41: Use satchel charge in 3d explosives interface
	["Satchel charge",
	{"\A3\Weapons_f\data\UI\gear_satchel_CA.paa"},
	{[] call RWT_fnc_smartMenuToggle; "SatchelCharge_Remote_Ammo_Scripted" call RWT_fnc_ifaceExplosives;},
	{"SatchelCharge_Remote_Mag" in magazines player}],
	//
	[]
];

// Control location depending on their number

RWT_SM_SELF_ACTION_ICONS_LOCATIONS = [
	[(0.500 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.300 * safezoneH + safezoneY)],
	[(0.628 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.348 * safezoneH + safezoneY)],
	[(0.697 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.465 * safezoneH + safezoneY)],
	[(0.673 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.600 * safezoneH + safezoneY)],
	[(0.568 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.688 * safezoneH + safezoneY)],
	[(0.432 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.688 * safezoneH + safezoneY)],
	[(0.327 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.600 * safezoneH + safezoneY)],
	[(0.303 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.465 * safezoneH + safezoneY)],
	[(0.372 * safezoneW + safezoneX)*safezoneH/safezoneW,(0.348 * safezoneH + safezoneY)]
];

// colors
RWT_SM_COLOR_DISABLED = [0,0,0,1];
RWT_SM_COLOR_DEFAULT = [1,1,1,1];
RWT_SM_COLOR_SELECTED = [1,0.5,0,0.8];
RWT_SM_COLOR_HINT = [1,1,0,1];
