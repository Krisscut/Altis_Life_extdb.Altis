#include <macro.h>
/*
	Author: S.lambert

	Description:
	Promote the selected player to the superior rank
*/
private["_index","_group","_grpMembers","_selectedMember","_uid","_rank","_name","_sentence","_rankString"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Vous devez d'abord choisir une personne !"};
_index = lbCurSel 2721;

_group = group player;
_grpMembers = _group getVariable "gang_members";
_selectedMember = _grpMembers select _index;
_uid = getPlayerUID player;
_name= (_selectedMember select 1);
_rank = (_selectedMember select 2);


if(_uid == (_selectedMember select 0)) exitWith {hint "Vous ne pouvez pas vous Retrograder vous-même!";};
if( _rank == 2) exitWith {hint "Le joueur est déja promu au rang maximum sans prendre la place de leader.";};
if ( (_rank + 1) == (player getVariable "gang_rank")) exitWith {hint "Vous ne pouvez promouvoir quelqu'un au même niveau que vous!";};
if (_rank == 3) exitWith {hint "Vous ne pouvez pas dégrader le chef de clan";};

_rankString = "";
_sentence = "";
switch (_rank +1 ) do {
		    case 0:
		    {
		    	_rankString = "Recrue";
		    	_sentence = format["Vous êtes sur le point de promouvoir %1<br/> au rang de %2",_name,_rankString = ""; ];
		 	};
		    case 1:
		    {
		    	_rankString = "Membre";
		    	_sentence = format["Vous êtes sur le point de promouvoir %1<br/> au rang de %2",_name,_rankString = ""; ];
		    };
		    case 2:
		    {
		    	_rankString = "Officier";
		    	_sentence = format["Vous êtes sur le point de promouvoir %1<br/> au rang de %2 - Il aura les permissions pour inviter/kicker des personnes dans le gang ",_name,_rankString = ""; ];
		    };
		    default
		    {
		    	_rankString = ""; = "Undefined...";
		    	_sentence = format["Undefined rank & undefined"];
		    };
		};

_action =
[
	_sentence,
	"Promouvoir ",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_selectedMember set [2, _rank +1];
	_grpMembers set [_index, _selectedMembers];

	_group setVariable["gang_members",_grpMembers,true];
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;	//UPDATE DATABASE
} else {
	hint "Changement de rank annulé.";
};
[] call life_fnc_gangGestionLoading;