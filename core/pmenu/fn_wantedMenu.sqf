#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred pour Involved-Gaming.Com	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_crimes","_listPlayers","_listCrimes"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Etablissement de la connexion..."];

if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{

	//restric vision for some buttons to low cops
	ctrlShow[2405,false];//unvisible pardon button
	ctrlShow[2406,false];//unvisible button manually add
	ctrlShow[2407,false];//unvisible player list manually add
	ctrlShow[2408,false];//unvisible crimes list manually add
	ctrlShow[2409,false];//unvisible text manually add
}
else{


	//------------------------------------------------------
	//section added 04/28/2014

	_listPlayers = _display displayCtrl 2407;
	_listCrimes = _display displayCtrl 2408;
	lbClear _listPlayers;
	lbClear _listCrimes;
	//we do the work only if the cops have enought coplevel (optimisation)
	//we init crimes combobox
	{
	    _listCrimes lbAdd (_x select 1);//we add crimes names
	    _listCrimes lbSetData [(lbSize _listCrimes)-1,(_x select 0)];//we add crimes values
	} forEach life_crimes;

	//we will find all players conencted (we exclude cops) and init suspect players combobox
	{
	   if ((side _x) != West) then
	   {
	      _listPlayers lbAdd (name _x);//we add players names
	      _listPlayers lbSetData [(lbSize _listPlayers)-1,str(_x)];//we add players entities
	   };
	} forEach playableUnits;
	//------------------------------------------------------
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;