//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_EXIT   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
	nr          = 999;
	condition   = DIA_NASZ_114_Hokurn_EXIT_Condition;
	information = DIA_NASZ_114_Hokurn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_114_Hokurn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_114_Hokurn_EXIT_Info()
{
	//Wld_SendTrigger("GUITAR_MUSIK");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_114_Hokurn_hello		(C_INFO)
{
	npc		 	 = 	NASZ_114_Hokurn;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_114_Hokurn_hello_Condition;
	information	 = 	DIA_NASZ_114_Hokurn_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_114_Hokurn_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && !(Kurgan_walka==4) && (KAPITEL == 1)
	{
		return TRUE;
	};
};
func void DIA_NASZ_114_Hokurn_hello_Info ()
{
	
	if (LOWCA_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_114_Hokurn_hello_03_00"); //Nie przeszkadzaj mi!
	LOWCA_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (LOWCA_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_114_Hokurn_hello_03_01"); //Cz�owieku, we� si� odczep.
	LOWCA_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (LOWCA_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_114_Hokurn_hello_03_02"); //Zostaw mnie w spokoju!
	LOWCA_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_114_Hokurn_hello_03_03"); //Nie mam teraz czasu.
	LOWCA_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};


func void HokurnSay_NoChances() {
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_HokurnSay_NoChances_55_00"); //Nie masz z nami �adnych szans!
};

//*********************************************************************
//	Arena 
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_arena   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
 	nr          = 2;
 	condition   = DIA_NASZ_114_Hokurn_arena_Condition;
 	information = DIA_NASZ_114_Hokurn_arena_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_114_Hokurn_arena_Condition()
{
	if ((Kurgan_walka==4)
		&& (Npc_GetDistToWP(self,"NASZ_LOWCY_ARENA_01") < 300)
		&& (Npc_GetDistToWP(NASZ_113_Godar,"NASZ_LOWCY_ARENA_01") < 300)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
		&& (NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_114_Hokurn_arena_Info()
{
	HokurnSay_NoChances();

	GODARHOKURN_WALCZY = TRUE;
	Arena_Opuszczasz_Raz = FALSE;
	Arena_Przegrana_Raz = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	B_Attack(NASZ_113_Godar, other, AR_NONE, 1);
};


//*********************************************************************
//	ArenaZamek
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_ArenaZamek   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
 	nr          = 2;
 	condition   = DIA_NASZ_114_Hokurn_ArenaZamek_Condition;
 	information = DIA_NASZ_114_Hokurn_ArenaZamek_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_114_Hokurn_ArenaZamek_Condition()
{
	if (Kurgan_walka==4)
	&& (KAPITEL >=4)
	&& (Npc_GetDistToWP(self,"OC_SMITH_01") < 600)
	&& (Npc_GetDistToWP(NASZ_113_Godar,"OC_SMITH_01") < 600)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_114_Hokurn_ArenaZamek_Info()
{
	HokurnSay_NoChances();

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	B_Attack(NASZ_113_Godar, other, AR_NONE, 1);
};


//*********************************************************************
//	Info Mapy
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_mapy   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
 	nr          = 11;
 	condition   = DIA_NASZ_114_Hokurn_mapy_Condition;
 	information = DIA_NASZ_114_Hokurn_mapy_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_114_Hokurn_mapy_Condition()	
{
	if (KAPITEL >= 2) && (Npc_GetDistToWP (self, "NASZ_LOWCY_ARENA_08") < 400)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_114_Hokurn_mapy_Info()
{
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_mapy_15_00"); //Zobacz na t� map�. To plan Starego Obozu. 
	AI_Output (other, self,"DIA_NASZ_114_Hokurn_mapy_55_01"); //Sk�d j� masz?
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_mapy_55_02"); //Znalaz�em kiedy� w jaskini obok wodospadu. Cholera wie, kto j� tam zani�s�.
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_mapy_55_03"); //Do czego zmierzam: Te mapy maj� niezwyk�� warto�� strategiczn�. Dzi�ki nim mo�emy planowa� ataki. S� du�o dok�adniejsze ni� mapa ca�ej kolonii.
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_mapy_55_04"); //Brakuje mi map Nowego Obozu i Obozu Na Bagnie. Gdyby� kiedy� natkn�� si� na nie, przynie� do mnie. Hojnie ci� wynagrodz�.

	MIS_HOKURN_READY = TRUE;
	Log_CreateTopic (TOPIC_Hokurn_mapy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Hokurn_mapy, LOG_RUNNING);
	B_LogEntry (TOPIC_Hokurn_mapy, "Musz� znale�� mapy Nowego Obozu i Obozu Na Bagnie i dostarczy� je Hokurnowi.");

};

//*********************************************************************
//	Info Mapy Done
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_MapyDone   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
 	nr          = 12;
 	condition   = DIA_NASZ_114_Hokurn_MapyDone_Condition;
 	information = DIA_NASZ_114_Hokurn_MapyDone_Info;
 	permanent   = FALSE;
	description	= "Znalaz�em mapy.";
};

FUNC INT DIA_NASZ_114_Hokurn_MapyDone_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_114_Hokurn_mapy))
		&& (npc_hasitems (other, ItNa_Mapa_ObozNaBagnie) >=1)
		&& (npc_hasitems (other, ItNa_Mapa_NowyOboz) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_114_Hokurn_MapyDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_114_Hokurn_MapyDone_15_00"); //Znalaz�em mapy.
	B_giveinvitems (other, self, ItNa_Mapa_ObozNaBagnie, 1);
	B_giveinvitems (other, self, ItNa_Mapa_NowyOboz, 1);
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_MapyDone_55_01"); //Dok�adnie, o te mi chodzi�o.
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_MapyDone_55_02"); //�wietna robota. Mam tu te� pergamin na wymian�. To projekt miecza bojowego. Je�li dogadasz si� z Janem, to wykuje dla ciebie taki.

	Createinvitems (self, ItNa_Projekt_MieczBojowy, 1);
	B_giveinvitems (self, other, ItNa_Projekt_MieczBojowy, 1);

	MIS_HOKURN_READY = FALSE;
	Log_SetTopicStatus (TOPIC_Hokurn_mapy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Hokurn_mapy, "Odda�em mapy Hokurnowi. W moich oczach s� bezu�yteczne, ale mo�e on zrobi z nich jaki� po�ytek.");
	DodajReputacje (3, REP_LOWCY);
	B_GivePlayerXP (500);
};


//*********************************************************************
//	Info TrfGolem
//*********************************************************************
INSTANCE DIA_NASZ_114_Hokurn_TrfGolem   (C_INFO)
{
	npc         = NASZ_114_Hokurn;
 	nr          = 12;
 	condition   = DIA_NASZ_114_Hokurn_TrfGolem_Condition;
 	information = DIA_NASZ_114_Hokurn_TrfGolem_Info;
 	permanent   = FALSE;
	description	= "Przyszed�em po zw�j przemiany w golema.";
};

FUNC INT DIA_NASZ_114_Hokurn_TrfGolem_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_work1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_114_Hokurn_TrfGolem_Info()
{
	AI_Output (other, self,"DIA_NASZ_114_Hokurn_TrfGolem_15_00"); //Przyszed�em po zw�j przemiany w golema.
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_TrfGolem_55_01"); //Keroloth znalaz� kolejnego g�upiego, kt�ry b�dzie przemienia� si� w golema, �eby zabi� golema?
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_TrfGolem_55_02"); //Pomy�l: Jaki sens ma przemienia� si� w wilka, �eby zabi� wilka? Ka�dy my�liwy, by ci� wy�mia�...
	AI_Output (self, other,"DIA_NASZ_114_Hokurn_TrfGolem_55_03"); //Dobrze, �e to zadanie ju� na mnie nie ci��y. Trzymaj, oto zw�j, kt�ry ci� interesuje.

	Createinvitems (self, ItNa_TrfGolem, 1);
	B_giveinvitems (self, other, ItNa_TrfGolem, 1);

	B_LogEntry (TOPIC_Keroloth_golem, "Hokurn da� mi zw�j i wyrazi� swoje zdanie o pomy�le Kerolotha. C�... Pora zabi� golema b�d�c golemem.");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_114_Hokurn_PICKPOCKET (C_INFO)
{
	npc			= NASZ_114_Hokurn;
	nr			= 900;
	condition	= DIA_NASZ_114_Hokurn_PICKPOCKET_Condition;
	information	= DIA_NASZ_114_Hokurn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_114_Hokurn_PICKPOCKET_Condition()
{
	C_Beklauen (68);
};
 
FUNC VOID DIA_NASZ_114_Hokurn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_114_Hokurn_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_114_Hokurn_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_114_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_114_Hokurn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_114_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_NASZ_114_Hokurn_PICKPOCKET_DoIt()
{
	B_BeklauenGold(77);
	Info_ClearChoices (DIA_NASZ_114_Hokurn_PICKPOCKET);
};
	
func void DIA_NASZ_114_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_114_Hokurn_PICKPOCKET);
};
