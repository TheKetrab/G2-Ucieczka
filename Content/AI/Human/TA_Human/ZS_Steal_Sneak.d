/*******************************************
*         		   Sneak		       	  *
*******************************************/

func void ZS_Steal_Sneak()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_Steal_Sneak");
	Perception_Set_Normal();

	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_SNEAK);	
	if !(C_BodyStateContains(self,BS_MOBINTERACT))
	{
			// Walkmode für den Zustand
		AI_GotoWP	(self, self.wp);
		
			
		//AI_AlignToWP		(self);  
		if(Npc_GetDistToPlayer			(self)<400)
		{
			AI_SetWalkmode (self,NPC_SNEAK);	
			AI_TurnToNpc(self,hero);
			AI_TurnAway(self,hero);
			AI_GotoWP	(self, self.wp);
			//AI_AlignToWP		(self); 
			//AI_StartState	(self, ZS_SitAround, 1, "");		
		}
		else
		{
			AI_SetWalkmode (self,NPC_SNEAK);
			AI_GotoFP (self, "FP_CHESTSTEAL");
			AI_AlignToFP( self );			
			AI_PlayAni(self,"T_CHESTSMALL_STAND_2_S0");			
		};
	};

};

func void ZS_Steal_Sneak_Loop ()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_Steal_Sneak_Loop");
        
	AI_Wait(self,1);
};

func void ZS_Steal_Sneak_End ()
{
			AI_PlayAni(self,"T_CHESTSMALL_S0_2_STAND");			
	
	//PrintDebugNpc (PD_TA_FRAME,"ZS_Steal_Sneak_End");
};

