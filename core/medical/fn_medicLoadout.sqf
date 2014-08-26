/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.

removeAllContainers player;
removeAllWeapons player;
player addUniform "U_Rangemaster";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"];*/


/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
player addBackpack "B_Bergen_blk";
player addUniform "U_I_CombatUniform";
player addItem "FirstAidKit";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";

life_actions = life_actions + [player addAction["Voir les inconscient",life_fnc_med,"",0,false,false,"",' playerside == independent ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Se soigner</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0 && ("Medikit" in (items player)) ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Soigner la personne</t>",life_fnc_heal_target,"",99,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 3.5 && vehicle player == player && (damage cursorTarget) > 0 && ("Medikit" in (items player)) ']];

player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"];
//player setObjectTextureGlobal [0,"textures\depan_uniform.jpg"];
switch(uniform player) do
	{
		//case "U_I_CombatUniform" : {player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"]};
		case "U_I_CombatUniform" : {[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
		//case "U_I_CombatUniform" : {[[player,0,"textures\depan_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};

		default{};
	};



