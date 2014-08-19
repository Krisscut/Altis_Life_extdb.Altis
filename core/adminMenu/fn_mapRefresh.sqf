/*
	File: fn_mapRefresh.sqf
	Author: S.Lambert

	Description:
	Auto-refresh map and marker of the unit
*/
private["_map","_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	disableSerialization;
	_display = findDisplay 9000;

	_map = _display displayCtrl 9001;
	[_map,1,0.1,getPos _unit] call life_fnc_setMapPosition;
	_markerstr = format["%1",name _unit];
	_marker = createMarkerLocal [_markerstr, getPos _unit];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "mil_triangle";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerDirLocal (getDir _unit);
	_marker setMarkerTextLocal _markerstr;

	ctrlSetText[9030,format["Tracking %1", name _unit]];
	sleep 1;
	while{player getVariable ["am_unitTargeted",false] == _unit && alive _unit} do
	{

		// do map refresh & other stuff?
		[_map,1,0.1,getPos _unit] call life_fnc_setMapPosition;
		_marker setMarkerPosLocal (getPos _unit);
		_marker setMarkerDirLocal (getDir _unit);

		//Réanimer
		if (_unit getVariable "FAR_isUnconscious" == 1) then
		{
			ctrlEnable[9051,true];
		}
		else
		{
			ctrlEnable[9051,false];
		};

		//Vehicule
		if (vehicle _unit != _unit ) then
		{
			ctrlEnable[9015,true];		//GetInTargetVehicle
			ctrlEnable[9054,true];		//EjectFrom Vehicle
		}
		else
		{
			ctrlEnable[9015,false];		//GetInTargetVehicle
			ctrlEnable[9054,false];		//EjectFrom Vehicle
		};

		//Damage
		if (damage _unit > 0) then
		{
			ctrlEnable[9052,true];		//Soigner
		}
		else
		{
			ctrlEnable[9052,false];		//Soigner
		};

		//Prison
		if (_unit distance (getMarkerPos "jail_marker") < 40 ) then
		{
			ctrlEnable[9055,true];		//extractFrom Jail
			ctrlEnable[9016,false];		//Put IntoJail
		}
		else
		{
			ctrlEnable[9055,false];		//extractFrom Jail
			ctrlEnable[9016,true];		//Put IntoJail
		};

		//Menottage
		if (_unit getVariable "restrained") then
		{
			ctrlEnable[9053,true];		//Demenotter
			ctrlEnable[9014,false];		//menotter
		}
		else
		{
			ctrlEnable[9014,true];		//menotter
			ctrlEnable[9053,false];		//Demenotter
		};

		sleep 0.25;
	};
	ctrlSetText[9030,format["L'unité selectionné est morte ou déconnectée"]];

	deleteMarkerLocal _markerstr;
	/* disable all buttons */
	ctrlEnable[9010,false];		//spectateur
	ctrlEnable[9011,false];		//tpToTarget
	ctrlEnable[9012,false];		//targetToMe
	ctrlEnable[9050,false];		//Deplacer
	ctrlEnable[9013,false];		//KillTarget
	ctrlEnable[9051,false];		//Réanimer
	ctrlEnable[9052,false];		//Soigner

	ctrlEnable[9014,false];		//menotter
	ctrlEnable[9053,false];		//Demenotter
	ctrlEnable[9015,false];		//GetInTargetVehicle
	ctrlEnable[9054,false];		//EjectFrom Vehicle
	ctrlEnable[9016,false];		//Put IntoJail
	ctrlEnable[9055,false];		//extractFrom Jail
	ctrlEnable[9017,false];		//Troll

};

