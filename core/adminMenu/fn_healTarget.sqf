/*
	File: fn_healTarget.sqf
	Author: S.lambert

	Description:
	Heal the designated unit
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	_unit setDamage 0;
	ctrlSetText[9030,format["Joueur %1 : santé restaurée", name _unit]];
};