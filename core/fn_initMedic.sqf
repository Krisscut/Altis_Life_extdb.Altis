#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((str(player) in ["Depanneur_1","Depanneur_2","Depanneur_3","Depanneur_4","Depanneur_5"])) then {

	if(!(license_civ_depanneur)) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
	[] execVM "remorquage.sqf";

} else {

	if((__GETC__(life_medicLevel)) < 1) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
};

[] call life_fnc_medicLoadout;
[] call life_fnc_spawnMenu;
[] execVM "admintools\activate.sqf";
[] execVM "admintools\loop.sqf";
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
