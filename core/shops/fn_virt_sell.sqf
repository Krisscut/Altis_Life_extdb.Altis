#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;
////Init des variable du marché////
_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Fin de l'init marché////
_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {hint "Format incorrect";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "Tu n'as pas assez d'objets a vendre!"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["Tu as vendu %1 %2 pour $%3",_amount,_name,[_price] call life_fnc_numberText];
	life_liquide = life_liquide + _price;
	[] call life_fnc_virt_update;
	playSound "caching";
////Rentrée marché////
	if(_marketprice != -1) then
	{
		[_type, _amount] spawn
		{
			sleep 300;
			[_this select 0,_this select 1] call life_fnc_marketSell;
		};
	////Fin du script////
		[] call life_fnc_virt_update;
	};

};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array set[count _array,[getPlayerUID player,profileName,_price]];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
private["_marketprice"];