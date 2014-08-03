/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};
<<<<<<< HEAD
//Far_revive GreeFine
_playerUncon = player getVariable ["FAR_isUnconscious", 0];

if ((alive _unit) && (_damage >= 1) && (_damage < 2.5)  && (_playerUncon == 0) && (_curwep != "hgun_P07_snds_F") && (_part != "head_hit")) then {
		_unit setDamage 0;
		_unit allowDamage false;
		_damage = 0;
		life_istazed = false;//modified 04/22/2014
		if ((side _source == civilan) && (vehicle _source isKindOf "LandVehicle")) then {
		[[getPlayerUID _source,name _source,"187V"],"life_fnc_wantedAdd",false,false] spawn BIS_fnc_MP;
		} else {
		[[getPlayerUID _source,name _source,"187T"],"life_fnc_wantedAdd",false,false] spawn BIS_fnc_MP;
		};

		[_unit, _source] spawn FAR_Player_Unconscious;
};
=======
>>>>>>> parent of f8809d0... GROSSE FIX EVENT HANDLER STACKER !

[] call life_fnc_hudUpdate;
_damage;