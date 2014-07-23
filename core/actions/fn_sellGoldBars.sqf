#include <macro.h>
/*
	File: fn_sellTurtle.sqf

	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val"];
if(life_inv_goldbar == 0) exitWith {
	titleText["Tu n'as pas de lingots d'ors à vendre.","PLAIN"];
};

_index = ["goldbar",__GETC__(sell_array)] call fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;
_val = life_inv_goldbar;
_price = _price * _val;

if([false,"goldbar",life_inv_goldbar] call life_fnc_handleInv) then {
	titleText[format["Tu as vendu %1 lingots d'ors pour $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	life_liquide = life_liquide + _price;
};
