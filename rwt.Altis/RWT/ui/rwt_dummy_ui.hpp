class rwt_dummy_ui {
	idd=-1;
	movingenable = false;
	enableSimulation = true;
	class controls {
		class RWT_sample_dialog: RscButton {
			idc = 9001;
			text = "Self menu!"; //--- ToDo: Localize;
			x = 0.420312 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.207188 * safezoneW;
			h = 0.085 * safezoneH;
			tooltip = "Click to close"; //--- ToDo: Localize;
			action = "closeDialog 0";
		};
	};
};