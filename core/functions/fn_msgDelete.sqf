/*
	File: fn_msgDelete.sqf
	Author: Bloopis
	Date : 05/11/2014
	
	Description:
	Draw for each client news message

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
life_stopRedCode = true;
life_redCode = false;
life_drawingMessage = false;
/*player setVariable["redCode",false,true];
player setVariable["stopRedCode",true,true];
player setVariable["drawingMessage",false,true];*/
(uinamespace getvariable "BIS_AAN") closedisplay 1;