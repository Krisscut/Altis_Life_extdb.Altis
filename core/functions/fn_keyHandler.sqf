#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = 35;//_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution
			_handled = true;
		};
	};

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};

	};


	// ALT J Se rendre
	case 36:
	{
		if (!_shift && _alt && !_ctrlKey) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["Escorting", false]) ) then {
				if (player getVariable ["playerSurrender", false]) then {
					player setVariable ["playerSurrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
			_handled = true;
		};
	};
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	case 62:
	{
		if (!_shift && _alt && !_ctrlKey) then
		{

		[[format["%1 a fait un ALT F4",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;

		};
	};

	case 211:
	{
		if (!_shift && _alt && _ctrlKey) then
		{

		[[format["%1 a fait un ALT SUP",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		};
	};
	case 15:
	{
		if (!_shift && _alt && !_ctrlKey) then
		{

		[[format["%1 a fait un ALT TAB",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
			/*
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};*/

		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !(cursorTarget getVariable "civrestrained")/*&& speed cursorTarget < 1*/) then
		{
			if(playerSide != west && (__GETC__(life_adminlevel) == 0)) then {
				//we check if the civilian have enough items to do this action !
				if(cursorTarget getVariable["playerSurrender",false] || ((cursorTarget getVariable["FAR_isUnconscious",false] == 1) && (license_civ_rebel))) then {
					[] call life_fnc_CivrestrainAction;


				};
			}
			else
			{
				//cop & admin
				[] call life_fnc_restrainAction;


			};
		};
	};

	//Touche 1
	case 2:
	{
		if(playerSide == west) then
		{
			[] call life_fnc_p_openMenu;
			[] call life_fnc_wantedMenu;
		};
	};

	//Touche 2
	case 3:
	{
		if(playerSide == west) then { hint parseText format["<t color='#FF0000'><t size='2'>Liste infractions</t></t><br/><br/><br/>-Vol véhicule: 20.000€<br/>-Excès vitesse: 100€ par km/h supp. Si +50km/h: fourriere<br/>-Stationnement génant: 1000€<br/>-Phares éteint nuit:500€<br/>-Conduite dangeureuse: 2500€<br/>-Atterrisage sans autorisation kavala : 15000<br/>-Arme levée: 5000€<br/>-Dégradation bien public: 5000€<br/>-Conduite sans permis: 10000€ voitures, 40000€ camions, 50000€ hélicos<br/>-Refus amende: 30m prison",_name];};

	};

	//Touche 3
	case 4:
	{
		if(playerSide == west) then { hint parseText format["<t color='#FF0000'><t size='2'>Liste délis</t></t><br/><br/><br/>-Délit fuite: 15000€<br/>-Objets rebelles: 70.000€+confiscation<br/>-Drogues: Prix cargaison + 30% de la cargaison<br/>-Vols véhicules: 2x prix véhicule<br/>-Vol personne: 2x prix vols<br/>-Tentative meurtre: 50000€(civils), 100000€(agents)<br/>-Prise d'otages: 50000€ par tête<br/>-Attaque banque: 30000€ par tête<br/>-Meurtres: 25000 par meutres (vehicules), 40000 par meurtres (armes)",_name];};

	};

	//Touche 4
	case 5:
	{
		if (( vehicle player != player ) && (playerSide == west) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"SirenHorn",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};

	//Touche 5
	case 6:
	{
		if (( vehicle player != player ) && (playerSide == west) && !(player getVariable["isHorn",false])) then {[4,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"SirenTrack",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};

	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","I_Truck_02_medical_F","O_Truck_03_medical_F","B_Truck_01_medical_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case 33:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirens Off","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirens On","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint "Tu n'es pas porche d'une porte!"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat "Tu as fermé la porte.";
					///[[player],"life_fnc_houseSoundClose",true,false] spawn life_fnc_MP;
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat "Tu as ouvert la porte.";
					///[[player],"life_fnc_houseSoundOpen",true,false] spawn life_fnc_MP;
					//ouverture
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
				if(_locked == 2) then
				{
					_veh lock 0;
					[[_veh,0], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					[[_veh, "Beep",10],"life_fnc_playSound",true,false] spawn Life_fnc_MP;
					systemChat "Votre vehicule est OUVERT.";
				}
				else
				{
					_veh lock 2;
					[[_veh,2], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					[[_veh, "BeepBeep",10],"life_fnc_playSound",true,false] spawn Life_fnc_MP;
					systemChat "Votre vehicule est FERME.";
				};
				};
			};
		};
	};
};

_handled;