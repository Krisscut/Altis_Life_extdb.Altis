#include <macro.h>
/*
	Author: S.lambert

	Description:
	load the gestionGang UI
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl", "_gangRank"];
disableSerialization;
if(isNull (findDisplay 2720)) then {
	if(!(createDialog "Life_Group_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer getVariable["gang_owner",""];
_gangRank = player getVariable "gang_rank";

if(_ownerID == "" || _gangRank == 2) exitWith {closeDialog 0;}; //Bad juju
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

//Loop through the players.
_members = getControl(2720,2721);
lbClear _members;

_groupMembers = grpPlayer getVariable "gang_members";

for "_i" from 0 to ((count _groupMembers) -1) do
{
	_rang = "";
	if ((_groupMembers select _i) select 0 == _ownerID)
	{
		_rang = "Chef de Clan";
	}
	else
	{

		switch (_condition) do {
		    case 0:
		    {
		    	_rang = "Recrue";
		 	};
		    case 1:
		    {
		    	_rang = "Membre";
		    };
		    default
		    {
		    	_rang = "Officier";
		    };
		};
	};
	_members lbAdd format["%1 - %2",(_groupMembers select _i) select 1),_rang];
	_members lbSetData [(lbSize _members)-1,_groupMembers select _i];
};