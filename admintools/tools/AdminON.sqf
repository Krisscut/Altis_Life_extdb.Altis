cutText ["Admin God Mod ON", "PLAIN"];
player setDamage 0;
player allowDamage false;
//player addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }];

//deleteVehicle sphereAdmin; je sais pas a quoi ca sert mais c'etait la, mais bon, ca bug, et comme ca bug
sphereAdmin = "Sign_Sphere10cm_F" createVehicle (getPos player);
sphereAdmin attachto [player, [0,-0.08,0.5],"head"];

sphereAdmin setObjectTextureGlobal [0,"#(argb,1,8,3)color(0,0,1,0.5)"];

waitUntil { not alive player };
deleteVehicle sphereAdmin;