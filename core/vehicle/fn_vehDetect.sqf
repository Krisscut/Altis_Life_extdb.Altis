/*
	File: fn_vehDetect.sqf
	Author: Komodo

	Description:
	Script used to display the distance to the closest Zamak Lab found (or any choosen vehicle)
	TODO: Might be necessary to check that the vehicle is processing to allow detection (would make sense in theory, but not really easy for cops)
*/

private["_message","_vehicle","_vehicleList","_upp","_ui","_progress","_pgText","_progress","_cP","_distance","_distanceMax"];

//Getting the closet vehicle of selected type. If several found, then the first is chosen.
_vehicle = Null;
_distanceMax = 1000;
_vehicleList = nearestObjects [player, ["O_Truck_02_Ammo_F"], _distanceMax];

switch (count _vehicleList) do
{
	case 0:
	{
		_vehicle = Null;
		exitWith {hint "Aucun labo trouvé dans un rayon de 1000m";};
	};
	case 1:
	{
		_vehicle = _vehicleList select 0;
		hint "Un seul laboratoire mobile a été repéré dans un rayon de 1000m. Aide-toi de la barre ci-dessus pour le repérer.";
	};
	default: //Multiple Zamak founds
	{
		_vehicle = _vehicleList select 0;
		hint "Plusieurs laboratoires ont été détectés. La distance d'un au hasard sera affichée.";
	};
};


//Setup our detection bar (re-used progress bar)
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_upp = "Distance Laboratoire Mobile: ";
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","m",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_distance = player distance _vehicle;

hint "Ce détecteur ne peut afficher que la distance. A toi d'apprendre à l'utiliser pour trouver ta cible!";

//Looping to update the distance each second. No need for more updates, but I should improve the loop exit conditions.
while{true} do
	{
		sleep  1;
		if(!alive _vehicle OR isNull _vehicle) exitWith;
		if(!alive player) exitWith;
		//Objective is to check the player is still in his vehicle.
		 if(vehicle player == player) exitWith {};
		_distance = player distance _vehicle;
		if(_distance > _distanceMax) exitWith {hint "Tu t'es trop éloignée de la cible, le détecteur intégré s'est mis en veille. Relance les gyrophares pour relancer la détection.";};
		_cP = _distance/_distanceMax;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",_distance,"m",_upp];
	};

5 cutText ["","PLAIN"];
