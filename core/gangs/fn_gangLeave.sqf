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

_idPlayer = getPlayerUID player;
_myCount = count _grpMembers;
for "_x" from 0 to _myCount do
{
	//searching for deleting player entry
	if( _idPlayer == ((_grpMembers select _x) select 0)) then
	{
		_myCount set [_x,[1]];
		_grpMembers = _grpMembers - [1];
	};
};
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
closeDialog 0;