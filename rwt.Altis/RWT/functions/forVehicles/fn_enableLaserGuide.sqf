_veh = _this select 0;
_soldier = _this select 1;
_req_headgear = switch (side _soldier) do
{
	case west: {"H_PilotHelmetHeli_B"};
	case east: {"H_PilotHelmetHeli_O"};
};
// _uniform = uniform _soldier; // must be U_O_PilotCoveralls
_headgear = headgear _soldier;
RWT_LG_typeOfLaserTarget = switch (side player) do
			{
				case west: {"LaserTargetW"};
				case east: {"LaserTargetE"};
			};

if ( (_headgear == _req_headgear) && (player == _soldier) ) then
{
	enabledLaserGuide = addMissionEventHandler [
		"Draw3D",
		{
			_laze = player nearEntities [RWT_LG_typeOfLaserTarget, 2000];
			{
				_vp = visiblePosition _x
				_t = worldtoscreen _vp;
				_notisvis = terrainIntersect [eyePos player, _vp];
				_infov = (_t select 0 > 0.1 && _t select 0 < 0.9) && (_t select 1 > 0.1 && _t select 1 < 0.9);
				if (_infov && !_notinvis) then
				{drawIcon3D ["\A3\ui_f\data\igui\cfg\cursors\attack_ca.paa", [1,0,0,1], visiblePosition _x, 1, 1, 45, ""]};
			} forEach _laze;
		}
	];
	_veh addEventHandler [
		"GetOut",
		{ removeMissionEventHandler ["Draw3D",enabledLaserGuide];}
	];
};
true