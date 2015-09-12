private ["_dir","_delta","_target","_house","_door","_state"];
_dir = _this select 0;

if (!RWT_SMART_CTRL_PRESSED) exitWith{false};

if (_dir) then {
	_delta = 0.1;
} else {
	_delta = -0.1;
};


// Exit with false if Ctrl key not pressed at the moment

// Find door we aim at
_target = call RWT_fnc_findDoor;
// Building object
_house = _target select 0;
// Get animation selection
_door = format ["%1_rot", (_target select 1)];
// Get door state
_state = _house animationPhase _door;

switch true do {
	case ((_state+_delta) < 0.1): {_house animate [_door,0]};
	case ((_state+_delta) > 0.9): {_house animate [_door,1]};
	default {_house animate [_door,(_state+_delta)]};
};
RWT_SMART_CTRL_PRESSED;