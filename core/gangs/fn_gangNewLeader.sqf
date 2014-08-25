#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_index = lbCurSel 2721;

_group = (group player );
_grpMembers = _group getVariable "gang_members";
_ownerID = _group getVariable["gang_owner",""];
_selectedMember = _grpMembers select _index;
_selectedMemberUID = _selectedMember select 0;

if(isNil "_grpMembers") exitWith {};
if(typeName _grpMembers != "ARRAY") exitWith {};
if(_selectedMemberUID == getPlayerUID player) exitWith {hint "Vous êtes déjà leader!"};

_action = [
	format["Vous êtes sur le point de transférer le <t color='#d16428'>grade de leader</t> à <t color='#00aa00'>%1</t><br/>En transférant le grade de leader <t color='#ff0000'>vous ne serez plus en mesure de contrôler le gang.</t>",_selectedMember select 1],
	"Changer de leader",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(_selectedMemberUID == "") exitWith {hint "Bad UID?"}; //Unlikely?
	grpPlayer setVariable["gang_owner",_selectedMemberUID,true];

	_allUnits = playableUnits;
	_unitOnline= player;
	//Searching if Unit is online
	{
		if( (getPlayerUID _x) == (_selectedMember select 0)) then
		{
			_unitOnline = _x;
		};
	} foreach _allUnits;

	//Si en ligne, broadcast du passage de chef
	if (_unitOnline != player ) then
	{
		/*Do that only if the player is online ! */
		grpPlayer selectLeader _unitOnline;
		[[_unitOnline,grpPlayer],"clientGangLeader",_unitOnline,false] spawn life_fnc_MP; //Boot that bitch!
	};

	//Mise de l'ancien chef en officier
	_myCount = count _grpMembers;
	for "_x" from 0 to (_myCount-1) do
	{
		//searching for setting name of the player
		if( getPlayerUID player  == (_grpMembers select _x) select 0) then
		{
			_grpMembers set [_x,[(_grpMembers select _x) select 0,(_grpMembers select _x) select 1,2]];
		};
	};

	//Mise du nouveau au rang 3
	_selectedMember set [2,3];
	_grpMembers set [_index, _selectedMember];

	player setVariable["gang_rank",2,false];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.


} else {
	hint parseText "<t color='#00aa00'>Changement de leader du gang annulé.</t>";
};
[] call life_fnc_gangGestionLoading;