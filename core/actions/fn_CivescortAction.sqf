/*
	File: fn_CivescortAction.sqf
	Author & Traduction : Skydred pour Involved-Gaming.com
*/
private["_unit"];
if((_unit getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};

_unit = _this select 0;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];

player reveal _unit;