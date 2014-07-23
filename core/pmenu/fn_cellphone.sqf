#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan

	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type","_lastContact","_fastReply","_adminReply"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;
_fastReply = _display displayCtrl 3022;
_adminReply = _display displayCtrl 3020;

ctrlSetText [3003, ""];
_lastContact = player getVariable "lastestContact";
if(!isNull _lastContact) then {
	if(alive _lastContact) then {
		ctrlSetText [3023, format["Dernier Contact: %1",name _lastContact]];
		player setVariable ["saveContact",_lastContact,true];
	}else {player setVariable ["saveContact",ObjNull,true];};
};
_fastReply buttonSetAction "[""1""] call fnc_cell_specialmsg;";
_adminReply buttonSetAction"[""2""] call fnc_cell_specialmsg;";

lbClear _units;


if((__GETC__(life_adminlevel) < 1)) then
{
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};
{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [3004,0];