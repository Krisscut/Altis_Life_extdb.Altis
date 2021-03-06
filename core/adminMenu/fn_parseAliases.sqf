/*
	File: fn_parseAliases.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	//example of input : [12,["S.Lambert","Protecteur"]]

	Description:
	Output information received to admin menu.
*/


private["_display","_text","_idJoueur","_aliases","_displayAliasesList","_textID"];
_idJoueur = _this select 0;
_aliases = _this select 1;			//array

diag_log format["%1 - %2",_idJoueur , _aliases];

disableSerialization;
_display = findDisplay 9000;
_textID = _display displayCtrl 9162;
_textID ctrlSetStructuredText parseText format["<a color='#FFFFFF' href='http://ts.involved-gaming.com/admin/player_detail.php?uid=%1'>Tools link : ID %1</a>",_idJoueur];

/*
_displayAliasesList = "";
if(count (_aliases) > 1) then {
{
	for "_i" from 0 to (count _aliases)-1 do
	{
		_displayAliasesList = _displayAliasesList + " - " ( _aliases select _i);
	};
}
else
{
	_displayAliasesList = "Pas d'alias detecté";
};

*/

_text = _display displayCtrl 9170;
_text ctrlSetStructuredText parseText format["%1",_aliases];

