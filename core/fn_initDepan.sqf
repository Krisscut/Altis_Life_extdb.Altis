#include <macro.h>
/*
	File: fn_initDepan.sqf
	Author: Skydred

	Description:
	Initializes the depan..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

	if((__GETC__(life_depanLevel)) < 1) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};

[] call life_fnc_depanLoadout;
[] call life_fnc_spawnMenu;
[] execVM "admintools\activate.sqf";

//3 radioChannelAdd [player];

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] execVM "core\functions\tm4_fuelUptake.sqf";
