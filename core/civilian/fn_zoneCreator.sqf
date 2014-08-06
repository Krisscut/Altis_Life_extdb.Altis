/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.

	Note:
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_yeastZones","_ryeZones","_hopsZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_ryeZones = ["rye_1"];
_yeastZones = ["yeast_1"];
_hopsZones = ["hops_1"];

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Cueillir des Pommes',life_fnc_gatherApples,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Cueillir des Pêches',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Cueillir Héroïne',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Cueillir du Cannabis',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Cueillir de la Cocaine',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;
//and at bottom under create zones
//Create zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Rye = player addAction['Ramasser Seigle',life_fnc_gatherRye,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Rye;"];
} foreach _ryeZones;
//Create zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Hops = player addAction['Ramasser Houblon',life_fnc_gatherHops,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Hops;"];
} foreach _hopsZones;
//Create zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Yeast = player addAction['Ramasser Levure',life_fnc_gatherYeast,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Yeast;"];
} foreach _yeastZones;

//Create Radar Zone
	RadarOn=true;

	_zone = createTrigger ["EmptyDetector",(getMarkerPos "RadarSud")];
	_zone setTriggerArea [25,25,0,false];
	_zone setTriggerActivation ["ANY","PRESENT",true];
	_zone setTriggerStatements ["vehicle player in thislist","[50,'Kavala Sud'] call life_fnc_RadarAuto","RadarOn=true"];

	_zone = createTrigger ["EmptyDetector",(getMarkerPos "Radarcentre")];
	_zone setTriggerArea [25,25,0,false];
	_zone setTriggerActivation ["ANY","PRESENT",true];
	_zone setTriggerStatements ["vehicle player in thislist","[50,'Kavala centre'] call life_fnc_RadarAuto","RadarOn=true"];

	_zone = createTrigger ["EmptyDetector",(getMarkerPos "RadarNord")];
	_zone setTriggerArea [25,25,0,false];
	_zone setTriggerActivation ["ANY","PRESENT",true];
	_zone setTriggerStatements ["vehicle player in thislist","[130, 'Kavala Nord'] call life_fnc_RadarAuto","RadarOn=true"];