/////////////////////////////////////////////////////////
// Revive Player
// Traduction : Skydred pour Involved-Gaming.com
// OPTIMISATION VIA UN SWITCH TRUE PAR SKY LE 02/05/2014
////////////////////////////////////////////////////////
//FAR_HandleRevive =
_curTarget = cursorTarget;

closeDialog 0;
private ["_target"];
//if(!(license_civ_ambulance)) exitWith {hint "Tu ne disposes pas de la licence de sauveteur, tu ne sais donc pas comment te servir de cet appareil";};
if(life_action_inUse) exitWith {hint "Tu es déjà en train d'effectuer une action, tu dois attendre que celle ci finisse avant d'en entamer une autre";};
_target = cursorTarget;
switch (true) do
{
	case ((vehicle player) != player) :
	{
		hint "Impossible d'effectuer cette action depuis le véhicule.";
	};

	case ((player getVariable "restrained") || (player getVariable "civrestrained")) :
	{
		hint "Impossible d'effectuer cette action en étant menotté.";
	};

	/*case ((_target getVariable "restrained") || (_target getVariable "civrestrained")) :
	{
		hint "Impossible d'effectuer cette action car la personne est menottée.";
	};*/
	case (!alive player || FAR_isDragging) :
	{
		hint "Impossible d'effectuer cette action dans cet état.";
	};
	case (isNil "_target" || !alive _target) :
	{
		hint "Impossible d'effectuer cette action sur ce type d'unité.";
	};
	case ((_target getVariable "FAR_isUnconscious" == 0) || !isPlayer _target || ((_target distance player) > 2 )) :
	{
		hint "Impossible d'effectuer cette action sur cette unité.";
	};
	case (alive _target && (animationState cursorTarget == "AinjPpneMstpSnonWrflDnon_rolltoback" || animationState cursorTarget == "AinjPpneMstpSnonWrflDnon")) :
	{
		life_action_inUse = true;
		[[_curTarget],"life_fnc_defibrillateur_son",nil,true] spawn life_fnc_MP;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		_target setVariable ["FAR_isUnconscious", 0, true];
		_target setVariable ["FAR_isDragged", 0, true];


		sleep 6;
		/*
		if(([false,"defibrilateur_son",1] call life_fnc_handleInv)) then
		{
			titleText["Tu as utilisé le défibrilateur avec succés.","PLAIN"];
		};
		*/
		titleText["Tu as utilisé le défibrillateur avec succès, tu obtiens une récompense.","PLAIN"];
		// [Debugging] Code below is only relevant if revive script is enabled for AI
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setDamage 0;
			_target setCaptive false;

			_target playMove "amovppnemstpsraswrfldnon";
		};
		life_dabliquide = life_dabliquide + 30000;
		life_action_inUse = false;
	};
};