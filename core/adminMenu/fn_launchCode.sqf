/*
	File: fn_launchCode.sqf
	Author: Bloopis modified by S.Lambert

	Description:
	Lancement Code Rouge
*/

private["_players","_val","_players2"];

_code = _this select 0;
_lock = true;
life_stopRedCode = false;
_players = [];
_val = 0;

While { _lock } do {
	if(!life_stopRedCode) then {
		//first launch
		if(_val == 0) then {[[_code],"life_fnc_displayCode",true,false] spawn BIS_fnc_mp;_players = playableUnits;};

		//security -> no spam if 0 players in server
		if((count playableUnits == 0) && (_val != 0)) then {_lock = false;};

		//we check new players entities
		if((count playableUnits != 0) && (_val != 0)) then
		{
			_players2 = [];
			{
				if(alive _x) then {
					_players2 set[count _players2,_x]
				};
			}forEach playableUnits;

			_players = _players2 - _players;

			if(count _players > 0) then
			{
				{[[_code],"life_fnc_displayCode",_x,false] spawn BIS_fnc_mp;
				}forEach _players;
			};
			_players = _players2;
		};
	}
	else{
		_lock = false;
	};
	_val = _val + 1;
	sleep 30;//we wait 30 seconds to advertising new players who just connected (no spawn server)
};