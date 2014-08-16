/*
	File: fn_spectator.sqf
	Author: S.lambert

	Description:
	Spectator of the player
*/

private["_unit","_mycv"];

if (!isNil {player getVariable ["am_unitTargeted",false]}) then
{
	_unit = player getVariable ["am_unitTargeted",false];
	_mycv = cameraView;
	F3_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3D) then {spectate = false;};"];
	(vehicle _unit) switchCamera "EXTERNAL";
	spectate = true;
	titleText ["Observation... Appuyer sur F3 pour quitter","PLAIN DOWN"];
	titleFadeOut 10;
	waitUntil { !(alive _unit) or !(alive player) or !(spectate)};
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F3_EH];
	player switchCamera _mycv;

	spectate = false;
	if (!spectate) then
	{
		titleText ["Retour au joueur...","PLAIN DOWN"];
		titleFadeOut 4;
	};
};