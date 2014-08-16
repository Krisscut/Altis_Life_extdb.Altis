/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_liquide) exitWith {hint "Tu n'as pas assez d'argent sur toi."};

life_liquide = life_liquide - _value;
life_dabliquide = life_dabliquide + _value;

hint format["Tu as déposé $%1 sur ton compte en banque",[_value] call life_fnc_numberText];
[[format["%1 à déposé %2 sur son compte",name player,[_value] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync
