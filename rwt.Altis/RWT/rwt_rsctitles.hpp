class RscText {
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_CENTER;
    linespacing = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,0,1};
	colorBorder[] = {0,0,0,0};
    text = "Test";
    shadow = 0;
    font = "PuristaLight";
    sizeEx = "0.035 / (getResolution select 5)";
    x = 0.40 * safezoneW + safezoneX;
    y = 0.15 * safezoneH + safezoneY;
    w = 0.4  * safezoneW;
	h = 0.1  * safezoneH;
};

class RscPicture {
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
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

class RscPictureKeepAspect: RscPicture {
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};

#include "ui\rwt_menu_dummy.hpp"
#include "ui\rwt_menu_debug.hpp"