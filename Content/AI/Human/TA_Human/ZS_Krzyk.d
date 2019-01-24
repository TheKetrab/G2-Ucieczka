
func void ZS_Krzyk()
{	
	Perception_Set_Normal();
	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); //sonst werden OUs abgebrochen - Grund: unbekannt 
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	
};

var int RandomKrzyk;
func int ZS_Krzyk_loop()
{
	if (Npc_GetStateTime(self) >= 13)
	{
		RandomKrzyk = Hlp_Random (10);
		if (RandomKrzyk <= 2) { Snd_Play ("SVM_2_DEAD"); }
		else if (RandomKrzyk <= 4) { Snd_Play ("HAR_DIE"); }
		else if (RandomKrzyk <= 6) { Snd_Play ("ZOM_DIE"); }
		else if (RandomKrzyk <= 8) { Snd_Play ("ZOM_DIE_A1"); }
		else { Snd_Play ("ZOM_DIE_A2"); };
		
		//if (self.aivar[AIV_TAPOSITION] > 20)
		//{
		//	self.aivar[AIV_TAPOSITION] = 0;
		//};
	
		//B_Krzyk(self.aivar[AIV_TAPOSITION]);
		
		//self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;		
		
		Npc_SetStateTime(self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Krzyk_end()
{

};	


//**** WrzodFinal

func void ZS_WrzodFinal()
{	
	Perception_Set_Normal();
	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); //sonst werden OUs abgebrochen - Grund: unbekannt 
	
	B_ResetAll (self);

	AI_SetWalkmode 		(self, NPC_RUN);
	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");	
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	
};


func int ZS_WrzodFinal_loop()
{
	var int RandomWrzodFinal;
	RandomWrzodFinal = Hlp_Random (12);

	if (Npc_GetStateTime(self) >= 5)
	{

		if (RandomWrzodFinal <= 2) { Snd_Play ("SCA_WARN01"); }
		else if (RandomWrzodFinal <= 4) { Snd_Play ("SCA_DIE01"); }
		else if (RandomWrzodFinal <= 6) { Snd_Play ("SCA_DIE02"); }
		else if (RandomWrzodFinal <= 8) { Snd_Play ("MOL_WARN03"); }
		else if (RandomWrzodFinal <= 10) { Snd_Play ("MOL_DIE01"); }
		else { Snd_Play ("BLO_DIE02"); };
			
		
		Npc_SetStateTime(self, 0);
	};
	
	var int danceStyleWrzodFinal;
	danceStyleWrzodFinal = Hlp_Random(9);

	if ( danceStyleWrzodFinal == 0 )
	{
		AI_PlayAni(self, "T_DANCE_01");
	};
	if ( danceStyleWrzodFinal == 1 )
	{
		AI_PlayAni(self, "T_DANCE_02");
	};
	if ( danceStyleWrzodFinal == 2 )
	{
		AI_PlayAni(self, "T_DANCE_03");
	};
	if ( danceStyleWrzodFinal == 3 )
	{
		AI_PlayAni(self, "T_DANCE_04");
	};
	if ( danceStyleWrzodFinal == 4 )
	{
		AI_PlayAni(self, "T_DANCE_05");
	};
	if ( danceStyleWrzodFinal == 5 )
	{
		AI_PlayAni(self, "T_DANCE_06");
	};
	if ( danceStyleWrzodFinal == 6 )
	{
		AI_PlayAni(self, "T_DANCE_07");
	};
	if ( danceStyleWrzodFinal == 7 )
	{
		AI_PlayAni(self, "T_DANCE_08");
	};
	if ( danceStyleWrzodFinal == 8 )
	{
		AI_PlayAni(self, "T_DANCE_09");
	};
	
	
	return LOOP_CONTINUE;
};

func void ZS_WrzodFinal_end()
{

};	

