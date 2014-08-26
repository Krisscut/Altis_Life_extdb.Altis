#include <macro.h>
/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred pour Involved-Gaming.com
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";

			_ret =
			[
					[_path + "hatchback_01_ext_sport01_co.paa","civ"],
					[_path + "hatchback_01_ext_sport02_co.paa","civ"],
					[_path + "hatchback_01_ext_sport03_co.paa","civ"],
					[_path + "hatchback_01_ext_sport04_co.paa","civ"],
					[_path + "hatchback_01_ext_sport05_co.paa","civ"],
					[_path + "hatchback_01_ext_sport06_co.paa","civ"],
					["textures\vehicules\hatchback_sport_2.jpg","civ"],
					["textures\vehicules\hatchback_sport_1.jpg","civ"],
					["textures\vehicules\hatchback_police.jpg","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","cop"],
					["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","cop"]

			];

	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["textures\vehicules\offroad_police.jpg","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["textures\vehicules\med_offroad.jpg","med"],
			["textures\vehicules\offroad_depannage.jpg","dep"],
			["textures\vehicules\offroad_cyan.jpg","civ"]


		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\vehicules\hatchback_police.jpg","cop"]
		];
	};

	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\vehicules\suv_taxi.jpg","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","cop"],
			["textures\vehicules\suv_police.jpg","cop"],
			["textures\vehicules\med_suv.jpg","med"],
			["textures\vehicules\suv_kitty.jpg","civ"],
			["textures\vehicules\suv_fast.jpg","civ"],
			["textures\vehicules\suv_taxi.jpg","civ"],
			["textures\vehicules\suv_camo.jpg","civ"],
			["textures\vehicules\suv_reb.jpg","reb"],
			["textures\vehicules\suv_staff_black.jpg","fed"],
			["textures\vehicules\suv_3.jpg","fed"],
			["textures\vehicules\suv_2.jpg","fed"],
			["textures\vehicules\suv_1.jpg","fed"],
			["textures\vehicules\suv_dona_orange.jpg","fed"],
			["textures\vehicules\test001.jpg","fed"],
			["textures\vehicules\test002.jpg","fed"],
			["textures\vehicules\test003.jpg","fed"]
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["textures\vehicules\heli_police_light.jpg","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\vehicules\little_rebel.jpg","reb"],
			["textures\vehicules\little_rebel_2.jpg","reb"],
			["textures\vehicules\heli_medic_light.jpg","med"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"]
		];
	};



	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\vehicules\Orca_rebel.jpg","reb"],
			["textures\vehicules\med_orca.jpg","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]

		];
	};

	case "B_MRAP_01_hmg_F":
	{
		_ret =
		[
			["textures\vehicules\mrap_police_noir.jpg","cop","textures\vehicules\mrap_police_noir_adds.jpg"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\vehicules\truck_02_kab_co.jpg","civ","textures\vehicules\truck_02_kuz_co.jpg"],
			["textures\vehicules\zamak_truck_kab_coca.jpg","civ","textures\vehicules\zamak_truck_kuz_coca.jpg"],
			["textures\vehicules\zamak_weed.jpg","civ","textures\vehicules\zamak_weed_back.jpg"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "O_Heli_Attack_02_black_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "I_MRAP_03_F":
	{
		_ret =
		[
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","reb"],
			["textures\vehicules\strider-police.jpg","cop"],
			["textures\vehicules\strider_reb.jpg","reb"]
		];
	};
	case "O_MRAP_02_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa","reb","\a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"],
			["textures\vehicules\ifrit_lion_front.jpg","reb","textures\vehicules\ifrit_lion_back.jpg"],
			["textures\vehicules\ifrit_grey_front.jpg","reb","textures\vehicules\ifrit_grey_back.jpg"],
			["textures\vehicules\ifrit_forest_front.jpg","reb","textures\vehicules\ifrit_forest_back.jpg"],
			["textures\vehicules\ifrit_red_front.jpg","reb","textures\vehicules\ifrit_red_back.jpg"]
		];
	};
};

_ret;
