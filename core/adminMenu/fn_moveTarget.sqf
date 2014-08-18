/*
	File: fn_moveTarget.sqf
	Author: S.lambert

	Description:
	Move the target to the designated position
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable "am_unitTargeted";

	cutText ["Cliquez quelque part sur la carte ou la minicarte pour deplacer la cible", "PLAIN"];

	moveTarget={
		_pos = [_this select 0, _this select 1, _this select 2];
		_unit = _this select 3;
		if (vehicle _unit != _unit) then
		{

			(vehicle _unit) setpos [_pos select 0, _pos select 1, 0];
		}
		else
		{
			_unit setpos [_pos select 0, _pos select 1, 0];
		};
		onMapSingleClick "";
			ctrlSetText[9030,format["Joueur %1 envoyé aux coordonénes %2/%3/%4", name _unit,_pos select 0,_pos select 1,_pos select 2]];
		openMap[false,false];
	};

	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2, _unit] call moveTarget";
	openMap[true,false];
};