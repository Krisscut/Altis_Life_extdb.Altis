#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
//correction glitch
//if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "You cannot leave the gang without appointing a new leader first!"};
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "Tu dois d'abord donner le grade de leader a un joueur pour quitter le gang!"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];

//correction toujours dans le groupe meme aprés avoir quitter
//[player] joinSilent (createGroup civilian);
[player] joinSilent (createGroup civilian);

[[4,_grp],"TON_fnc_u
pdateGang",false,false] spawn life_fnc_MP;
closeDialog 0;