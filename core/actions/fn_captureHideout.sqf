#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_i_Shed_Ind_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["Tu dois déjà créer un gang avant de pouvoir capturer une planque!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Ton gang a déjà capturé la zone!","PLAIN"]};
	//ajout asurion
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint"Une personne seulement peut capturer la zone !";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["Cette planque est prise par %1<br/>Êtes vous sur de vouloir essayer de la capturer quand meme ??",_gangName],
		"Territoire deja sous controle",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText["Capture annulé","PLAIN"];};
life_action_inUse = true;
[[[0,1],format["%1 et son gang nommé: %2 - sont en train de capturer une zone de gang",name player,(group player) getVariable "gang_name" ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
//Setup the progress bar
disableSerialization;
_title = "Capture de la zone...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 1.80;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;

titleText["La zone a été capturé avec succes.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
//Added asurion for make global message
[[[0,1],format["%1 et son gang nommé: %2 - ont capturé la zone de gang",name player,(group player) getVariable "gang_name" ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
// Merci Pictureglass > On se crée un marker TROLOL

_markername = str(getPos _hideout);
_gangname2 = formatText["Captured by: %1",(group player) getVariable "gang_name"];
if (getMarkerColor _markername == "") then
{
	gang_owner_marker = createMarker [_markername, position player];
	_markername setMarkerShape "ICON";
	_markername setMarkerType "hd_warning";
	_markername setMarkerColor "ColorBlue";
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else
{
	_markername setMarkerText str(_gangname2);
};
_hideout setVariable["gangOwner",grpPlayer,true];