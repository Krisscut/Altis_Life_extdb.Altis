1./*
2.        File: fn_vehDetect.sqf
3.        Author: Komodo
4. 
5.        Description:
6.        Script used to display the distance to the closest Zamak Lab found (or any choosen vehicle)
7.        TODO: Might be necessary to check that the vehicle is processing to allow detection (would make sense in theory, but not really easy for cops)
8.*/
9. 
10.private["_message","_vehicle","_vehicleList","_upp","_ui","_progress","_pgText","_progress","_cP","_distance","_distanceMax"];
11. 
12.if(player getVariable ["life_ZamakSearch",true]) exitWith {};
13.player setVariable ["life_ZamakSearch", true, true];
14. 
15._message = "";
16.while{true} do
17.{
18.        //Getting the closet vehicle of selected type. If several found, then the first is chosen.
19.        _vehicle = objNull;
20.        _distanceMax = 1000;
21.        _vehicleList = nearestObjects [player, ["O_Truck_02_Ammo_F"], _distanceMax];
22. 
23.        switch (true) do {
24.            case (count _vehicleList == 1) : {_vehicle = _vehicleList select 0; _message = "Un laboratoire mobile a été repéré dans un rayon de 500m. Aide-toi de la barre ci-dessus pour le repérer.";};
25.            //case (count _vehicleList == 0) : {_vehicle = objNull; _message = "Aucun laboratoire trouvé dans un rayon de 500m.";};
26.            case (count _vehicleList > 1) : {_vehicle = _vehicleList select 0; _message = "plusieurs laboratoires repérés, l'appareil te donnera une indication sur le premier trouvé.";};
27.        };
28.        if (_message != "") exitWith {hint _message;};
29.};
30. 
31.//Setup our detection bat (re-used progress bar)
32.disableSerialization;
33.5 cutRsc ["life_progress","PLAIN"];
34._upp = "Distance Laboratoire Mobile: ";
35._ui = uiNameSpace getVariable "life_progress";
36._progress = _ui displayCtrl 38201;
37._pgText = _ui displayCtrl 38202;
38._pgText ctrlSetText format["%2 (1%1)...","m",_upp];
39._progress progressSetPosition 0.01;
40._cP = 0.01;
41._distance = player distance _vehicle;
42. 
43.hint "Ce détecteur ne peut afficher que la distance. A toi d'apprendre à l'utiliser pour trouver ta cible!";
44. 
45.//Looping to update the distance each second. No need for more updates, but I should improve the loop exit conditions.
46.while{true} do
47.{
48.        sleep  1;
49.        if(!alive _vehicle OR isNull _vehicle) exitWith {player setVariable ["life_ZamakSearch", false, true];};
50.        if(!alive player) exitWith {player setVariable ["life_ZamakSearch", false, true];};
51.        //Objective is to check the player is still in his vehicle.
52.        if(vehicle player == player) exitWith {player setVariable ["life_ZamakSearch", false, true];};
53.        _distance = player distance _vehicle;
54.        if(_distance > _distanceMax) exitWith {hint "Tu t'es trop éloignée de la cible, le détecteur intégré s'est mis en veille. Relance les gyrophares pour relancer la détection.";player setVariable ["life_ZamakSearch", false, true];};
55.        _cP = _distance/_distanceMax;
56.        _progress progressSetPosition _cP;
57.        _pgText ctrlSetText format["%3 (%1%2)...",_distance,"m",_upp];
58.};
59. 
60.player setVariable ["life_ZamakSearch", false, true];
61.5 cutText ["","PLAIN"];
