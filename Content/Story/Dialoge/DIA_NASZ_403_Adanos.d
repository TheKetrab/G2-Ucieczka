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
	AI_Output (self, other,"DIA_NASZ_403_Adanos_siema_15_00"); //Kim jeste�, �miertelniku?
	AI_Output (other, self,"DIA_NASZ_403_Adanos_siema_15_01"); //Nazywam si� Will. Mia�em spory udzia� w twoim przyzwaniu.
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
 	description = "Chcia�bym prosi� o pomoc.";
};

FUNC INT DIA_NASZ_403_Adanos_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_403_Adanos_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_portal_15_00"); //Chcia�bym prosi� o pomoc.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_01"); //Do czego zmierzasz, �miertelniku?
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_portal_15_02"); //Wszyscy bogowie musz� si� spotka� i otworzy� portal.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_03"); //C�... Bardzo dawno nie wsp�pracowa�em z bra�mi.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_04"); //Pomog� ci, je�li wyka�esz si� m�dro�ci�.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_portal_55_05"); //Najpierw jednak musisz pokaza� sw� bezgraniczn� wiar�.

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
 	description = "Co mam zrobi�, Adanosie?";
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
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workA_15_00"); //Co mam zrobi�, Adanosie?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workA_55_01"); //Udaj si� na najwy�sz� wie�� w zamku. Gdy ju� tam b�dziesz, odwr�� si� na zach�d i skocz.
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workA_15_03"); //Przecie� si� zabij�.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workA_55_04"); //Poka�, �e wierzysz. Tylko wtedy b�d� wiedzia�, czy jest sens podda� ci� pr�bie.

	ADANOS_JUMP = TRUE;
	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "Adanos wymy�li� sobie, �e �eby udowodni� swoj� wiar�, musz� wykona� skok w przepa��... Mam uda� si� na najwy�sz� wie�� zamku w G�rniczej Dolinie, obr�ci� si� na zach�d i wykona� skok wiary.");

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
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneA_15_00"); //Skoczy�e�.
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_doneA_15_01"); //My�la�em, �e ju� po mnie.
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
 	description = "Co jeszcze mam zrobi�?";
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
	AI_Output (other,self ,"DIA_NASZ_403_Adanos_workB_15_00"); //Co jeszcze mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workB_55_01"); //Pokaza�e� ju�, �e wierzysz. Pytanie, czy jeste� inteligentny?
	AI_Output (self, other,"DIA_NASZ_403_Adanos_workB_55_02"); //We� ten pergamin, przeczytaj go i przyjd� do mnie dopiero z rozwi�zan� zagadk�.

	Wld_InsertNpc	(NASZ_430_StaryTrup,"NASZ_FOGTOWER_01");
	Wld_InsertItem	(ItNa_KrysztalAdanosa,"FP_ADANOS_WORK2"); 

	Createinvitems (self, ItNa_Zagadka_Adanos, 1);
	B_giveinvitems (self, other, ItNa_Zagadka_Adanos, 1);
	FF_ApplyOnceExt(KrysztalAdanosa,2000,-1);
	B_LogEntry (TOPIC_bogowie_work, "Adanos da� mi kartk� z zagadk�. Mam si� do niego zg�osi�, gdy ju� j� rozwi���.");
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
 	description = "Znalaz�em kryszta�.";
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
	AI_Output (other, self,"DIA_NASZ_403_Adanos_doneB_15_00"); //Znalaz�em kryszta�.
	B_giveinvitems (other, self, ItNa_KrysztalAdanosa, 1);
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneB_55_01"); //A wi�c da�e� rad�. Pomog� ci, dok�d mam si� uda�?
	AI_Output (other, self,"DIA_NASZ_403_Adanos_doneB_15_02"); //Do ruin orkowego miasta.
	AI_Output (self, other,"DIA_NASZ_403_Adanos_doneB_55_03"); //Zatem do zobaczenia.

	AdanosSieTeleportuje = TRUE;

	B_GivePlayerXP(1000);
	
	B_LogEntry (TOPIC_bogowie_work, "Odda�em Adanosowi kryszta�.");
	Npc_ExchangeRoutine (self, "Final");
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
