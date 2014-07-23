/*
	File: fn_sendCommercialMsg.sqf
	Author: Bloopis
	Date : 07/11/2014

	Description:
	put message in list of display

	Parameter(s) :
		N/A

	Returns :
		N/A
*/
if((ctrlText 70003) == "") ExitWith {};
_size = count (toArray (ctrlText 70003));
life_msg_cost = _size * 1000;
life_msg_pub = (ctrlText 70003);

createDialog "life_msg_confirm";
disableSerialization;
waitUntil {!isnull (findDisplay 70100)};
_display = findDisplay 70100;
_control = _display displayCtrl 70111;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>Vous souhaitez envoyer une annonce pour votre société en payant %1€, vous confirmez ?<br /><br />Attention, l'annonce n'est valide que jusqu'au prochain reboot.",life_msg_cost];
waitUntil {isnull (findDisplay 70100)};