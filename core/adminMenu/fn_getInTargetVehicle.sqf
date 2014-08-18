/*
	File: fn_getInTargetVehicule.sqf
	Author: S.lambert

	Description:
	Get in Vehicule of the target
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	if (vehicle _unit != _unit) then
	{
		player moveInAny (vehicle _unit);

		sleep 2;
		if( vehicle player != vehicle _unit) then
		{
			ctrlSetText[9030,"Vehicule plein ou probleme lors du déplacement"];
		};
	}
	else
	{
		ctrlSetText[9030,"La cible n'est pas dans un véhicule"];
	};
};