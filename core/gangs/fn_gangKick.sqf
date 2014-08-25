#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	old kick function
*/
private["_unit","_unitID","_members","_myCount","_idPlayer"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "Tu dois sélectionné une personne a kick"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Tu ne peux pas te kick!"};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
_ownerID = _group getVariable["gang_owner",""];

_myCount = count _members;
_index = 0;
for "_j" from 0 to (_myCount-1) do
{
	//searching the index of the player
	if( _unitID == ((_members select _j) select 0)) then
	{
		_index = _j;
	};
};

_selectedMember = _members select _index;
if (_ownerID  == (_selectedMember select 0)) exitWith {hint "Vous ne pouvez pas kicker le chef de clan";};
if (((_selectedMember select 2) == 2) && (getPlayerUID player )!= _ownerID ) exitWith {hint "Tu ne peux pas kicker un officier sans etre chef de gang!"};
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};

//search for the entry corresponding to the player

//diag_log format["Avant operation: %1 ", _members];
_members set [_index,1];
//diag_log format["Après operation de mise à 1 de l'index %1: %2", _index, _members];
_members = _members - [1];
//diag_log format["Final après suppression avant MAJ gang: %1", _members];

grpPlayer setVariable["gang_members",_members,true];

[[_unit,grpPlayer],"clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.

[] call life_fnc_gangMenu;