/*
	File: fn_modoGetID.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	Description:
	Request information
*/

private["_unit","_sender","_uid"];
_unit = lbData[9004,lbCurSel (9004)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

diag_log format["%1", _unit];
[[_unit,player],"INVO_fnc_getIDbis",false,false] spawn life_fnc_MP;

_sender = player;
_uid = getPlayerUID _unit;
// request for aliases
[[_uid,_sender],"INVO_fnc_queryAliases",false,false] spawn life_fnc_MP;