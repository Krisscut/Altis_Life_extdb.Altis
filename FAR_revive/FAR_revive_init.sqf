//
// Farooq's Revive 1.5
//

//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//
/*
	MODIFICATIONS :
		- 04/22/2014 - SET ISTAZED VARIABLE AT 0 WHEN PLAYER IS KILLED - MODIFIED BY BLOOPIS
		- 04/26/2014 - SET ISUNCONSCIOUS VARIABLE AT 0 WHEN PLAYER IS KILLED - MODIFIED BY BLOOPIS

*/

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_BleedOut = 600;

// Enable teamkill notifications
FAR_EnableDeathMessages = true;

// If enabled, unconscious units will not be able to use ACRE radio, hear other people or use proximity chat
FAR_MuteACRE = false;

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
*/
FAR_ReviveMode = 2;

//------------------------------------------//

call compile preprocessFile "FAR_revive\FAR_revive_funcs.sqf";

#define SCRIPT_VERSION "1.5"

FAR_isDragging = false;
FAR_isDragging_EH = [];
FAR_deathMessage = [];
FAR_Debugging = true;

if (isDedicated) exitWith {};

////////////////////////////////////////////////
// Player Initialization
////////////////////////////////////////////////
[] spawn
{
    waitUntil { !isNull player };

	// Public event handlers
	"FAR_isDragging_EH" addPublicVariableEventHandler FAR_public_EH;
	"FAR_deathMessage" addPublicVariableEventHandler FAR_public_EH;

	[] spawn FAR_Player_Init;
	hintSilent format["Farooq's Revive %1 is initialized.", SCRIPT_VERSION];
};

FAR_Player_Init =
{
	// Cache player's side
	FAR_PlayerSide = side player;

	player setVariable ["FAR_isUnconscious", 0, true];
	player setVariable ["FAR_isStabilized", 0, true];
	player setVariable ["FAR_isDragged", 0, true];
	player setVariable ["ace_sys_wounds_uncon", false];
	player setCaptive false;

	FAR_isDragging = false;

	[] spawn FAR_Player_Actions;
};

// Drag & Carry animation fix
[] spawn
{
	while {true} do
	{
		if (animationState player == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || animationState player == "helper_switchtocarryrfl" || animationState player == "AcinPknlMstpSrasWrflDnon") then
		{
			if (FAR_isDragging) then
			{
				player switchMove "AcinPknlMstpSrasWrflDnon";
			}
			else
			{
				player switchMove "amovpknlmstpsraswrfldnon";
			};
		};

		sleep 3;
	}
};