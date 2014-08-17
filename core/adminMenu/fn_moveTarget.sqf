/*
	File: fn_moveTarget.sqf
	Author: S.lambert

	Description:
	Move the target to the designated position
*/

private["_unit"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];

	cutText ["Cliquez quelque part sur la carte ou la minicarte pour deplacer la cible", "PLAIN"];

	moveTarget={

		_pos = [_this select 0, _this select 1, _this select 2];
		(vehicle _unit) setpos [_pos select 0, _pos select 1, 0];
		onMapSingleClick "";
			ctrlSetText[9030,format["Joueur %1 envoyé aux coordonénes %2/%3/%4", name _unit,_pos select 0,_pos select 1,_pos select 2]];
	};

	onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call moveTarget";
};