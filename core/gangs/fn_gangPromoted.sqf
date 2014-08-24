#include <macro.h>
/*
	Author: S.lambert

	Description:
	Prompts the player about a promotion.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_rank = [_this,1,1] call BIS_fnc_param;
if(_name == "" OR _rank == "") exitWith {}; //Fail horn anyone?

_rankString = "";
switch (_rank) do
{
    case 0:
    {
    	_rankString = "Recrue";
 	};
    case 1:
    {
    	_rankString = "Membre";

    };
    case 2:
    {
    	_rankString = "Officier";

    };
    default
    {
    	_rankString = "Undefined...";
    };
};

_action = [
	parseText format["<t color='#00aa00'>%1</t> vous a promu au grade de <t color='#ff0000'>%2</t><br/><br/>Félicitations !</t>",_name,_rankString],
	"Promotion Gang",
	true
] call BIS_fnc_guiMessage;

player setVariable["gang_rank",_rank,false];
