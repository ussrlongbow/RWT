class RWT_SMART_MENU_DUMMY // Layout for smart self-interaction menu
{
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['RWT_SM_display', _this select 0];"; 
		   
	class Controls {
		class RWT_SM_HELPER: RscText{
			idc = 66300;
			// RWT Smart Menu helper, shows text hint for selected action
			text = "";
			colorText[] = {1,1,0,0.8};
		};
		// controls for action icons 1 to 9
		class RWT_SM_ACT_I1: RscPictureKeepAspect {
			text = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
			//colorText[] = {1,1,0,0.8};
			idc = 66301;
		};
		class RWT_SM_ACT_I2: RscPictureKeepAspect {
			text = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
			idc = 66302;
		};
		class RWT_SM_ACT_I3: RscPictureKeepAspect {
			text = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
			idc = 66303;
		};
		class RWT_SM_ACT_I4: RscPictureKeepAspect {
			text = "\A3\ui_f\data\map\markers\military\circle_CA.paa";
			idc = 66304;
		};
		class RWT_SM_ACT_I5: RscPictureKeepAspect {
			idc = 66305;
		};
		class RWT_SM_ACT_I6: RscPictureKeepAspect {
			idc = 66306;
		};
		class RWT_SM_ACT_I7: RscPictureKeepAspect {
			idc = 66307;
		};
		class RWT_SM_ACT_I8: RscPictureKeepAspect {
			idc = 66308;
		};
		class RWT_SM_ACT_I9: RscPictureKeepAspect {
			idc = 66309;
		};
		// control for action icon borders
		class RWT_SM_ACT_B1: RscPictureKeepAspect {
			idc = 66311;
		};
		class RWT_SM_ACT_B2: RscPictureKeepAspect {
			idc = 66312;
		};
		class RWT_SM_ACT_B3: RscPictureKeepAspect {
			idc = 66313;
		};
		class RWT_SM_ACT_B4: RscPictureKeepAspect {
			idc = 66314;
		};
		class RWT_SM_ACT_B5: RscPictureKeepAspect {
			idc = 66315;
		};
		class RWT_SM_ACT_B6: RscPictureKeepAspect {
			idc = 66316;
		};
		class RWT_SM_ACT_B7: RscPictureKeepAspect {
			idc = 66317;
		};
		class RWT_SM_ACT_B8: RscPictureKeepAspect {
			idc = 66318;
		};
		class RWT_SM_ACT_B9: RscPictureKeepAspect {
			idc = 66319;
		};
	};
}; 
