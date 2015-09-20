// RWT base control classes
// Prefix RWT_CC_ means RWT Control Class

// Static
class RWT_CC_Text {
	access = 0;
	idc = -1;
	type = RWT_CT_STATIC;
	style = RWT_ST_MULTI;
	linespacing = 1;
    colorBackground[] = RWT_C_TRANSPARENT;
    colorText[] = RWT_C_WHITE;
	text = "";
    shadow = 0;
    font = "PuristaLight";
    SizeEx = RWT_GUI_GRID_H;
    fixedWidth = 0;
    x = 0; y = 0; h = 0; w = 0;
};

class RWT_CC_Button {
	access = 0;
	idc = -1;
	type = RWT_CT_BUTTON;
	style = RWT_ST_CENTER;
	action = "";
	default = false;
	borderSize = 0;
	text = "";
	toolTip = "";
	shadow = 0;
    font = "PuristaLight";
    SizeEx = RWT_GUI_GRID_H;
	colorText[] = RWT_C_WHITE;
    colorDisabled[] = RWT_C_SILVER;
    colorBackground[] = {0,0,0,0.3};
    colorBackgroundDisabled[] = RWT_C_GUNMETAL;
    colorBackgroundActive[] = {0,0,0,0.3};
    colorFocused[] = {0.75,0.75,0.75,.5};
    colorShadow[] = RWT_C_TRANSPARENT;
    colorBorder[] = RWT_C_BLACK;
	soundEnter[] = {"",0.09,1};
    soundPush[] = {"",0,0};
    soundClick[] = {"",0.07,1};
    soundEscape[] = {"",0.09,1};
	offsetPressedX = 0.05 * RWT_GUI_GRID_H;
    offsetPressedY = 0.05 * RWT_GUI_GRID_H;
	offsetX = 0; offsetY = 0;
	x = 0; y = 0; h = 0; w = 0;
};

class RWT_CC_Edit {
	access = 0;
	idc = -1;
	type = RWT_CT_EDIT;
	style = RWT_ST_LEFT;
	x = 0; y = 0; h = 0; w = 0;
	colorBackground[] = RWT_C_BLACK;
	colorText[] = RWT_C_WHITE;
	colorSelection[] = RWT_C_SILVER;
	colorDisabled[] = RWT_C_GUNMETAL;
	font = "PuristaLight";
	sizeEx = RWT_GUI_GRID_H;
	autocomplete = "";
	text = "";
	shadow = 0;
};

class RWT_CC_Scrollbar {
	access = 0;
	idc = -1;
	type = RWT_CT_SLIDER;
	style = RWT_SL_HORZ;
	x = 0; y = 0; h = 0; w = 0;
	color[] = RWT_C_WHITE; 
    coloractive[] = RWT_C_RED;
	onSliderPosChanged = "";
};

class RWT_CC_Combo {
	access = 0;
	idc = -1;
	type = RWT_CT_COMBO;
	style = RWT_ST_LEFT;
	x = 0; y = 0; h = 0; w = 0;
	text = "";
	default = 0;
	blinkingPeriod = 0;
	shadow = 0;
	sizeEx = RWT_GUI_GRID_H;
	font = "PuristaLight";
	colorSelect[] = {0.6,0.6,0.6,1};
	colorText[] = RWT_C_WHITE;
	colorBackground[] = {0.2,0.2,0.2,1};
	colorScrollbar[] = RWT_C_WHITE;
	colorDisabled[] = {0.4, 0.4, 0.4, 1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1.0;
	wholeHeight = 0.25;
	rowHeight = 0.025;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	class ComboScrollBar : RWT_CC_Scrollbar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
		shadow = 0;
	};
};

class RWT_CC_Picture {
	access = 0;
    idc = -1;
    type = RWT_CT_STATIC;
    style = RWT_ST_PICTURE;
	x = 0; y = 0; h = 0; w = 0;
	colorBackground[] = RWT_C_TRANSPARENT;
    colorText[] = RWT_C_WHITE;
	font = "PuristaLight";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};

class RWT_CC_Checkbox {
	access = 0;
	idc = -1;
	type = RWT_CT_CHECKBOXES;
	style = RWT_ST_CENTER;
	rows = 1;
	columns = 1;
	colorText[] = RWT_C_RED;
	color[] = RWT_C_GREEN;  //seems nothing to change, but define to avaoid errors
	colorTextSelect[] = {0, 0.8, 0, 1};
	colorSelect[] = RWT_C_BLACK;
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};// colorSelectedBg
	colorSelectedBg[] = {0.4, 0.4, 0.4, 1};
	sizeEx = RWT_GUI_GRID_H;
	font = "PuristaLight";
	strings[] = {""};
};