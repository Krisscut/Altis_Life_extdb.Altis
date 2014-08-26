/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred pour Involved-Gaming.com
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Rouge foncé";};
			case 5: {_color = "Bleu / Blanc"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Gendarmerie"};
			case 8: {_color = "Jaune"};
			case 9: {_color = "Medic"};
			case 10: {_color = "Depannage"};
			case 11: {_color = "Cyan Dragon"};
		};
	};
	
	case "C_Offroad_01_repair_f" :
	{
		switch (_index) do
		{
			case 0: {_color = "Depannage"};
		};
	};
	case "B_G_Offroad_01_repair_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Depannage"};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Verte";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu foncé";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanche"};
			case 6: {_color = "Grise"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Gendarmerie"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Bleu foncé"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Noir et Blanche"};
			case 4: {_color = "Beige"};
			case 5: {_color = "Verte"};
			case 6: {_color = "Monster"};
			case 7: {_color = "Dragon"};
			case 8: {_color = "Gendarmerie"};
			case 9: {_color = "Banalisée beige";};
			case 10: {_color = "Banalisée verte";};
			case 11: {_color = "Banalisée bleu";};
			case 12: {_color = "Banalisée bleu foncé";};
			case 13: {_color = "Banalisée jaune";};
			case 14: {_color = "Banalisée blanche"};
			case 15: {_color = "Banalisée grise"};
			case 16: {_color = "Banalisée noir"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge foncé";};
			case 1: {_color = "Argent";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Taxi";};
			case 4: {_color = "Banalisée rouge foncé";};
			case 5: {_color = "Gendarmerie";};
			case 6: {_color = "Médical";};
			case 7: {_color = "Hello Kitty";};
			case 8: {_color = "Vert Speed";};
			case 9: {_color = "Jaune";};
			case 10: {_color = "Camouflé";};
			case 11: {_color = "Banalisée orange";};
			case 12: {_color = "Staff";};
			case 13: {_color = "Dona camo";};
			case 14: {_color = "Dona Wood";};
			case 15: {_color = "Dona Ferrari";};
			case 16: {_color = "Dona Orange";};
			case 17: {_color = "test001";};
			case 18: {_color = "test002";};
			case 19: {_color = "test003";};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Digital desert"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Digital Vert"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};

	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Civ Bleu"};
			case 3: {_color = "Civ Rouge"};
			case 4: {_color = "Digi Vert"};
			case 5: {_color = "Bleuline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Bleu"};
			case 9: {_color = "Speedy Rougeline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Bleu"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Rebel Army"};
			case 15: {_color = "Rebel Camo"};
			case 16: {_color = "Medic"};
			case 17: {_color = "Tigre"};
		};
	};



	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Digi Vert"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Rebel Camo"};
			case 5: {_color = "Medic"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Army"};

		};
	};


	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Vert"};
			case 1: {_color = "Noir"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Barbie"};
			case 3: {_color = "Coca"};
			case 4: {_color = "weed"};
		};
	};

	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};

	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Croco"};
			case 1: {_color = "Reb"};
			case 2: {_color = "Bleu Gendarme"};
			case 3: {_color = "Blanc Rebelle"};
		};
	};

	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sable"};
			case 1: {_color = "Jaune Orange"};
			case 2: {_color = "Gris Blanc"};
			case 3: {_color = "Vert Foret"};
			case 4: {_color = "Rouge Gris"};
		};
	};

};

_color;