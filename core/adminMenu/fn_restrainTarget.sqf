/*
	File: fn_restrainTarget.sqf
	Author: S.lambert

	Description:
	Restrain à distance la cible
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	if(isNull _unit) exitWith {}; //Not valid
	if((_unit getVariable "restrained")) exitWith {};
	if((_unit getVariable "civrestrained")) exitWith {};
	if((player getVariable "civrestrained")) exitWith {};
	if((player getVariable "restrained")) exitWith {};
	if(player == _unit) exitWith { ctrlSetText[9030,format["Vous ne pouvez pas vous menotter vous-même", name _unit]]; };
	if(!isPlayer _unit) exitWith {};

	//Broadcast!
	_unit setVariable["playerSurrender",false,true];
	_unit setVariable["restrained",true,true];
	[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;


	[[0,format["%1 a été menotté à distance par l'administrateur %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	ctrlSetText[9030,format["Joueur %1 menotté", name _unit]];
};