cutText ["Admin God Mod OFF", "PLAIN"];
player setDamage 0;
player allowDamage true;
detach sphereAdmin;
deleteVehicle sphereAdmin;
player removeEventHandler ["Fired", 0];