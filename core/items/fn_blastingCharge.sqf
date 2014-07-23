/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint "Ceci peut juste être utilisé sur un coffre."};
if(_vault getVariable["chargeplaced",false]) exitWith {hint "Il y a déja un charge de déposé sur le coffre."};
if(_vault getVariable["safe_open",false]) exitWith {hint "Le coffre est déjà ouvert."};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[[1,"Une charge d'explosif a été posé sur le coffre de la banque, tu as jusqu'à la fin du temps pour désarmer la bombe!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
hint "Le décompte a commencé! Tuer tout les flics !!";
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint "La charge a été désamorcé"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint "La caisse est maintenant ouverte";