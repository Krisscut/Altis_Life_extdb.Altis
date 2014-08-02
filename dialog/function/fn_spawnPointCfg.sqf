#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Neochorie","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Aéroport","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","Sofia","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","Prison","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};

	case civilian:
	{
		_return = [];

		if((str(player) in ["Depanneur_1","Depanneur_2","Depanneur_3","Depanneur_4","Depanneur_5"])) then {

			_return  set [count _return, ["depannage","QG Dépannage","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]];

		} else {
			if(license_civ_rebel) then {
           	 	_return  set [count _return, ["civ_spawn_5","EVENT #1","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
				_return  set [count _return, ["civ_spawn_6","Sira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
				_return  set [count _return, ["civ_spawn_8","Frini","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
          	 	_return  set [count _return, ["civ_spawn_7","AUTRE BASE 3","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
			} else {

           	 	_return  set [count _return, ["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
				_return  set [count _return, ["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
				_return  set [count _return, ["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
				_return  set [count _return, ["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
			};
		};

		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};
	};

	case independent: {
		_return = [];

			_return  set [count _return, ["medic_spawn_1","Hôpital Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
            _return  set [count _return, ["medic_spawn_2","Hôpital Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
            _return  set [count _return, ["medic_spawn_3","Hôpital Pygros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];


	};
};

_return;