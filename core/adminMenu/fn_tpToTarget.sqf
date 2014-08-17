/*
	File: fn_tpToTarget.sqf
	Author: S.lambert

	Description:
	Teleportation to Target
*/

player setVariable ["usingAdminMenu",false, false];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	if (vehicle player != player) then//player dans un véhicule
	{
		(vehicle player) setPos (getPos _unit);
	}
	else
	{
		player setPos (getPos _unit);
	};

};