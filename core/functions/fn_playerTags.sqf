/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred pour Involved-Gaming.Com
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_visible","_position","_position2","_nearUnits","_name","_GangName","_icon","_width","_height"];
_nearUnits = (visiblePosition player) nearEntities ["Man",10];
{
	if(!(_x getVariable["invisible",false])) then //disable refresh of tags and name(hide function for admins)
	{
		if(player distance _x < 10 && isPlayer _x && _x != player) then {
			_visible = lineIntersects [eyePos player, eyePos _x,player, _x];
			if(!_visible) then {
				_icon = "";
				_position = visiblePosition _x;
				_position set[2,(getPosATL _x select 2) + 2.2];

				//drawIcon3D ["",[1,1,1,1],_position,0,0,0,name _x,0,0.04];

				_width = 0.85;
				_height = 0.85;

				/*if (_x getVariable["life_inspec",false]) then
				{
					switch (_x getVariable["coplevel", 0]) do
					{
						case (1) : {_name = format["Contrôleur %1", name _x];};
						case (2) : {_name = format["Inspecteur %1", name _x];};
						case (3) : {_name = format["Inspecteur Chef %1", name _x];};
						case (4) : {_name = format["Inspecteur Principal %1", name _x];};
						case (5) : {_name = format["Inspecteur Principal %1", name _x];};
						case (6) : {_name = format["Inspecteur Principal %1", name _x];};
						default {_name = name _x; _width = 0; _height = 0;}
					};
				}
				else
				{*/
					switch (_x getVariable["coplevel", 0]) do
					{
						case (1) : {_name = format["[GAV] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa";};
						case (2) : {_name = format["[Gendarme] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa";};
						case (3) : {_name = format["[Adjudant] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa";};
						case (4) : {_name = format["[Major] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa";};
						case (5) : {_name = format["[Lieutenant] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa";};
						case (6) : {_name = format["[Capitaine] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\major_gs.paa";};
						case (7) : {_name = format["[Colonel] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa";};
						case (8) : {_name = format["[General] %1", name _x];_icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa";};
						default {_name = name _x; _icon = ""; _width = 0; _height = 0;}
					};


				//};
				//if(_x getVariable["life_dep",false]) then{_name = format["[Depanneur] %1", name _x];};
				//if(_x getVariable["life_vigil",false]) then{_name = format["[Vigil] %1", name _x];};
				//if(_x getVariable["life_medic",false]) then{_name = format["[Ambulancier] %1", name _x];};
				//if(str(_x) in ["cop_30"]) then{_name = format["[Démineur] %1", name _x];};
				//if(_x getVariable["life_demineur",false]) then{_name = format["[Démineur] %1", name _x];};


				/*if (_x getVariable["coplevel", 0] > 0) then
				{
					_icon = [((_x getVariable["coplevel", 0]) - 1),"texture"] call BIS_fnc_rankParams;
				};*/

				drawIcon3D [_icon,[1,1,1,1],_position,_width,_height,0,_name,0,0.04];

				if (!isnil {(group _x) getVariable "gang_name"}) Then {
					_position2 = visiblePosition _x;
					_position2 set[2,(getPosATL _x select 2) + 2.7];
					_GangName = format["%1", ((group _x) getVariable "gang_name")];
					drawIcon3D ["",[0.3,0,0.8,1],_position2,_width,_height,0,_GangName,0,0.06];
				};
			};
		};
	};
} foreach _nearUnits;