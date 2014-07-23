#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_shop":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (__GETC__(life_coplevel) == 2):
			{
				["Armurerie Gendarmes",
					[
						["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["arifle_sdar_F","Arme Sdar",20000],
						["SMG_02_ACO_F","Sting",30000],
						["hgun_P07_snds_F","Pistolet Taser",2000],
						["16Rnd_9x21_Mag","Munition pistolet",50],
						["20Rnd_556x45_UW_mag","Munitions SdarTaser",125],
						["30Rnd_556x45_Stanag","Munitions Sdar",150],
						["30Rnd_9x21_Mag","Munitions Sting",200],
						["optic_Holosight",nil,1200],
						["optic_ACO_grn",nil,1200],
						["optic_Aco",nil,1200],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemGPS",nil,100],
						["SmokeShell",nil,100],
						["FirstAidKit",nil,150],
						["ToolKit",nil, 2000],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["acc_flashlight",nil,750],
						["Rangefinder",nil,2000]
					]
				];
			};
			case (__GETC__(life_coplevel) == 3):
				{
					["Armurerie Adjudant",
						[
							["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
							["6Rnd_GreenSignal_F","Munitions verte",250],
							["6Rnd_RedSignal_F","Munitions rouge",250],
							["arifle_sdar_F","Arme Sdar",20000],
							["arifle_TRG21_F",nil,20000],
							["SMG_02_ACO_F","Sting",30000],
							["arifle_MXC_F",nil,30000],
							["hgun_P07_snds_F","Pistolet Taser",2000],
							["16Rnd_9x21_Mag","Munition pistolet",50],
							["30Rnd_65x39_caseless_mag","Munitions MXC",100],
							["20Rnd_556x45_UW_mag","Munitions Taser",125],
							["30Rnd_9x21_Mag","Munitions Sting",200],
							["30Rnd_556x45_Stanag","Munition TRG21",200],
							["30Rnd_556x45_Stanag","Munitions Sdar",150],
							["optic_Holosight",nil,1200],
							["optic_ACO_grn",nil,1200],
							["optic_Aco",nil,1200],
							["optic_NVS","Night Vision",3000],
							["optic_Hamr",nil,8000],
							["Binocular",nil,150],
							["ItemMap",nil,50],
							["ItemCompass",nil,50],
							["ItemGPS",nil,100],
							["SmokeShell",nil,100],
							["FirstAidKit",nil,150],

							["ToolKit",nil, 2000],
							["NVGoggles",nil,2000],
							["Chemlight_red",nil,300],
							["Chemlight_yellow",nil,300],
							["Chemlight_green",nil,300],
							["Chemlight_blue",nil,300],
							["acc_flashlight",nil,750],
							["Rangefinder",nil,2000]
						]
					];
				};

			case (__GETC__(life_coplevel) > 3):
				{
					["Armurerie",
						[
							["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
							["6Rnd_GreenSignal_F","Munitions verte",250],
							["6Rnd_RedSignal_F","Munitions rouge",250],
							["srifle_EBR_F",nil,40000],
							["20Rnd_762x51_Mag","Munitions Mk18",250],
							["arifle_sdar_F","Arme Sdar",20000],
							["arifle_TRG21_F",nil,20000],
							["SMG_02_ACO_F","Sting",30000],
							["arifle_MXC_Black_F",nil,30000],
							["arifle_MX_Black_F",nil,35000],
							["arifle_MXM_Black_F",nil,35000],
							["arifle_MX_SW_Black_F","MX SW",40000],
							["srifle_DMR_01_F",nil,100000],
							["LMG_Mk200_F",nil,150000],
							["srifle_LRR_F",nil,600000],
							["srifle_LRR_camo_F",nil,600001],
							["arifle_MX_GL_Black_F","MX luncher",200000],
							["3Rnd_UGL_FlareWhite_F","Grenade Blanche",10000],
							["3Rnd_UGL_FlareGreen_F","Grenade Green",10000],
							["3Rnd_UGL_FlareRed_F","Grenade Rouge",10000],
							["3Rnd_UGL_FlareYellow_F","Grenade Jaune",10000],
							["3Rnd_UGL_FlareCIR_F","Grenade Infrarouge",10000],
							["hgun_P07_snds_F","Pistolet Taser",2000],
							["16Rnd_9x21_Mag","Munition pistolet",50],
							["30Rnd_65x39_caseless_mag","Munitions MXC",100],
							["20Rnd_556x45_UW_mag","Munitions Taser",125],
							["200Rnd_65x39_cased_Box","Munitions MK200",150],
							["30Rnd_9x21_Mag","Munitions Sting",200],
							["30Rnd_556x45_Stanag","Munition TRG21",200],
							["30Rnd_65x39_caseless_mag","Munitions MX",200],
							["10Rnd_762x51_Mag","Munitions DMR",200],
							["30Rnd_65x39_caseless_mag","Munitions MXM",200],
							["100Rnd_65x39_caseless_mag","Munition MX SW",200],
							["30Rnd_556x45_Stanag","Munitions Sdar",150],
							["7Rnd_408_Mag",nil,2000],
							["optic_Holosight",nil,1200],
							["optic_ACO_grn",nil,1200],
							["optic_Aco",nil,1200],
							["optic_DMS",nil,2000],
							["optic_NVS","Night Vision",3000],
							["optic_Hamr",nil,8000],
							["optic_MRCO",nil,8000],
							["optic_Arco",nil,8000],
							["Binocular",nil,150],
							["ItemMap",nil,50],
							["ItemCompass",nil,50],
							["ItemGPS",nil,100],
							["SmokeShell",nil,100],
							["B_UavTerminal",nil,150],
							["FirstAidKit",nil,150],
							["Medikit",nil,15000],
							["ToolKit",nil, 2000],
							["NVGoggles",nil,2000],
							["NVGoggles_INDEP",nil,2001],
							["muzzle_snds_H",nil,10000],
							["muzzle_snds_B",nil,10000],
							["muzzle_snds_L",nil,10000],
							["muzzle_snds_M",nil,10000],
							["muzzle_snds_H_MG",nil,10000],
							["Chemlight_red",nil,300],
							["Chemlight_yellow",nil,300],
							["Chemlight_green",nil,300],
							["Chemlight_blue",nil,300],
							["acc_flashlight",nil,750],
							["Rangefinder",nil,2000]
						]
					];
				};
			default
			{
				["Armurerie Bleu",
					[
						["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["hgun_P07_snds_F","Pistolet Taser",2000],
						["16Rnd_9x21_Mag","Munition pistolet",50],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemGPS",nil,100],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["ToolKit",nil, 2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["Rangefinder",nil,2000]

					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						//["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_Bergen_blk",nil,3000]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Interdit aux civils !"};
			case (!license_civ_rebel): {"Tu n'as pas ta licence d'entrainement Rebel!"};
			case (__GETC__(life_donator) == 1) :
			{
				["Mohammed's Jihadi Shop 1",
					[
						["hgun_Rook40_F",nil,2000],
						["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["hgun_PDW2000_F",nil,14000],
						["hgun_Pistol_heavy_02_F","Pistolet Zbur",500000],
						["arifle_SDAR_F",nil,12750],
						["arifle_TRG20_F",nil,16000],
						["arifle_TRG21_GL_F",nil,25000],
						["arifle_Mk20_F",nil,85000],
						["arifle_Katiba_F",nil,106250],
						["arifle_Katiba_GL_F",nil,150000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_EBR_F",nil,136000],
						["srifle_DMR_01_F",nil,212500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125],
						["20Rnd_762x51_Mag","Munition MK18",425],
						["30Rnd_65x39_caseless_green","Munition Katiba",425],
						["30Rnd_556x45_Stanag","Munition MK20",425],
						["30Rnd_556x45_Stanag","Munition SDAR",720],
						["100Rnd_65x39_caseless_mag","Munition MX",835],
						["10Rnd_762x51_Mag","Munition DMR",1060],
						["hgun_Pistol_heavy_01_F","Pistolet",7200],
						["hgun_Pistol_heavy_01_snds_F","Pistolet silencieux",12750],
						["hgun_Pistol_heavy_01_MRD_F","Pistolet + viseur",17000],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["11Rnd_45ACP_Mag","Munition pistolet",425],
						["6Rnd_45ACP_Cylinder","Munition Zbur",500],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_NVS","Night Vision",425],
						["optic_ACO_grn",nil,700],
						["optic_Aco",nil,700],
						["acc_flashlight",nil,1000],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,4250],
						["muzzle_snds_B",nil,4250],
						["muzzle_snds_H",nil,4250],
						["optic_DMS",nil,6800],
						["optic_Hamr",nil,6800],
						["optic_MRCO",nil,8500],
						["Chemlight_red",nil,255],
						["Chemlight_yellow",nil,255],
						["Chemlight_green",nil,255],
						["Chemlight_blue",nil,255],
						["ToolKit",nil,200],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,8500],
						["Medikit",nil,60000]
					]
				];
			};
			case (__GETC__(life_donator) == 2) :
			{
				["Mohammed's Jihadi Shop 2",
					[
						["hgun_Rook40_F",nil,1750],
						["hgun_Pistol_heavy_01_F","Pistolet",8000],
						["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["hgun_PDW2000_F",nil,10500],
						["hgun_Pistol_heavy_01_snds_F","Pistolet silencieux",12000],
						["hgun_Pistol_heavy_01_MRD_F","Pistolet + viseur",16000],
						["hgun_Pistol_heavy_02_F","Pistolet Zbur",50000],
						["arifle_SDAR_F",nil,12000],
						["arifle_TRG20_F",nil,14000],
						["arifle_TRG21_GL_F",nil,25000],
						["arifle_Mk20_F",nil,80000],
						["arifle_Katiba_F",nil,100000],
						["srifle_EBR_F",nil,128000],
						["arifle_Katiba_GL_F",nil,150000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_DMR_01_F",nil,200000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["30Rnd_9x21_Mag",nil,400],
						["11Rnd_45ACP_Mag","Munition pistolet",400],
						["20Rnd_762x51_Mag","Munition MK18",400],
						["30Rnd_65x39_caseless_green","Munition Katiba",400],
						["30Rnd_556x45_Stanag","Munition MK20",400],
						["6Rnd_45ACP_Cylinder","Munition Zbur",500],
						["100Rnd_65x39_caseless_mag","Munition MX",800],
						["30Rnd_556x45_Stanag","Munition SDAR",800],
						["10Rnd_762x51_Mag","Munition DMR",1000],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_NVS","Night Vision",400],
						["optic_ACO_grn",nil,700],
						["optic_Aco",nil,700],
						["optic_DMS",nil,6400],
						["optic_MRCO",nil,8000],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,4000],
						["optic_Hamr",nil,6400],
						["muzzle_snds_B",nil,4000],
						["muzzle_snds_H",nil,4000],
						["acc_flashlight",nil,800],
						["Chemlight_red",nil,240],
						["Chemlight_yellow",nil,240],
						["Chemlight_green",nil,240],
						["Chemlight_blue",nil,240],
						["ToolKit",nil,200],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,8000],
						["Medikit",nil,60000]
					]
				];
			};
			case (__GETC__(life_donator) == 3) :
			{
				["Mohammed's Jihadi Shop 3",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_01_F","Pistolet",7500],
						["hgun_PDW2000_F",nil,9000],
						["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["hgun_Pistol_heavy_01_snds_F","Pistolet silencieux",15000],
						["hgun_Pistol_heavy_01_MRD_F","Pistolet + viseur",20000],
						["hgun_Pistol_heavy_02_F","Pistolet Zbur",50000],
						["arifle_SDAR_F",nil,11250],
						["arifle_TRG20_F",nil,12000],
						["arifle_TRG21_GL_F",nil,25000],
						["arifle_Mk20_F",nil,75000],
						["arifle_Katiba_F",nil,93500],
						["arifle_Katiba_GL_F",nil,150000],
						["arifle_Mk20_GL_F",nil,150000],
						["srifle_EBR_F",nil,120000],
						["srifle_DMR_01_F",nil,187500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["30Rnd_9x21_Mag",nil,375],
						["20Rnd_762x51_Mag","Munition MK18",375],
						["30Rnd_65x39_caseless_green","Munition Katiba",375],
						["30Rnd_556x45_Stanag","Munition MK20",375],
						["11Rnd_45ACP_Mag","Munition pistolet",375],
						["6Rnd_45ACP_Cylinder","Munition Zbur",500],
						["30Rnd_556x45_Stanag","Munition SDAR",750],
						["100Rnd_65x39_caseless_mag","Munition MX",750],
						["10Rnd_762x51_Mag","Munition DMR",935],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_NVS","Night Vision",375],
						["optic_DMS",nil,6000],
						["optic_MRCO",nil,7500],
						["optic_ACO_grn",nil,1875],
						["optic_Aco",nil,1875],
						["optic_Holosight",nil,3750],
						["optic_Hamr",nil,6000],
						["muzzle_snds_B",nil,3750],
						["muzzle_snds_H",nil,3750],
						["acc_flashlight",nil,750],
						["Chemlight_red",nil,225],
						["Chemlight_yellow",nil,225],
						["Chemlight_green",nil,225],
						["Chemlight_blue",nil,225],
						["ToolKit",nil,200],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Rangefinder",nil,7500],
						["Medikit",nil,60000]
					]
				];
			};
			default
			{
				["Mohammed's Jihadi Shop",
					[
							["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
							["6Rnd_GreenSignal_F","Munitions verte",250],
							["6Rnd_RedSignal_F","Munitions rouge",250],
						["arifle_Mk20_F",nil,100000],
						["arifle_Katiba_F",nil,125000],
						["arifle_Katiba_GL_F",nil,150000],
						["arifle_Mk20_GL_F",nil,150000],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["srifle_EBR_F",nil,160000],
						["srifle_DMR_01_F",nil,250000],
						["arifle_SDAR_F",nil,15000],
						["10Rnd_762x51_Mag","Munition DMR",1250],
						["100Rnd_65x39_caseless_mag","Munition MX",1000],
						["30Rnd_9x21_Mag",nil,500],
						["20Rnd_762x51_Mag","Munition MK18",500],
						["30Rnd_65x39_caseless_green","Munition Katiba",500],
						["30Rnd_556x45_Stanag","Munition MK20",500],
						["30Rnd_556x45_Stanag","Munition SDAR",1000],
						["hgun_Pistol_heavy_01_F","Pistolet",10000],
						["hgun_Pistol_heavy_01_snds_F","Pistolet silencieux",15000],
						["hgun_Pistol_heavy_01_MRD_F","Pistolet + viseur",20000],
						["11Rnd_45ACP_Mag","Munition pistolet",500],
						["hgun_Pistol_heavy_02_F","Pistolet Zbur",50000],
						["6Rnd_45ACP_Cylinder","Munition Zbur",500],
						["optic_DMS",nil,8000],
						["optic_MRCO",nil,10000],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,5000],
						["optic_Hamr",nil,8000],
						["muzzle_snds_B",nil,5000],
						["muzzle_snds_H",nil,5000],
						["acc_flashlight",nil,1000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["Rangefinder",nil,10000],
						["optic_NVS","Night Vision",500],
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemGPS",nil,100],
						["ToolKit",nil,2000],
						["FirstAidKit",nil,1000]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Interdit aux civils !"};
			case (!license_civ_gun): {"Tu n'a pas le Permis de Port d'Armes !"};
			default
			{
				["Armes a Feu De Billy Joe",
					[
							["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
							["6Rnd_GreenSignal_F","Munitions verte",250],
							["6Rnd_RedSignal_F","Munitions rouge",250],
						["hgun_Rook40_F",nil,2500],
						["arifle_SDAR_F",nil,15000],
						["hgun_PDW2000_F",nil,20000],
						["SMG_01_Holo_F",nil,40000],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_556x45_Stanag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["LMG_Zafir_F",nil,300000],
						["srifle_GM6_F",nil,600000],
						["srifle_GM6_camo_F",nil,600000],
						["150Rnd_762x51_Box","Munition Zafir",500],
						["5Rnd_127x108_Mag","Munition sniper",3000],
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["Magasin de la Communauté grade 1",
					[
						["hgun_Rook40_F",nil,2000],
						["hgun_PDW2000_F",nil,14000],
						["arifle_TRG20_F",nil,16000],
						["arifle_TRG21_GL_F",nil,25000],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_ACO_grn",nil,700],
						["optic_Aco",nil,700],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Medikit",nil,60000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["Magasin de la Communauté grade 2",
					[
						["hgun_Rook40_F",nil,1750],
						["hgun_PDW2000_F",nil,10500],
						["arifle_TRG20_F",nil,14000],
						["arifle_TRG21_GL_F",nil,25000],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_ACO_grn",nil,700],
						["optic_Aco",nil,700],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Medikit",nil,60000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["Magasin de la Communauté grade 3",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_PDW2000_F",nil,9000],
						["arifle_TRG20_F",nil,12000],
						["arifle_TRG21_GL_F",nil,25000],
						["UGL_FlareWhite_F","Grenade Blanche",2000],
						["UGL_FlareGreen_F","Grenade Verte",2000],
						["UGL_FlareRed_F","Grenade Rouge",2000],
						["UGL_FlareYellow_F","Grenade Jaune",2000],
						["UGL_FlareCIR_F","Grenade Infrarouge",2000],
						["optic_ACO_grn",nil,700],
						["optic_Aco",nil,700],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["itemCompass",nil,50],
						["FirstAidKit",nil,25],
						["Medikit",nil,60000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemGPS",nil,100],
				["ToolKit",nil,2000],
				["FirstAidKit",nil,1000],
				["NVGoggles",nil,2000]
			]
		];
	};

	case "depan":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Magasin dépanneur",
					[
						["Binocular",nil,150],
						["ItemMap",nil,50],
						["ItemCompass",nil,50],
						["ItemGPS",nil,100],
						["ToolKit",nil,0],
						["FirstAidKit",nil,1000],
						["NVGoggles",nil,2000]
					]
				];
			};
		};
	};
};
