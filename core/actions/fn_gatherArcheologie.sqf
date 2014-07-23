//	Traduction : Skydred pour Involved-Gaming.com	
private["_sum"];
_sum = ["archeologie",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Prise d'echantillons en cours...","PLAIN"];
	sleep 2;
	if(([true,"archeologie",_sum] call life_fnc_handleInv)) then
	{
		
		titleText[format["Tu as ramassé un échantillon archéologique"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};
life_action_in_use = false;