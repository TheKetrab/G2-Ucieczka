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
	//oCNpc_UseItem(self, ItLsTorch);
};

func int ZS_Stand_Torch_loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		oCNpc_UseItem(self, ItLsTorch);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	
	if ((Npc_GetStateTime(self) > 5)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		var int random;	random = Hlp_Random(10);
		
		if (random == 0)
		{
			//AI_PlayAni (self,"T_LGUARD_SCRATCH");
		}
		else if (random == 1)
		{
			//AI_PlayAni (self,"T_LGUARD_STRETCH");
		}
		else if (random == 2)
		{
			//AI_PlayAni (self,"T_LGUARD_CHANGELEG");
		};
		
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Torch_end()
{
    AI_PlayAni (self,"T_LGUARD_2_STAND");
};	


