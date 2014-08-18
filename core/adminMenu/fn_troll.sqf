/*
	File: fn_troll.sqf
	Author: S.lambert

	Description:
	Poteau de troll
*/
private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];


	if( _unit != player ) then
	{
		_feudecamps = "Land_Campfire_F" createVehicle (position player);
		_feudecamps2 = "FlagPole_F" createVehicle (position player);
		_feudecamps2 attachTo [_feudecamps, [0, 0, 0]];
		_unit attachTo [_feudecamps2, [0, -0.2, 1]];

		ctrlSetText[9030,format["%1 a été attaché au poteau anti-troll", name _unit]];
	}
	else
	{
		ctrlSetText[9030,"Impossible de s'attacher soi-même au poteau anti-troll"];
	};


};