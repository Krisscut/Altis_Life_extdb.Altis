private ["_params", "_action"];

// Parameters passed by the action
_params = _this select 3;
_action = _params select 0;

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
if (_action == "action_revive") then
{
	if (playersNumber independent > 2) exitWith {hint "Il y as plus de 3 ambulancier tu ne peut pas faire cette action"};
	[cursorTarget] spawn FAR_HandleRevive;
};

if (_action == "action_stabilize") then
{
	[cursorTarget] spawn FAR_HandleStabilize;
};

if (_action == "action_suicide") then
{
	//license_civ_gun = false;
	//license_civ_rebel = false;
	life_is_arrested = false;
	_handle = [] spawn SOCK_fnc_updateRequest;//paf sauvegarde dans ta face
	player setDamage 1;
};

if (_action == "action_drag") then
{
	[cursorTarget] spawn FAR_Drag;
};

if (_action == "action_release") then
{
	[] spawn FAR_Release;
};
if (_action == "action_achever") then
{
	if (playersNumber independent > 2) exitWith {hint "Il y as plus de 3 ambulancier tu ne peut pas faire cette action"};
	[cursorTarget] spawn FAR_Kill;
	[[[cursorTarget], "sortiprison.sqf"],"BIS_fnc_execVM",cursorTarget,true] spawn life_fnc_MP;

};