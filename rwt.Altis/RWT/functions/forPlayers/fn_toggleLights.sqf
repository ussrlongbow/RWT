//
_light = _this select 0;
_light_exists = player getVariable ["rwt_status_light",false];
_light_obj = player getVariable ["rwt_status_light_obj",objNull];

// Exit if we try to attach light, while having one attached already
if ((_light != "") && _light_exists) exitWith {hint "Light already attached"; false};

switch _light do {
	case "c_blue": {
		_light_obj = "Chemlight_blue" createVehicle [0,0,0];
		player removeMagazine "Chemlight_blue";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		hint "Attached blue chemlight";
	};
	case "c_green": {
		_light_obj = "Chemlight_green" createVehicle [0,0,0];
		player removeMagazine "Chemlight_green";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		hint "Attached green chemlight";
	};
	case "c_red": {
		_light_obj = "Chemlight_red" createVehicle [0,0,0];
		player removeMagazine "Chemlight_red";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		hint "Attached red chemlight";
	};
	case "c_yellow": {
		_light_obj = "Chemlight_yellow" createVehicle [0,0,0];
		player removeMagazine "Chemlight_yellow";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		hint "Attached yellow chemlight";
	};
	// "I_IR_Grenade"
	case "ir_aaf": {
		// strobe = "IRStrobeBase" createVehicle [0,0,0]; strobe attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		_light_obj = "NVG_TargetC" createVehicle [0,0,0];
		player removeMagazine "I_IR_Grenade";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		player setVariable ["rwt_irstrobe_faction","I_IR_Grenade",true];
		hint "Attached AAF IR strobe"};
	// "O_IR_Grenade"
	case "ir_csat": {
		_light_obj = "NVG_TargetC" createVehicle [0,0,0];
		player removeMagazine "O_IR_Grenade";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		player setVariable ["rwt_irstrobe_faction","O_IR_Grenade",true];
		hint "Attached CSAT IR strobe";
	};
	// "B_IR_Grenade"
	case "ir_nato": {
		_light_obj = "NVG_TargetC" createVehicle [0,0,0];
		player removeMagazine "B_IR_Grenade";
		_light_obj attachTo [player, [0,-0.03,0.07], "LeftShoulder"]; 
		player setVariable ["rwt_status_light",true,false];
		player setVariable ["rwt_status_light_obj",_light_obj,false];
		player setVariable ["rwt_irstrobe_faction","B_IR_Grenade",true];
		hint "Attached NATO IR strobe"
	};
	case "": {
		if (_light_obj isKindOf "Chemlight_base") then {
			detach _light_obj;
			player setVariable ["rwt_status_light",false,false];
			player setVariable ["rwt_status_light_obj",objNull,false];
			hint "Detached chemlight";
		};
		if (_light_obj isKindOf "NVG_TargetC") then {
			systemchat (player getVariable "rwt_irstrobe_faction");
			player addMagazine (player getVariable "rwt_irstrobe_faction");
			detach _light_obj;
			deleteVehicle _light_obj;
			player setVariable ["rwt_status_light",false,false];
			player setVariable ["rwt_status_light_obj",objNull,false];
			hint "Detached IR strobe";
		};
	};
	default {false};
}


