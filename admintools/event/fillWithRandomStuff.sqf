/*
	File: fillWithRandomStuff.sqf
	Author: Komodo

	Description:
	Admin function, allowing to randomly fill in a targeted inventory with random stuff
*/

private["_unit"];
_unit = cursorTarget;

if(isNull _unit) exitWith {}; //Not valid
if(player == _unit) exitWith {};
//if(!isPlayer _unit) exitWith {};

//Sample for tests.
//MK18
_unit addWeaponCargoGlobal ["srifle_EBR_DMS_pointer_snds_F",2];
_unit addMagazineCargoGlobal ["20Rnd_762x51_Mag",24];
//Rahim
_unit addWeaponCargoGlobal ["srifle_DMR_01_DMS_F",2];
_unit addMagazineCargoGlobal ["10Rnd_762x51_Mag",24];
//Lynx
_unit addWeaponCargoGlobal ["srifle_GM6_F",2];
_unit addMagazineCargoGlobal ["5Rnd_127x108_Mag",24];
//M320
_unit addWeaponCargoGlobal ["srifle_LRR_F",2];
_unit addMagazineCargoGlobal ["7Rnd_408_Mag",24];
//MK200
_unit addWeaponCargoGlobal ["LMG_Mk200_F",2];
_unit addMagazineCargoGlobal ["200Rnd_65x39_cased_Box",6];
//Zafir
_unit addWeaponCargoGlobal ["LMG_Zafir_F",2];
_unit addMagazineCargoGlobal ["150Rnd_762x51_Box",6];