_box = _this select 0;
_side = _this select 1;

0 = ["AmmoboxInit",[_box,false]] spawn BIS_fnc_arsenal;

/////////////////////
// Common // Общее //
/////////////////////

// Equipment // Снаряжение
[ _box, [
	"Binocular","Rangefinder",
	"MineDetector","Medikit","ToolKit",
	"FirstAidKit","ItemRadio","ItemWatch","ItemCompass","ItemMap","ItemGPS",
	"muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_acp",
	"acc_flashlight","acc_pointer_IR",
	"optic_NVS","optic_LRPS","optic_SOS","optic_DMS",
	"optic_Holosight","optic_Holosight_smg","optic_Yorris","optic_MRD",
	"optic_MRCO","optic_Arco","optic_Hamr",
	"optic_ACO_grn","optic_ACO_grn_smg","optic_Aco","optic_Aco_smg",
	"H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_mcamo","H_Booniehat_grn",
	"H_Booniehat_tan","H_Booniehat_khk_hs","H_Cap_red","H_Cap_blu","H_Cap_oli",
	"H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_grn",
	"H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs",
	"H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_gry",
	"H_Bandanna_camo","H_Bandanna_mcamo","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive",
	"H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Beret_blk",
	"H_Watchcap_blk","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_sgg","",""
],true] call BIS_fnc_addVirtualItemCargo;
// Ammunition // Боеприпасы
[ _box, [
	"SmokeShell","SmokeShellRed","SmokeShellOrange","SmokeShellYellow","SmokeShellGreen",
	"SmokeShellPurple","SmokeShellBlue",
	"Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue",
	"1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"HandGrenade","MiniGrenade",
	"UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F",
	"UGL_FlareYellow_F","UGL_FlareCIR_F",
	"FlareWhite_F","FlareGreen_F","FlareRed_F","FlareYellow_F",
	"ATMine_Range_Mag",	"APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag",
	"30Rnd_556x45_Stanag","20Rnd_556x45_UW_mag","16Rnd_9x21_Mag"
],true] call BIS_fnc_addVirtualMagazineCargo;
// Weapon // Оружие
[ _box, [
	"arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F"
],true] call BIS_fnc_addVirtualWeaponCargo;
// Backpacks // Рюкзаки
[ _box, [
	"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr",
	"B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr",
	"B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli",
	"B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk",
	"B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk","B_Carryall_cbr","B_Parachute"
],true] call BIS_fnc_addVirtualBackpackCargo;

//////////////////////////////////
// Side specific // Для фракций //
//////////////////////////////////

switch (_side) do {
    case "EAST": {
		// Ammunition // Боеприпасы
		[ _box, [
			"RPG32_F","RPG32_HE_F","5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","30Rnd_9x21_Mag","30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_556x45_Stanag_Tracer_Green","150Rnd_762x51_Box",
			"150Rnd_762x51_Box_Tracer","10Rnd_762x51_Mag","6Rnd_45ACP_Cylinder","O_IR_Grenade"
		],true] call BIS_fnc_addVirtualMagazineCargo;
		// Weapon // Оружие
		[ _box, [
			"launch_RPG32_F","srifle_GM6_F","hgun_Rook40_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F",
			"LMG_Zafir_F","SMG_02_F","srifle_DMR_01_F","hgun_Pistol_heavy_02_F"
		],true] call BIS_fnc_addVirtualWeaponCargo;
		// Equipment // Снаряжение
		[ _box, [
			"NVGoggles_OPFOR",
			"U_O_CombatUniform_ocamo","U_O_GhillieSuit","U_O_PilotCoveralls","U_O_Wetsuit",
			"U_O_CombatUniform_oucamo","U_O_SpecopsUniform_ocamo","U_O_OfficerUniform_ocamo",
			"V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVest_brn","V_TacVest_blk",
			"V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry","V_RebreatherIR","H_Beret_ocamo",
			"H_PilotHelmetHeli_O","H_CrewHelmetHeli_O","H_HelmetO_ocamo",
			"H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_HelmetO_oucamo",
			"H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk"
		],true] call BIS_fnc_addVirtualItemCargo;
		// Backpacks // Рюкзаки
		[ _box, [
			"O_Mortar_01_support_F","O_Mortar_01_weapon_F","O_HMG_01_support_F","O_HMG_01_support_high_F",
			"O_HMG_01_weapon_F","O_GMG_01_weapon_F","O_HMG_01_high_weapon_F","O_GMG_01_high_weapon_F",
			"O_AA_01_weapon_F","O_AT_01_weapon_F"
		],true] call BIS_fnc_addVirtualBackpackCargo;
	};
    case "WEST": {
		// Ammunition // Боеприпасы
		[ _box, [
			"NLAW_F","7Rnd_408_Mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_tracer_green","11Rnd_45ACP_Mag","B_IR_Grenade"
		],true] call BIS_fnc_addVirtualMagazineCargo;
		// Weapon // Оружие
		[ _box, [
			"launch_NLAW_F","srifle_LRR_F","hgun_P07_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MX_SW_F",
			"arifle_MXM_F","SMG_01_F","hgun_Pistol_heavy_01_F"
		],true] call BIS_fnc_addVirtualWeaponCargo;
		// Equipment // Снаряжение
		[ _box, [
			"NVGoggles",
			"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest",
			"U_B_GhillieSuit","U_B_HeliPilotCoveralls","U_B_Wetsuit","U_B_PilotCoveralls",
			"V_BandollierB_rgr","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrierGL_rgr",
			"V_PlateCarrierSpec_rgr","V_TacVest_blk","V_RebreatherB",
			"H_HelmetB","H_HelmetB_light","H_HelmetB_light","H_HelmetB_plain_mcamo","H_HelmetSpecB",
			"H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetB_grass",
			"H_HelmetB_desert","H_HelmetB_sand","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B",
			"H_MilCap_mcamo","H_HelmetB_light_desert","H_HelmetB_light_sand"
		],true] call BIS_fnc_addVirtualItemCargo;
		// Backpacks // Рюкзаки
		[ _box, [
			"B_Mortar_01_support_F","B_Mortar_01_weapon_F","B_HMG_01_support_F","B_HMG_01_support_high_F",
			"B_HMG_01_weapon_F","B_GMG_01_weapon_F","B_HMG_01_high_weapon_F","B_GMG_01_high_weapon_F",
			"B_AA_01_weapon_F","B_AT_01_weapon_F"
		],true] call BIS_fnc_addVirtualBackpackCargo;
	};
};
