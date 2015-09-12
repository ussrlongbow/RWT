_veh = _this select 0;
_veh addEventHandler [
	"GetIn",
	{
		[_this select 0, _this select 2] call RWT_fnc_enableLaserGuide;
	}
];