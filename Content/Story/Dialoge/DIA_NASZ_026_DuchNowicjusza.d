///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_026_DuchNowicjusza_EXIT   (C_INFO)
{
	npc         = NASZ_026_DuchNowicjusza;
	nr          = 999;
	condition   = DIA_NASZ_026_DuchNowicjusza_EXIT_Condition;
	information = DIA_NASZ_026_DuchNowicjusza_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_026_DuchNowicjusza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_026_DuchNowicjusza_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	AI_Teleport (self, "TOT"); 
	B_StartOtherRoutine (self,"End");

};

///////////////////////////////////////////////////////////////////////
//	Info Lojalnosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_026_DuchNowicjusza_Lojalnosc		(C_INFO)
{
	npc		 	 = 	NASZ_026_DuchNowicjusza;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Condition;
	information	 = 	DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Info;
	important	 = 	TRUE;
};

func int DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_025_Shrat_Lojalnosc))
	{
		return TRUE;
	};
};
func void DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Info ()
{
	
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_00"); //W koñcu widzê œwiat³o na koñcu mojej drogi... Czujê... Czujê, jak wszelakie troski i zmartwienia odchodz¹ w niepamiêæ.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_01"); //Jego blask sprawia, ¿e czujê siê lepiej. Dziêkujê ci nieznajomy za kilka minut jakie poœwiêci³eœ na modlitwê nad moim zapomnianym przez czas ciele.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_02"); //Chcia³bym ci podziêkowaæ za twoj¹ pomoc. Proszê weŸ ten pas i za³ó¿ go.
	
	
	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	Info_AddChoice		(DIA_NASZ_026_DuchNowicjusza_Lojalnosc, "Dziêkujê duchu za twój dar." ,DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie);
	Info_AddChoice		(DIA_NASZ_026_DuchNowicjusza_Lojalnosc, "Nie mogê tego przyj¹æ."	,DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa);

};

func void DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa()
{
	AI_Output			(other, self, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa_15_00"); //Nie mogê tego przyj¹æ. Ka¿demu z nas nale¿y siê spokojny, wiekuisty spoczynek.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa_026_01"); //W twoich s³owach wyczuwam olbrzymi¹ szczeroœæ, dlatego proszê ciê, weŸ ten pas i niech prowadzi ciê przez drogê jak¹ kroczysz.

	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Zaj¹³em siê pochówkiem zmar³ego. W nagrodê dosta³em dziwny pas.");
	B_GivePlayerXP(500);
	
	Createinvitems (self, ItNa_Pas_Smierci, 1); 
	B_giveinvitems (self, other, ItNa_Pas_Smierci, 1);	

};

func void DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie()
{
	AI_Output			(other, self, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie_15_00"); //Dziêkujê duchu za twój dar. ¯yczê ci, abyœ w koñcu zazna³ wymarzonego spokoju.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie_026_01"); //To ja dziêkujê, ¿egnaj nieznajomy!

	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Zaj¹³em siê pochówkiem zmar³ego. W nagrodê dosta³em dziwny pas.");
	B_GivePlayerXP(500);
	
	Createinvitems (self, ItNa_Pas_Smierci, 1); 
	B_giveinvitems (self, other, ItNa_Pas_Smierci, 1);

};
