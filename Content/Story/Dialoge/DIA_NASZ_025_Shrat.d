var int ShratRediToTelepport;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_025_Shrat_EXIT   (C_INFO)
{
	npc         = NASZ_025_Shrat;
	nr          = 999;
	condition   = DIA_NASZ_025_Shrat_EXIT_Condition;
	information = DIA_NASZ_025_Shrat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_025_Shrat_EXIT_Condition()
{	
	return TRUE;
};

func void DeleteShrat()
{
	if(InfoManager_HasFinished())
	{
		B_StartOtherRoutine (NASZ_025_Shrat,"End");
		DeleteNpc(NASZ_025_Shrat);
		ff_remove(DeleteShrat);
	};
};

FUNC VOID DIA_NASZ_025_Shrat_EXIT_Info()
{
	if (ShratRediToTelepport == TRUE)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");

		AI_StopProcessInfos (self);
		ff_applyonceext(DeleteShrat,1000,-1);
		hero.aivar[AIV_INVINCIBLE] = 0;
	};
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_025_Shrat_Before   (C_INFO)
{
	npc         = NASZ_025_Shrat;
 	nr          = 1;
 	condition   = DIA_NASZ_025_Shrat_Before_Condition;
 	information = DIA_NASZ_025_Shrat_Before_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_025_Shrat_Before_Condition()
{
	if (!Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_025_Shrat_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_025_Shrat_Before_025_00"); //MMMM.
	
};

///////////////////////////////////////////////////////////////////////
//	Info Lojalnosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_025_Shrat_Lojalnosc		(C_INFO)
{
	npc		 	 = 	NASZ_025_Shrat;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_025_Shrat_Lojalnosc_Condition;
	information	 = 	DIA_NASZ_025_Shrat_Lojalnosc_Info;
	description	 =	"Shrat, to naprawdê ty?";
};

func int DIA_NASZ_025_Shrat_Lojalnosc_Condition ()
{
		if(Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
		{
			return TRUE;
		};
};
func void DIA_NASZ_025_Shrat_Lojalnosc_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_00"); //Shrat, to naprawdê ty? Myœla³em, ¿e opuœci³eœ swój dom na bagnach tu¿ po upadku bariery!
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_01"); //To imiê... Wydaje siê byæ znajome, lecz nic ju¿ dla mnie nie oznacza. Natomiast ty... Kim jesteœ? Œmiertelnik nie powinien by³ nigdy tutaj przychodziæ.
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_02"); //Wy naprawdê nic nie pamiêtacie... Przysy³a mnie Baal Orun. Chcê wam pomóc, ale abym móg³ poznaæ sposób, który mo¿e mnie do tego doprowadziæ, muszê zdobyæ wasze zaufanie.
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_03"); //Powiedz mi duchu, czy jest jakiœ sposób na ukojenie twojej duszy?
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_04"); //Chcesz nam pomóc... Nie czêsto spotyka siê œmiertelnika, który baczy na los innych. Nie, mi niczego nie potrzeba.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_05"); //Jednak chcê poprosiæ ciê o wyœwiadczenie przys³ugi mojemu przyjacielowi.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_06"); //Pewnego razu wyszed³ z obozu pozbieraæ zio³a przy okolicznej górze, gdzie napad³y i po¿ar³y go wilki. Jego nagie koœci le¿¹ w jaskini, a duch b³¹ka siê po okolicy nie mog¹c zaznaæ spokoju.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_07"); //Móg³byœ mu pomóc?
	
	Wld_InsertItem (ItNa_DuchSkull,"FP_ROAM_ZAPALISADA_LAS_70");
	
	
	B_LogEntry (TOPIC_Lojalnosc, "Porozmawia³em ze Shratem, duch nie poprosi³ mnie o nic dla siebie, a jedynie o wykonanie obrzêdu pochówku dla jego przyjaciela.");
	
	Log_CreateTopic (TOPIC_Shrat_przyjaciel, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_RUNNING);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Shrat martwi siê o spoczynek swojego przyjaciela. 'Pewnego razu wyszed³ z obozu pozbieraæ zio³a przy okolicznej górze.' Pozostaje mi znaleŸæ jego koœci i pomodliæ siê nad nimi do znanych mi bogów. Mo¿e to pomo¿e jego duszy zaznaæ spokoju.");	
	
	ff_applyonce(Duch);




};

func void Duch()
{
	//print("funkcja duch");

	if(Npc_HasItems(hero,ItNa_DuchSkull)>=1)
	{
		AI_Output(hero,hero,"DIA_Will_Duch_15_00");//Innosie, Adanosie i Beliarze... Jako pokorny œmiertelnik proszê was o wys³uchanie moich mod³ów.
		Duch_Modlitwa_Start = TRUE;
		Fade_Status = 1;
		ff_applyonce(Duch_Modlitwa);
		ff_remove(Duch);
	};

};


///////////////////////////////////////////////////////////////////////
//	Info Duch
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_025_Shrat_Duch		(C_INFO)
{
	npc		 	 = 	NASZ_025_Shrat;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_025_Shrat_Duch_Condition;
	information	 = 	DIA_NASZ_025_Shrat_Duch_Info;
	description	 =	"Jeœli chodzi o twojego przyjaciela...";
};

func int DIA_NASZ_025_Shrat_Duch_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_026_DuchNowicjusza_Lojalnosc))
	{
		return TRUE;
	};
};
func void DIA_NASZ_025_Shrat_Duch_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Duch_15_00"); //Twój przyjaciel zazna³ spokoju poœród innych zmar³ych.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Duch_025_01"); //Wyczu³em to w chwili, kiedy siê po¿egnaliœcie. Teraz ju¿ wiem, ¿e kieruj¹ tob¹ szlachetne pobudki.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Duch_025_02"); //Niech ciê œwiat³o prowadzi.
	
	ShratRediToTelepport = TRUE;
	B_LogEntry (TOPIC_Lojalnosc, "Po dostarczeniu do Shrata wiadomoœci o jego przyjacielu ten zamilk³ i odda³ siê zadumie. Myœlê, ¿e nie bêdê go d³u¿ej niepokoi³.");	


};
