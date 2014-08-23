/*
	Author: Bryan "Tonic" Boardwine
	Edited by Krisscut

	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
if(count life_gangData == 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
		if((life_gangData select 0) == _groupID && {(life_gangData select 1) == _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((life_gangData select 1) == (getPlayerUID player)) then {
		_group selectLeader player;
		[[player,_group],"clientGangLeader",(units _group),false] spawn life_fnc_MP;
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(life_gangData select 0),true];
	_group setVariable["gang_owner",(life_gangData select 1),true];
	_group setVariable["gang_name",(life_gangData select 2),true];
	_group setVariable["gang_maxMembers",(life_gangData select 3),true];
	_group setVariable["gang_bank",(life_gangData select 4),true];

	// parse members information to format it in the new format [[uid, name, rank], [uid,name,rank]] from [uid,uid,uid]
	private["_listMembers","_myCount","_idPlayer"];
	_listMembers =  (life_gangData select 5);
	_myCount = count _listMembers;
	for "_x" from 0 to _myCount do
	{
		if( !(typeName (_listMembers select _x) == "ARRAY")) then// si ce n'est pas un tableau --> ancienne version transition en nouvelle version
		{
			_listMembers set [_x,[(_listMembers select _x), "name to be determined", 0]];
		};
	};

	//search for the entry corresponding to the player
	_idPlayer = getPlayerUID player;
	for "_x" from 0 to _myCount do
	{
		//searching for setting name of the player
		if( _idPlayer == (_listMembers select _x) select 0) then
		{
			_listMembers set [_x,[_idPlayer, name player, 0]];

			// memorise information about the rank of the player
			player setVariable["gang_rank",(_listMembers select _x) select 2,false];
		};
	};


	// purge Duplicates
	//search foreach entry if there is already an entry in the memberlist
	_continue = true;

	while { _continue } do
	{
		scopeName "loop1";
		_count = count _listMembers;

		for "_i" from 0 to _count do
		{
			_idSelect = (_listMembers select _i) select 0;
			for "_j" from 0 to _count do
			{
				_idCurrent = (_listMembers select _j) select 0;
				//Si les indices sont differents
				if( _i != _j) then
				{
					//Mais que les id sont identiques ===> duplication donc suppresion du current
					if ( _idSelect == _idCurrent) then
					{
						diag_log format["Duplicate entries of %1, deleting entry %2",_idSelect, _j ];
						_listMembers set [_j,1];
						_listMembers = _listMembers - [1];
						breakTo "loop1";
					};
				};
			};
		};
		_continue = false;
	};
	_group setVariable["gang_members",(_listMembers),true];
};