class rwt_dummy_ui2 {
	idd=-1;
	movingenable = false;
	enableSimulation = true;
	class controls {
		class RWT_sample_dialog: RscButton {
			idc = 9002;
			text = "Testing! Проверка?"; //--- ToDo: Localize;
			x = 0.420312 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.15 * safezoneH;
			tooltip = "Click to close"; //--- ToDo: Localize; PuristaMedium
			action = "closeDialog 0";
			SizeEx = 0.0800;
			font = "TahomaB";
		};
	};
};