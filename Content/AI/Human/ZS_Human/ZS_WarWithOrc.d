// **************
// ZS_WarWithOrc
// **************

func int ZS_WarWithOrc()
{
	B_ClearPerceptions (self);
	self.flags = 2;
	AI_PlayAni			(self,	"T_PERCEPTION");
	AI_PlayAniBS		(self,	"T_STAND_2_SLEEP", BS_LIE);
			
					// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Temp_Att (upset) "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));

	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
	
		
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};

	AI_PlayAniBS (self,	"T_STAND_2_VICTIM_SLE", BS_LIE );
	self.aivar[AIV_WAR_WITH_ORC] = true;
};


func int ZS_WarWithOrc_Loop ()
{	
	if(!self.aivar[AIV_WAR_WITH_ORC])
	{
		return LOOP_END;
	};
	
	return	LOOP_CONTINUE;
};

func void ZS_WarWithOrc_End()
{
	self.flags = 0;
	Perception_Set_Normal ();
	Npc_ClearAIQueue	(self);
	AI_PlayAni			(self, "T_VICTIM_SLE_2_STAND");
};

