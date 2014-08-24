/*
        File: fn_vehDetect.sqf
        Author: Komodo & Bloopis

        Description:
        Script used to display the distance to the closest Zamak Lab found (or any choosen vehicle)
        TODO: Might be necessary to check that the vehicle is processing to allow detection (would make sense in theory, but not really easy for cops)
*/

private["_message","_vehicle","_vehicleList","_upp","_ui","_progress","_pgText","_progress","_cP","_distance","_distanceMax"];

diag_log "ZAMAK LABO ----- Init vehDetect -----";
if(player getVariable ["life_ZamakSearch",true]) exitWith {};
player setVariable ["life_ZamakSearch", true, true];
diag_log "ZAMAK LABO ----- lifeZamakSearch set -----";
_message = "";
while{true} do
{
        //Getting the closest vehicle of selected type. If several found, then the first is chosen.
        _vehicle = objNull;
        _distanceMax = 1000;
        _vehicleList = nearestObjects [player, ["O_Truck_02_Ammo_F"], _distanceMax];

        switch (true) do {
            case (count _vehicleList == 1) : {_vehicle = _vehicleList select 0; _message = "Un laboratoire mobile a été repéré dans un rayon de 1000m. Aide-toi de la barre ci-dessus pour le repérer.";};
          //case (count _vehicleList == 0) : {_vehicle = objNull; _message = "Aucun laboratoire trouvé dans un rayon de 500m.";};
            case (count _vehicleList > 1) : {_vehicle = _vehicleList select 0; _message = "plusieurs laboratoires repérés, l'appareil te donnera une indication sur le premier trouvé.";};
        };
        if (_message != "") exitWith {hint _message;};
};
diag_log ["ZAMAK LABO ----- %1 -----",_message];

//Setup our detection bat (re-used progress bar)
disableSerialization;
.5 cutRsc ["life_progress","PLAIN"];
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
        if(!alive _vehicle OR isNull _vehicle) exitWith {player setVariable ["life_ZamakSearch", false, true];};
        if(!alive player) exitWith {player setVariable ["life_ZamakSearch", false, true];};
        //Objective is to check if the player is still in his vehicle.
        if(vehicle player == player) exitWith {player setVariable ["life_ZamakSearch", false, true];};
        _distance = player distance _vehicle;
        if(_distance > _distanceMax) exitWith {hint "Tu t'es trop éloignée de la cible, le détecteur intégré s'est mis en veille. Relance les gyrophares pour relancer la détection.";player setVariable ["life_ZamakSearch", false, true];};
        _cP = _distance/_distanceMax;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",_distance,"m",_upp];
};

player setVariable ["life_ZamakSearch", false, true];
5 cutText ["","PLAIN"];
