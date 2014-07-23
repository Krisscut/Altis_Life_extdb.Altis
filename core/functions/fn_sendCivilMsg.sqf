/*
	File: fn_sendCivilMsgsqf
	Author: Bloopis
	Date : 07/11/2014

	Description:
	add message in list

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
if(life_dabliquide < life_msg_cost) exitWith {hint format["Tu ne dispose pas de %1€ en banque, tu ne peux donc pas souscrire à l'assurance !", life_msg_cost]};
if(getPlayerUID player in life_msg_Owner) exitWith {hint format["Une seule annonce par personne est autorisée !"]};
if(life_msg_pub == "") ExitWith {};
life_dabliquide = life_dabliquide - life_msg_cost;
//hint format["%1       ||||       %2",life_msg_Owner,life_msg_Civil];
life_msg_Owner set[count life_msg_Owner,(getPlayerUID player)];
life_msg_Civil set[count life_msg_Civil,life_msg_pub];
publicVariableServer "life_msg_Civil";
publicVariableServer "life_msg_Owner";
sleep 2;//little sleep
[[],"TON_fnc_actualiseVariablesMsg",false,false] spawn life_fnc_MP;
life_msg_cost = 0;
life_msg_pub = "";
hint format["Ton annonce a bien été postée !"];