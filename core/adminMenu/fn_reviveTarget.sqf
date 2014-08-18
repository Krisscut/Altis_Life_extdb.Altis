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
		[[_unit],"life_fnc_defibrillateur_son",nil,true] spawn life_fnc_MP;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		_unit setVariable ["FAR_isUnconscious", 0, true];
		_unit setVariable ["FAR_isDragged", 0, true];
		systemchat format["%1 a été réanimé", name _unit];
		ctrlSetText[9030,format["%1 a été réanimé", name _unit]];
	}
	else
	{
		ctrlSetText[9030,format["%1 n'est pas inconscient", name _unit]];
	};

};