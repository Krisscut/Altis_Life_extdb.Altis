#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "Tu dois déja séléctionné un joueur"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Tu ne peux pas te kick!"};

_action = [
	format["Vous êtes sur le point d'inviter %1 a votre gang, si il accepte, il aura acces au compte en banque du gang",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	hint format["Tu as envoyé une invitation a %1",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation annulé";
};