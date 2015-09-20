// findDetonatorB
private ["_control","_type"];
disableSerialization;

_control = _this select 0;

_type = typeOf (player getVariable ["rwt_explosives_curr",objNull],false);