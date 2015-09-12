/* Russian Warfare Toolset for ArmA 3

Side limited BIS Arsenal init script
Author: [SVR]longbow
Edited for TFAR Radio items
Enabled only for players with loaded Task Force Radio addon
Usage:
	[_box,_side] call RWT_fnc_limitArsenalTFAR;
Parameters:
	_this select 0 - box object
	_this select 1 - string with side ("EAST" or "WEST")
Returns: NOTHING
*/

_box = _this select 0;
_side = _this select 1;

// since BIS Arsenal is added globally, checking for addon
0 = ["AmmoboxInit",[_box,false,{"task_force_radio" in activatedAddons}]] spawn BIS_fnc_arsenal;
/////////////////////
// Common // Общее //
/////////////////////

if ("task_force_radio" in activatedAddons) then {

// Equipment // Снаряжение
[ _box, [
	"ItemRadio","ItemWatch","ItemCompass","ItemMap","ItemGPS","tf_microdagr"
]] call BIS_fnc_addVirtualItemCargo;

//////////////////////////////////
// Side specific // Для фракций //
//////////////////////////////////

// Based on encryption code from configFile
switch (_side) do {
    case "EAST": {
		// Equipment // Снаряжение
		[ _box, [
			"tf_fadak","tf_pnr1000a"
		]] call BIS_fnc_addVirtualItemCargo;
		// Backpacks // Рюкзаки
		[ _box, [
			"tf_mr3000","tf_mr3000_bwmod","tf_mr3000_multicam","tf_mr3000_rhs","tf_mr6000l"
		]] call BIS_fnc_addVirtualBackpackCargo;
	};
    case "WEST": {
		// Equipment // Снаряжение
		[ _box, [
			"tf_anprc152","tf_rf7800str"
		]] call BIS_fnc_addVirtualItemCargo;
		// Backpacks // Рюкзаки
		[ _box, [
			"tf_anarc210","tf_rt1523g","tf_rt1523g_big","tf_rt1523g_big_bwmod",
			"tf_rt1523g_big_rhs","tf_rt1523g_black","tf_rt1523g_bwmod","tf_rt1523g_fabric",
			"tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage"
		]] call BIS_fnc_addVirtualBackpackCargo;
	};
	case "INDEP": {
		// Equipment // Снаряжение
		[ _box, [
			"tf_anprc148jem","tf_anprc154"
		]] call BIS_fnc_addVirtualItemCargo;
		// Backpacks // Рюкзаки
		[ _box, [
			"tf_anarc164","tf_anprc155","tf_anprc155_coyote"
		]] call BIS_fnc_addVirtualBackpackCargo;
	};
};
};