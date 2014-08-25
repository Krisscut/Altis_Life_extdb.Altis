/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Komodo

	Description:
	Catches a dead turtle?
	Komodo: Spawns a new one!
*/
private["_obj","_newTurtle"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];

	//if turtle catched, spawns a new one in a determined radius.
	_newTurtle = createAgent ["Turtle_F", position player, [], 20, "FORM"];
};