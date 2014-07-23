/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	Traduction : Skydred pour Involved-Gaming.Com	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
//if (uniform player in ["U_Rangemaster","U_B_CombatUniform_mcam_worn"]) then {removeUniform player;};
//if (vest player in ["V_HarnessOGL_brn"]) then {removeVest player;};
//license_civ_gun = false;
//[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
//[] call life_fnc_civLoadGear;
titleText["Vos armes ont été saisies.","PLAIN"];