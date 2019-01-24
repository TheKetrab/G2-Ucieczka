/*******************************************
*         		   Chest		       	  *
*******************************************/

func void ZS_Chest()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_Chest");
	Perception_Set_Normal();

	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);	
	if !(C_BodyStateContains(self,BS_MOBINTERACT))
	{
			// Walkmode f�r den Zustand
		AI_GotoWP	(self, self.wp);
		
			
		//AI_AlignToWP		(self);  
		if(Npc_GetDistToPlayer			(self)<400)
		{
			AI_SetWalkmode (self,NPC_WALK);	
			AI_TurnToNpc(self,hero);
			AI_TurnAway(self,hero);
			AI_GotoWP	(self, self.wp);
			//AI_AlignToWP		(self); 
			//AI_StartState	(self, ZS_SitAround, 1, "");		
		}
		else
		{
			AI_SetWalkmode (self,NPC_WALK);
			AI_GotoFP (self, "FP_CHESTSTEAL");
			AI_AlignToFP( self );			
			AI_PlayAni(self,"T_CHESTSMALL_STAND_2_S0");			
		};
	};

};

func void ZS_Chest_Loop ()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_Chest_Loop");
        
	AI_Wait(self,1);
};

func void ZS_Chest_End ()
{
			AI_PlayAni(self,"T_CHESTSMALL_S0_2_STAND");			
	
	//PrintDebugNpc (PD_TA_FRAME,"ZS_Chest_End");
};

