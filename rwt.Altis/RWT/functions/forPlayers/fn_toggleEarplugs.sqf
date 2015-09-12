switch true do {
	case ((player getVariable ["rwt_status_earp",false]) && (soundVolume > 0.5)): {
		0.5 fadeSound 1;
		hint "Ear plugs off";
		player setVariable ["rwt_status_earp",false,false];
	};
	case (player getVariable ["rwt_status_earp",false]): {
		0.5 fadeSound (soundVolume * 2);
		hint "Ear plugs off";
		player setVariable ["rwt_status_earp",false,false];
	};
	default {
		0.5 fadeSound (soundVolume / 2);
		hint "Ear plugs on";
		player setVariable ["rwt_status_earp",true,false];
	};
};