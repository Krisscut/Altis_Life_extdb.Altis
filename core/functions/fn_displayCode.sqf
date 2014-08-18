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
    case 0: { 3 cutText ["", "PLAIN"]; };	//Delete
    case 1: { 3 cutRsc ["codeRed","PLAIN"]; };
    case 2: { 3 cutRsc ["codeFrini","PLAIN"]; }
};