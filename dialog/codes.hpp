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
			text = "textures\redCode.paa";
			x = safeZoneX+safeZoneW-0.4; y = safeZoneY + 0.2;
			w = 0.4; h = 0.80;
			moving = 1;
			colorText[] = {1, 1, 1, 0.5};
		};
		
	};  
};