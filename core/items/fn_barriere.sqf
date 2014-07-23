/*
	File: fn_barriere.sqf
	Author & Traduction : Skydred pour Involved-Gaming.Com	
	Description:
	cree la barriere et la place
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule.";
	if(([true,"barriere",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere.","PLAIN"];
	};
};
if ((player getVariable "restrained") || (player getVariable "civrestrained")) exitWith { hint "Impossible d'effectuer cette action en étant menotté.";
	if(([true,"barriere",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récupéré la barriere.","PLAIN"];
	};
};
closeDialog 0;
private["_position","_barriere"];
_barriere = "RoadBarrier_F" createVehicle [0,0,0];
_barriere attachTo[player,[0,5.5,0]];
_barriere setDir 90;
_barriere setVariable["item",true];
_barriere setVariable["idleTime",time,true];
//Ajout 3.1.2 Sky
life_action_barriereDeploy = player addAction["Placer la barrière",{if(!isNull life_barriere) then {detach life_barriere; life_barriere = ObjNull;}; player removeAction life_action_barriereDeploy; life_action_barriereDeploy = nil;},"",999,false,false,"",'!isNull life_barriere'];
//Fin Ajout
life_barriere = _barriere;
waitUntil {isNull life_barriere};
//Ajout 3.1.2 Sky
if(!isNil "life_action_barriereDeploy") then {player removeAction life_action_barriereDeploy;};
//Fin Ajout
if(isNull _barriere) exitWith {life_barriere = ObjNull;};
_barriere setPos [(getPos _barriere select 0),(getPos _barriere select 1),0];
_barriere setDamage 1;
//Ajout 3.1.2 Sky
life_action_barrierePickup = player addAction["Récupérer la Barrière",life_fnc_packupBarriere,"",0,false,false,"",
' _barrieres = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barrieres" && !isNil {(_barrieres getVariable "item")}'];
//Fin Ajout