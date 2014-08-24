#include <macro.h>
/*
	Author: S.lambert

	Description:
	Kick from the gestion panel ---> so you can kick offline players !
*/
private["_unit","_unitID","_members","_myCount","_idPlayer"];
disableSerialization;

if((lbCurSel 2721) == -1) exitWith {hint "Tu dois sélectionné une personne a kick"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint "Tu ne peux pas te kick!"};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};


//search for the entry corresponding to the player
_myCount = count _members;
for "_x" from 0 to _myCount do
{
	//searching deleting selected Player
	if( _unitID == ((_members select _x) select 0)) then
	{
		_members set [_x,[1]];

		_members = _members - [1];
	};
};
//_members = _members - [_unitID, name player, 0];

grpPlayer setVariable["gang_members",_members,true];

[[_unit,grpPlayer],"clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;