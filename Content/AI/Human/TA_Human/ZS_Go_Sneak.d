// *************************************
// NSC steht mit verschränkten Armen rum
// *************************************

func void ZS_Go_Sneak_Erak()
{	
	Perception_Set_Normal();
	
	B_ResetAll (self);

		if (npc_isdead (Orc_Erak_A)
		&& npc_isdead (Orc_Erak_B)
		&& npc_isdead (Orc_Erak_C)
		&& npc_isdead (Orc_Erak_D)
		&& npc_isdead (Orc_Erak_E))
	{
		AI_SetWalkmode 	(self, NPC_WALK);		
	}

	else {
		AI_SetWalkmode 	(self, NPC_SNEAK);		
	};
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Go_Sneak_Erak_loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

	return LOOP_CONTINUE;
};

func void ZS_Go_Sneak_Erak_end()
{
    AI_PlayAni (self,"T_LGUARD_2_STAND");
};	

