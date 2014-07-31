/*
	File: fn_gatherApples.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["apple",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (life_action_inUse) exitWith {titleText[format["Tu es dejà occupé à faire quelque chose"],"PLAIN"]; sleep 5; life_action_inUse = false; };
life_action_inUse = true;
if(_sum > 0) then
{
	life_action_inUse = true;
	titleText[format[(localize "STR_NOTF_Gathering"),localize "STR_Item_Apples"],"PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"apple",_sum] call life_fnc_handleInv)) then
	{
		titleText[format[(localize "STR_NOTF_Picked"),_sum,localize "STR_Item_Apples"],"PLAIN"];
		life_action_inUse = true;
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_inUse = false;