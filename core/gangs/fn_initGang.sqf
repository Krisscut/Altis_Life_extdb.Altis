/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Main initialization for gangs?

if(count life_gangData == 0) exitWith {};

sleep 10;

_group = true;
_groupOwner = true;
_groupMembers = [];
{
_groupName = _x getVariable "gang_name";
 if (!isNil "__groupName") then {
 	if (_groupName == (life_gangData select 2)) then {_group = _x;_groupMembers = _x getVariable ["gang_members",false];_groupOwner = _x getVariable ["gang_owner",false];};
 		sleep 0.2;
};
} foreach allGroups;

if (isNil "_group" or !_groupOwner) exitWith {hint "Eror Gang"};

if ((getPlayerUID player) in _groupMembers) Then {
	[player] join _group;
	if(_groupOwner == (getPlayerUID player)) then {
		_group selectLeader player;
		[[player,_group],"clientGangLeader",(units _group),false] spawn life_fnc_MP;
	};
};

if (_group && _groupOwner && _groupMembers) then {
	_group = group player;
	_group setVariable["gang_id",(life_gangData select 0),true];
	_group setVariable["gang_owner",(life_gangData select 1),true];
	_group setVariable["gang_name",(life_gangData select 2),true];
	_group setVariable["gang_maxMembers",(life_gangData select 3),true];
	_group setVariable["gang_bank",(life_gangData select 4),true];
	_group setVariable["gang_members",(life_gangData select 5),true];
};
*/
/*_exitLoop = false;
{
	__groupName = _x getVariable "gang_name";
	if(!isNil "__groupName") then {
		__groupOwner = _x getVariable["gang_owner",""];
		__groupID = _x getVariable "gang_id";
		if(__groupOwner == "" OR isNil "__groupID") exitWith {}; //Seriously?
		if((life_gangData select 0) == __groupID && {(life_gangData select 1) == __groupOwner}) exitWith {__group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "__group") then {
	[player] join __group;
	if((life_gangData select 1) == (getPlayerUID player)) then {
		__group selectLeader player;
		[[player,__group],"clientGangLeader",(units __group),false] spawn life_fnc_MP;
	};
} else {
	__group = group player;
	__group setVariable["gang_id",(life_gangData select 0),true];
	__group setVariable["gang_owner",(life_gangData select 1),true];
	__group setVariable["gang_name",(life_gangData select 2),true];
	__group setVariable["gang_maxMembers",(life_gangData select 3),true];
	__group setVariable["gang_bank",(life_gangData select 4),true];
	__group setVariable["gang_members",(life_gangData select 5),true];
};*/