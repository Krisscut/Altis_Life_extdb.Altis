/*
	File: fn_extractFromJail.sqf
	Author: S.lambert

	Description:
	Move the target to the extraction point of the prison
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	_unit setPos ( getmarkerPos "jail_release");
	ctrlSetText[9030, format ["Le joueur %1 a été sorti de prison", name _unit]];
};