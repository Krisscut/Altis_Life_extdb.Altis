#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText["Erreur serveur.","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText ["Chargement des informations envoyées par le serveur... Validation...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_liquide = parseNumber (_this select 2);
life_dabliquide = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		//__CONST__(life_serveur,parseNumber(_this select 10));
		cop_gear = _this select 8;
		[] spawn life_fnc_loadGear;
		life_blacklisted = _this select 9;
		__CONST__(life_medicLevel,0);
		__CONST__(life_depanLevel,0);
	};

	case civilian: {
		life_is_arrested = _this select 7;
		//life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		__CONST__(life_depanLevel,0);
		life_houses = _this select 9;
		//__CONST__(life_serveur,parseNumber(_this select 9));
		[] spawn life_fnc_civLoadGear;

		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;

		life_gangData = _This select 10;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		
		__CONST__(life_medicLevel,parseNumber(_this select 7));
		__CONST__(life_depanLevel,parseNumber(_this select 8));
		__CONST__(life_copLevel,0);
	};
};

switch(__GETC__(life_donator)) do
{
	case 1:
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 7500;
			};

			case civilian:
			{
			// Housing initialization
			/*
				life_houses = _this select 10;
        		ife_houses_markers = [];*/
				life_paycheck = life_paycheck * 2;

			};

			default {
				life_paycheck = life_paycheck * 2;

			};
		};
	};
	case 2:
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 10000;
			};

			case civilian:
			{
				life_paycheck = life_paycheck * 3;

			};

			default {
				life_paycheck = life_paycheck * 3;
			};
		};
	};
	case 3:
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 12500;
			};

			case civilian:
			{
				life_paycheck = life_paycheck * 4;

			};

			default {
				life_paycheck = life_paycheck * 4;
			};
		};
	};
};


life_session_completed = true;
switch (__GETC__(life_coplevel)) do
{
	case 2 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 2500;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 3 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 5000;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 4 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 7500;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 5 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 9000;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 6 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 11500;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 7 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 14000;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
	case 8 :
	{
		switch (playerSide) do
		{
			case west:
			{
				life_paycheck = life_paycheck + 16500;
			};

			default {

				life_paycheck = life_paycheck + 0;
					};

		};
	};
};
