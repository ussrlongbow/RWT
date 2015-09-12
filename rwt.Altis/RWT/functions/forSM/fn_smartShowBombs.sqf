private ["_has_bombs","_show"];

_has_bombs = call RWT_fnc_hasSomeBombs;
_show = false;

if (player == vehicle player) then {
	_show = (_has_bombs select 0) || (_has_bombs select 1);
};

if (player != vehicle player) then {
	_show = _has_bombs select 2;
};
_show;