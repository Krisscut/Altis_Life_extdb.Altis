#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_? ");
if(_length > 15) exitWith {hint "Vous ne pouvez pas avoir un nom de gang de plus de 15 caractères."};

_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Vous avez des caractères non valides dans le nom de votre gang. Il ne peut être constitué que de chiffres, lettres et espaces";};
if(life_dabliquide < (__GETC__(life_gangPrice))) exitWith {hint format["Il vous manque: $%1",[((__GETC__(life_gangPrice))-life_dabliquide)] call life_fnc_numberText];};

_gangName = format ["[%1]",_gangName];
[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
hint "Envoi des informations au serveur.....";
closeDialog 0;
life_action_gangInUse = true;
