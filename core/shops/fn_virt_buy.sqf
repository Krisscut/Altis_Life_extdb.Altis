#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint "Tu dois sélectionner un objet a acheter."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call fnc_isnumber)) exitWith {hint "Mauvais nombre";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Tu n'as pas assez de places"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_liquide && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint "Tu n'as pas assez d'argent!"};
if((_price * _amount) > life_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Tu n'as pas assez d'argent!";};
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format["Le gang a assez d'argent pour payer cette objet, voulez vous payer avec le compte en banque du gang ou avec le votre ?<br/><br/>Compte Gang: <t color='#8cff9b'>$%1</t><br/>Compte Perso: <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_liquide] call life_fnc_numberText
			],
			"Compte gang ou compte perso ?",
			"Compte gang",
			"Compte perso"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format["Tu as acheté %1 %2 pour $%3 avec l'argent du gang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		playSound "caching";
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > life_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Tu n'as pas assez d'argent!";};
			hint format["Tu as acheté %1 %2 pour $%3",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		playSound "caching";
			__SUB__(life_liquide,_price);
		};
	} else {
		if((_price * _amount) > life_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Tu n'as pas assez d'argent!";};
		hint format["Tu as acheté %1 %2 pour $%3",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		playSound "caching";

		__SUB__(life_liquide,(_price * _amount));
	};
	[] call life_fnc_virt_update;

};
