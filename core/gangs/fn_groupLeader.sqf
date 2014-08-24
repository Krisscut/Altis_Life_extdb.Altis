#include <macro.h>
/*
	Author: S.Lambert

	Description:
	Change group Leader
*/
private["_unit","_action"];
disableSerialization;

//if (true) exitWith {hint "Fonction en cours de developpement!"};
if((lbCurSel 2621) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous êtes déjà leader!"};

_action = [
	format["Vous êtes sur le point de transférer le grade de chef de groupe à %1.",_unit getVariable ["realname",name _unit]],
	"Changer de GroupLeader",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	(group player) selectLeader _unit;
	[[_unit,grpPlayer],"clientGroupLeader",_unit,false] spawn life_fnc_MP; //Boot that bitch!
} else {
	hint "Changement de group leader annulé.";
};
