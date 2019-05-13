// *********************
// Miecz_Sing
// *********************

var int MieczSingVerse;

func void ZS_Miecz_Sing()
{	
	Perception_Set_Normal();
	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); //sonst werden OUs abgebrochen - Grund: unbekannt 

	B_ResetAll (self);
	
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	
	MieczSingVerse = 0;
};

func int ZS_Miecz_Sing_loop()
{


	if (Npc_GetStateTime(self) >= 10)
	&& (hero.aivar[AIV_INVINCIBLE] == FALSE) //quatscht so nicht mehr rein
	{
		AI_PlayAni (self,"T_HGUARD_2_STAND");
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
		B_Miecz_Sing(MieczSingVerse);
		MieczSingVerse += 1;
		if (MieczSingVerse >= 6) { MieczSingVerse = 0; };
		
		
		
		var int random; random = Hlp_Random(10);
  
		// TODO ma przepijać TYLKO jesli sie mu juz przyniesie cos do picia
		// TODO ITEMINTERRACT jest zly... miecz nie uzywa PIWA a powinien :/
		if (random == 0)
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_3",BS_ITEMINTERACT); //Flasche ansehen 
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
  		}
  		else if (random == 1) 
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
   			AI_PlayAniBS (self,"T_POTION_RANDOM_2",BS_ITEMINTERACT); //Mund abwischen
  		}
  		else
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
  		};  

		
		
		
		Npc_SetStateTime(self, 0);
	};
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Miecz_Sing_end()
{
	MieczSingVerse = 0;
};	
