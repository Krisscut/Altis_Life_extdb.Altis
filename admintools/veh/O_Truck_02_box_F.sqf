_spawn = "O_Truck_02_box_F";
_posplr = [((getPos player) select 0) - 3, ((getPos player) select 1) + 3, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);