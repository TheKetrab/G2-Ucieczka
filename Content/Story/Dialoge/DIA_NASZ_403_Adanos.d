//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_EXIT   (C_INFO)
{
	npc         = NASZ_403_Adanos;
	nr          = 999;
	condition   = DIA_NASZ_403_Adanos_EXIT_Condition;
	information = DIA_NASZ_403_Adanos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_403_Adanos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_403_Adanos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_siema   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 1;
 	condition   = DIA_NASZ_403_Adanos_siema_Condition;
 	information = DIA_NASZ_403_Adanos_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_403_Adanos_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_403_Adanos_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_403_Adanos_siema_15_00"); //Kim jesteœ, œmiertelniku?
	AI_Output (other, self,"DIA_NASZ_403_Adanos_siema_15_01"); //Nazywam siê Will. Mia³em spory udzia³ w twoim przyzwaniu.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_siema_15_02"); //Czego ci potrzeba?
	
};

//*********************************************************************
//	Info Portal
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_portal   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 2;
 	condition   = DIA_NASZ_403_Adanos_portal_Condition;
 	information = DIA_NASZ_403_Adanos_portal_Info;
 	permanent   = FALSE;
 	description = "Chcia³bym prosiæ o pomoc.";
};

FUNC INT DIA_NASZ_403_Adanos_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_403_Adanos_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_portal_15_00"); //Chcia³bym prosiæ o pomoc.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_01"); //Do czego zmierzasz, œmiertelniku?
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_portal_15_02"); //Wszyscy bogowie musz¹ siê spotkaæ i otworzyæ portal.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_03"); //Có¿... Bardzo dawno nie wspó³pracowa³em z braæmi.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_04"); //Pomogê ci, jeœli wyka¿esz siê m¹droœci¹.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_05"); //Najpierw jednak musisz pokazaæ sw¹ bezgraniczn¹ wiarê.

};

//*********************************************************************
//	Info WorkA
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_workA   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 3;
 	condition   = DIA_NASZ_403_Adanos_workA_Condition;
 	information = DIA_NASZ_403_Adanos_workA_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobiæ, Adanosie?";
};

FUNC INT DIA_NASZ_403_Adanos_workA_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_403_Adanos_portal))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_403_Adanos_workA_Info()
{
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workA_15_00"); //Co mam zrobiæ, Adanosie?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workA_55_01"); //Udaj siê na najwy¿sz¹ wie¿ê w zamku. Gdy ju¿ tam bêdziesz, odwróæ siê na zachód i skocz.
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workA_15_03"); //Przecie¿ siê zabijê.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workA_55_04"); //Poka¿, ¿e wierzysz. Tylko wtedy bêdê wiedzia³, czy jest sens poddaæ ciê próbie.

	ADANOS_JUMP = TRUE;
	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "Adanos wymyœli³ sobie, ¿e ¿eby udowodniæ swoj¹ wiarê, muszê wykonaæ skok w przepaœæ... Mam udaæ siê na najwy¿sz¹ wie¿ê zamku w Górniczej Dolinie, obróciæ siê na zachód i wykonaæ skok wiary.");

};


//*********************************************************************
//	Info DoneA
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_doneA   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 4;
 	condition   = DIA_NASZ_403_Adanos_doneA_Condition;
 	information = DIA_NASZ_403_Adanos_doneA_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_403_Adanos_doneA_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_403_Adanos_workA)
		&& (ADANOS_JUMP_DONE == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_403_Adanos_doneA_Info()
{
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneA_15_00"); //Skoczy³eœ.
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_doneA_15_01"); //Myœla³em, ¿e ju¿ po mnie.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneA_55_02"); //Ja zawsze dbam o wiernych.

	B_GivePlayerXP(1000);
};



//*********************************************************************
//	Info WorkB
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_workB   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 5;
 	condition   = DIA_NASZ_403_Adanos_workB_Condition;
 	information = DIA_NASZ_403_Adanos_workB_Info;
 	permanent   = FALSE;
 	description = "Co jeszcze mam zrobiæ?";
};

FUNC INT DIA_NASZ_403_Adanos_workB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_403_Adanos_doneA))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_403_Adanos_workB_Info()
{
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workB_15_00"); //Co jeszcze mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workB_55_01"); //Pokaza³eœ ju¿, ¿e wierzysz. Pytanie, czy jesteœ inteligentny?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workB_55_02"); //WeŸ ten pergamin, przeczytaj go i przyjdŸ do mnie dopiero z rozwi¹zan¹ zagadk¹.

	Wld_InsertNpc	(NASZ_430_StaryTrup,"NASZ_FOGTOWER_01");
	Wld_InsertItem	(ItNa_KrysztalAdanosa,"FP_ADANOS_WORK2"); 

	Createinvitems (self, ItNa_Zagadka_Adanos, 1);
	B_giveinvitems (self, other, ItNa_Zagadka_Adanos, 1);
	FF_ApplyOnceExt(KrysztalAdanosa,2000,-1);
	B_LogEntry (TOPIC_bogowie_work, "Adanos da³ mi kartkê z zagadk¹. Mam siê do niego zg³osiæ, gdy ju¿ j¹ rozwi¹¿ê.");
	AI_StopProcessInfos (self);
	
};


//*********************************************************************
//	Info DoneB
//*********************************************************************
INSTANCE DIA_NASZ_403_Adanos_doneB   (C_INFO)
{
	npc         = NASZ_403_Adanos;
 	nr          = 6;
 	condition   = DIA_NASZ_403_Adanos_doneB_Condition;
 	information = DIA_NASZ_403_Adanos_doneB_Info;
 	permanent   = FALSE;
 	description = "Znalaz³em kryszta³.";
};

FUNC INT DIA_NASZ_403_Adanos_doneB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_403_Adanos_workB)
		&& npc_hasitems (other, ItNa_KrysztalAdanosa) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_403_Adanos_doneB_Info()
{
	AI_Output (other, self,"DIA_NASZ_403_Adanos_doneB_15_00"); //Znalaz³em kryszta³.
	B_giveinvitems (other, self, ItNa_KrysztalAdanosa, 1);
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneB_55_01"); //A wiêc da³eœ radê. Pomogê ci, dok¹d mam siê udaæ?
	AI_Output (other, self,"DIA_NASZ_403_Adanos_doneB_15_02"); //Do ruin orkowego miasta.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneB_55_03"); //Zatem do zobaczenia.

	AdanosSieTeleportuje = TRUE;

	B_GivePlayerXP(1000);
	
	B_LogEntry (TOPIC_bogowie_work, "Odda³em Adanosowi kryszta³.");
	Npc_ExchangeRoutine (self, "Final");
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
