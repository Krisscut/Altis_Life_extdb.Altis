cutText ["+ 200000 $", "PLAIN"];
life_liquide = life_liquide + 200000;
[[format["%1 s'est donné 200K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;