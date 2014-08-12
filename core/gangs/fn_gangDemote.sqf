#include <macro.h>

if((lbCurSel 2621) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Vous êtes déjà leader!"};

	_action = [
	format["Vous êtes sur le point de dégrader %1<br/> il ne sera en mesure de contrôler le gang.",_unit getVariable ["realname",name _unit]],
	"Changer de leader",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
	_groupOwner = grpPlayer getVariable["gang_owner",[]];
	if !(_unitID in _groupOwner) exitWith {hint "Cette personne ne controle pas le gang"};
	_groupOwner = _groupOwner - [_unitID];
	grpPlayer setVariable["gang_owner",_groupOwner,true];
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
} else {
	hint "Changement de leader du gang annulé.";
};
[] call life_fnc_gangMenu;