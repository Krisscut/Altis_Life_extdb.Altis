#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "Tu dois d'abord donner le grade de leader a un joueur pour quitter le gang!"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid, name player, 0];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
closeDialog 0;