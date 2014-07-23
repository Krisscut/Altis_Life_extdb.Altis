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