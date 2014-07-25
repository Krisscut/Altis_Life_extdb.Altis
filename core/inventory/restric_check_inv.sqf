/*
File: restric_check_inv.sqf
Author: Bloopis
Date : 04/27/2014
Traduction : Skydred pour Involved-Gaming.Com
Description:
Blocks the opening of the inventory of other players or locked vehicles.
The cop are not concerned.
Rebels can open bags only if the target is :
	- UNCOUSCIOUS
	- RESTRAINED
	- SURRENDED
	- INCAPACITED

Parameter(s) :
	NULL

Returns:
	NULL
*/
waituntil {alive player};
if (side player == west) exitWith {};

/*fnc_RestricNullTarget = {
		//here we check the target to avoid glitches
		//if _val equals 00000, it's a null selection on items container display
		//else it's a item so we restrict !

		if((isNull cursortarget) && ((lbText [(_this select 0), (_this select 1)]) != "00000")) then {
			//glitch time !
			((findDisplay 602) displayCtrl 632) ctrlRemoveEventHandler ["LBDrag",0];
			((findDisplay 602) displayCtrl 640) ctrlRemoveEventHandler ["LBDrag",0];
			((findDisplay 602) displayCtrl 632) ctrlRemoveAllEventHandlers "LBDrag";
			((findDisplay 602) displayCtrl 640) ctrlRemoveAllEventHandlers "LBDrag";
			(FindDisplay 602) closeDisplay 1;
			titleText["\n\n\n\n Voler c'est mal ! Systeme Anti-Vol !", "PLAIN",0];
		};

		//we have a target but it is the original target ?
		//glitch who based on change target before check inventory to avoid most of verification !
		//with this there is 98 % chances to block glitchers (but if the fake target is under the test so it's work ..)
		//this condition is made for grounds item (if we only block with _val player can never loot grounds items ..)
		//that why we can't restrict distance less than 1.2 meters (player must be very near of the target)
		if((player distance cursortarget > 1.2) && ((lbText [(_this select 0), (_this select 1)]) != "00000")) then {
			((findDisplay 602) displayCtrl 632) ctrlRemoveEventHandler ["LBDrag",0];
			((findDisplay 602) displayCtrl 640) ctrlRemoveEventHandler ["LBDrag",0];
			((findDisplay 602) displayCtrl 632) ctrlRemoveAllEventHandlers "LBDrag";
			((findDisplay 602) displayCtrl 640) ctrlRemoveAllEventHandlers "LBDrag";
			(FindDisplay 602) closeDisplay 1;
			titleText["\n\n\n\n Voler c'est mal ! Systeme Anti-Vol !", "PLAIN",0];
		};
		false;
};*/
while {alive player} do
{
	WaitUntil {!isnull (findDisplay 602)};

	life_inv_allowed = false;
	_alreadyBlock =  false;

	if ((cursortarget iskindof "man") && (isplayer cursortarget)) then {
		//if the player is not a rebel, or if the target is not unconscious, stunned, restrained, surrended; the player can't check inventory of target
		if((license_civ_rebel)&& (player distance cursortarget < 4) && (((cursortarget getVariable "FAR_isUnconscious") == 1) || ((cursortarget getVariable "isknocked")) || ((cursortarget getVariable "restrained")) || ((cursortarget getVariable "playerSurrender")))) then {
			life_inv_allowed = true;
		};
		if(!(life_inv_allowed)) exitWith {(FindDisplay 602) closeDisplay 1; titleText["\n\n\n\n Tu ne peux pas voler dans un sac d'un autre joueur! Système antivol ! ", "PLAIN",0];_alreadyBlock = true;};
	};

	//now we must check if the player is allowed or not previously. if he is, the player will not execute those obsolete conditions

	//restrict inventory on vehicles
	if(!(life_inv_allowed) && !(_alreadyBlock)) then {
		if (((cursortarget iskindof "Air") || (cursortarget iskindof "Car") || (cursortarget iskindof "Ship"))) then {
			if ((locked cursortarget) == 2 || (player distance cursortarget > 10)) exitwith {(FindDisplay 602) closeDisplay 1; titleText["\n\n\n Tu ne peux pas ouvrir cet inventaire le véhicule est verrouillé/trop loin !", "PLAIN",0];_alreadyBlock = true;};
			life_inv_allowed = true;
		};
	};

		//restrict check inventory on NPC
	if(!(life_inv_allowed) && !(_alreadyBlock)) then {
		if (cursortarget iskindof "man" && (player distance cursortarget < 4)) exitWith{(FindDisplay 602) closeDisplay 1;	titleText["\n\n\n\n Impossible de fouiller dans le sac d'un PNJ !", "PLAIN",0];_alreadyBlock = true;};
	};


	//we delete all event on controls (Memory leak counter-measure)
	/*((findDisplay 602) displayCtrl 632) ctrlRemoveAllEventHandlers "LBDrag";
	((findDisplay 602) displayCtrl 640) ctrlRemoveAllEventHandlers "LBDrag";

	if(!(_alreadyBlock) && !(life_inv_allowed)) then {
		//if those two variables is at false then we implement events for more glitch counter-measure
		//but if not the player is already authorized/blocked, then those events are not necessary

		//we analyse ground items container
		//désactiver temporairement 16/05
		((findDisplay 602) displayCtrl 632) ctrlAddEventHandler ["LBDrag", "_this call fnc_RestricNullTarget"];

		//we analyse vehicules/box items container
		((findDisplay 602) displayCtrl 640) ctrlAddEventHandler ["LBDrag", "_this call fnc_RestricNullTarget"];
	};*/
	WaitUntil {isnull (findDisplay 602)};
};
waituntil {alive player};
[] execVM "core\inventory\restric_check_inv.sqf";