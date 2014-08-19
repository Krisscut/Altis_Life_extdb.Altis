/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon

	Description:
	Looks like weird but radar?
*/
if(playerSide != west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if((_vehicle isKindOf "Car") && (currentWeapon player) == "rangefinder") then
{
	switch (true) do
	{
		case ((_speed > 33 && _speed <= 80)) :
		{
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#33CC33'><t align='center'><t size='1'>Vitesse %1 km/h<br /><t>Analyse Faciale.... Il s'agit de %2</t>",round  _speed,name _vehicle];
		};

		case ((_speed > 100)) :
		{
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vitesse %1 km/h<br /><t>Analyse Faciale.... VEHICULE TROP RAPIDE</t>",round  _speed];
		};
	};
};
if((!isNull cursortarget && (currentWeapon player) == "rangefinder")) then{

hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Resultat Analyse Faciale <br/><t color='#FF0000'><t align='center'><t size='1'> %1",cursortarget getVariable ["realname",name cursortarget]];

};