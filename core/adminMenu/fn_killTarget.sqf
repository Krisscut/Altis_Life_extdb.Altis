/*
	File: fn_closeMenu.sqf
	Author: S.lambert

	Description:
	Delete var on player about usingAdminMenu
*/
private["_unit","_mycv"];

if (!isNil {player getVariable ["am_unitTargeted"]}) then
{
	_unit = player getVariable ["am_unitTargeted"];
	_unit setDamage 1;
	systemChat format ["Le joueur %1 a été tué par un l'administrateur %2", name _unit,name player];
};