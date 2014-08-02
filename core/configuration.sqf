#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_action_gather = false;
life_spikestrip = ObjNull;
life_has_insurance = false;
life_fatigue = 0.5; //ajout Serrat
life_respawn_timer = .3; //Scaled in minutes

life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;

life_redCode = false;//added 05/11/2014
life_stopRedCode = false;//added 05/11/2014
life_drawingMessage = false;//added 05/11/2014
life_barrierestop = ObjNull;//added 05/11/2014
life_inv_kit_meth = ObjNull;//added 05/11/2014
life_inv_poudre_hydroxyde_sodium_anhydre = ObjNull;//added 05/11/2014
life_inv_crystal_meth = ObjNull;//added 05/11/2014
life_inv_crystal_meth_pur = ObjNull;//added 05/11/2014

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,250); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,1000000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,500000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,15); //Five minutes
life_liquide = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_inv_allowed = false;//added bloopis
life_insure_val = 0;//added bloopis
life_insure_veh = ObjNull;//added bloopis
life_msg_cost = 0;//added bloopis
life_msg_pub = "";//added bloopis
Action_Revived = false;


life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_dabliquide = 15000; //Starting Bank Money
		life_paycheck = 22500; //Paycheck Amount

		//----------------------------------------------------
		//section added 04/28/2014
		//init crimes array, it must be change if the crimes change !
		life_crimes = [
			["490","Conso Stupéfiants"],
			["489","Crochetage de menottes"],
			["480","Délit de Fuite"],
			["207","Enlèvement"],
			["901","Évadé de Prison"],
			["187","Homicide Involontaire"],
			["187V","Homicide Involontaire Véhicules"],
			["482","Intention de distribuer"],
			["481","Possession de Drogue"],
			["208","Sequestration Civil"],
			["209","Sequestration Policier"],
			["216","Tentative de démenottage"],
			["483","Trafic de Drogues"],
			["207A","Tentative d'Enlèvement"],
			["261A","Tentative de Viol"],
			["215","Tentative de Vol Auto"],
			["213","Utilisation d'Explosif"],
			["261","Viol"],
			["211","Vol"],
			["487","Vol de Voiture"],
			["488","Vol Mineur"]
			];
		//----------------------------------------------------
	};
	case civilian:
	{
			//Systeme de rémunération pour ceux qui sont sur le slot dépanneur

		if((str(player) in ["Depanneur_1","Depanneur_2","Depanneur_3","Depanneur_4","Depanneur_5"])) then {
			life_dabliquide = 15000; //Starting Bank Money
			life_paycheck = 5000;
		}else{
			life_dabliquide = 15000; //Starting Bank Money
			life_paycheck = 3000;
		};
	};

	case independent: {
		life_dabliquide = 15000;
		life_paycheck = 5000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);
//These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",

	"life_inv_barriere",//added by asurion
	"life_inv_barriereStop",//added by asurion
	"life_inv_ziptie",//added by asurion
	"life_inv_hamburger",//added by asurion
	"life_inv_frites",//added by asurion
	"life_inv_cheeseburger",//added by asurion
  	"life_inv_storage1",//added by asurion
    "life_inv_storage2",//added by asurion
	"life_inv_kitmeth",//added by asurion
	"life_inv_poudrehydroxyde",//added by asurion
	"life_inv_crystalmeth",//added by asurion
	"life_inv_crystalmethpur",//added by asurion
	"life_inv_archeologie"//added by asurion
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_depanneur","civ"],//added by asurion
  	["license_civ_home","civ"],//added by asurion
	["license_civ_meth","civ"],//added by asurion
	["license_civ_archeologie","civ"],//added by asurion
	["license_civ_papiers","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [
["heroinu",1200],
["heroinp",2500],
["cocaine",1500],
["cocainep",3500],
["marijuana",2000],
["turtle",3500],
["crystalmeth",3300],
["crystalmethpur",3600]
];

/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",60],
	["heroinu",2300],
	["heroinp",4600],
	["salema",500],
	["ornate",500],
	["mackerel",500],
	["tuna",500],
	["mullet",500],
	["catshark",500],
	["rabbit",65],
	["oilp",3700],
	["turtle",4300],
	["water",5],
	["coffee",5],
	["turtlesoup",4300],
	["donuts",60],
	["marijuana",3500],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",45],
	["cocaine",2400],
	["cocainep",5900],
	["diamond",2000],
	["diamondc",4000],
	["iron_r",1800],
	["copper_r",1900],
	["salt_r",2100],
	["glass",1400],
	["fuelF",500],
	["cement",1050],
	["spikeStrip",1500],
	["goldbar",21000],

	["hamburger",25],//added by asurion
	["crystalmeth",5700],
	["frites",5],//added by asurion
	["cheeseburger",30],//added by asurion
	["barriere",1500],//added by asurion
	["barriereStop",1500],//added by asurion
	["cargoHq",2500],//added by asurion
	["blocdesableLong",1500],//added by asurion
	["ziptie",2000],//added by asurion
	["defibrilateur",10000],//added by asurion
	["acideahlorhydrique",1250],//added by asurion
	["hydrogenchloride",125],//added by asurion
	["hydroxydesodiumanhydre",50],//added by asurion
	["kitmeth",2000],//added by asurion
	["crystalmethpur",10750],//added by asurion
	["archeologie",3000]//added by asurion
];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],

	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],

	["ziptie",3000],//added by asurion
	["hamburger",75],//added by asurion
	["frites",60],//added by asurion
	["cheeseburger",90],//added by asurion
	["barriere",2500],//added by asurion
	["barriereStop",2500],//added by asurion
 //   ["storage2",250000],//added by asurion
	["acideahlorhydrique",2500],//added by asurion
	["hydrogenchloride",250],//added by asurion
	["hydroxydesodiumanhydre",100],//added by asurion
	["kitmeth",2000]//added by asurion
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_Quadbike_01_F",1000],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F", 2000],
	["B_G_Offroad_01_F",2000],
	["C_SUV_01_F",2000],
	["C_Hatchback_01_sport_F",3000],
	["C_Van_01_transport_F",3000],
	["C_Van_01_fuel_F",3000],
	["C_Van_01_box_F",3000],
	["I_Heli_Transport_02_F",7000],
	["B_Heli_Light_01_F",7000],
	["O_Heli_Light_02_unarmed_F",6000],
	["I_Truck_02_transport_F",4000],
	["I_Truck_02_covered_F",4000],
	["B_Truck_01_transport_F",4000],
	["B_Truck_01_box_F", 4000],
	["B_MRAP_01_F",8000],
	["O_MRAP_02_F",8000],
	["I_MRAP_03_F",8000],
	["C_Rubberboat",1000],
	["C_Boat_Civil_01_F",2000],
	["B_Boat_Transport_01_F",2000],
	["C_Boat_Civil_01_police_F",2000],
	["B_Boat_Armed_01_minigun_F",10000],
	["B_G_Offroad_01_armed_F",15000],
	["O_Truck_03_transport_F",4000],
	["B_SDV_01_F",20000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",10000]
];
__CONST__(life_garage_sell,life_garage_sell);

life_price_insurance =
[
    ["B_Quadbike_01_F",500],
    ["C_Hatchback_01_F",200],
    ["C_Offroad_01_F", 2500],
    ["B_G_Offroad_01_F",2500],
    ["C_SUV_01_F",7500],
    ["C_Van_01_transport_F",10000],
    ["C_Hatchback_01_sport_F",5000],
    ["C_Van_01_fuel_F",10000],
    ["I_Heli_Transport_02_F",32500],
    ["C_Van_01_box_F",12500],
    ["I_Truck_02_transport_F",25000],
    ["I_Truck_02_covered_F",30000],
    ["B_Truck_01_transport_F",67500],
    ["B_Truck_01_box_F", 77500],
    ["O_MRAP_02_F",37500],
    ["B_Heli_Light_01_F",50000],
    ["O_Heli_Light_02_unarmed_F",150000],
    ["B_Truck_01_ammo_F",37500],
    ["O_Truck_03_transport_F",100000],
    ["C_Rubberboat",500],
    ["C_Boat_Civil_01_F",3400],
    ["B_Boat_Transport_01_F",400],
    ["C_Boat_Civil_01_police_F",2500],
    ["B_Boat_Armed_01_minigun_F",10500],
    ["B_SDV_01_F",22500],
    ["B_MRAP_01_F",37500],
    ["I_Truck_02_medical_F",18000],
    ["O_Truck_03_medical_F",20000],
    ["B_Truck_01_medical_F",22000],
    ["O_Truck_03_device_F",80000]
];
__CONST__(life_price_insurance,life_price_insurance);