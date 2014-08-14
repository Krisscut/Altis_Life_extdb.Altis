/*
	File: fn_seizePlayerStuffAction.sqf
	Author: Bloopis
	Date : 05/02/2014

	Description:
	Delete target stuff (clothes)

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
private["_val","_onceDelete"];
_val = false;
_onceDelete = false;
//we check uniform
switch (uniform player) do {
	case "U_IG_Guerilla1_1": {_val = true};
	case "U_I_G_Story_Protagonist_F": {_val = true};
	case "U_I_G_resistanceLeader_F": {_val = true};
	case "U_O_CombatUniform_oucamo": {_val = true};
	case "U_O_SpecopsUniform_blk": {_val = true};
	case "U_O_OfficerUniform_ocamo": {_val = true};
	case "U_O_PilotCoveralls": {_val = true};
	case "U_IG_leader": {_val = true};
	case "U_O_GhillieSuit": {_val = true};
	case "U_B_SpecopsUniform_sgg": {_val = true};
	case "U_B_CombatUniform_mcam": {_val = true};
	case "U_B_CombatUniform_mcam_vest": {_val = true};
	default {_val = false};
};

if(_val) then {removeUniform player;_onceDelete = true;};

_val = false;
//we check vest
switch (vest player) do {
	case "V_TacVest_khk": {_val = true};
	case "V_BandollierB_cbr": {_val = true};
	case "V_HarnessO_brn": {_val = true};
	default {_val = false};
};

if(_val) then {removeVest player;_onceDelete = true;};

_val = false;
//we check headgear
switch (headgear player) do {
	case "H_Booniehat_dgtl": {_val = true};
	case "H_Cap_brn_SPECOPS": {_val = true};
	case "H_Cap_tan_specops_US": {_val = true};
	case "H_Cap_khaki_specops_UK": {_val = true};
	case "H_Cap_blk_Raven": {_val = true};
	case "H_Bandanna_camo": {_val = true};
	case "H_Bandanna_mcamo": {_val = true};
	case "H_Shemag_tan": {_val = true};
	case "H_Shemag_olive": {_val = true};
	case "H_ShemagOpen_khk": {_val = true};
	default {_val = false};
};

if(_val) then {removeHeadgear player;_onceDelete = true;};

_val = false;
//we check goggles
switch (goggles player) do {
	case "G_Shades_Black": {_val = true};
	case "G_Shades_Blue": {_val = true};
	case "G_Sport_Blackred": {_val_val = true};
	case "G_Sport_Checkered": {_val = true};
	case "G_Sport_Blackyellow": {_val = true};
	case "G_Sport_BlackWhite": {_val = true};
	case "G_Squares": {_val = true};
	case "G_Lowprofile": {_val = true};
	case "G_Combat": {_val = true};
	default {_val = false};
};

if(_val) then {removeGoggles player;_onceDelete = true;};

//we refresh the player
//[] call life_fnc_sessionUpdate;
[] call life_fnc_civFetchGear;
[] call life_fnc_civLoadGear;
[] call SOCK_fnc_updateRequest; //call our silent sync.

if(_onceDelete) then {titleText["Vos habits et objets ont été saisies par la police comme pieces à convictions.","PLAIN"];};