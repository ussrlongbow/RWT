class RWT_SMART_MENU_SELF // Layout for smart self-interaction menu
{
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['RWT_SMART_MENU_SELF_DISPLAY', _this select 0];"; 
		   
	class Controls {
		class RWT_SM_ACTION_ONE: RscPicture {
			// border for action
			text = ""; // image path, changed in runtime
			idc = 67101; // legend: 67 - unique id for this menu, 1 - number of actions (0 for base classes), 0 (or 1) - border (or icon), 1 - action index
			sizeEx = "0.02 / (getResolution select 5)";
			x = 0.9 * safezoneW + safezoneX;
			y = 0.005 * safezoneH + safezoneY;
			w = 0.1  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class LB_HUD_FIRE : RscPicture {
			text = "";
			idc = 32201;
			sizeEx = "0.02 / (getResolution select 5)";
			x = 0.9 * safezoneW + safezoneX;
			y = 0.025 * safezoneH + safezoneY;
			w = 0.1  * safezoneW;
			h = 0.025  * safezoneH;
		};
   
	};
}; 