/*
	File: fn_targetToMe.sqf
	Author: S.lambert

	Description:
	amener la personne jusqu'a moi
*/
player setVariable ["usingAdminMenu",false, false];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	if (vehicle _unit != _unit) then//unité dans un véhicule
	{
		(vehicle _unit) setPos (getPos player);
	}
	else
	{
		_unit setPos (getPos player);
	};

};