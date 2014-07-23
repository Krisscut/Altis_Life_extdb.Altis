enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];
call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";
life_versionInfo = "Altis Life RPG v3.1.3.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "monitor\info.sqf";
[] execVM "anti-hack.sqf";

[] execVM "core\inventory\init.sqf";

StartProgress = true;