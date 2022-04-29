var int PROWADZENIE;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_EXIT   (C_INFO)
{
	npc         = NASZ_405_VanGan;
	nr          = 999;
	condition   = DIA_NASZ_405_VanGan_EXIT_Condition;
	information = DIA_NASZ_405_VanGan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_405_VanGan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_405_VanGan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_siema   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 1;
 	condition   = DIA_NASZ_405_VanGan_siema_Condition;
 	information = DIA_NASZ_405_VanGan_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_405_VanGan_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
		&& !npc_isdead (NASZ_315_Bandzior))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_405_VanGan_siema_15_00"); //Ja nie gada� z obcymi, morra.
	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_siema2   (C_INFO)
{
	npc         = NASZ_405_VanGan;
	nr          = 2;
	condition   = DIA_NASZ_405_VanGan_siema2_Condition;
	information = DIA_NASZ_405_VanGan_siema2_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_405_VanGan_siema2_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
		&& npc_isdead (NASZ_315_Bandzior))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_siema2_Info()
{
	AI_Output (other, self,"DIA_NASZ_405_VanGan_siema2_15_00"); //Zabi�em Donksa.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_siema2_15_01"); //Co? Ty zabi� wygnaniec?
	AI_Output (other, self,"DIA_NASZ_405_VanGan_siema2_15_02"); //Tak, ten, kt�ry chcia� ci� zabi�, nie �yje.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_siema2_15_03"); //Czego wi�c ty chcie�, morra?

};

//*********************************************************************
//	Info Hello3
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_siema3   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 3;
 	condition   = DIA_NASZ_405_VanGan_siema3_Condition;
 	information = DIA_NASZ_405_VanGan_siema3_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_405_VanGan_siema3_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
		&& npc_knowsinfo (other, DIA_NASZ_405_VanGan_siema2)
		&& (!PROWADZENIE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_siema3_Info()
{
	AI_Output (self, other,"DIA_NASZ_405_VanGan_siema3_15_00"); //Dobrze ci� widzie�, Will.

};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_what   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 4;
 	condition   = DIA_NASZ_405_VanGan_what_Condition;
 	information = DIA_NASZ_405_VanGan_what_Info;
 	permanent   = FALSE;
 	description = "Mog� ci si� na co� przyda�?";
};

FUNC INT DIA_NASZ_405_VanGan_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_405_VanGan_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_405_VanGan_what_15_00"); //Mog� ci si� na co� przyda�?
	AI_Output (self, other,"DIA_NASZ_405_VanGan_what_55_01"); //Zab�jca wygnaniec by� silny wojownik. Zab�jca wygnaniec mo�e mi pom�c.
	AI_Output (other, self,"DIA_NASZ_405_VanGan_what_55_02"); //Yyy, m�w mi Will.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_what_55_03"); //Will? Dobrze, morra.
	Info_ClearChoices (DIA_NASZ_405_VanGan_what);
		Info_AddChoice	  (DIA_NASZ_405_VanGan_what, "Wi�c co mam zrobi�?", DIA_NASZ_405_VanGan_what_so);

};

FUNC VOID DIA_NASZ_405_VanGan_what_so()
{

	AI_Output (other,self ,"DIA_NASZ_405_VanGan_what_so_15_04"); //Wi�c co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_405_VanGan_what_so_55_05"); //Van-Gan ju� d�ugo planowa� t� podr�, ale nigdy nie znale�� dobrej morra.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_what_so_55_06"); //Ty, Will, by� dobry wojownik. Czy Will p�j�� ze mn�?

	Info_ClearChoices (DIA_NASZ_405_VanGan_what);
};



//*********************************************************************
//	Info Where
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_where   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 5;
 	condition   = DIA_NASZ_405_VanGan_where_Condition;
 	information = DIA_NASZ_405_VanGan_where_Info;
 	permanent   = FALSE;
 	description = "Gdzie mieliby�my i��?";
};

FUNC INT DIA_NASZ_405_VanGan_where_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_405_VanGan_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_where_Info()
{
	AI_Output (other,self ,"DIA_NASZ_405_VanGan_where_15_00"); //Gdzie mieliby�my i��?
	AI_Output (self, other,"DIA_NASZ_405_VanGan_where_55_01"); //Na wojn�, morra. Ja musie� pom�ci� m�j brat. Zabi� zab�jca.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_where_55_02"); //Will pom�c mi go zabi�, je�li b�dzie zbyt silny dla Van-Gan.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_where_15_03"); //Czy morra p�j�� ze mn�? Powiedzie�, jak Will gotowy.

	Log_CreateTopic (TOPIC_VanGan_zemsta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_VanGan_zemsta, LOG_RUNNING);
	B_LogEntry (TOPIC_VanGan_zemsta, "Ork Van-Gan chce pom�ci� brata. Poprosi� mnie, bym towarzyszy� mu w drodze do zab�jcy, a potem pom�g� go zabi�, w razie gdyby by� zbyt silny.");
	
};

//*********************************************************************
//	Info GoA
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_GoA   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 6;
 	condition   = DIA_NASZ_405_VanGan_GoA_Condition;
 	information = DIA_NASZ_405_VanGan_GoA_Info;
 	permanent   = FALSE;
 	description = "Chod�my.";
};

FUNC INT DIA_NASZ_405_VanGan_GoA_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_405_VanGan_where))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_GoA_Info()
{
	AI_Output (other,self ,"DIA_NASZ_405_VanGan_GoA_15_00"); //Chod�my.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_GoA_55_01"); //Ty, morra, i�� za mn�.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_GoA_55_02"); //Ale wzi�� ta mikstura. Will b�dzie szybko biega�.

	Createinvitems (self, ItPo_Speed, 1);
	B_giveinvitems (self, other, ItPo_Speed, 1);
	B_UseItem (other, ItPo_Speed);
	PROWADZENIE = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GoA");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_405_VanGan,1);
};


//*********************************************************************
//	Info GoB
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_GoB   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 7;
 	condition   = DIA_NASZ_405_VanGan_GoB_Condition;
 	information = DIA_NASZ_405_VanGan_GoB_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_405_VanGan_GoB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_405_VanGan_GoA)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"MOVEMENT_OW_BLACKGOBBO_A2"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_GoB_Info()
{
	AI_Output (self, other,"DIA_NASZ_405_VanGan_GoB_15_00"); //I co? Morra mie� jeszcze si��?
	AI_Output (other, self,"DIA_NASZ_405_VanGan_GoB_55_01"); //Prowad�, prowad�.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GoB");
	Wld_InsertNpc	(NASZ_410_PallumBo,"NASZ_BANDYCI_ARENA_4");
	PallumBoInserted = TRUE;
};

//*********************************************************************
//	Info Arena
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_Arena   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 9;
 	condition   = DIA_NASZ_405_VanGan_Arena_Condition;
 	information = DIA_NASZ_405_VanGan_Arena_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_405_VanGan_Arena_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_405_VanGan_GoB)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_BANDYCI_ARENA_3"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_Arena_Info()
{
	AI_Output (self, other,"DIA_NASZ_405_VanGan_Arena_15_00"); //Zaraz walczymy... �ycz mi powodzenia.

	AI_StopProcessInfos (self);

};

//*********************************************************************
//	Info After
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_After   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 10;
 	condition   = DIA_NASZ_405_VanGan_After_Condition;
 	information = DIA_NASZ_405_VanGan_After_Info;
 	permanent   = FALSE;
 	description = "Pallum-Bo nie �yje.";
};

FUNC INT DIA_NASZ_405_VanGan_After_Condition()
{
	if (npc_isdead (NASZ_410_PallumBo)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_BANDYCI_ARENA_3"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_After_Info()
{
	AI_Output (other, self,"DIA_NASZ_405_VanGan_After_15_00"); //Pallum-Bo nie �yje.
	AI_Output (self, other,"DIA_NASZ_405_VanGan_After_55_01"); //Tak, to koniec. Dobrze si� spisa�e�, Willu. Dzi�kowa�, morra.

	Log_SetTopicStatus (TOPIC_VanGan_zemsta, LOG_SUCCESS);

	
	B_GivePlayerXP (400);
	DodajReputacje (10, REP_BANDYCI);
	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_405_VanGan,0);
};

//*********************************************************************
//	Info RekaTrolla
//*********************************************************************
INSTANCE DIA_NASZ_405_VanGan_RekaTrolla   (C_INFO)
{
	npc         = NASZ_405_VanGan;
 	nr          = 11;
 	condition   = DIA_NASZ_405_VanGan_RekaTrolla_Condition;
 	information = DIA_NASZ_405_VanGan_RekaTrolla_Info;
 	permanent   = FALSE;
 	description = "Ten top�r ci si� przyda, we� go.";
};

FUNC INT DIA_NASZ_405_VanGan_RekaTrolla_Condition()
{
	if (npc_hasitems (other, ItNa_RekaTrolla) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_405_VanGan_RekaTrolla_Info()
{
	AI_Output (other, self,"DIA_NASZ_405_VanGan_RekaTrolla_15_00"); //Ten top�r ci si� przyda, we� go.
	B_giveinvitems (other, self, ItNa_RekaTrolla, 1);
	AI_Output (self, other,"DIA_NASZ_405_VanGan_RekaTrolla_55_01"); //R�ka Trolla... Ten top�r zabi� tyle morr, a teraz nale�e� do mnie... Dzi�kuj�, morra.

	B_GivePlayerXP (100);
	DodajReputacje (5, REP_BANDYCI);
};