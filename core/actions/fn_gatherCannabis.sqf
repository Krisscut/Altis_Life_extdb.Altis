/*
	File: fn_gatherCannabis.sqf

	Description:
	Gathers cannabis?
*/
private["_sum"];
_sum = ["cannabis",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
player removeAction LIFE_Action_Cannabis;

if(_sum > 0) then
{
	life_action_inUse = true;
	player removeAction LIFE_Action_Cannabis;
	TitleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Cannabis"],"PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"cannabis",1] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Cannabis"],"PLAIN"];
		player addAction LIFE_Action_Cannabis;
	};
};

life_action_inUse = false;

/*
		if(_sum > 0) then
{
		_upp = format["Recolte du Cannabis"];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				player removeAction LIFE_Action_Cannabis;
				life_action_inUse = true;
			};
			sleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {life_action_inUse = false;};
			if(!alive player) exitWith {life_action_inUse = false;};
			if(player != vehicle player) exitWith {life_action_inUse = false;};
			if(life_interrupted) exitWith {life_action_inUse = false;};
		};
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Action terminée","PLAIN"]; life_action_inUse = false;};
		if(([true,"cannabis",1] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Cannabis"],"PLAIN"];
	};
};
life_action_inUse = false;
*/