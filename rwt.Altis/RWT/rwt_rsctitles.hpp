class RWT_RscText {
    access = 0;
    idc = -1;
    type = RWT_CT_STATIC;
    style = RWT_ST_CENTER;
    linespacing = 0;
    colorBackground[] = RWT_C_TRANSPARENT;
    colorText[] = RWT_C_YELLOW;
	colorBorder[] = RWT_C_TRANSPARENT;
    text = "";
    shadow = 0;
    font = "PuristaLight";
    sizeEx = "0.035 / (getResolution select 5)";
    x = 0.40 * safezoneW + safezoneX;
    y = 0.15 * safezoneH + safezoneY;
    w = 0.4  * safezoneW;
	h = 0.1  * safezoneH;
};

class RWT_RscPicture {
    access = 0;
    idc = -1;
    type = RWT_CT_STATIC;
    style = RWT_ST_PICTURE;
    colorBackground[] = RWT_C_TRANSPARENT;
    colorText[] = RWT_C_TRANSPARENT;
    font = "PuristaLight";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.025 * safezoneW;
    h = 0.025 * safezoneH;
};

class RWT_RscPictureKeepAspect: RWT_RscPicture {
	style = RWT_ST_PICTURE + RWT_ST_KEEP_ASPECT_RATIO;
};

#include "ui\rwt_menu_dummy.hpp"
#include "ui\rwt_menu_debug.hpp"