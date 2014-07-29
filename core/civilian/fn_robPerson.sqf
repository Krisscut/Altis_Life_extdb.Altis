/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred pour Involved-Gaming.com
	Description:
	Getting tired of adding descriptions...
*/
private["_robber","_robprice"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_liquide > 1) then
{
	_robprice = round(0.5 * life_liquide);
	[[_robprice],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,format["%1 a dérobé %3€ à %2",name _robber,name player,[_robprice] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	life_liquide = life_liquide - _robprice;
}
	else
{
	[[2,format["Pas de chance... %1 n'a pas un radis.",name player]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};
