createDialog "Life_RadioMenu";
MenuOk=false;
for "_i" from 0 to (count PRadioAmbu) do {lbAdd [7776,(PRadioAmbu select _i)]};
	waitUntil {MenuOk};
_playerN = (lbCurSel 7776);
_name = (PRadioAmbu select _playerN) select 0;
_player = (PRadioAmbu select _playerN) select 1;
3 radioChannelRemove [_player];
PRadioAmbu = PRadioAmbu - [_name,_player];publicVariable "PRadioAmbu";