/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "Tu ne peux pas retirer plus de $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Mauvais format."};
if(_val > life_dabliquide) exitWith {hint "Tu n'as pas assez sur ton compte en banque!"};
if(_val < 100 && life_dabliquide > 20000000) exitWith {hint "Tu ne peux pas retirer moins de $100"}; //Temp fix for something.

life_liquide = life_liquide + _val;
life_dabliquide = life_dabliquide - _val;
hint format ["Tu as retiré $%1 de ton compte en banque",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync
