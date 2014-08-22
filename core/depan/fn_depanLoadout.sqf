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
player addItem "Toolkit";


//player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"];
player setObjectTextureGlobal [0,"textures\depan_uniform.jpg"];
switch(uniform player) do
	{
		//case "U_I_CombatUniform" : {player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"]};
		//case "U_I_CombatUniform" : {[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
		case "U_I_CombatUniform" : {[[player,0,"textures\depan_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};

		default{};
	};



