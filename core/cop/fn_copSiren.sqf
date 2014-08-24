/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};

//Zamak Labo - detect
if ((typeOf _vehicle) == "B_MRAP_01_F" || (typeOf _vehicle) == "I_MRAP_03_F") then
{
	diag_log "ZAMAK LABO ----- Flic dans Strider -----";
	[] spawn life_fnc_vehDetect; //Zamak Labo: activates detection script when siren is activated.
};

while {true} do
{
	if(!(_vehicle getVariable "siren")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "SirenLong";
	sleep 6;
	if(!(_vehicle getVariable "siren")) exitWith {};
};
