/*
	@version: 1.0
	@file_name: fn_displayCode.sqf
	@file_author: S.Lambert
	@file_edit: 18/08/2014
	@file_description: Display code to all clients


	Return:

*/

private["_code"];

_code = _this select 0;

switch (_code) do {
    case 0:	//Delete		---> whitecode
    {
    	3 cutText ["", "PLAIN"];
    	playSound "CodeAlerte";
    	3 cutRsc ["whiteCode","PLAIN"];
    	sleep 20;
     	3 cutText ["", "PLAIN"];
    };
    case 1:	//CodeRed
    {
    	3 cutRsc ["codeRed","PLAIN"];
    	playSound "CodeAlerte";
    };
    case 2:	//CodeFrini
    {
    	3 cutRsc ["codeFrini","PLAIN"];
    	playSound "CodeAlerte";
    };
    case 3: //Troll code
    {
    	3 cutRsc ["trollCode","PLAIN"];
    	playSound "CodeAlerte";
    };
    case 4:	//Siracode
    {
    	3 cutRsc ["siraCode","PLAIN"];
    	playSound "CodeAlerte";
    };
};