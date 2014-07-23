#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];

_action = [
	"Vous vous apprêtez à dissoudre le gang, en démantelant le gang, il sera supprimé de la base de données et le groupe sera supprimé.<br/><br/>Etes-vous sûr de vouloir dissoudre le groupe? Vous ne serez pas remboursé du prix de sa création.",
	"Dissoudre Gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint "Suppression du gang....";
	[[grpPlayer],"TON_fnc_removeGang",false,false] spawn life_fnc_MP;
} else {
	hint "Suppression annulé";
};