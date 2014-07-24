#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];

waitUntil {!(isNull (findDisplay 46))};

if(str(player) in ["civ_1","civ_2","civ_3","civ_4","civ_5","civ_6","civ_7","civ_8","civ_9","civ_10","civ_11","civ_12","civ_13","civ_14","civ_15","civ_16","civ_17","civ_18","civ_19","civ_20","civ_21","civ_22","civ_23","civ_24","civ_25","civ_26","civ_27","civ_28","civ_29","civ_30"]) then {

		if((__GETC__(life_donator) < 2)) then {
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
		};

};

if((str(player) in ["Depanneur_1","Depanneur_2","Depanneur_3","Depanneur_4","Depanneur_5"])) then {

	if(!(license_civ_depanneur)) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
	[] execVM "remorquage.sqf";

};
/*
if(!license_civ_papiers) exitwith
	{

	["Nopapiers",false,true] call BIS_fnc_endMission;

	player enableSimulation false;
	};


if((__GETC__(life_serveur)) == 0) exitWith {
	["altis",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 30;
};
*/
if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};



player addRating 9999999;

[] call life_fnc_zoneCreator;
[] execVM "admintools\activate.sqf";
[] execVM "admintools\loop.sqf";
life_liquide=0;