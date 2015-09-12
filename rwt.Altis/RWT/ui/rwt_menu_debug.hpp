class RWT_MD_TEXT {
	access = 0;
	type = CT_STATIC;
	style = ST_LEFT;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,0.8};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
	shadow = 2;
	font = "puristaMedium";
	sizeEx = "0.02 / (getResolution select 5)";
};

class RWT_MENU_DEBUG // Layout for smart self-interaction menu
{
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['RWT_MD_display', _this select 0];";
	
	class Controls {
		class RWT_MD_CURSOR_TARGET: RWT_MD_TEXT {
			text = "Cursor Target";
			idc = 76501;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.005 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_AIM_POS: RWT_MD_TEXT {
			text = "Aiming position";
			idc = 76502;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.025 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_EYE_POS: RWT_MD_TEXT {
			text = "Eye Position";
			idc = 76503;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.045 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_EYE_DIR: RWT_MD_TEXT {
			text = "Eye Direction";
			idc = 76504;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.065 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_WEAP_DIR: RWT_MD_TEXT {
			text = "Weapon Direction";
			idc = 76505;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.085 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_OBJ_INTERSECT: RWT_MD_TEXT {
			text = "Object Intersect";
			idc = 76506;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.105 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
		class RWT_MD_OBJ_SELECTION: RWT_MD_TEXT {
			text = "Object Selection";
			idc = 76507;
			x = 0.05 * safezoneW + safezoneX;
			y = 0.125 * safezoneH + safezoneY;
			w = 0.3  * safezoneW;
			h = 0.025  * safezoneH;
		};
	};
};