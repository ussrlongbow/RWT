_veh = _this select 0;

_firemode = currentWeaponMode _veh;
switch (_firemode) do {
    case "Single": { firepic = "| " };
    case "Burst": { firepic = "| | | " };
	case "FullAuto": { firepic = "| | | | | " };
	case "EGLM": { firepic = "GL " };
	default { firepic = ""};
};
firepic