/*
	File: fn_moveTarget.sqf
	Author: S.lambert

	Description:
	Move the target to the designated position
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];


	if (_unit getVariable ["FAR_isUnconscious", 0] == 1) then
	{
		_unit spawn FAR_HandleRevive;
		ctrlSetText[9030,format["%1 a été réanimé", name _unit]];
	};

};