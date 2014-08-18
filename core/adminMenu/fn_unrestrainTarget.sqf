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

	if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

	_unit setVariable["restrained",FALSE,TRUE];
	_unit setVariable["Escorting",FALSE,TRUE];
	_unit setVariable["transporting",FALSE,TRUE];
	detach _unit;

	[[0,format["%1 a été relaché par l'administrateur %2",_unit getVariable["realname",name _unit], name player]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;
	[[_unit, "Cuff",10],"life_fnc_playSound",true,false] spawn BIS_fnc_mp;
};