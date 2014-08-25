#include <macro.h>
/*
	Author: S.Lambert

	Description:
	Kick from the gestion panel ---> so you can kick offline players !
*/
private["_unit","_unitID","_grpMembers","_myCount","_idPlayer"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Tu dois sélectionné une personne a kick"};

_index = lbCurSel 2721;
_group = (group player );
_grpMembers = _group getVariable "gang_members";
_ownerID = _group getVariable["gang_owner",""];
_selectedMember = _grpMembers select _index;
_selectedMemberUID = _selectedMember select 0;

if (_ownerID  == _selectedMemberUID) exitWith {hint "Vous ne pouvez pas kicker le chef de clan";};
if(_selectedMemberUID  == getPlayerUID player) exitWith {hint "Tu ne peux pas te kick!"};
if (((_selectedMember select 2) == 2) && (getPlayerUID player )!= _ownerID ) exitWith {hint "Tu ne peux pas kicker un officier sans etre chef de gang!"};
if(isNil "_grpMembers") exitWith {};
if(typeName _grpMembers != "ARRAY") exitWith {};


//search for the entry corresponding to the player
_myCount = count _grpMembers;
for "_x" from 0 to (_myCount-1) do
{
	//searching deleting selected Player
	if( _selectedMemberUID == ((_grpMembers select _x) select 0)) then
	{
		_grpMembers set [_x,1];
		_grpMembers = _grpMembers- [1];
	};
};

grpPlayer setVariable["gang_members",_grpMembers,true];

_allUnits = playableUnits;
_unitOnline= player;
//Searching if Unit is online
{
	if( (getPlayerUID _x) == (_selectedMember select 0)) then
	{
		_unitOnline = _x;
	};
} foreach _allUnits;

//Si en ligne, broadcast de la dégradation
if (_unitOnline != player ) then
{
	/*Do that only if the player is online ! */
	[[_unitOnline,grpPlayer],"clientGangKick",_unitOnline,false] spawn life_fnc_MP; //Boot that bitch!
};

[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.

[] call life_fnc_gangGestionLoading;