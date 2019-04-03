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
	
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_00"); //W ko�cu widz� �wiat�o na ko�cu mojej drogi... Czuj�... Czuj�, jak wszelakie troski i zmartwienia odchodz� w niepami��.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_01"); //Jego blask sprawia, �e czuj� si� lepiej. Dzi�kuj� ci nieznajomy za kilka minut jakie po�wi�ci�e� na modlitw� nad moim zapomnianym przez czas ciele.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_026_02"); //Chcia�bym ci podzi�kowa� za twoj� pomoc. Prosz� we� ten pas i za�� go.
	
	
	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	Info_AddChoice		(DIA_NASZ_026_DuchNowicjusza_Lojalnosc, "Dzi�kuj� duchu za tw�j dar." ,DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie);
	Info_AddChoice		(DIA_NASZ_026_DuchNowicjusza_Lojalnosc, "Nie mog� tego przyj��."	,DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa);

};

func void DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa()
{
	AI_Output			(other, self, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa_15_00"); //Nie mog� tego przyj��. Ka�demu z nas nale�y si� spokojny, wiekuisty spoczynek.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Odmowa_026_01"); //W twoich s�owach wyczuwam olbrzymi� szczero��, dlatego prosz� ci�, we� ten pas i niech prowadzi ci� przez drog� jak� kroczysz.

	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Zaj��em si� poch�wkiem zmar�ego. W nagrod� dosta�em dziwny pas.");
	B_GivePlayerXP(500);
	
	Createinvitems (self, ItNa_Pas_Smierci, 1); 
	B_giveinvitems (self, other, ItNa_Pas_Smierci, 1);	

};

func void DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie()
{
	AI_Output			(other, self, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie_15_00"); //Dzi�kuj� duchu za tw�j dar. �ycz� ci, aby� w ko�cu zazna� wymarzonego spokoju.
	AI_Output			(self, other, "DIA_NASZ_026_DuchNowicjusza_Lojalnosc_Przyjecie_026_01"); //To ja dzi�kuj�, �egnaj nieznajomy!

	Info_ClearChoices	(DIA_NASZ_026_DuchNowicjusza_Lojalnosc);
	
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Zaj��em si� poch�wkiem zmar�ego. W nagrod� dosta�em dziwny pas.");
	B_GivePlayerXP(500);
	
	Createinvitems (self, ItNa_Pas_Smierci, 1); 
	B_giveinvitems (self, other, ItNa_Pas_Smierci, 1);

};
