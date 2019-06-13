//#######################################################
//		ZS_Orc_Dance
//#######################################################
func void ZS_Orc_Dance()
{
	Perception_Set_Normal();
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance" );
	
	//	Zum angegebenen Wegpunkt gehen
	AI_SetWalkmode( self, NPC_WALK );
	if ( !Npc_IsOnFP( self, "NASZ_LOWCY_KARCZMA_06" ) )
	{
		self.wp = "NASZ_LOWCY_KARCZMA_06";
		AI_GotoFP(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	Npc_PercEnable		(self, PERC_ASSESSDAMAGE		,	B_MM_AssessDamage);
	Npc_PercEnable	(self, 	PERC_ASSESSTALK			,	B_AssessTalk);
	
	/*Npc_PercEnable( self, PERC_OBSERVEINTRUDER,		B_OrcSlave_Quicklook		);	
	Npc_PercEnable( self, PERC_DRAWWEAPON,			B_OrcSlave_Quicklook		);
	Npc_PercEnable( self, PERC_ASSESSSURPRISE,		B_OrcSlave_Quicklook		);*/
};

func void ZS_Orc_Dance_Loop()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_Orc_Dance_Loop" );
	
	AI_GotoFP		(self, "DANCE");

	if ( Hlp_Random( 10 ) < 5 )
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE" );
		AI_PlayAni( self, "T_DANCE" );
	}
	else
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE_RANDOM_1" );
		AI_PlayAni( self, "T_DANCE_RANDOM_1" );
	};

};

func void ZS_Orc_Dance_End()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_Orc_Dance_End" );
	Npc_ClearAIQueue( self );
	AI_StandUp( self );
};