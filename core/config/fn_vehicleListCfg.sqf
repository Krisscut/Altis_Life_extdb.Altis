#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["C_Kart_01_F",20000],
					["C_Kart_01_Fuel_F",20000],
					["C_Kart_01_Blu_F",20000],
					["C_Kart_01_Red_F",20000],
					["C_Kart_01_Vrana_F",20000]
				];
			};
			case 2 :
			{
				_return =
				[
					["C_Kart_01_F",20000],
					["C_Kart_01_Fuel_F",20000],
					["C_Kart_01_Blu_F",20000],
					["C_Kart_01_Red_F",20000],
					["C_Kart_01_Vrana_F",20000]
				];
			};
			case 3 :
			{
				_return =
				[
					["C_Kart_01_F",20000],
					["C_Kart_01_Fuel_F",20000],
					["C_Kart_01_Blu_F",20000],
					["C_Kart_01_Red_F",20000],
					["C_Kart_01_Vrana_F",20000]
				];
			};
			default
			{
				_return =
				[
					["C_Kart_01_F",20000],
					["C_Kart_01_Fuel_F",20000],
					["C_Kart_01_Blu_F",20000],
					["C_Kart_01_Red_F",20000],
					["C_Kart_01_Vrana_F",20000]
				];
			};
		};
	};

	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",8500],
			["C_SUV_01_F",25500],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000]
		];
	};

	case "med_air_hs":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["B_Heli_Light_01_F",275000],
					["O_Heli_Light_02_unarmed_F",330000]
				];
			};
			case 2 :
			{
				_return =
				[
					["B_Heli_Light_01_F",275000],
					["O_Heli_Light_02_unarmed_F",330000]
				];
			};
			case 3 :
			{
				_return =
				[
					["B_Heli_Light_01_F",275000],
					["O_Heli_Light_02_unarmed_F",330000]
				];
			};
			default
			{
				_return =
				[
					["B_Heli_Light_01_F",275000],
					["O_Heli_Light_02_unarmed_F",330000]
				];
			};
		};
	};

	case "civ_car":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["B_Quadbike_01_F",2100],
					["C_Hatchback_01_F",8000],
					["C_Offroad_01_F",10500],
					["C_SUV_01_F",29500],
					["C_Van_01_transport_F",34000]
				];
			};
			case 2 :
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["C_Hatchback_01_F",7600],
					["C_Offroad_01_F",10000],
					["C_SUV_01_F",28000],
					["C_Van_01_transport_F",32000]
				];
			};
			case 3 :
			{
				_return =
				[
					["B_Quadbike_01_F",1800],
					["C_Hatchback_01_F",7000],
					["C_Offroad_01_F",9000],
					["C_SUV_01_F",26000],
					["C_Van_01_transport_F",30000]
				];
			};
			default
			{
				_return =
				[
					["B_Quadbike_01_F",2500],
					["C_Hatchback_01_F",9500],
					["C_Offroad_01_F",12500],
					["C_SUV_01_F",35000],
					["C_Van_01_transport_F",40000]
				];
			};
		};
	};

	case "civ_truck":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["C_Van_01_box_F",51000],
					["I_Truck_02_transport_F",64000],
					["I_Truck_02_covered_F",85000],
					["B_Truck_01_transport_F",170000],
					["O_Truck_03_device_F",335000],
					["B_Truck_01_box_F",235000]
				];
			};
			case 2 :
			{
				_return =
				[
					["C_Van_01_box_F",48000],
					["I_Truck_02_transport_F",60000],
					["I_Truck_02_covered_F",80000],
					["B_Truck_01_transport_F",160000],
					["O_Truck_03_device_F",330000],
					["B_Truck_01_box_F",220000]
				];
			};
			case 3 :
			{
				_return =
				[
					["C_Van_01_box_F",45000],
					["I_Truck_02_transport_F",56000],
					["I_Truck_02_covered_F",75000],
					["B_Truck_01_transport_F",150000],
					["O_Truck_03_device_F",325000],
					["B_Truck_01_box_F",305000]
				];
			};
			default
			{
				_return =
				[
					["C_Van_01_box_F",60000],
					["I_Truck_02_transport_F",75000],
					["I_Truck_02_covered_F",100000],
					["B_Truck_01_transport_F",200000],
					["O_Truck_03_device_F",375000],
					["B_Truck_01_box_F",275000]
				];
			};
		};
	};


	case "reb_car":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["B_Quadbike_01_F",2100],
					["B_G_Offroad_01_F",10500],
					["O_Truck_02_covered_F",70000],
					["I_Truck_02_covered_F",85000],
					["B_Truck_01_ammo_F",170000],
					["O_MRAP_02_F",170000],
					["B_Truck_01_box_F",235000],
					["O_Truck_03_transport_F",255000],
					["B_Heli_Light_01_F",255000],
					["O_Heli_Light_02_unarmed_F",700000],
					["B_G_Offroad_01_armed_F",430000],
					["I_MRAP_03_F",512000]

				];
			};
			case 2 :
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["B_G_Offroad_01_F",10000],
					["O_Truck_02_covered_F",65000],
					["I_Truck_02_covered_F",80000],
					["B_Truck_01_ammo_F",160000],
					["O_MRAP_02_F",160000],
					["B_Truck_01_box_F",220000],
					["O_Truck_03_transport_F",240000],
					["B_Heli_Light_01_F",240000],
					["O_Heli_Light_02_unarmed_F",700000],
					["B_G_Offroad_01_armed_F",400000],
					["I_MRAP_03_F",480000]

				];
			};
			case 3 :
			{
				_return =
				[
					["B_Quadbike_01_F",1800],
					["B_G_Offroad_01_F",9000],
					["O_Truck_02_covered_F",60000],
					["I_Truck_02_covered_F",75000],
					["B_Truck_01_ammo_F",150000],
					["O_MRAP_02_F",150000],
					["B_Truck_01_box_F",205000],
					["O_Truck_03_transport_F",225000],
					["B_Heli_Light_01_F",225000],
					["O_Heli_Light_02_unarmed_F",700000],
					["B_G_Offroad_01_armed_F",375000],
					["I_MRAP_03_F",450000]

				];
			};
			default
			{
				_return =
				[
					["B_Quadbike_01_F",2500],
					["B_G_Offroad_01_F",12500],
					["O_Truck_02_covered_F",80000],
					["I_Truck_02_covered_F",100000],
					["B_Truck_01_ammo_F",200000],
					["O_MRAP_02_F",200000],
					["B_Truck_01_box_F",275000],
					["O_Truck_03_transport_F",300000],
					["B_Heli_Light_01_F",300000],
					["O_Heli_Light_02_unarmed_F",700000],
					["B_G_Offroad_01_armed_F",500000],
					["I_MRAP_03_F",600000]

				];
			};
		};
	};

	case "cop_car":
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 2 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000]
					];
				}
				else {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000]
					];
				};
			};
			case 3 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000],
						["B_MRAP_01_F",120000]
					];
				}
				else {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000]
					];
				};
			};
			case 4 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000],
						["B_MRAP_01_F",120000],
						["C_Hatchback_01_sport_F",100000],
						["I_MRAP_03_F",200000]
					];
				}
				else {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000],
						["B_MRAP_01_F",120000]
					];
				};
			};
			case 5 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000],
						["B_MRAP_01_F",120000],
						["C_Hatchback_01_sport_F",100000],
						["I_MRAP_03_F",200000],
						["O_Truck_02_covered_F",40000],
						["I_Truck_02_medical_F",30000],
						["B_Truck_01_ammo_F",200000]
					];
				}
				else {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000],
						["C_SUV_01_F",50000],
						["B_MRAP_01_F",120000],
						["C_Hatchback_01_sport_F",100000],
						["I_MRAP_03_F",200000]
					];
				};
			};
			case 6 :
			{
				_return =
				[
					["C_Offroad_01_F",5000],
					["B_Quadbike_01_F",2500],
					["C_Hatchback_01_F",20000],
					["C_SUV_01_F",50000],
					["B_MRAP_01_F",120000],
					["C_Hatchback_01_sport_F",100000],
					["I_MRAP_03_F",200000],

					["O_Truck_02_covered_F",40000],
					["I_Truck_02_medical_F",30000],
					["B_Truck_01_ammo_F",200000]
				];
			};
			case 7 :
			{
				_return =
				[
					["C_Offroad_01_F",5000],
					["B_Quadbike_01_F",2500],
					["C_Hatchback_01_F",20000],
					["C_SUV_01_F",50000],
					["B_MRAP_01_F",120000],
					["C_Hatchback_01_sport_F",100000],
					["I_MRAP_03_F",200000],

					["O_Truck_02_covered_F",40000],
					["I_Truck_02_medical_F",30000],
					["B_Truck_01_ammo_F",200000]
				];
			};
			case 8 :
			{
				_return =
				[
					["C_Offroad_01_F",5000],
					["B_Quadbike_01_F",2500],
					["C_Hatchback_01_F",20000],
					["C_SUV_01_F",50000],
					["B_MRAP_01_F",120000],
					["C_Hatchback_01_sport_F",100000],
					["I_MRAP_03_F",200000],

					["O_Truck_02_covered_F",40000],
					["I_Truck_02_medical_F",30000],
					["B_Truck_01_ammo_F",200000]
				];
			};
			default
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500],
						["C_Hatchback_01_F",20000]
					];
				}
				else {
					_return =
					[
						["C_Offroad_01_F",5000],
						["B_Quadbike_01_F",2500]
					];
				};
			};
		};
	};

	case "civ_air":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["B_Heli_Light_01_F",430000],
					["O_Heli_Light_02_unarmed_F",600000]
				];
			};
			case 2 :
			{
				_return =
				[
					["B_Heli_Light_01_F",400000],
					["O_Heli_Light_02_unarmed_F",565000]
				];
			};
			case 3 :
			{
				_return =
				[
					["B_Heli_Light_01_F",375000],
					["O_Heli_Light_02_unarmed_F",530000]
				];
			};
			default
			{
				_return =
				[
					["B_Heli_Light_01_F",500000],
					["O_Heli_Light_02_unarmed_F",700000]
				];
			};
		};
	};

	case "cop_air":
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 2 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000]
					];
				}
				else {
					_return =
					[
						[]
					];

				};
			};
			case 3 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000]
					];
				}
				else {
					_return =
					[
						["B_Heli_Light_01_F",75000]
					];

				};
			};
			case 4 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000],
						["I_Heli_light_03_unarmed_F",350000]
					];
				}
				else {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000]
					];
				};
			};
			case 5 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000]
				];
			};
			case 6 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			case 7 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			case 8 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			default
			{
				_return =
				[
					[]
				];
			};
		};
	};

	case "cop_airhq":
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 2 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000]
					];
				}
				else {
					_return =
					[
						[]
					];

				};
			};
			case 3 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000]
					];
				}
				else {
					_return =
					[
						["B_Heli_Light_01_F",75000]
					];

				};
			};
			case 4 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000],
						["I_Heli_light_03_unarmed_F",350000]
					];
				}
				else {
					_return =
					[
						["B_Heli_Light_01_F",75000],
						["I_Heli_Transport_02_F",250000],
						["O_Heli_Light_02_unarmed_F",250000]
					];
				};
			};
			case 5 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000]
				];
			};
			case 6 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			case 7 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			case 8 :
			{
				_return =
				[
					["B_Heli_Light_01_F",75000],
					["I_Heli_Transport_02_F",250000],
					["O_Heli_Light_02_unarmed_F",250000],
					["I_Heli_light_03_unarmed_F",350000],
					["B_Heli_Transport_01_F",350000]
				];
			};
			default
			{
				_return =
				[
					[]
				];
			};
		};
	};

	case "civ_ship":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["C_Rubberboat",4500],
					["O_Lifeboat",4500],
					["B_Lifeboat",4500],
					["C_Boat_Civil_01_rescue_F",6000],
					["C_Boat_Civil_01_F",11500]
				];
			};
			case 2 :
			{
				_return =
				[
					["C_Rubberboat",4250],
					["O_Lifeboat",4250],
					["B_Lifeboat",4250],
					["C_Boat_Civil_01_rescue_F",5500],
					["C_Boat_Civil_01_F",11000]
				];
			};
			case 3 :
			{
				_return =
				[
					["C_Rubberboat",4000],
					["O_Lifeboat",4000],
					["B_Lifeboat",4000],
					["C_Boat_Civil_01_rescue_F",5000],
					["C_Boat_Civil_01_F",10000]

				];
			};
			default
			{
				_return =
				[
					["C_Rubberboat",5000],
					["O_Lifeboat",5000],
					["B_Lifeboat",5000],
					["C_Boat_Civil_01_rescue_F",7000],
					["C_Boat_Civil_01_F",13500]
				];
			};
		};
	};

	case "cop_ship":
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 1 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Boat_Civil_01_police_F",20000],
						["C_Rubberboat",3000]
					];
				}
				else {
					_return =
					[
						[]
					];
				};
			};
			case 2 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000]
				];
			};
			case 3 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000]
				];
			};
			case 4 :
			{
				if(__GETC__(life_donator) > 0) then {
					_return =
					[
						["C_Boat_Civil_01_police_F",20000],
						["C_Rubberboat",3000],
						["O_SDV_01_F",100000],
						["B_Boat_Armed_01_minigun_F",75000]
					];
				}
				else {
					_return =
					[
						["C_Boat_Civil_01_police_F",20000],
						["C_Rubberboat",3000],
						["O_SDV_01_F",100000]
					];
				};
			};
			case 5 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000],
					["O_SDV_01_F",100000],
					["B_Boat_Armed_01_minigun_F",75000]
				];
			};
			case 6 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000],
					["O_SDV_01_F",100000],
					["B_Boat_Armed_01_minigun_F",75000]
				];
			};
			case 7 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000],
					["O_SDV_01_F",100000],
					["B_Boat_Armed_01_minigun_F",75000]
				];
			};
			case 8 :
			{
				_return =
				[
					["C_Boat_Civil_01_police_F",20000],
					["C_Rubberboat",3000],
					["O_SDV_01_F",100000],
					["B_Boat_Armed_01_minigun_F",75000]
				];
			};
			default
			{
				_return =
				[
					[]
				];
			};
		};
	};

	case "donateur":
	{
		switch(__GETC__(life_donator)) do
		{
			case 1 :
			{
				_return =
				[
					["B_Quadbike_01_F",2100],
					["C_Offroad_01_F",10500],
					["C_SUV_01_F",29500],
					["C_Van_01_fuel_F",42000],
					["C_Hatchback_01_sport_F",57000],
					["B_Heli_Light_01_F",430000],
					["O_Heli_Light_02_unarmed_F",600000],
					["I_Heli_Transport_02_F",970000]
				];
			};
			case 2 :
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["C_Offroad_01_F",10000],
					["C_SUV_01_F",28000],
					["C_Van_01_fuel_F",40000],
					["C_Hatchback_01_sport_F",53000],
					["B_Heli_Light_01_F",400000],
					["O_Heli_Light_02_unarmed_F",565000],
					["I_Heli_Transport_02_F",910000]
				];
			};
			case 3 :
			{
				_return =
				[
					["B_Quadbike_01_F",1800],
					["C_Offroad_01_F",9000],
					["C_SUV_01_F",26000],
					["C_Van_01_fuel_F",37000],
					["C_Hatchback_01_sport_F",50000],
					["B_Heli_Light_01_F",375000],
					["O_Heli_Light_02_unarmed_F",530000],
					["I_Heli_Transport_02_F",855000]
				];
			};
			default
			{
				_return =
				[
					[]
				];
			};
		};
	};

	case "depan_car":
	{
			_return =
			[
				["B_Quadbike_01_F",2100],
				["C_Hatchback_01_F",8000],
				["C_Offroad_01_F",10500],
				["C_SUV_01_F",29500],
				["O_Truck_03_transport_F",300000],
				["C_Van_01_transport_F",34000]
			];

	};
};

_return;
