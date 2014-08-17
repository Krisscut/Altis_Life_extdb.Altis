/*
	File: fn_ejectFromVehicle.sqf
	Author: S.Lambert

	Description:
	Eject all units from the target véhicle
*/

private["_unit", "_crew"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	if (vehicle _unit != _unit) then
	{
		_crew = crew _vehicle;
		{
			_x setVariable ["transporting",false,true];
			_x setVariable ["Escorting",false,true];
			[[_x],"life_fnc_CivpulloutVeh",_x,false] spawn life_fnc_MP;
		} foreach _crew;

		ctrlSetText[9030,format["Toutes les unités étant dans le véhicule de %1 ont été ejecté", name _unit]];
	}
	else
	{
		ctrlSetText[9030,format["La cible n'est pas dans un véhicule", name _unit]];
	};
};