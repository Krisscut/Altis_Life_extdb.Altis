#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

/*
if((__GETC__(life_serveur)) == 0) exitWith {
	["altis",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 30;
};
*/
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

switch (true) do
{

if((str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19","cop_20"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	}else{
		switch(__GETC__(life_coplevel)) do
		{
			case 1 : {player setRank "PRIVATE";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa"] call BIS_fnc_rankParams;};
			case 2 : {player setRank "CORPORAL";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"] call BIS_fnc_rankParams;};
			case 3 : {player setRank "SERGEANT";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa"] call BIS_fnc_rankParams;};
			case 4 : {player setRank "LIEUTENANT";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa"] call BIS_fnc_rankParams;};
			case 5 : {player setRank "CAPTAIN";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa"] call BIS_fnc_rankParams;};
			case 6 : {player setRank "MAJOR";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\major_gs.paa"] call BIS_fnc_rankParams;};
			case 7 : {player setRank "COLONEL";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa"] call BIS_fnc_rankParams;};
			case 8 : {player setRank "GENERAL";_rankIcon = [player,"a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa"] call BIS_fnc_rankParams;};
			default{};
		};

	};
};


///////////////////////////////////MAATTIII////////////////////////////////////////////////	case (!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])):
	case (!(str(player) in ["cop_nil"])):
	{
		switch (true) do
		{
			case(__GETC__(life_coplevel) > 0) : {}; // Do nothing
			case (__GETC__(life_adminlevel) > 0) : {}; //Do nothing
			default {endMission "Loser";};
		};
	};
};
//////////////MATIII////////////////
player setVariable["coplevel", __GETC__(life_coplevel), true]; // Rang Anzeige
player setVariable ["life_ZamakSearch", false, true];

[] call life_fnc_spawnMenu;
[] spawn    //basic cop
{
 while {true} do
 {
  waitUntil {uniform player == "U_Rangemaster"};
  player setObjectTextureGlobal [0,"Textures\gav_uniform.jpg"];
  waitUntil {uniform player != "U_Rangemaster"};
 };
};

[] spawn
{
 while {true} do
 {
  waitUntil {uniform player == "U_B_CTRG_1"};
  player setObjectTextureGlobal [0,"Textures\Uniforme_Gd_spe_.jpg"];
  waitUntil {uniform player != "U_B_CTRG_1"};
 };
};
[] execVM "admintools\activate.sqf";
[player] execVM "scripts\groupsMenu\initGroups.sqf"; //gestion de groupe

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] execVM "core\functions\tm4_fuelUptake.sqf"
