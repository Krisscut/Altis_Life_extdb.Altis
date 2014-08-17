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

	[[_unit,false,_time],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
	[[0,format["%1 a été envoyé en prison par l'administrateur %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	ctrlSetText[9030,format["Joueur %1 envoyé en prison", name _unit]];
};