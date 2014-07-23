#include <macro.h>
/*
	File: fn_clothing_med.sqf
	Author: F.Serrat

	Description:
	Master config file for Med clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Ambulanciers"];

_ret = [];
switch (_filter) do
{

	//Uniforms
	case 0:
	{

		switch(__GETC__(life_medicLevel)) do
		{
			case 1 : {
				_ret set[count _ret,["U_I_CombatUniform","Uniforme d'ambulancier",0]];
			};
			case 2 : {
				_ret set[count _ret,["U_I_CombatUniform","Uniforme d'ambulancier",0]];

					};
			case 3 : {
				_ret set[count _ret,["U_I_CombatUniform","Uniforme d'ambulancier",0]];

			};

			default{};
		};
	};

//Hats
	case 1:
	{
		switch(__GETC__(life_coplevel)) do
		{
			case 1 : {

			};
			default{};
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[


			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0]

		];
	};

	//Vest
	case 3:
	{

		switch(__GETC__(life_medicLevel)) do
		{
			case 1 : {

			};
			case 2 : {

			};
			case 3 : {

			};

			default{};
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_rgr",nil,0],
			["B_AssaultPack_blk",nil,0],
			["B_Kitbag_mcamo",nil,0],
			["B_Bergen_blk",nil,0],
			["B_Bergen_mcamo",nil,0],
			["B_TacticalPack_mcamo",nil,0],
			["B_TacticalPack_blk",nil,0],
			["B_TacticalPack_rgr",nil,0],
			["B_Carryall_mcamo",nil,0],
			["B_Carryall_khk",nil,0]

		];
	};
};

_ret;