#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "Tu es déjà dans un gang"};

_gangName = _group getVariable "gang_name";
_action = [
	format["%1 vous a invité à un gang appelé %2<br/>Si vous acceptez l'invitation, vous serez ajouté a leur groupe et aurez accès au compte en banque et aux cachettes de gangs si contrôlés.",_name,_gangName],
	"Invitation Gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[[4,_grpMembers],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
};