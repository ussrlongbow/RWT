/*
RWT configuration, must be executed at preInit


*/
// set to true to enable RWT Smart Menu
RWT_SMART_MENU_ENABLED = true;

// Read smart menu configuration
if (RWT_SMART_MENU_ENABLED) then { call RWT_fnc_smartMenuConfig; };