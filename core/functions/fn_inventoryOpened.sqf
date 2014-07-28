/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

if(((_isPack == 1) && (playerSide == civilian)) OR ((_isPack == 1) && (playerSide == civilian) && !((license_civ_rebel) && (player distance cursortarget < 4) && (((cursortarget getVariable "FAR_isUnconscious") == 1) || ((cursortarget getVariable "isknocked")) || ((cursortarget getVariable "restrained")) || ((cursortarget getVariable "playerSurrender"))))) then {
	hint "Impossible de voler dans les sacs !";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) && (playerSide == civilian) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "Tu n'as pas acces à cette caisse car le propriétaire a verrouiller celui ci";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};
