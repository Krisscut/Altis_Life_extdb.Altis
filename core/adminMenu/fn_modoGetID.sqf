/*
	File: fn_modoGetID.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	Description:
	Request information
*/

private["_unit"];
_unit = lbData[9004,lbCurSel (9004)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};


[[_unit,player],"INVO_fnc_getIDbis",false,false] spawn life_fnc_MP;

// request for aliases
[[_unit,player],"INVO_fnc_queryAliases",false,false] spawn life_fnc_MP;