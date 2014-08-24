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
	parseText format["Vous êtes sur le point de transférer le <t color='#d16428'>grade de leader</t> à <t color='#00aa00'>%1</t><br/>En transférant le grade de leader <t color='#ff0000'>vous ne serez plus en mesure de contrôler le gang.</t>",_unit getVariable ["realname",name _unit]],
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
	hint parseText "<t color='#00aa00'>Changement de leader du gang annulé.</t>";
};
[] call life_fnc_gangMenu;