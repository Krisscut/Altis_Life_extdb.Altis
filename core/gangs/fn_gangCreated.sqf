#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(life_dabliquide < (__GETC__(life_gangPrice))) exitWith {
	hint format["Il vous manque: $%1",[((__GETC__(life_gangPrice))-life_dabliquide)] call life_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(life_dabliquide,(__GETC__(life_gangPrice)));

hint format["Vous avez créé le gang nommé %1 pour $%2",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];
