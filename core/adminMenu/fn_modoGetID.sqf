/*
	File: fn_modoGetID.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	Description:
	Request information
*/

private["_unit"];
_unit = lbData[9003,lbCurSel (9003)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[[_unit,player],"TON_fnc_getIDbis",false,false] spawn life_fnc_MP;