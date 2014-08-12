#include <macro.h>

if (__GETC__(life_adminlevel) != 0) then {
	//marker_mapesp = false;

	k = 0;
	for "k" from 0 to 2000 do
	{
		deleteMarkerLocal ("Player"+ (str k));
		deleteMarkerLocal ("Vehicle"+ (str k));
	};

	onEachFrame {
				nil
	};
};
[[format["%1 a désactivé l'ESP",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;