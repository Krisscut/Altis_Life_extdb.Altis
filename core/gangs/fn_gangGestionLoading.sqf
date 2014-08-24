#include <macro.h>
/*
	Author: S.lambert

	Description:
	load the gestionGang UI
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl", "_gangRank", "_groupMembers","_rank","_display","_slots"];
disableSerialization;
if(isNull (findDisplay 2720)) then {
	if(!(createDialog "Life_Group_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer getVariable["gang_owner",""];
_gangRank = player getVariable "gang_rank";

if((_ownerID != getPlayerUID player) && (_gangRank != 2)) exitWith {closeDialog 0; hint "Vous n'avez pas les droits nécéssaires pour accéder à ce menu"}; //Bad juju
_gangName = grpPlayer getVariable "gang_name";
_gangBank = grpPlayer getVariable "gang_bank";
_gangMax = grpPlayer getVariable "gang_maxMembers";

if (player getVariable "gang_rank" == 2) then
{

	(getControl(2720,2738)) ctrlEnable false; //Mettre chef
	(getControl(2720,2724)) ctrlEnable false; //Disband Gang
};



/*		NEED MORE TESTS
if (leader group player == player ) then		//si le chef de groupe est le joueur... il peut selectionner le chef de groupe
{
	(getControl(2620,2650)) ctrlEnable true; //CdG
};
*/

//TO DO

//(getControl(2620,2629)) ctrlSetText _gangName;
//(getControl(2620,601)) ctrlSetText format["Compte: $%1",[_gangBank] call life_fnc_numberText];



//Filling list of gang member
_members = getControl(2720,2721);
lbClear _members;

_groupMembers = grpPlayer getVariable "gang_members";
for "_i" from 0 to ((count _groupMembers) -1) do
{
	_rank = "";
	if (((_groupMembers select _i) select 0) == _ownerID) then
	{
		_rank = "Chef de Clan";
	}
	else
	{
		switch ((_groupMembers select _i) select 2) do {
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
	_members lbAdd format["%1 - %2",(_groupMembers select _i) select 1,_rank];
	//_members lbSetData [(lbSize _members)-1,_groupMembers select _i];
};


//Filling list of external players online ( for invitation into the gang)
_grpMembers = units grpPlayer;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = getControl(2720,2732);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;

_display = findDisplay 2720;
_slots = _display displayCtrl 2775;

_nbMembers = (count _groupMembers);
//Filling number of slot
if (_nbMembers  >= _gangMax) then
{
	_slots ctrlSetStructuredText parseText format["<t color='#ff0000'>%1 / %2</t>",_nbMembers ,_gangMax];
}
else
{
	if (_nbMembers  > _gangMax-3 ) then	//orange
	{
		_slots ctrlSetStructuredText parseText format["<t color='#d16428'>%1 / %2</t>",_nbMembers ,_gangMax];
	}
	else			// green
	{
		_slots ctrlSetStructuredText parseText format["<t color='#00aa00'>%1 / %2</t>",_nbMembers ,_gangMax];
	};
};

