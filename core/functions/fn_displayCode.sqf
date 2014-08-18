/*
	@version: 1.0
	@file_name: fn_fetchCfgDetails.sqf
	@file_author: S.Lambert
	@file_edit: 18/08/2014
	@file_description: Display code


	Return:

*/

private["_code"];

_code = _this select 0;

switch (_code) do {
    case 0:	//Delete
    {
     	3 cutText ["", "PLAIN"];
     	playSound "bankalarm";
    };
    case 1:	//CodeRed
    {
    	3 cutRsc ["codeRed","PLAIN"];
    	playSound "bankalarm";
    };
    case 2:	//CodeFrini
    {
    	3 cutRsc ["codeFrini","PLAIN"];
    	playSound "bankalarm";
    };
};