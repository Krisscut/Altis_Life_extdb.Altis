/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_oldItemName","_countAllWest"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,"Raffinage du Pétrole","Baril de Pétrole"];};
	case "diamond": {["diamond","diamondc",1350,"Taille des Diamants","Diamant Brut"]};
	case "copper": {["copperore","copper_r",750,"Fonte du Cuivre","Minerai de Cuivre"]};
	case "iron": {["ironore","iron_r",1120,"Fonte du Fer","Minerai de Fer"]};
	case "sand": {["sand","glass",650,"Traitement du Sable","Sable"]};
	case "salt": {["salt","salt_r",450,"Raffinage du Sel","Sel"]};
	case "cocaine": {["cocaine","cocainep",1500,"Traitement de la Cocaïne","Feuille de Coca"]};
	case "marijuana": {["cannabis","marijuana",500,"Traitement de la Marijuana","Feuille de Cannabis"]};
	case "heroin": {["heroinu","heroinp",1720,"Traitement de l'Héroïne","Héroïne"]};
	case "cement": {["rock","cement",350,"Mélange pour Ciment","Ciment"]};
	case "meth": {["kitmeth","poudrehydroxyde",2500,"Traitement de la Meth","Poudre Hydroxyde Sodium"]};
	case "meth1": {["poudrehydroxyde","crystalmeth",3000,"Traitement de la Poudre Hydroxyde","Cristal de Meth"]};
	case "meth2": {["crystalmeth","crystalmethpur",3500,"Purification Cristal de Meth","Cristal de Meth Pur"]};
	default {[]};
};

//Ajout Sky

_countAllWest=0;
{
   if ((side _x) == West) then
   {
	  _countAllWest=_countAllWest+1;// magic
   };
} forEach playableUnits;

//Error checking
if(count _itemInfo == 0) exitWith {hint "Tu n'as pas les ingrédients nécessaires"};

//Setup vars.
_oldItem = _itemInfo select 0;
_oldItemName = _itemInfo select 4;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if((_oldItem == "kitmeth" OR _oldItem == "poudrehydroxyde" OR _oldItem == "crystalmeth" OR _oldItem == "cocaine") && (_countAllWest <4)) exitWith
	{
		titleText[format["Il y a %1 flic connecté actuellement",_countAllWest],"PLAIN"];
		hint "Les gendarmes en présence ne sont pas assez nombreux actuellement, il faut qu'ils soient 4 minimum, merci de bien vouloir réitérer plus tard cette tentative...";
		5 cutText ["","PLAIN"];
		life_is_processing = false;
	};

	if(player distance _vendor > 10) exitWith {hint "Tu dois rester dans un rayon de 10 mètres pour effectuer le traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	//Ajout de Sky pour différencier le genre
	if(_oldItem == "cocaine" OR _oldItem == "cannabis" OR _oldItem == "poudrehydroxyde") exitWith {titleText[format["Tu as transformé la %1 en %2",_oldItemName,_itemName],"PLAIN"]; life_is_processing = false;};
	if(_oldItem == "heroinu") exitWith {titleText[format["Tu as transformé l'%1 en %2",_oldItemName,_itemName],"PLAIN"]; life_is_processing = false;};
	//Fin ajout
	titleText[format["Tu as transformé le %1 en %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_liquide < _cost) exitWith {hint format["Tu as besoin de %1€ pour effectuer le traitement sans licence !",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Tu dois rester dans un rayon de 10 mètres pour effectuer le traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_liquide < _cost) exitWith {hint format["Tu as besoin de %1€ pour effectuer le traitement sans licence !",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];

	//Ajout de Sky pour différencier le genre
	if(_oldItem == "cocaine" OR _oldItem == "cannabis" OR _oldItem == "poudrehydroxyde") exitWith {titleText[format["Tu as transformé la %1 en %2 pour %3€",_oldItemName,_itemName,[_cost] call life_fnc_numberText],"PLAIN"]; life_liquide = life_liquide - _cost;
	life_is_processing = false;};
	if(_oldItem == "heroinu") exitWith {titleText[format["Tu as transformé l'%1 en %2 pour %3€",_oldItemName,_itemName,[_cost] call life_fnc_numberText],"PLAIN"]; life_liquide = life_liquide - _cost;
	life_is_processing = false;};
	//Fin ajout

	titleText[format["Tu as transformé le %1 en %2 pour %3€",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_liquide = life_liquide - _cost;
	life_is_processing = false;
};