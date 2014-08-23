/*
	File: fn_parseID.sqf
	Author: S.Lambert from Bryan "Tonic" Boardwine original files

	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text"];
disableSerialization;
_ret = _this select 0;
_display = findDisplay 9000;
_text = _display displayCtrl 9008;

_text ctrlSetStructuredText parseText format["<a color='#FFFFFF' href='http://ts.involved-gaming.com/admin/player_detail.php?uid=%1'>Tools ID: %1</a>",_ret];