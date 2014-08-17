/*
	File: fn_admininfo.sqf  and content from  fn_admininfo.sqf && spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine && S.Lambert

	Description:
	Output information received to admin menu. && MAJ map position && MAJ Unit targeted
*/
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp","_map"];
_ret = _this;
disableSerialization;
_display = findDisplay 9000;
_text = _display displayCtrl 9006;
_unit = _ret select 3;
_prim = if(primaryWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "DisplayName")} else {"None"};
_sec = if(handgunWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "DisplayName")} else {"None"};
_vest = if(vest _unit != "") then { getText(configFile >> "CfgWeapons" >> (vest _unit) >> "DisplayName")} else {"None"};
_uni = if(uniform _unit != "") then { getText(configFile >> "CfgWeapons" >> (uniform _unit) >> "DisplayName")} else {"None"};
_bp = if(backpack _unit != "") then { getText(configFile >> "CfgWeapons" >> (backpack _unit) >> "DisplayName")} else {"None"};

_attach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_attach set[count _attach,_tmp];
		};
	} foreach (primaryWeaponItems _unit);
};

if(count _attach == 0) then {_attach = "None"};
_text ctrlSetStructuredText parseText format["Pseudo: %1<br/>Banque: %2<br/>Argent: %3<br/>Uniforme: %4<br/>Veste: %5<br/>Sac: %6<br/>Principal: %7<br/>Secondaire: %8<br/><t align='center'>Accessoires primaires</t><br/>%9",
_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText, _uni,_vest,_bp,_prim,_sec,_attach];


/* Launch Localisation of the player  */

_map = _display displayCtrl 9001;
[_map,1,0.1,getPos _unit] call life_fnc_setMapPosition;

/* MAJ local var to _unit */
player setVariable ["am_unitTargeted",_unit,false];

/* Launch auto-update */
[] spawn life_fnc_mapRefresh;