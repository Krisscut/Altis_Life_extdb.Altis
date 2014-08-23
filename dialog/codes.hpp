class codeRed
{
	idd=-1;
	movingEnable = 1;
  	fadein =0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout =0;
	name= "codeRed";

	class controlsBackground 
	{
		
		class codeRedIcon : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\redcode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  
};

class codeFrini
{
	idd=-1;
	movingEnable = 1;
  	fadein =0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout =0;
	name= "codeFrini";

	class controlsBackground 
	{
		
		class codeFriniIcon : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\frinicode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  
};


class trollCode
{
	idd=-1;
	movingEnable = 1;
  	fadein =0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout =0;
	name= "trollCode";

	class controlsBackground 
	{
		
		class trollCodeIcon : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\blackcode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  
};

class siraCode
{
	idd=-1;
	movingEnable = 1;
  	fadein =0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout =0;
	name= "siraCode";

	class controlsBackground 
	{
		
		class siraCodeIcon : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\siracode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  
};

class whiteCode
{
	idd=-1;
	movingEnable = 1;
  	fadein =0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout =0;
	name= "whiteCode";

	class controlsBackground 
	{
		
		class siraCodeIcon : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\whitecode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  

};
class breakingNews
{
	idd=-1;
	movingEnable = 1;
  	fadein =1;
	duration = 16;
  	fadeout =1;
	name= "breakingNews";

	class controlsBackground 
	{
		
		class movie : Life_RscPictureKeepAspect
		{
		
			idc = -1;
			text = "textures\breakingNews.ogv";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.5; h = 0.4;
		    autoplay = 1;
		    loops = 1;

		};
	};  
};
