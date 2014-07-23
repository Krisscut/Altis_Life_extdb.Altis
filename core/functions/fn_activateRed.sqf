/*
	File: fn_RedCode.sqf
	Author: Bloopis
	Date : 05/11/2014
	
	Description:
	Draw for each client news message
	For new player (just connected) we must create a loop each 1 minutes who draw again message

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
private["_players","_val","_players2"];
_text = parseText"<t size='1.8'color='#FEFEFE'>Breaking news - Code rouge sur Kavala</t><br/><t color='#FFFF00'>Quittez la ville ou réfugiez-vous dans vos maisons. Toute menace sera abattue sans sommation.</t>";
_scroll = parseText"<t size='1.2'color='#FE2E2E'> - Une perquisition a été effectuée au domicile du leader de la secte des pingouins Redempteurs, la gendarmerie soupçonnait une activité échangiste illégale.</t><t size='1.2'color='#FE2E2E'> - Le douzième marriage du colonel HeadNoiz aura lieu dans la discothèque de Kavala ce samedi. N'oubliez pas vos couscous !</t><t size='1.2'color='#FE2E2E'> - Le gang rebelle LsD est soupsonné d'avoir organisé un traffic de proxénétisme avec de jeunes femmes venant de Stratis.</t><t size='1.2'color='#FE2E2E'> - La gendarmerie a récemment interpellé un exibitionniste pour escroquerie à la carte bancaire.</t><t size='1.2'color='#FE2E2E'> - Un certain Thierry Pastor a été emprisonné pour traffic d'organe génital en bande organisée.</t><t size='1.2'color='#FE2E2E'> - Un gendarme a été retrouvé ivre mort plus tôt dans la soirée. Il avait ""pris un DAB pour un urinoir"". </t>";
_lock = true;
life_stopRedCode = false;
_players = [];
_val = 0;

While { _lock } do {
	if(!life_stopRedCode) then {
		//first launch
		if(_val == 0) then {[[_text,_scroll],"life_fnc_msgDraw",true,false] spawn BIS_fnc_mp;_players = playableUnits;};
		
		//security -> no spam if 0 players in server
		if((count playableUnits == 0) && (_val != 0)) then {_lock = false;};
		
		//we check new players entities
		if((count playableUnits != 0) && (_val != 0)) then {_players2 = [];{if(alive _x) then {_players2 set[count _players2,_x]};}forEach playableUnits;_players = _players2 - _players;if(count _players > 0) then {{[[_text,_scroll],"life_fnc_msgDraw",_x,false] spawn BIS_fnc_mp;}forEach _players;};_players = _players2;};
	}
	else{
		_lock = false;
	};
	_val = _val + 1;
	sleep 30;//we wait 30 seconds to advertising new players who just connected (no spawn server)
};

/*private["_players","_val","_players2"];
_text = parseText"<t size='1.8'color='#FEFEFE'>Breaking news - Code rouge sur Kavala</t><br/><t color='#FFFF00'>Quittez la ville ou réfugiez-vous dans vos maisons. Toute menace sera abattue sans sommation.</t>";
_scroll = parseText"<t size='1.2'color='#FE2E2E'> - Une perquisition a été effectuée au domicile du leader de la secte des pingouins Redempteurs, la gendarmerie soupçonnait une activité échangiste illégale.</t><t size='1.2'color='#FE2E2E'> - Le douzième marriage du colonel HeadNoiz aura lieu dans la discothèque de Kavala ce samedi. N'oubliez pas vos couscous !</t><t size='1.2'color='#FE2E2E'> - Le gang rebelle LsD est soupsonné d'avoir organisé un traffic de proxénétisme avec de jeunes femmes venant de Stratis.</t><t size='1.2'color='#FE2E2E'> - La gendarmerie a récemment interpellé un exibitionniste pour escroquerie à la carte bancaire.</t><t size='1.2'color='#FE2E2E'> - Un certain Thierry Pastor a été emprisonné pour traffic d'organe génital en bande organisée.</t><t size='1.2'color='#FE2E2E'> - Un gendarme a été retrouvé ivre mort plus tôt dans la soirée. Il avait ""pris un DAB pour un urinoir"". </t>";
_lock = true;
player setVariable["stopRedCode",false,true];
_players = [];
_val = 0;

While { _lock } do {
	if(!(player getVariable["stopRedCode",false])) then {
		//first launch
		if(_val == 0) then {[[_text,_scroll],"life_fnc_msgDraw",true,false] spawn BIS_fnc_mp;_players = playableUnits;};
		
		//security -> no spam if 0 players in server
		if((count playableUnits == 0) && (_val != 0)) then {_lock = false;};
		
		//we check new players entities
		if((count playableUnits != 0) && (_val != 0)) then {_players2 = [];{if(alive _x) then {_players2 set[count _players2,_x]};}forEach playableUnits;_players = _players2 - _players;if(count _players > 0) then {{[[_text,_scroll],"life_fnc_msgDraw",_x,false] spawn BIS_fnc_mp;}forEach _players;};_players = _players2;};
	}
	else{
		_lock = false;
	};
	_val = _val + 1;
	sleep 30;//we wait 30 seconds to advertising new players who just connected (no spawn server)
};*/