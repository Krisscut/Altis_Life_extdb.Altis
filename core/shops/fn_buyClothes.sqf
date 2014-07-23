/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Tu n'as pas choisi de vêtements.","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_liquide) exitWith {titleText["Tu n'as pas assez d'argent !","PLAIN"];};
life_liquide = life_liquide - _price;

life_clothesPurchased = true;
closeDialog 0;
