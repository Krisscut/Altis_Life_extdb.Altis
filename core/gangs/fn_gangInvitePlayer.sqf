#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2732) == -1) exitWith {hint "Tu dois déja séléctionné un joueur"};
_unit = call compile format["%1",getSelData(2732)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Tu ne peux pas t'inviter'!"};

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Tu dois augmenter les slots du gang pour inviter ce joueur."};
if (!isnil {(group _unit) getVariable "gang_name"}) exitWith {hint "Ce joueur a déjà un gang"};
_action = [
	format["Vous êtes sur le point d'inviter %1 a votre gang",_unit getVariable ["realname",name _unit]],
	"Inviter joueur dans le gang",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	_members = grpPlayer getVariable "gang_members";
	_members set[count _members,[getPlayerUID _unit, name _unit, 0]];

	grpPlayer setVariable["gang_members",_members,true];
	hint format["Tu as envoyé une invitation a %1",_unit getVariable["realname",name _unit]];
} else {
	hint localize "Invitation annulé";
};