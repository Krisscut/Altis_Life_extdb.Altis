#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl","_groupMembers","_myCount","_rank","_index"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = grpPlayer getVariable "gang_name";
_gangBank = grpPlayer getVariable "gang_bank";
_gangMax = grpPlayer getVariable "gang_maxMembers";

if((_ownerID != steamid) && (player getVariable "gang_rank" != 2) ) then
{			// s'il n'est pas le leader

	(getControl(2620,2624)) ctrlEnable false; //Kick
	(getControl(2620,2650)) ctrlEnable false; //CdG
	(getControl(2620,2630)) ctrlEnable false; //Gestion gang
	(getControl(2620,2637)) ctrlEnable false; //Invite Player

	/* TEMP */
	/*
	(getControl(2620,2638)) ctrlEnable false;	//Augmenter Gang
	(getControl(2620,2639)) ctrlEnable false;	//Dissoudre Gang
	*/
};

if (player getVariable "gang_rank" == 2) then
{
	(getControl(2620,2650)) ctrlEnable false; //CdG
	(getControl(2620,2639)) ctrlEnable false; //Dissoudre Gang

};

//NEED MORE TEST
if (leader (group player) == player ) then		//si le chef de groupe est le joueur... il peut selectionner le chef de groupe
{
	(getControl(2620,2650)) ctrlEnable true; //CdG
};


(getControl(2620,2629)) ctrlSetText _gangName;
(getControl(2620,601)) ctrlSetText format["Compte: $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = getControl(2620,2621);
_groupMembers = grpPlayer getVariable "gang_members";
_myCount = count _groupMembers;
_rank = "";
_index = 0;
lbClear _members;
{
	/*
	if((getPlayerUID _x) == _ownerID) then
	{
		_members lbAdd format["%1 (Gang Leader)",(_x getVariable["realname",name _x])];
	}
	else
	{
		_members lbAdd format["%1",(_x getVariable["realname",name _x])];
	};
	*/

	//search for the entry corresponding to the player
	_idPlayer = getPlayerUID _x;
	for "_j" from 0 to _myCount do
	{
		//searching the index of the player
		if( _idPlayer == (_groupMembers select _j) select 0) then
		{
			_index = _j;
		};
	};

	//searching for the id of the player
	if (((_groupMembers select _index) select 0) == _ownerID) then
	{
		_rank = "Chef de Clan";
	}
	else
	{
		switch ((_groupMembers select _index) select 2) do {
		    case 0:
		    {
		    	_rank = "Recrue";
		 	};
		    case 1:
		    {
		    	_rank = "Membre";
		    };
		    case 2:
		    {
		    	_rank = "Officier";
		    };
		    default
		    {
		    	_rank = "Undefined...";
		    };
		};
	};

	_exportString = format["%1 - %2",(_x getVariable["realname",name _x]), _rank];

	//Si group lader on le rajoute à son nom
	if (leader group _x == _x ) then
	{
		_exportString = _exportString + " - CdG";

	};

	_members lbAdd _exportString ;
	_members lbSetData [(lbSize _members)-1,str(_x)];
} foreach (units grpPlayer);

_grpMembers = units grpPlayer;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = getControl(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;