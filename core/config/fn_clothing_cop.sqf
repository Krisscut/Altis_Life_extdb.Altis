#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{

	//Uniforms
	case 0:
	{

		switch(__GETC__(life_coplevel)) do
		{
			case 1 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
			};
			case 2 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
					};
			case 3 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
			};
			case 4 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
				_ret set[count _ret,["U_B_HeliPilotCoveralls","Tshirt GIGN",0]];
				_ret set[count _ret,["U_B_CTRG_2",nil,860]];
			};
			case 5 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
				_ret set[count _ret,["U_B_HeliPilotCoveralls","Tshirt GIGN",0]];
				_ret set[count _ret,["U_B_CTRG_2",nil,860]];
				_ret set[count _ret,["U_B_SpecopsUniform_sgg","Uniforme GIGN",0]];
				_ret set[count _ret,["U_B_CombatUniform_mcam_vest","Uniforme Olive FR",0]];
			};
			case 6 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
				_ret set[count _ret,["U_B_HeliPilotCoveralls","Tshirt GIGN",0]];
				_ret set[count _ret,["U_B_CTRG_2",nil,860]];
				_ret set[count _ret,["U_B_SpecopsUniform_sgg","Uniforme GIGN",0]];
				_ret set[count _ret,["U_B_CombatUniform_mcam_vest","Uniforme Olive FR",0]];
			};
			case 7 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
				_ret set[count _ret,["U_B_HeliPilotCoveralls","Tshirt GIGN",0]];
				_ret set[count _ret,["U_B_CTRG_2",nil,860]];
				_ret set[count _ret,["U_B_SpecopsUniform_sgg","Uniforme GIGN",0]];
				_ret set[count _ret,["U_B_CombatUniform_mcam_vest","Uniforme Olive FR",0]];
				_ret set[count _ret,["U_B_GhillieSuit",nil,0]];
			};
			case 8 : {
				_ret set[count _ret,["U_Rangemaster","Uniforme de gendarme",0]];
				_ret set[count _ret,["U_B_survival_uniform","Plongeur CE",0]];
				_ret set[count _ret,["U_KerryBody","Tshirt CE",0]];
				_ret set[count _ret,["U_B_CTRG_3","Uniforme CE FR",0]];
				_ret set[count _ret,["U_B_HeliPilotCoveralls","Tshirt GIGN",0]];
				_ret set[count _ret,["U_B_CTRG_2",nil,860]];
				_ret set[count _ret,["U_B_SpecopsUniform_sgg","Uniforme GIGN",0]];
				_ret set[count _ret,["U_B_CombatUniform_mcam_vest","Uniforme Olive FR",0]];
				_ret set[count _ret,["U_B_GhillieSuit",nil,0]];
			};
			default{};
		};
	};

//Hats
	case 1:
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 1 : {

			};
			case 2 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
			};
			case 3 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
			};
			case 4 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_tan_specops_US",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_blk",nil,0]];
				_ret set[count _ret,["H_HelmetB_black",nil,0]];
				_ret set[count _ret,["H_HelmetSpecB_blk",nil,0]];
				_ret set[count _ret,["H_PilotHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
			};
			case 5 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_tan_specops_US",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_blk",nil,0]];
				_ret set[count _ret,["H_HelmetB_black",nil,0]];
				_ret set[count _ret,["H_HelmetSpecB_blk",nil,0]];
				_ret set[count _ret,["H_PilotHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_MilCap_mcamo",nil,0]];
				_ret set[count _ret,["H_Cap_brn_SPECOPS",nil,0]];
				_ret set[count _ret,["H_Cap_khaki_specops_UK",nil,0]];
				_ret set[count _ret,["H_HelmetB_camo",nil,0]];
				_ret set[count _ret,["H_HelmetB_light_black",nil,0]];
				_ret set[count _ret,["H_Cap_headphones",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
			};
			case 6 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_tan_specops_US",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_blk",nil,0]];
				_ret set[count _ret,["H_HelmetB_black",nil,0]];
				_ret set[count _ret,["H_HelmetSpecB_blk",nil,0]];
				_ret set[count _ret,["H_PilotHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_MilCap_mcamo",nil,0]];
				_ret set[count _ret,["H_Cap_brn_SPECOPS",nil,0]];
				_ret set[count _ret,["H_Cap_khaki_specops_UK",nil,0]];
				_ret set[count _ret,["H_HelmetB_camo",nil,0]];
				_ret set[count _ret,["H_HelmetB_light_black",nil,0]];
				_ret set[count _ret,["H_Cap_headphones",nil,0]];
				_ret set[count _ret,["H_Beret_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_gry",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
				_ret set[count _ret,["H_Beret_02","NEW HAT",0]];
			};
			case 7 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_tan_specops_US",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_blk",nil,0]];
				_ret set[count _ret,["H_HelmetB_black",nil,0]];
				_ret set[count _ret,["H_HelmetSpecB_blk",nil,0]];
				_ret set[count _ret,["H_PilotHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_MilCap_mcamo",nil,0]];
				_ret set[count _ret,["H_Cap_brn_SPECOPS",nil,0]];
				_ret set[count _ret,["H_Cap_khaki_specops_UK",nil,0]];
				_ret set[count _ret,["H_HelmetB_camo",nil,0]];
				_ret set[count _ret,["H_HelmetB_light_black",nil,0]];
				_ret set[count _ret,["H_Cap_headphones",nil,0]];
				_ret set[count _ret,["H_Beret_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_gry",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
				_ret set[count _ret,["H_Beret_02","NEW HAT",0]];
			};
			case 8 : {
				_ret set[count _ret,["H_Watchcap_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_blue",nil,0]];
				_ret set[count _ret,["H_CrewHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_Booniehat_grn",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,0]];
				_ret set[count _ret,["H_HelmetIA",nil,0]];
				_ret set[count _ret,["H_Cap_tan_specops_US",nil,0]];
				_ret set[count _ret,["H_HelmetB_plain_blk",nil,0]];
				_ret set[count _ret,["H_HelmetB_black",nil,0]];
				_ret set[count _ret,["H_HelmetSpecB_blk",nil,0]];
				_ret set[count _ret,["H_PilotHelmetHeli_B",nil,0]];
				_ret set[count _ret,["H_MilCap_mcamo",nil,0]];
				_ret set[count _ret,["H_Cap_brn_SPECOPS",nil,0]];
				_ret set[count _ret,["H_Cap_khaki_specops_UK",nil,0]];
				_ret set[count _ret,["H_HelmetB_camo",nil,0]];
				_ret set[count _ret,["H_HelmetB_light_black",nil,0]];
				_ret set[count _ret,["H_Cap_headphones",nil,0]];
				_ret set[count _ret,["H_Beret_blk",nil,0]];
				_ret set[count _ret,["H_MilCap_gry",nil,0]];
				_ret set[count _ret,["H_Cap_police",nil,0]];
				_ret set[count _ret,["H_Beret_Colonel","BEST HAT EVER",0]];
			};
			default{};
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[

			["G_Shades_Black",nil,0],
			["G_Aviator","lunettes trop swag",0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Diving",nil,0],
			["G_Balaclava_blk","NEW",10000]

		];
	};

	//Vest
	case 3:
	{

		switch(__GETC__(life_coplevel)) do
		{
			case 1 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
			};
			case 2 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
			};
			case 3 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
			};
			case 4 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_rgr",nil,0]];
				_ret set[count _ret,["V_PlateCarrier2_rgr",nil,0]];
				_ret set[count _ret,["V_TacVest_oli",nil,0]];
			};
			case 5 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_rgr",nil,0]];
				_ret set[count _ret,["V_PlateCarrier2_rgr",nil,0]];
				_ret set[count _ret,["V_TacVest_oli",nil,0]];
				_ret set[count _ret,["V_TacVestIR_blk",nil,0]];
				_ret set[count _ret,["V_TacVest_blk",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_blk",nil,0]];
			};
			case 6 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_rgr",nil,0]];
				_ret set[count _ret,["V_PlateCarrier2_rgr",nil,0]];
				_ret set[count _ret,["V_TacVest_oli",nil,0]];
				_ret set[count _ret,["V_TacVestIR_blk",nil,0]];
				_ret set[count _ret,["V_TacVest_blk",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_blk",nil,0]];
				_ret set[count _ret,["V_BandollierB_oli",nil,0]];
				_ret set[count _ret,["V_BandollierB_blk",nil,0]];
			};
			case 7 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_rgr",nil,0]];
				_ret set[count _ret,["V_PlateCarrier2_rgr",nil,0]];
				_ret set[count _ret,["V_TacVest_oli",nil,0]];
				_ret set[count _ret,["V_TacVestIR_blk",nil,0]];
				_ret set[count _ret,["V_TacVest_blk",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_blk",nil,0]];
				_ret set[count _ret,["V_BandollierB_oli",nil,0]];
				_ret set[count _ret,["V_BandollierB_blk",nil,0]];
			};
			case 8 : {
				_ret set[count _ret,["V_Rangemaster_belt",nil,0]];
				_ret set[count _ret,["V_Press_F","Veste Journaliste",0]];
				_ret set[count _ret,["V_Chestrig_blk",nil,0]];
				_ret set[count _ret,["V_RebreatherB",nil,0]];
				_ret set[count _ret,["V_Chestrig_oli",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_rgr",nil,0]];
				_ret set[count _ret,["V_PlateCarrier2_rgr",nil,0]];
				_ret set[count _ret,["V_TacVest_oli",nil,0]];
				_ret set[count _ret,["V_TacVestIR_blk",nil,0]];
				_ret set[count _ret,["V_TacVest_blk",nil,0]];
				_ret set[count _ret,["V_PlateCarrier1_blk",nil,0]];
				_ret set[count _ret,["V_BandollierB_oli",nil,0]];
				_ret set[count _ret,["V_BandollierB_blk",nil,0]];
			};
			default{};
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_rgr",nil,0],
			["B_AssaultPack_blk",nil,0],
			["B_Kitbag_mcamo",nil,0],
			["B_Bergen_blk",nil,0],
			["B_Bergen_mcamo",nil,0],
			["B_TacticalPack_mcamo",nil,0],
			["B_TacticalPack_blk",nil,0],
			["B_TacticalPack_rgr",nil,0],
			["B_Carryall_mcamo",nil,0],
			["B_Carryall_khk",nil,0]

		];
	};
};

_ret;