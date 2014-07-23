/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText["Il n'as pas d'argents ...","PLAIN"]};

life_liquide = life_liquide + _cash;
titleText[format["Tu as dérobé $%1",[_cash] call life_fnc_numberText],"PLAIN"];
