/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Pétrole Brut"};
	case "life_inv_oilp": {"Pétrole Raffiné"};
	case "life_inv_heroinu": {"Graine blanche de Pavot"};
	case "life_inv_heroinp": {"Héroïne Pure"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Pomme"};
	case "life_inv_rabbit": {"Viande de Lapin"};
	case "life_inv_salema": {"Chaire de Saumon"};
	case "life_inv_ornate": {"Chaire de Rouget"};
	case "life_inv_mackerel": {"Chaire de Maquereau"};
	case "life_inv_tuna": {"Chaire de Thon"};
	case "life_inv_mullet": {"Chaire de Mullet"};
	case "life_inv_catshark": {"Chaire de Requin Tigre"};
	case "life_inv_turtle": {"Viande de tortue"};
	case "life_inv_fishingpoles": {"Canne à pêche"};
	case "life_inv_water": {"Bouteille d'Eau"};
	case "life_inv_coffee": {"Thermos de Café"};
	case "life_inv_turtlesoup": {"Soupe de Tortue"};
	case "life_inv_donuts": {"Beignets"};
	case "life_inv_fuelE": {"Jerrican Vide"};
	case "life_inv_fuelF": {"Jerrican d'Eseence"};
	case "life_inv_pickaxe": {"Pioche"};
	case "life_inv_copperore": {"Minerai de Cuivre"};
	case "life_inv_ironore": {"Minerai de Fer"};
	case "life_inv_ironr": {"Lingot de Fer"};
	case "life_inv_copperr": {"Lingot de Cuivre"};
	case "life_inv_sand": {"Sable"};
	case "life_inv_salt": {"Sel"};
	case "life_inv_saltr": {"Sel Raffinné"};
	case "life_inv_glass": {"Verre"};
	case "life_inv_diamond": {"Diamant Brut"};
	case "life_inv_diamondr": {"Diamant Taillé"};
	case "life_inv_tbacon": {"Sandwich au Thon"};
	case "life_inv_redgull": {"Boisson Énergisante"};
	case "life_inv_lockpick": {"Outils de crochetage"};
	case "life_inv_peach": {"Pêche"};
	case "life_inv_coke": {"Feuille de Coca"};
	case "life_inv_cokep": {"Cocaïne Pure"};
	case "life_inv_spikeStrip": {"Herse"};
	case "life_inv_rock": {"Roche"};
	case "life_inv_cement": {"Bloc de Ciment"};
	case "life_inv_goldbar": {"Lingot d'Or"};
	case "life_inv_blastingcharge": {"Charges d'explosifs"};
	case "life_inv_boltcutter": {"Pince coupante"};
	case "life_inv_defusekit": {"Kit de désarmement"};
	case "life_inv_storagesmall": {"Petit container"};
	case "life_inv_storagebig": {"Grand container"};


	case "life_inv_hamburger": {"Hamburger"};
	case "life_inv_frites": {"Frites"};
	case "life_inv_cheeseburger": {"Cheeseburger"};
	case "life_inv_rubanSecurite": {"Ruban Sécurité"};
	case "life_inv_cone": {"Cône Sécurité"};
	case "life_inv_barriere": {"Barrière Sécurité"};
	case "life_inv_barriereStop": {"Barrière Stop"};
	case "life_inv_blocdesableCoin": {"Bloc de sable d'Angle"};
	case "life_inv_blocdesableCourt": {"Bloc de sable Court"};
	case "life_inv_blocdesableLong": {"Bloc de sable Long"};
	case "life_inv_blocdesableTourelle": {"Bloc de sable Tourelle"};
	case "life_inv_blocdesableBunker": {"Bloc de sable Bunker"};
	case "life_inv_camonetLong": {"Camouflage Long"};
	case "life_inv_camonetLarge": {"Camouflage Large"};
	case "life_inv_camonetRectangle": {"Camouflage Rectangulaire"};
	case "life_inv_cargoHq": {"Cargo HQ"};
	case "life_inv_ziptie": {"Menottes"};
	case "life_inv_defibrilateur": {"Défibrilateur"};
	case "life_inv_kitmeth": {"Kith De Meth"};
	case "life_inv_crystalmeth": {"Cristal Meth Non Purifie"};
	case "life_inv_crystalmethpur": {"Cristal Meth Purifie"};
	case "life_inv_poudrehydroxyde": {"Poudre d'Hydroxyde De Sodium Anhydre"};
	case "life_inv_archeologie": {"Echantillon d'Archeologie"};
	case "life_inv_mash": {"Mix de grain d'ethanol"};
	case "life_inv_yeast": {"Levure"};
	case "life_inv_rye": {"Seigle"};
	case "life_inv_hops": {"Houblon"};
	case "life_inv_whiskey": {"Whisky distillé"};
	case "life_inv_beerp": {"Biere fermenté"};
	case "life_inv_bottles": {"Bouteille de verre"};
	case "life_inv_cornmeal": {"Grains de Mais"};
	case "life_inv_bottledwhiskey": {"Whisky en bouteille"};
	case "life_inv_bottledbeer": {"Biere en bouteille"};
	case "life_inv_bottledshine": {"Moonshine en bouteille"};
	case "life_inv_moonshine": {"Moonshine Distillé"};


	//License Block
	case "license_civ_driver": {"Permis de conduire"};
	case "license_civ_air": {"Brevet de Pilote"};
	case "license_civ_heroin": {"Producteur d'Héroïne"};
	case "license_civ_gang": {"Wu Tang Gang"};
	case "license_civ_oil": {"Raffinage du Pétrole"};
	case "license_civ_dive": {"Diplôme de Plongée"};
	case "license_civ_boat": {"Permis Bateau"};
	case "license_civ_gun": {"Permis de port d'armes"};
	case "license_cop_air": {"Brevet de Pilote"};
	case "license_cop_swat": {"Diplôme des Forces Spéciales"};
	case "license_cop_cg": {"Garde Cote"};
	case "license_civ_rebel": {"Licence de rebellion"};
	case "license_civ_truck": {"Permis Poids Lourd"};
	case "license_civ_diamond": {"Joallier"};
	case "license_civ_copper": {"Fondeur de Cuivre"};
	case "license_civ_iron": {"Fondeur de Fer"};
	case "license_civ_sand": {"Souffleur de Verre"};
	case "license_civ_salt": {"Rafinnage du Sel"};
	case "license_civ_coke": {"Producteur de Cocaïne"};
	case "license_civ_marijuana": {"Producteur de Marijuana"};
	case "license_civ_cement": {"Producteur de Ciment"};
    case "license_med_air": {"Bret de pilote ambulancier"};
    case "license_civ_home": {"Licence proprio"};

	case "license_civ_meth": {"Formation De Meth."};
	//case "license_civ_depanneur": {"Brevet de Dépanneur"};
	case "license_civ_archeologie": {"License D'Archeologie"};
	case "license_civ_papiers": {"Papiers d'identitées"};

	case "license_civ_stiller": {"Licence de distilleur"};
	case "license_civ_liquor": {"Fabriquant de liqueur"};
	case "license_civ_bottler": {"Licence de mise en bouteille"};
	case "license_civ_rebel": {"Licence Gangster"};

};
