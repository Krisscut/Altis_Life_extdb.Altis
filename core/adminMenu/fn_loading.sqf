#include <macro.h>
/*
	File: fn_loading.sqf  (from adminMenu.sqf)
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9000)};
_display = findDisplay 9000;
_list = _display displayCtrl 9004;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

ctrlSetText[9030,"Chargement interface terminé - En attente du choix d'un joueur"];

/* disable all buttons */
ctrlEnable[9010,false];		//spectateur
ctrlEnable[9011,false];		//tpToTarget
ctrlEnable[9012,false];		//targetToMe
ctrlEnable[9050,false];		//Deplacer
ctrlEnable[9013,false];		//KillTarget
ctrlEnable[9051,false];		//Réanimer
ctrlEnable[9052,false];		//Soigner

ctrlEnable[9014,false];		//menotter
ctrlEnable[9053,false];		//Demenotter
ctrlEnable[9015,false];		//GetInTargetVehicle
ctrlEnable[9054,false];		//EjectFrom Vehicle
ctrlEnable[9016,false];		//Put IntoJail
ctrlEnable[9055,false];		//extractFrom Jail
ctrlEnable[9017,false];		//Troll

