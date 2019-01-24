
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_202_Tival_EXIT   (C_INFO)
{
	npc         = NASZ_202_Tival;
	nr          = 999;
	condition   = DIA_NASZ_202_Tival_EXIT_Condition;
	information = DIA_NASZ_202_Tival_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_202_Tival_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_202_Tival_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/*
//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_202_Tival_siema   (C_INFO)
{
	npc         = NASZ_202_Tival;
 	nr          = 1;
 	condition   = DIA_NASZ_202_Tival_siema_Condition;
 	information = DIA_NASZ_202_Tival_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_202_Tival_siema_Condition()
 {
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_202_Tival_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_202_Tival_siema_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_202_Tival_siema_55_01"); //Poluj� i patrosz� mi�so z upolowanej zwierzyny.
		
};

//*********************************************************************
//	Info What 
//*********************************************************************
INSTANCE DIA_NASZ_202_Tival_what   (C_INFO)
{
	npc         = NASZ_202_Tival;
 	nr          = 2;
 	condition   = DIA_NASZ_202_Tival_what_Condition;
 	information = DIA_NASZ_202_Tival_what_Info;
 	permanent   = FALSE;
 	description = "Jak idzie praca?";
};

FUNC INT DIA_NASZ_202_Tival_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_202_Tival_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_202_Tival_what_15_00"); //Jak idzie praca?
	AI_Output (self, other,"DIA_NASZ_202_Tival_what_55_01"); //Nie najlepiej. Od kilku dni w okolicy nie widzia�em �adnego wilka. Same �cierwojady.
	AI_Output (self, other,"DIA_NASZ_202_Tival_what_55_02"); //Brakuje mi sk�r.

};

//*********************************************************************
//	         Wilki
//*********************************************************************
INSTANCE DIA_NASZ_202_Tival_wilki   (C_INFO)
{
	npc         = NASZ_202_Tival;
 	nr          = 3;
 	condition   = DIA_NASZ_202_Tival_wilki_Condition;
 	information = DIA_NASZ_202_Tival_wilki_Info;
 	permanent   = FALSE;
 	description = "Mog� jako� pom�c?";
};

FUNC INT DIA_NASZ_202_Tival_wilki_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_202_Tival_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_202_Tival_wilki_Info()
{
	AI_Output (other,self ,"DIA_NASZ_202_Tival_wilki_15_00"); //Mog� jako� pom�c?
	AI_Output (self, other,"DIA_NASZ_202_Tival_wilki_55_01"); //Oczywi�cie! Przynie� mi 5 wilczych sk�r.
	AI_Output (self, other,"DIA_NASZ_202_Tival_wilki_55_02"); //Za ka�d� sk�r� wymieni� si� piwem.
	
	Log_CreateTopic (TOPIC_Tival_trofea, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Tival_trofea, LOG_RUNNING);
	B_LogEntry (TOPIC_Tival_trofea, "Tival potrzebuje 5 wilczych sk�r.");

};

//*********************************************************************
//	         Sk�ry
//*********************************************************************
INSTANCE DIA_NASZ_202_Tival_skory   (C_INFO)
{
	npc         = NASZ_202_Tival;
 	nr          = 4;
 	condition   = DIA_NASZ_202_Tival_skory_Condition;
 	information = DIA_NASZ_202_Tival_skory_Info;
 	permanent   = FALSE;
 	description = "Oto twoje sk�ry.";
};

FUNC INT DIA_NASZ_202_Tival_skory_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_202_Tival_wilki)
	&& (npc_hasitems (other, ItAt_WolfFur) >= 5))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_202_Tival_skory_Info()
{
	AI_Output (other,self ,"DIA_NASZ_202_Tival_skory_15_00"); //Oto twoje rzeczy.
	B_giveinvitems (other, self, ItAt_WolfFur, 5);
	AI_Output (self, other,"DIA_NASZ_202_Tival_skory_55_01"); //A oto twoje piwo. Trzymaj, zas�u�y�e� na nie.

	Createinvitems (self, itfo_beer, 5);
	B_giveinvitems (self, other, itfo_beer, 5);
	B_LogEntry (TOPIC_Tival_trofea, "Dostarczy�em my�liwemu sk�ry.");
	Log_SetTopicStatus (TOPIC_Tival_trofea, LOG_SUCCESS);
	
	B_GivePlayerXP (100);
	DodajReputacje (2, REP_MYSLIWI);
};

*/