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
//player addItem "Toolkit";


player addAction ["<t color='#B40404'>Dépaneuse : Attacher</t>",{[] spawn fnc_DepaneuseR}
,0,0,true,true,'','(vehicle player) == player && count (nearestObjects [player, ["B_Truck_01_mover_F"], 7]) > 0 && cursorTarget isKindOf "CAR" && typeOf cursorTarget != "B_Truck_01_mover_F" && (count attachedObjects ((nearestObjects [player, ["B_Truck_01_mover_F"], 7]) select 0) == 0)'];

player addAction ["<t color='#0F3F99'>Dépaneuse : Détacher</t>",{[] spawn fnc_DepaneuseD},0,0,true,true,'','(vehicle player) == player && count (nearestObjects [player, ["B_Truck_01_mover_F"], 7]) > 0 && cursorTarget isKindOf "CAR" && typeOf cursorTarget != "B_Truck_01_mover_F" && !isNull attachedTo cursorTarget'];

player addAction ["Dépaneuse : Impound",{[cursorTarget] spawn life_fnc_impoundAction},0,0,true,true,'','(vehicle player) == player && cursorTarget isKindOf "CAR"'];


if (isNil {fnc_DepaneuseR}) Then {
	fnc_DepaneuseR = {
			_depanneuse = (nearestObjects [player, ["B_Truck_01_mover_F"], 7]) select 0;
			_veh = cursorTarget;
			_dir = sqrt((direction _depanneuse - direction _veh)^2);
			if (_veh isKindOf "CAR" && (player distance _veh) < 5 && _dir < 12) then        {
							hint "Remorquage de la voiture ...";
							player playMove "AinvPknlMstpSlayWrflDnon_healed";
							sleep 11;
							//réduire d'un peu moins de moitié le x et redescendre de pas grand chose en y
							//_veh attachTo [_depanneuse,[0.1,-2.5,1.23]];
							_veh attachTo [_depanneuse,[0.1,-4,0.40]];
							//[[0,0.66,-0.33],[0,0.33,0.66]];
							_veh setVectorDirAndUp [[0,0.70,0.30],[0,-0.70,0.30]];
							hint "La voiture est en place !";
					} else {hint "La voiture est trop loin ou n'est pas aligner !"};
	};

	fnc_DepaneuseD = {
			_depanneuse = (nearestObjects [player, ["B_Truck_01_mover_F"], 7]) select 0;
			_veh = (attachedObjects  _depanneuse) select 0;
			hint "Détachement de la voiture ...";
			player playMove "AinvPknlMstpSlayWrflDnon_healed";
			sleep 7;
			_veh attachTo [_depanneuse,[0.1,-3.5,1.55]];
			sleep 2;
			_veh attachTo [_depanneuse,[0.1,-5.5,1.55]];
			sleep 2;
			_veh attachTo [_depanneuse,[0.1,-8,0.9]];
			sleep 2;
			_veh attachTo [_depanneuse,[0.1,-8,0.3]];
			sleep 2;
			_veh attachTo [_depanneuse,[0.1,-8,-0.3]];
			_vehicle setvectorup [0,0,1];
			if (_veh isKindOf "Truck_F") Then {
			_veh attachTo [_depanneuse,[0.1,-10,-0.3]];
			};
			sleep 0.5;
			detach _veh;
	};
};


//player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"];
player setObjectTextureGlobal [0,"textures\depan_uniform.jpg"];
switch(uniform player) do
{
	//case "U_I_CombatUniform" : {player setObjectTextureGlobal [0,"textures\medic_uniform.jpg"]};
	//case "U_I_CombatUniform" : {[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
	case "U_I_CombatUniform" : {[[player,0,"textures\depan_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};

	default{};
};