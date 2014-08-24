#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_unit = call compile format["%1",getSelData(2721)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous êtes déjà leader!"};

_action = [
	format["Vous êtes sur le point de transférer le grade de leader a %1<br/>En transférant le grade de leader vous ne serez plus en msure de contrôler le gang.",_unit getVariable ["realname",name _unit]],
	"Changer de leader",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
	grpPlayer setVariable["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[[_unit,grpPlayer],"clientGangLeader",_unit,false] spawn life_fnc_MP; //Boot that bitch!
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
} else {
	hint "Changement de leader du gang annulé.";
};
[] call life_fnc_gangMenu;