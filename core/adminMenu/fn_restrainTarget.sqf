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
	if(player == _unit) exitWith {};
	if(!isPlayer _unit) exitWith {};

	//Broadcast!
	_unit setVariable["playerSurrender",false,true];
	_unit setVariable["restrained",true,true];
	[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
	//AJOUT SKY LE 10/08/2014 pour rajouter les actions médic
	//Si la personne est côté BLUEFOR alors :

	[[0,format["%1 a été menotté à distance par l'administrateur %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};