/*
	File: fn_parseAliases.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text","_idJoueur","_aliases","_displayAliasesList"];
disableSerialization;
_ret = _this select 0;

_idJoueur = _ret select 0;
_aliases = _ret select 1;

_displayAliasesList = "";

if(count (_aliases) > 0) then {
{
	for "_i" from 0 to (count _aliases)-1 do
	{
		_displayAliasesList = _displayAliasesList + " - " ( _aliases select _i);
	};
};

_display = findDisplay 9000;
_text = _display displayCtrl 9162;

_text ctrlSetStructuredText parseText format["%1",_displayAliasesList];