/*
	File: fn_mapRefresh.sqf
	Author: S.Lambert

	Description:
	Auto-refresh map and marker of the unit
*/
private["_map","_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	disableSerialization;
	_display = findDisplay 9000;

	_map = _display displayCtrl 9001;
	[_map,1,0.1,getPos _unit] call life_fnc_setMapPosition;
	_markerstr = [format["%1",name _unit]];
	_marker createmarkerLocal [_markerstr, getPos _unit]
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "DOT";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTextLocal _markerstr;

	ctrlSetText[9030,format["Tracking %1", name _unit]];
	sleep 1;
	while{player getVariable ["am_unitTargeted",false] == _unit} do
	{
		[_map,1,0.1,getPos _unit] call life_fnc_setMapPosition;
		_marker setMarkerPosLocal (getPos _unit);
		sleep 0.5;
	};
	deleteMarkerLocal _markerstr;
};