// *************************************
// NSC steht mit verschränkten Armen rum
// *************************************

func void ZS_Stand_Torch()
{	
	Perception_Set_Normal();
	
	B_ResetAll (self);

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Torch_loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		oCNpc_UseItem(self, ItLsTorch);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Torch_end()
{
    AI_PlayAni (self,"T_LGUARD_2_STAND");
};


