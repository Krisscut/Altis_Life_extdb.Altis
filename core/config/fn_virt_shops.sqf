/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Marché",["ziptie","water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Marché Rebelle",["boltcutter","blastingcharge"]]};
	case "gang": {["Marché Gang", ["blastingcharge","boltcutter"]]};
	case "wongs": {["Marché donateur", ["blastingcharge","boltcutter"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Marchand de drogues",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Marchand petrole",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Poissonnier",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Marchand de verre",["glass"]]};
	case "iron": {["Marchand de fer et cuivre",["iron_r","copper_r"]]};
	case "diamond": {["Diamantaire",["diamond","diamondc"]]};
	case "salt": {["Marchand de sel",["salt_r"]]};
	case "cop": {["Magasin poulet",["donuts","coffee","spikeStrip","barriere","barriereStop","water","rabbit","apple","redgull","fuelF","defusekit"]]};
	case "cement": {["Marchand de ciment",["cement"]]};

	case "pharmacie": {["Pharmacie d'Altis",["kitmeth"]]};
	case "meth": {["Tuco",["crystalmeth","crystalmethpur"]]};
	case "archeologie": {["Vendeur d'archeologie",["archeologie"]]};
	case "redburger": {["RedBurger",["hamburger", "frites", "cheeseburger"]]};
};