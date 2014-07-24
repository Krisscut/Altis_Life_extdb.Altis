/*
	File: fn_vehInsure.sqf
	Author: Bloopis

	Description:
	Insures the vehicle
*/
if(life_dabliquide < life_insure_val) exitWith {hint format["Tu ne dispose pas de %1€ en banque, tu ne peux donc pas souscrire à l'assurance !", life_insure_val]};
if(!(life_insure_veh getVariable["insured",false])) then {
	life_insure_veh setVariable["insured",true,true];
	life_dabliquide = life_dabliquide - life_insure_val;
	_vinfo = life_insure_veh getVariable["dbInfo",[]];
	[[format["Info : Assurance souscrite pour le joueur : %1 || véhicule plate : %2",(_vinfo select 0), (_vinfo select 1)]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
	hint format["Tu viens d'assurer ton véhicule pour %1 euros",life_insure_val];
}else {
	hint "Ce véhicule est déjà assuré !";
};