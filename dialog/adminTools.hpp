class life_admin_tools_main {
	idd = 4000;
	name= "life_admin_tools_main";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.546;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4001;
			text = "Admin Menu - Accueil";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class Teleport : Life_RscButtonMenu 
		{
			idc = 4002;
			text = "Moderation";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_TPmenu';";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class Remboursement : Teleport
		{
			idc = 4003;
			text = "Remboursement";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_remboursements';";
			y = -0.22;
		};

		class GodMods : Teleport
		{
			idc = 4004;
			text = "God mods";
			onButtonClick = "closeDialog 0;  createDialog 'life_admin_tools_godMenu';";
			y = -0.16;
		};

		class LifeMenu : Teleport
		{
			idc = 4005;
			text = "Altis Menu";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_altisMenu';";
			y = -0.1;
		};

		class Vehicules : Teleport
		{
			idc = 4006;
			text = "Spawn Véhicules";
			onButtonClick = "hint 'Not implemented yet'";
			y = -0.04;
		};

		class Armes : Teleport
		{
			idc = 4007;
			text = "Spawn Armes";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.02;
		};

		class Equipements : Teleport
		{
			idc = 4008;
			text = "Spawn Equipements";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.08;
		};

		class Events : Teleport
		{
			idc = 4009;
			text = "Events";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.14;
		};

		class Construction : Teleport
		{
			idc = 4010;
			text = "Construction";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.20;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.25;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
class life_admin_tools_TPmenu {
	idd = 4100;
	name= "life_admin_tools_TPmenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.38;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4101;
			text = "Admin Menu - Moderation Menu";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class TPmap : Life_RscButtonMenu 
		{
			idc = 4102;
			text = "Téléportation Map";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_teleport";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class InterfaceSurveillance : TPmap
		{
			idc = 4103;
			text = "Moderation Joueur";
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_advancedMenu'; ";
			y = -0.22;
		};

		class GoIntoVehicule : TPmap
		{
			idc = 4106;
			text = "Monter véhicule";
			onButtonClick = "player moveInAny cursorTarget;";
			y = -0.16;
		};

		class ESPon : TPmap
		{
			idc = 4107;
			text = "ESP On";
			onButtonClick = "player execVM 'admintools\tools\ESP.sqf';";
			y = -0.10;
		};

		class ESPoff : TPmap
		{
			idc = 4108;
			text = "ESP Off";
			onButtonClick = "player execVM 'admintools\tools\ESPoff.sqf';";
			y = -0.04;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.02;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
class life_admin_tools_remboursements {
	idd = 4200;
	name= "life_admin_tools_remboursements";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.38;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4201;
			text = "Admin Menu - remboursements";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class resetLiquide : Life_RscButtonMenu 
		{
			idc = 4202;
			text = "Reset Liquide";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\tools\moneyReset.sqf';";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class give200k : resetLiquide
		{
			idc = 4203;
			text = "Donner 200k";
			onButtonClick = "player execVM 'admintools\tools\money200.sqf';";
			y = -0.22;
		};

		class give400k : resetLiquide
		{
			idc = 4204;
			text = "Donner 400k";
			onButtonClick = "player execVM 'admintools\tools\money400.sqf';";
			y = -0.16;
		};

		class give800k : resetLiquide
		{
			idc = 4205;
			text = "Donner 800k";
			onButtonClick = "player execVM 'admintools\tools\money800.sqf';";
			y = -0.1;
		};

		class atmOn : resetLiquide
		{
			idc = 4206;
			text = "ATM ON";
			onButtonClick = "player execVM 'admintools\life\ATMadminON.sqf';";
			y = -0.04;
		};

		class atmOff : resetLiquide
		{
			idc = 4207;
			text = "ATM OFF";
			onButtonClick = "player execVM 'admintools\life\ATMadminOFF.sqf';";
			y = 0.02;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.08;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_altisMenu {
	idd = 4200;
	name= "life_admin_tools_AltisMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.44;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4201;
			text = "Admin Menu - Altis Menu";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class TrollMenu : Life_RscButtonMenu 
		{
			idc = 4202;
			text = "Troll Menu";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog 'life_admin_tools_trollMenu';";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class MettreEnFourriere : TrollMenu
		{
			idc = 4203;
			text = "Mettre en fourriere";
			onButtonClick = "player execVM 'admintools\life\impoundAction.sqf';";
			y = -0.22;
		};

		class PlacerVendeurPerso : TrollMenu
		{
			idc = 4204;
			text = "Placer Vendeur Perso";
			onButtonClick = "player execVM 'admintools\life\spawnMarket.sqf';";
			y = -0.16;
		};

		class ResetMarche : TrollMenu
		{
			idc = 4205;
			text = "Reset marche";
			onButtonClick = "player execVM 'admintools\life\resetmarche.sqf';";
			y = -0.1;
		};

		class Revive : TrollMenu
		{
			idc = 4206;
			text = "Réanimer Cible";
			onButtonClick = "player execVM 'admintools\life\Revive.sqf';";
			y = -0.04;
		};

		class LockUnlock : TrollMenu
		{
			idc = 4207;
			text = "Lock/Unlock";
			onButtonClick = "player execVM 'admintools\life\Unlock.sqf';";
			y = 0.02;
		};

		class objetsInventaire : TrollMenu
		{
			idc = 4207;
			text = "Life Objets Menu";
			onButtonClick = "hint 'Not implemented yet'";
			y = 0.08;
		};


		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.14;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

//###############################################
class life_admin_tools_godMenu {
	idd = 4300;
	name= "life_admin_tools_godMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.726;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4301;
			text = "Admin Menu - God modes";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class GodModOn : Life_RscButtonMenu 
		{
			idc = 4302;
			text = "God mod ON";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\tools\AdminON.sqf';";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class GodModOff : GodModOn
		{
			idc = 4303;
			text = "God Mod OFF";
			onButtonClick = "player execVM 'admintools\tools\AdminOFF.sqf';";
			y = -0.22;
		};

		class CarGodModOn : GodModOn
		{
			idc = 4304;
			text = "Car God mod ON";
			onButtonClick = "player execVM 'admintools\tools\cargodON.sqf';";
			y = -0.16;
		};

		class CarGodModOff : GodModOn
		{
			idc = 4305;
			text = "Car god mod OFF";
			onButtonClick = "player execVM 'admintools\tools\cargodOFF.sqf';";
			y = -0.1;
		};

		class InvisibleOn : GodModOn
		{
			idc = 4306;
			text = "Invisible ON";
			onButtonClick = "player execVM 'admintools\tools\Invisible.sqf';";
			y = -0.04;
		};

		class InvisibleOff : GodModOn
		{
			idc = 4307;
			text = "Invisible OFF";
			onButtonClick = "player execVM 'admintools\tools\InvisibleOFF.sqf';";
			y = 0.02;
		};

		class PousseMousse : GodModOn
		{
			idc = 4308;
			text = "Pousse mousse";
			onButtonClick = "player execVM 'admintools\tools\pushIT.sqf';";
			y = 0.08;
		};

		class SupprimerCible : GodModOn
		{
			idc = 4309;
			text = "Supprimer Cible";
			onButtonClick = "player execVM 'admintools\tools\DeleteIT.sqf';";
			y = 0.14;
		};

		class DestroyTarget : GodModOn
		{
			idc = 4310;
			text = "Detruire Cible";
			onButtonClick = "player execVM 'admintools\tools\DestroyIT.sqf';";
			y = 0.20;
		};

		class HealTarget : GodModOn
		{
			idc = 4311;
			text = "Reparer Cible";
			onButtonClick = "player execVM 'admintools\tools\RepairIT.sqf';";
			y = 0.26;
		};

		class ReviveSelf : GodModOn
		{
			idc = 4312;
			text = "Se réanimer";
			onButtonClick = "player execVM 'admintools\tools\Rez.sqf';";
			y = 0.32;
		};

		class Superman : GodModOn
		{
			idc = 4313;
			text = "Superman";
			onButtonClick = "player execVM 'admintools\tools\Superman.sqf';";
			y = 0.38;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.43;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};




//###############################################
class life_admin_tools_trollMenu {
	idd = 4400;
	name= "life_admin_tools_trollMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.38;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4401;
			text = "Admin Menu - Troll Menu";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class TPTrollAttach : Life_RscButtonMenu 
		{
			idc = 4402;
			text = "Attacher troll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "player execVM 'admintools\troll\AntiTrollon.sqf;";
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class DetachTarget : TPTrollAttach
		{
			idc = 4403;
			text = "Détacher Troll";
			onButtonClick = "player execVM 'admintools\troll\AntiTrolloff.sqf';";
			y = -0.22;
		};

		class RestrainTarget : TPTrollAttach
		{
			idc = 4404;
			text = "Arreter Cible";
			onButtonClick = "player execVM 'admintools\troll\Menotter.sqf';";
			y = -0.16;
		};

		class UnrestrainTarget : TPTrollAttach
		{
			idc = 4405;
			text = "Demenotter Cible";
			onButtonClick = "player execVM 'admintools\troll\Demenotter.sqf';";
			y = -0.1;
		};

		class SendToJail : TPTrollAttach
		{
			idc = 4406;
			text = "Envoyer en prison";
			onButtonClick = "player execVM 'admintools\troll\prison.sqf';";
			y = -0.04;
		};

		class UnrestrainSelf : TPTrollAttach
		{
			idc = 4407;
			text = "Se Démenotter";
			onButtonClick = "player execVM 'admintools\troll\SeDemenotter.sqf';";
			y = 0.02;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.08;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


//###############################################
class life_admin_tools_vehiculeMenu {
	idd = 4500;
	name= "life_admin_tools_vehiculeMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 0.3;
			h = 0.31;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4501;
			text = "Admin Menu - Spawn Véhicule";
			x = -0.3;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class VehicleType : Life_RscText
		{
			idc = -1;
			text = "Type du vehicule";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = -0.2625;
			y = -0.28;
			w = (9 / 40);
			h = (1 / 25);
		};

		class VehicleTypeCombo : Life_RscCombo 
		{
			idc = 4502;
		
			x = -0.2625;
			y = -0.22;
			w = (9 / 40); h = (1 / 25);
		};

		class VehicleName : Life_RscText
		{
			idc = -1;
			text = "Choix Véhicule";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = -0.2625;
			y = -0.16;
			w = (9 / 40);
			h = (1 / 25);
		};

		class VehiclenameCombo : Life_RscCombo 
		{
			idc = 4503;
		
			x = -0.2625;
			y = -0.10;
			w = (9 / 40); h = (1 / 25);
		};

		class SpawnButton : Life_RscButtonMenu 
		{
			idc = 4504;
			text = "Spawner !";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = -0.2625;
			y = -0.04;
			w = (9 / 40);
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_am_fnc_closeMenu; closeDialog 0;";
			x = -0.3;
			y = 0.02;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};




//###############################################
//##############MEGAMENU################
//###############################################
class life_admin_tools_advancedMenu {
	idd = 9000;
	name= "life_admin_tools_advancedMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_loading;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.3;
			y = -0.34;
			w = 1.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.3;
			y = -0.34 + (11 / 250);
			w = 1.3;
			h = 0.9;
		};

		class MapView : Life_RscMapControl 
		{
			idc = 9001;
			x = 0.59; y = 0.19;
			w = 0.4;
			h = 0.4;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 9002;
			text = "Menu de Modération Avancé";
			x = -0.3;
			y = -0.34;
			w = 1.3;
			h = (1 / 25);
		};

		class TitleInfo : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 9030;
			text = "Interface Information";
			x = 0.41;
			y = -0.34;
			w = 0.8;
			h = (1 / 25);
		};

		class ListeJoueurs : Life_RscText
		{
			idc = 9003;
			text = "Liste des Joueurs";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = -0.27;
			y = -0.28;
			w = 0.35;
			h = (1 / 25);
		};

		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 9004;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_queryPlayerInfo";
			
			x = -0.29; y = -0.22;
			w = 0.39; h = 0.7;
		};

		class InfoJoueur : Life_RscText
		{
			idc = 9005;
			text = "Info Joueur Selectionné";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.15;
			y = -0.28;
			w = 0.35;
			h = (1 / 25);
		};

		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 9006;
			text = "";
			x = 0.12;
			y = -0.22;
			w = 0.41;
			h = 0.6;
		};


		class TitreAutrepseudos : Life_RscText
		{
			idc = 9007;
			text = "Autres pseudos";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.15;
			y = 0.42;
			w = 0.35;
			h = (1 / 25);
		};

		class Aliases : PlayerBInfo
		{
			idc = 9008;
			text = "Not Implemented yet";
			x = 0.12;
			y = 0.48;
			h = 0.2;
		};

		class TitreModeration : Life_RscText
		{
			idc = 9009;
			text = "Actions modérations";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.61; y = -0.28;
			w = 0.35;
			h = (1 / 25);
		};

		class Spectateur : Life_RscButtonMenu 
		{
			idc = 9010;
			text = "Observer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_spectator;";
			x = 0.61; y = -0.22;
			w = 0.17;
			h = 0.04;
			class Attributes
			{
				align = "center";
			};
		};

		class TptoTarget : Spectateur 
		{
			idc = 9011;
			text = "TP vers lui";
			
			onButtonClick = "[] spawn life_fnc_tpToTarget;";
			y = -0.16;
		};

		class TargetToMe : Spectateur 
		{
			idc = 9012;
			text = "TP à moi";
			
			onButtonClick = "[] spawn life_fnc_targetToMe;";
			y = -0.10;
		};

		class Deplacer : Spectateur 
		{
			idc = 9050;
			text = "Deplacer Cible";
			
			onButtonClick = "hint 'Not implemented yet'";
			y = -0.04;
		};

		class KillTarget : Spectateur 
		{
			idc = 9013;
			text = "Tuer Cible";
			
			onButtonClick = "[] spawn life_fnc_killTarget;";
			y = 0.02;
		};

		class Reanimer : Spectateur 
		{
			idc = 9051;
			text = "Reanimer";
			
			onButtonClick = "hint 'Not implemented yet';";
			y = 0.02;
		};

		class Soigner : Spectateur 
		{
			idc = 9052;
			text = "Soigner";
			
			onButtonClick = "hint 'Not implemented yet';";
			y = 0.02;
		};


		class Menotter : Spectateur 
		{
			idc = 9014;
			text = "Menotter";
			
			onButtonClick = "[] spawn life_fnc_restrainTarget;";
			x = 0.79;
			y = -0.22;
		};

		class Demenotter : Spectateur 
		{
			idc = 9053;
			text = "Demenotter";
			
			onButtonClick = "hint 'Not implemented yet';";
			x = 0.79;
			y = -0.16;
		};

		class GetInTargetVehicle : Menotter 
		{
			idc = 9015;
			text = "TP véhicule";
			
			onButtonClick = "[] spawn life_fnc_getInTargetVehicle";
			y = -0.10;
		};


		class EjectFromVehicle : Menotter 
		{
			idc = 9054;
			text = "TP véhicule";
			
			onButtonClick = "hint 'Not implemented yet';";
			y = -0.04;
		};


		class PutIntoJail : Menotter 
		{
			idc = 9016;
			text = "Prison Troll";
			
			onButtonClick = "[] spawn life_fnc_putIntoJail";
			y = 0.02;
		};

		class ExtractFromJail : Menotter 
		{
			idc = 9055;
			text = "Sortir de prison";
			
			onButtonClick = "hint 'Not implemented yet';";
			y = 0.02;
		};


		class Troll : Menotter 
		{
			idc = 9017;
			text = "PoteauTroll";
			
			onButtonClick = "[] spawn life_fnc_troll";
			y = 0.06;
		};


		class Refresh : Life_RscButtonMenu 
		{
			idc = 9018;
			text = "Rafraichir";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_refresh";
			x = -0.25;
			y = 0.50;
			w = 0.28;
			h = (1 / 25);
			class Attributes
			{
				align = "center";
			};
		};
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "[] spawn life_fnc_closeMenu; closeDialog 0;";
			x = -0.25;
			y = 0.55;
			w = 0.28;
			h = (1 / 25);

			class Attributes
			{
				align = "center";
			};
		};
	};
};