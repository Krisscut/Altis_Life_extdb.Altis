[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food =
	{
		if(life_hunger < 2) then {player setDamage 1; hint "Tu es mort de faim";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "Tu es mort de faim";};
		switch(life_hunger) do {
			case 30: {hint "Tu n'as rien mangé depuis un bon bout de temps !";};
			case 20: {hint "Tu as des troubles, tu vas mourrir dans quelques minutes.";};
			case 10: {hint "C'est la catastrophe ! Tu arrives plus a marcher droit, mort dans les secondes a venir";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Tu es mort de déshydratation.";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Tu es mort de déshydratation.";};
			switch(life_thirst) do
			{
				case 30: {hint"Tu n'as rien bue depuis un bon bout de temps !.";};
				case 20: {hint "Tu n'arrives plus a courrir car tu as pas bue depuis un moment"; player setFatigue 1;};
				case 10: {hint "Tu n'arrives pas a marcher droit !! Boie maintenant ou tu v'as mourrir"; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);

	if(_bp == 'B_FieldPack_ocamo') then {
			_load = 20;
		};
	if(_bp == 'B_AssaultPack_blk') then {
            _load = 30;
        };
	if(_bp == 'B_AssaultPack_cbr') then {
            _load = 30;
        };
	if(_bp == 'B_AssaultPack_khk') then {
            _load = 30;
        };
	if(_bp == 'B_AssaultPack_sgg') then {
            _load = 30;
        };
	if(_bp == 'B_AssaultPack_rgr') then {
            _load = 30;
        };
	if(_bp == 'B_AssaultPack_Kerry') then {
            _load = 30;
        };
	if(_bp == 'B_FieldPack_cbr') then {
            _load = 40;
        };
	if(_bp == 'B_FieldPack_blk') then {
            _load = 40;
        };
    if(_bp == 'B_Kitbag_rgr') then {
            _load = 40;
        };
	if(_bp == 'B_Kitbag_mcamo') then {
            _load = 40;
        };

	if(_bp == 'B_Kitbag_sgg') then {
            _load = 55;
        };
	if(_bp == 'B_Kitbag_cbr') then {
            _load = 55;
        };
	if(_bp == 'B_Bergen_sgg') then {
            _load = 55;
        };

	if(_bp == 'B_Carryall_oucamo') then {
            _load = 70;
        };

		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};


[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint "Ton inventaire est remplis. Tu ne peux plus courrir tant que ton sac est remplis!";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};
//part of alcohol system written by [midgetgrimm]
[] spawn
{
	while {true} do
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {

			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			sleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			sleep 180;
			life_drink = life_drink - 0.02;
			};
		};

		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;

	};
};
[] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};