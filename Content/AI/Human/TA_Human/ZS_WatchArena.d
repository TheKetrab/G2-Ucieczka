
// *************************************
// WatchArena
// *************************************

func void ZS_WatchArena()
{	
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_WatchArena_Loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_WATCHFIGHT");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	
	if ((Npc_GetStateTime(self) > 3)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		var int random;	random = Hlp_Random(10);
		
		if (random < 2)
		{
			AI_PlayAni	(self, "T_WATCHFIGHT_OHNO");
		}
		else if (random < 10)
		{
			AI_PlayAni	(self, "T_WATCHFIGHT_YEAH");
		};

		
		
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_WatchArena_End()
{
    AI_PlayAni (self,"T_LGUARD_2_STAND");
};	


