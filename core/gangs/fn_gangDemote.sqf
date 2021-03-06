#include <macro.h>
/*
	Author: S.lambert

	Description:
	Demote the selected player to the inferior rank
*/
private["_index","_group","_grpMembers","_selectedMember","_uid","_rank","_name","_sentence","_rankString","_ownerID"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_index = lbCurSel 2721;

_group = group player;
_grpMembers = _group getVariable "gang_members";
_ownerID = _group getVariable["gang_owner",""];
_selectedMember = _grpMembers select _index;
_uid = getPlayerUID player;
_name= (_selectedMember select 1);
_rank = (_selectedMember select 2);

if(_uid == (_selectedMember select 0)) exitWith {hint "Vous ne pouvez pas vous retrograder vous-même!";};
if ((_rank == 3) || ((_selectedMember select 0) == _ownerID )) exitWith {hint "Vous ne pouvez pas dégrader le chef de clan";};
if( _rank == (player getVariable "gang_rank")) exitWith {hint "Vous ne pouvez pas dégrader une personne du même rang que vous";};
if (_rank == 0) exitWith {hint "Vous ne pouvez pas le dégrader car le joueur selectionné est déja au grade le plus bas";};

_rankString = "";
_sentence = "";
switch (_rank -1 ) do {
		    case 0:
		    {
		    	_rankString = "Recrue";
		    	_sentence = format["Vous êtes sur le point de Retrograder <t color='#00aa00'>%1 au rang de <t color='#d16428'>%2</t>",_name,_rankString ];
		 	};
		    case 1:
		    {
		    	_rankString = "Membre";
		    	_sentence = format["Vous êtes sur le point de retrograder <t color='#00aa00'>%1 au rang de <t color='#d16428'>%2</t>, il <t color='#ff0000'>ne pourra plus accéder aux fonctionnalités de gestion du gang</t>",_name,_rankString ];
		    };
		    case 2:
		    {
		    	_rankString = "Officier";
		    	_sentence = format["Vous êtes sur le point de retrograder <t color='#00aa00'>%1 au rang de <t color='#d16428'>%2</t> - Il aura les permissions pour <t color='#ff0000'>inviter/kicker</t> des personnes dans le gang ",_name,_rankString ];
		    };
		    default
		    {
		    	_rankString = "Undefined...";
		    	_sentence = format["Undefined rank & undefined"];
		    };
		};

_action =
[
	_sentence,
	"Retrograder ",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_selectedMember set [2, _rank -1];
	_grpMembers set [_index, _selectedMember];

	_allUnits = playableUnits;
	_unit = player;
	//Searching if Unit is online
	{
		if( (getPlayerUID _x) == (_selectedMember select 0)) then
		{
			_unit = _x;
		};
	} foreach _allUnits;

	//Si en ligne, broadcast de la dégradation
	if (_unit != player ) then
	{
		[[profileName,_rank-1],"life_fnc_gangDemoted",_unit,false] spawn life_fnc_MP;
	};


	_group setVariable["gang_members",_grpMembers,true];
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;	//UPDATE DATABASE
} else {
	hint "Changement de rank annulé.";
};
[] call life_fnc_gangGestionLoading;