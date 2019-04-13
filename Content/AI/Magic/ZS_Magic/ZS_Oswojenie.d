// **************
// ZS_Oswojenie
// **************
var int StanOswojenie;
func int ZS_Oswojenie()
{

};


func int ZS_Oswojenie_Loop ()
{	
	if 	(StanOswojenie < 1)
	{
		B_SetAttitude (self, ATT_FRIENDLY); 
		self.guild = GIL_FRIENDLY_ORC;
		Npc_SetTrueGuild (self, GIL_FRIENDLY_ORC);
 
		StanOswojenie = 1;
	}
	else if (StanOswojenie == 1) 
	{
		Npc_ClearAIQueue(self);	
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

		if (OswajaszDlaWrzoda == TRUE)
		{
			if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER)
			{
				AI_StartState (self, ZS_MM_Rtn_Follow_Monster_You, 1, "");
				PrintScreen ("Zabra³eœ ze sob¹ œcierwojada.", -1, 45, FONT_ScreenSmall, 5);
				WrzodQuestZabralesScierwojada = 1;
			};

			if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON)
			{
				AI_StartState (self, ZS_MM_Rtn_Follow_Monster_You, 1, "");
				PrintScreen ("Zabra³eœ ze sob¹ œcierwojada.", -1, 45, FONT_ScreenSmall, 5);
				WrzodQuestZabralesScierwojada = 2;
			};	
		
			if (self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
			{
				AI_StartState (self, ZS_MM_Rtn_Follow_Monster_You, 1, "");
				PrintScreen ("Zabra³eœ ze sob¹ kretoszczura.", -1, 45, FONT_ScreenSmall, 5);
				WrzodQuestZabralesKretoszczura = 1;
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
			{
				AI_StartState (self, ZS_MM_Rtn_Follow_Monster_You, 1, "");
				PrintScreen ("Zabra³eœ ze sob¹ krwiopijcê.", -1, 45, FONT_ScreenSmall, 5);
				WrzodQuestZabralesKrwiopijce = 1;
			};
		
		}
		
		else
		{
			AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		
		};
		
		
		
		
		return				LOOP_END;	 
	};

	AI_Wait					(self,	0.38);		// 5 Sekunden gesamte Schrumpfzeit geteilt durch 13 Stadien

	return					LOOP_CONTINUE;
};

func void ZS_Oswojenie_End()
{
	StanOswojenie = 0;
	//PrintScreen ("koniec petli", -1, 50, FONT_ScreenSmall, 2);
};






// ********************************************
// ZS_MM_Rtn_Follow_Monster_You
// ********************************************

func void ZS_MM_Rtn_Follow_Monster_You()
{
	Npc_SetPercTime	(self,	1);
	
	Npc_PercEnable	(self, 	PERC_ASSESSPLAYER		,	B_MM_AssessPlayer);
};

func int ZS_MM_Rtn_Follow_Monster_You_Loop ()
{
	if 	(Npc_GetDistToWP(hero, "NASZ_ZAPALISADA_TARTAK_10") > 500)
	{
		if (Npc_GetDistToNpc (self, hero) > 500)
		{
			if	!C_BodyStateContains(self, BS_SWIM)
			{	
				AI_SetWalkmode	(self,	NPC_RUN);
			};
			//PrintScreen ("idzie za toba!", -1, 40, FONT_ScreenSmall, 2);
			AI_GotoNpc (self, hero);
		}
		else
		{
			AI_TurnToNpc (self, hero);
			self.WP = Npc_GetNearestWP (self); 
		};
	}
	else
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "NASZ_ZAPALISADA_TARTAK_10");
		self.WP = "NASZ_ZAPALISADA_TARTAK_10"; 
		AI_GotoWP		(self, self.wp);
		PrintScreen ("Doprowadzi³eœ potwora.", -1, 40, FONT_ScreenSmall, 2);
		
		if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) || (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON)
		{
			QuestWrzodDoprowadzilesScierwojada = TRUE;
			B_LogEntry (TOPIC_Wrzod_zwierzeta, "Doprowadzi³em œcierwojada.");
			B_GivePlayerXP(500);
		};

		if (self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
		{
			QuestWrzodDoprowadzilesKretoszczura = TRUE;
			B_LogEntry (TOPIC_Wrzod_zwierzeta, "Doprowadzi³em kretoszczura.");
			B_GivePlayerXP(500);
		};
		
		if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			QuestWrzodDoprowadzilesKrwiopijce = TRUE;
			B_LogEntry (TOPIC_Wrzod_zwierzeta, "Doprowadzi³em krwiopijcê.");
			B_GivePlayerXP(500);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Follow_Monster_You_End ()
{

};
