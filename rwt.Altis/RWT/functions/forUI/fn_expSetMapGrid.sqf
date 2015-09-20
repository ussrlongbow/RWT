// write mapgrid in exp iface
disableSerialization;
_control = _this select 0;

if ("ItemGPS" in assignedItems player) then {
	_control ctrlSetText (mapGridPosition player);
	_control ctrlEnable false;
}