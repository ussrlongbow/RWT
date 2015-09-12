private ["_player","_is_jip"];
_player = _this select 0;
_is_jip = _this select 1;

// waitUntil is Null display 46 

// register layer for RWT Smart Menu
("RWT_SM_Layer" call BIS_fnc_rscLayer) cutRsc ["RWT_SMART_MENU_DUMMY","PLAIN"];
("RWT_MD_Layer" call BIS_fnc_rscLayer) cutRsc ["RWT_MENU_DEBUG","PLAIN"];
[_player] call RWT_fnc_initPlayer;