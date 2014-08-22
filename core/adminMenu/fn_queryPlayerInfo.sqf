#include <macro.h>
/*
	File: fn_queryPlayerInfo.sqf from adminQuery
	Author: Bryan "Tonic" Boardwine && S.Lambert

	Description:
	Starts the query on a player.
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 9000;
if(!isNil {admin_query_ip}) exitWith {hint "Tu es déjà en train de rechercher cette personne."};
_text = _display displayCtrl 9006;
_info = lbData[9004,lbCurSel (9004)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {_text ctrlSetText "Joueur a disparu?";};
if(isNull _info) exitWith {_text ctrlSetText "Joueur a disparu?";};
[[player],"fnc_adminMenu_player_query",_info,false] spawn life_fnc_MP;
_text ctrlSetText "Recherche joueur......";

// add id search
[] spawn life_fnc_modoGetId;

//TODO add other name search