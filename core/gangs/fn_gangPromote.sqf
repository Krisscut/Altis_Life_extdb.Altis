#include <macro.h>
/*
	Author: S.lambert

	Description:
	Promote the selected player to the superior rank
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


if(_uid == (_selectedMember select 0)) exitWith {hint "Vous ne pouvez pas vous promouvoir vous-même!";};
if ((_rank == 3) || ((_selectedMember select 0) == _ownerID )) exitWith {hint "Vous ne pouvez pas promouvoir le chef de clan";};
if( _rank == 2) exitWith {hint "Le joueur est déja promu au rang maximum sans prendre la place de leader.";};
if ( (_rank + 1) == (player getVariable "gang_rank")) exitWith {hint "Vous ne pouvez promouvoir quelqu'un au même niveau que vous!";};


_rankString = "";
_sentence = "";
switch (_rank +1 ) do {
	case 0:
	{
		_rankString = "Recrue";
		_sentence =parseText format["Vous êtes sur le point de promouvoir <t color='#00aa00'>%1</t> au rang de <t color='#d16428'>%2</t>",_name,_rankString];
	};
	case 1:
	{
		_rankString = "Membre";
		_sentence = format["Vous êtes sur le point de promouvoir <t color='#00aa00'>%1</t> au rang de <t color='#d16428'>%2</t>",_name,_rankString];
	};
	case 2:
	{
		_rankString = "Officier";
		_sentence = format["Vous êtes sur le point de promouvoir <t color='#00aa00'>%1</t> au rang de <t color='#d16428'>%2</t> - Il aura les permissions pour <t color='#ff0000'>inviter/kicker</t> des personnes dans le gang ",_name,_rankString];
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
	"Promouvoir",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	_selectedMember set [2, _rank +1];
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

	//Si en ligne, broadcast de la promotion
	if (_unit != player ) then
	{
		[[profileName,_rank+1],"life_fnc_gangPromoted",_unit,false] spawn life_fnc_MP;
	};

	_group setVariable["gang_members",_grpMembers,true];
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;	//UPDATE DATABASE
} else {
	hint "Changement de rank annulé.";
};
[] call life_fnc_gangGestionLoading;