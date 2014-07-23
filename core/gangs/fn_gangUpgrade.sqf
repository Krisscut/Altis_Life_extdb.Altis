#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * (__GETC__(life_gangUpgradeBase)) / (__GETC__(life_gangUpgradeMultipler)));

_action = [
	format["Vous êtes sur le point d'augmenter le nombre de places du gang.<br/><br/>Actuellement: %1<br/>Aprés augmentation: %2<br/>Prix: <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	"Augmenter le nombre de slots",
	"Acheter",
	"Annulé"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_dabliquide < _upgradePrice) exitWith {
		hint parseText format[
			"Vous n'avez pas assez d'argent dans votre compte en banque pour mettre à niveau les places du gangs.<br/><br/>Actuellement: <t color='#8cff9b'>$%1</t><br/>Manque: <t color='#FF0000'>$%2</t>",
			[life_dabliquide] call life_fnc_numberText,
			[_upgradePrice - life_dabliquide] call life_fnc_numberText
		];
	};
	__SUB__(life_dabliquide,_upgradePrice);
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format["Tu as augmenté de %1 a %2 le nombre de slots maximum pour <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[[2,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	hint "Augmentation annulé.";
};
