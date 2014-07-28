_veh = "";
if (vehicle player == player) Then {_veh = cursorTarget} else {_veh = vehicle player};
if (isnil {_veh} or _veh == "") exitWith {};
	if (locked _veh > 1) Then {
		_veh lock false;
		_veh lockCargo false;
		_veh lockTurret false;
	} else {_veh lock true};
