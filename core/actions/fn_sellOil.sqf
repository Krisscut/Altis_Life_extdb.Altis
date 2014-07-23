#include <macro.h>
/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_index","_price","_val"];
_index = ["oilp",__GETC__(sell_array)] call fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;
_val = life_inv_oilp;
_price = _price * _val;

if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["Tu as vendu %1 barils de pétroles pour $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	life_liquide = life_liquide + _price;
};
