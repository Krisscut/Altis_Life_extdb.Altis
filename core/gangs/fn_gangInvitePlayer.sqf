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

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Tu dois augmenter les slots du gang pour inviter ce joueur."};

_action = [
	format["Vous êtes sur le point d'inviter %1 a votre gang, si il accepte, il aura acces au compte en banque du gang",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	_members = grpPlayer getVariable "gang_members";
	_members set[count _members,getPlayerUID _unit];
	grpPlayer setVariable["gang_members",_members,true];
	hint format["Tu as envoyé une invitation a %1",_unit getVariable["realname",name _unit]];
} else {
	hint localize "Invitation annulé";
};