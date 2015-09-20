// RWT UI for explosives configuration

// Inherited control classes

class RWT_UI_Explosives_Config_Title: RWT_CC_Text{
	style = RWT_ST_CENTER;
	text = "";
	x = RWT_GUI_GRID_X;
	w = 24 * RWT_GUI_GRID_W;
	h = 1 * RWT_GUI_GRID_H;
	colorText[] = RWT_C_BLACK;
	colorBackground[] = RWT_C_YELLOW;
};
class RWT_UI_Explosives_Config_Text: RWT_CC_Text{
	style = RWT_ST_CENTER;
	h = 1 * RWT_GUI_GRID_H;
	colorText[] = RWT_C_WHITE;
	colorBackground[] = RWT_C_TRANSPARENT;
	sizeEx = 0.75 * RWT_GUI_GRID_H;
};
class RWT_UI_Explosives_Config_Text_Edit: RWT_CC_Edit{
	style = RWT_ST_CENTER;
	h = 1 * RWT_GUI_GRID_H;
	y = 2 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
	sizeEx = 0.75 * RWT_GUI_GRID_H;
};
class RWT_UI_Explosives_Config_Button: RWT_CC_Button {
	y = 11 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
	w = 6 * RWT_GUI_GRID_W;
	h = 3 * RWT_GUI_GRID_H;
	colorText[] = RWT_C_WHITE;
	font = "PuristaBold";
	sizeEx = 1.2 * RWT_GUI_GRID_H;
	colorDisabled[] = {0.2,0.2,0.2,0.3};
};

// Primary dialog
class RWT_UI_Explosives_Config {
	idd = 81100;
	movingenable = false;
	enableSimulation = true;
	onLoad = "";
	controlsBackground[] = { RWT_UI_Explosives_Config_Frame };
	class RWT_UI_Explosives_Config_Frame: RWT_CC_Text {
		idc = -1;
		x = RWT_GUI_GRID_X;
		y = RWT_GUI_GRID_Y;
		w = 24 * RWT_GUI_GRID_W;
		h = 17 * RWT_GUI_GRID_H;
		colorText[] = RWT_C_WHITE;
		colorBackground[] = {0.2,0.2,0.2,0.7};
		colorActive[] = RWT_C_WHITE;
		text = "";
	};
	class Controls {
		class RWT_UI_Explosives_Config_Header: RWT_UI_Explosives_Config_Title {
			idc = 81101;
			text = "Charge";
			y = RWT_GUI_GRID_Y;
			onLoad = "_this call RWT_fnc_expLocalizeBombName";
		};
		class RWT_UI_Explosives_Config_Image: RWT_CC_Picture {
			idc = 81102;
			text = "";
			x = RWT_GUI_GRID_X;
			y = 1 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 8 * RWT_GUI_GRID_W;
			h = 8 * RWT_GUI_GRID_H;
			colorText[] = RWT_C_WHITE;
			onLoad = "_this call RWT_fnc_expFindBombImage";
		};
		class RWT_UI_Explosives_Config_Status_Text: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_CENTER;
			text = "Status"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 1 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 10 * RWT_GUI_GRID_W;
			font = "PuristaMedium";
			sizeEx = RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_Status_Value: RWT_UI_Explosives_Config_Text {
			idc = 81103;
			style = RWT_ST_CENTER;
			text = "SAFE"; //--- ToDo: Localize;
			x = 18 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 1 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 6 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			font = "PuristaBold";
			colorText[] = RWT_C_GREEN;
			sizeEx = RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_Text_Timeout: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_LEFT;
			text = "Self-destruction in:";
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 2 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 8.5 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Hours: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81104;
			text = "0";
			w = 1.25 * RWT_GUI_GRID_W;
			x = 16.5 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			onMouseZChanged = "[_this,24,1,1] call RWT_fnc_scrollNumber";
		};
		class RWT_UI_Explosives_Config_Text_Hours: RWT_UI_Explosives_Config_Text {
			text = "hrs";
			x = 17.75 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 2 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 1.25 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Mins: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81105;
			text = "5";
			w = 1.25 * RWT_GUI_GRID_W;
			x = 19 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			onMouseZChanged = "[_this,60,5,1] call RWT_fnc_scrollNumber";
		};
		class RWT_UI_Explosives_Config_Text_Mins: RWT_UI_Explosives_Config_Text {
			text = "min";
			x = 20.25 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 2 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 1.25 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Secs: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81106;
			text = "0";
			w = 1.25 * RWT_GUI_GRID_W;
			x = 21.5 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			onMouseZChanged = "[_this,60,5,1] call RWT_fnc_scrollNumber";
		};
		class RWT_UI_Explosives_Config_Text_Secs: RWT_UI_Explosives_Config_Text {
			text = "sec";
			x = 22.75 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 2 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 1.25 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
		};
		class RWT_UI_Explosives_Config_DetonatorA_Text: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_LEFT;
			text = "Detonator A:"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 3 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 8.5 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_DetonatorB_Text: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_LEFT;
			text = "Detonator B:"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 4 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 8.5 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_Remote_Text: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_LEFT;
			text = "Remote type:"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 5 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 8.5 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_SensorA: RWT_CC_Combo {
			idc = 81107;
			text = ""; //--- ToDo: Localize;
			x = 16.5 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 3 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 7.5 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
			onLoad = "(_this select 0) lbAdd 'None';(_this select 0) lbAdd 'Remote';(_this select 0) lbAdd 'Wire';";
		};
		class RWT_UI_Explosives_Config_SensorB: RWT_CC_Combo {
			idc = 81108;
			text = ""; //--- ToDo: Localize;
			x = 16.5 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 4 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 7.5 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
			onLoad = "(_this select 0) lbAdd 'None';";
		};
		class RWT_UI_Explosives_Config_Remote: RWT_CC_Combo {
			idc = 81109;
			text = ""; //--- ToDo: Localize;
			x = 16.5 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 5 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 7.5 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			sizeEx = 0.75 * RWT_GUI_GRID_H;
			onLoad = "(_this select 0) lbAdd 'Simple';(_this select 0) lbAdd 'Code';(_this select 0) lbAdd 'Encrypt';";
		};
		class RWT_UI_Explosives_Config_Text_Code: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_CENTER;
			text = "Code:"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 6 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 4 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Code: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81110;
			text = "123456";
			w = 4 * RWT_GUI_GRID_W;
			x = 12 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 6 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
		};
		class RWT_UI_Explosives_Config_Text_Grid: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_CENTER;
			text = "Grid:"; //--- ToDo: Localize;
			x = 16 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 6 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 4 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Grid: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81111;
			text = "";
			w = 4 * RWT_GUI_GRID_W;
			x = 20 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 6 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			onLoad = "if ('ItemGPS' in assignedItems player) then {(_this select 0) ctrlSetText (mapGridPosition player); (_this select 0) ctrlEnable false;}";
		};
		class RWT_UI_Explosives_Config_Text_Key: RWT_UI_Explosives_Config_Text {
			style = RWT_ST_LEFT;
			text = "Encryption key:"; //--- ToDo: Localize;
			x = 8 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 7 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 6 * RWT_GUI_GRID_W;
		};
		class RWT_UI_Explosives_Config_Text_Edit_Key: RWT_UI_Explosives_Config_Text_Edit {
			idc = 81112;
			text = "";
			w = 10 * RWT_GUI_GRID_W;
			x = 14 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 7 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			onLoad = "(_this select 0) ctrlEnable false";
		};
		class RWT_UI_Explosives_Config_Diary: RWT_CC_Checkbox {
			idc = 81113;
			style = RWT_ST_LEFT;
			x = 1 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 9 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 22 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			rowHeight = RWT_GUI_GRID_H;
			rows = 1;
			columns = 2;
			sizeEx = 1 * RWT_GUI_GRID_H;
			font = "PuristaMedium";
			strings[] = {"Note code in diary", "Note location in diary"};
			colorSelect[] = {0,1,0,1};
			colorText[] = {0.8,0.8,0.8,1};
			colorSelectedBg[] = {0, 0.4, 0.4, 0};
		};
		class RWT_UI_Explosives_Config_Button_Arm: RWT_UI_Explosives_Config_Button {
			idc = 81114;
			text = "ARM"; //--- ToDo: Localize;
			x = 1 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			colorBackground[] = {1,0.6,0,1};
			colorBackgroundDisabled[] = {0.502,0.298,0,1};
			colorBackgroundActive[] = {1,0.6,0,1};
			colorFocused[] = {1,0.6,0,1};
		};
		class RWT_UI_Explosives_Config_Button_Disarm: RWT_UI_Explosives_Config_Button {
			idc = 81115;
			text = "Disarm"; //--- ToDo: Localize;
			x = 9 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			colorBackground[] = {0,0.6,0,1};
			colorBackgroundDisabled[] = {0,0.361,0,1};
			colorBackgroundActive[] = {0,0.6,0,1};
			colorFocused[] = {0,0.6,0,1};
		};
		class RWT_UI_Explosives_Config_Button_Commit: RWT_UI_Explosives_Config_Button {
			idc = 81116;
			text = "Commit"; //--- ToDo: Localize;
			x = 17 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			colorBackground[] = {0.2,0.6,1,1};
			colorBackgroundDisabled[] = {0.141,0.419,0.698,1};
			colorBackgroundActive[] = {0.2,0.6,1,1};
			colorFocused[] = {0.2,0.6,1,1};
		};
		class RWT_UI_Explosives_Config_FooterA: RWT_UI_Explosives_Config_Title {
			idc = 81117;
			style = RWT_ST_LEFT;
			text = "Message, line 1"; //--- ToDo: Localize;
			x = 0 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 15 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 24 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			colorBackground[] = {1,0.5,0,1};
		};
		class RWT_UI_Explosives_Config_FooterB: RWT_UI_Explosives_Config_Title {
			idc = 81117;
			style = RWT_ST_LEFT;
			text = "Message, line 2"; //--- ToDo: Localize;
			x = 0 * RWT_GUI_GRID_W + RWT_GUI_GRID_X;
			y = 16 * RWT_GUI_GRID_H + RWT_GUI_GRID_Y;
			w = 24 * RWT_GUI_GRID_W;
			h = 1 * RWT_GUI_GRID_H;
			colorBackground[] = RWT_C_GREEN;
		};
	};
};