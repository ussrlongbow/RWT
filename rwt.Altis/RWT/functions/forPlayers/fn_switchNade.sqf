// function to switch thrown item and display it
// by longbow
private ["_curnade","_hasnade"];
_curnade = (profileNamespace getVariable "curNade");
_hasnade = (profileNamespace getVariable "hasNade");

while {_curnade == (_hasnade select 0)} do {
	_hasnade = [_hasnade,true] call LB_fnc_arrayRotate;
	profileNamespace setVariable ["hasNade",_hasnade];
};
_curnade = _hasnade select 0;
profileNamespace setVariable ["curNade",_curnade];
player sidechat str _curnade;
