cutText ["+ 800000 $", "PLAIN"];
life_liquide = life_liquide + 800000;
[[format["%1 s'est donné 800K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;