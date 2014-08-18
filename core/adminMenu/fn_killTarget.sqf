/*
	File: fn_closeMenu.sqf
	Author: S.lambert

	Description:
	Delete var on player about usingAdminMenu
*/
private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	_unit setDamage 1;
	systemChat format ["Le joueur %1 a été tué par un l'administrateur %2", name _unit,name player];

	ctrlSetText[9030,format["Joueur %1 tué", name _unit]];
};