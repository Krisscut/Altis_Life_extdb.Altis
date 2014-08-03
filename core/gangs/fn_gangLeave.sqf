#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours later...
*/
private["_grp","_grpMembers","_unitID"];
//correction glitch
//if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "You cannot leave the gang without appointing a new leader first!"};
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "Tu dois d'abord donner le grade de leader a un joueur pour quitter le gang!"};

_unitID = getPlayerUID player;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer setVariable["gang_members",_members,true];

//correction toujours dans le groupe meme aprés avoir quitter
//[player] joinSilent (createGroup civilian);
[player] joinSilent (createGroup civilian);

[[player,grpPlayer],"clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
[] call life_fnc_gangMenu;
closeDialog 0;