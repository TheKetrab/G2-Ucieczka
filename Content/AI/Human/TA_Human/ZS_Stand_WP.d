// *************************************
// NSC steht mit verschränkten Armen rum
// *************************************


func void ZS_Stand_WP()
{	
	if(self.id != 410)
	{
		Perception_Set_Normal();
	}
	else
	{
		self.senses			=	SENSE_HEAR | SENSE_SEE;

		self.senses_range	=	PERC_DIST_ACTIVE_MAX;
		Npc_SetPercTime		(self, 0.3);

		Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_MM_AssessEnemy);

		Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic);
		
		Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_MM_AssessDamage); 
		Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE	, 	B_MM_AssessOthersDamage);
		Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE	, 	B_MM_AssessOthersDamage); 
		Npc_PercEnable		(self, PERC_ASSESSMURDER		, 	B_MM_AssessOthersDamage);

		Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk ); 
	};
	
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_WP_loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(self.guild < 16)
		{
			AI_PlayAni (self,"T_STAND_2_LGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	if(self.guild < 16)
	{
		if ((Npc_GetStateTime(self) > 5)
		&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			var int random;	random = Hlp_Random(10);
			
			if (random == 0)
			{
				AI_PlayAni (self,"T_LGUARD_SCRATCH");
			}
			else if (random == 1)
			{
				AI_PlayAni (self,"T_LGUARD_STRETCH");
			}
			else if (random == 2)
			{
				AI_PlayAni (self,"T_LGUARD_CHANGELEG");
			};
			
			Npc_SetStateTime (self, 0);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_end()
{
    if(self.guild < 16)
	{
		AI_PlayAni (self,"T_LGUARD_2_STAND");
	};
};	


