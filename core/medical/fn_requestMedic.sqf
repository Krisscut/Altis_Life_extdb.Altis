/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[life_corpse,profileName],"life_fnc_medicRequest",independent,FALSE] spawn life_fnc_MP;
} else {
	//No medics were online, send it to the police.
	[[life_corpse,profileName],"life_fnc_copMedicRequest",west,FALSE] spawn life_fnc_MP;
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};

this addAction ["Concessionnaire voitures",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_1","civ_car_1_1"],"civ","Bruce's New & Used Auto's"]]; this addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 '];