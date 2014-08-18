#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous êtes déjà leader!"};

_action = [
	format["Vous êtes sur le point de transférer le grade de chef de groupe a %1.",_unit getVariable ["realname",name _unit]],
	"Changer de GroupLeader",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	(group player) selectLeader _unit;

} else {
	hint "Changement de group leader annulé.";
};
