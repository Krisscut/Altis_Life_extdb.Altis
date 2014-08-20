/*
	Author: Bryan "Tonic" Boardwine

	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_vehicle in life_vehicles)) then
{
	life_vehicles set[count life_vehicles,_vehicle];
};
if(_vehicle isKindof "Air") exitWith {};
_vehicle disableTIEquipment true;
//Ajout Serrat, à tester
if((typeOf _vehicle) in ["I_MRAP_03_F","B_MRAP_01_F","O_MRAP_02_F","B_MRAP_01_hmg_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F"] && (!license_civ_rebel) && (playerSide == Civilian)) exitWith



	{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	//if(count _vehicleData == 0) exitWith { hint "Ce véhicule est l'oeuvre d'un tricheur ou d'un admin" }; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	/*[[0,format["%1 ton %2 à été mis en fourrière par un administrateur",(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;*/

	if((count crew _vehicle) == 0) then
	{
		[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
		//hint "Vehicule mis en fourrière";
	}
		else
	{
		hint "Il y a un joueur dans le vehicule";
	};
};
