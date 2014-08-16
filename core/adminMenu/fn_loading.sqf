#include <macro.h>
/*
	File: fn_loading.sqf  (from adminMenu.sqf)
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
hint "Passage dans fn_loading";
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9000)};
_display = findDisplay 9000;
_list = _display displayCtrl 9003;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};