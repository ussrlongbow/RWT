private ["_veh","_player_vel","_nade_vel"];
_veh = _this select 0;
_veh addEventHandler ["Fired",{
	if ((_this select 1) == "Throw") then {
	player sidechat str speed (_this select 6);};
}];
true

// rgn 93.6
// smoke 79.2
// chemlight 50.4
// ir grenade 64.8
// rgo 64.8
