/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_liquide < life_ticket_val) exitWith
{
	if(life_dabliquide < life_ticket_val) exitWith
	{
		hint "Tu n'as pas assez d'argent sur toi ou en banque pour payer l'amende.";
		[[1,format["%1 n'as pas assez d'argent pour payer l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format["Tu as payé une amende de $%1",[life_ticket_val] call life_fnc_numberText];
	life_dabliquide = life_dabliquide - life_ticket_val;
	life_ticket_paid = true;
	[[0,format["%1 a payé l'amende de $%2",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	closeDialog 0;
};

life_liquide = life_liquide - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
[[0,format["%1 a payé l'amende de $%2",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
closeDialog 0;
[[1,format["%1 a payé l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[[life_ticket_val],{life_dabliquide = life_dabliquide + (_this select 0);}],"BIS_fnc_call",life_ticket_cop,false] spawn life_fnc_MP;
