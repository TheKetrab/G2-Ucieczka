var int WIELKI_DOM_DRZWI_OTWARTE;

var int WielkiDomDrzwiOneTime;

var int WielkiDomTimerSec;
func void WielkiDomTimer() {

	WielkiDomTimerSec += 1;
	
	if (WielkiDomTimerSec == 2) {
		WIELKI_DOM_DRZWI_OTWARTE = TRUE;
		WielkiDomTimerSec = 0;
		ff_remove(WielkiDomTimer);
	};
};

func void WIELKI_DOM_FUNC_S1() {

	if (WielkiDomDrzwiOneTime == FALSE)
	{
		WielkiDomDrzwiOneTime = TRUE;
		ff_applyonceext(WielkiDomTimer,1000,-1);
	};
	
};



//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_212_Drax_EXIT   (C_INFO)
{
	npc         = NASZ_212_Drax;
	nr          = 999;
	condition   = DIA_NASZ_212_Drax_EXIT_Condition;
	information = DIA_NASZ_212_Drax_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_212_Drax_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_212_Drax_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_212_Drax_siema   (C_INFO)
{
	npc         = NASZ_212_Drax;
 	nr          = 1;
 	condition   = DIA_NASZ_212_Drax_siema_Condition;
 	information = DIA_NASZ_212_Drax_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_212_Drax_siema_Condition()
{
	// zagaduje po dw�ch sekundach od otwarcia drzwi
	if (WIELKI_DOM_DRZWI_OTWARTE == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_212_Drax_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_212_Drax_siema_15_00"); //Ha, ha, ha!
	AI_Output (self, other,"DIA_NASZ_212_Drax_siema_55_01"); //W ko�cu wolny.

	Log_CreateTopic (TOPIC_Drax_ucieczka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Drax_ucieczka, LOG_RUNNING);
	B_LogEntry (TOPIC_Drax_ucieczka, "Z mojej winy, jeden z wi�ni�w z obozu my�liwych uciek�. Niestety, by� bardzo szybki, wi�c nie da�em rady go dogoni�. Zapytam si� Snafa, kt�ry na pewno b�dzie co� o nim wiedzia�. W ko�cu to on pokierowa� mnie do wi�zienia!");

	Npc_ExchangeRoutine (self,"FLEE");
	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	         Info Stop
//*********************************************************************
INSTANCE DIA_NASZ_212_Drax_stop   (C_INFO)
{
	npc         = NASZ_212_Drax;
 	nr          = 2;
 	condition   = DIA_NASZ_212_Drax_stop_Condition;
 	information = DIA_NASZ_212_Drax_stop_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_212_Drax_stop_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema))
	&& (Npc_IsInState(self, ZS_TALK))
	&& (!Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_MYSLIWI_DRAX_B"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_212_Drax_stop_Info()
{
	AI_Output (self, other,"DIA_NASZ_212_Drax_stop_55_00"); //Zostaw mnie!

	AI_StopProcessInfos (self);

};

//*********************************************************************
//	         Info Found
//*********************************************************************
INSTANCE DIA_NASZ_212_Drax_found   (C_INFO)
{
	npc         = NASZ_212_Drax;
 	nr          = 3;
 	condition   = DIA_NASZ_212_Drax_found_Condition;
 	information = DIA_NASZ_212_Drax_found_Info;
 	permanent   = FALSE;
 	description = "Mam ci�!";
};

FUNC INT DIA_NASZ_212_Drax_found_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_MYSLIWI_DRAX_B"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_212_Drax_found_Info()
{
	AI_Output (other,self ,"DIA_NASZ_212_Drax_found_15_00"); //Mam ci�!
	AI_Output (self, other,"DIA_NASZ_212_Drax_found_55_01"); //I co? Co zrobisz?
	AI_Output (other,self ,"DIA_NASZ_212_Drax_found_15_02"); //P�jdziesz ze mn� z powrotem do obozu my�liwych.
	AI_Output (self, other,"DIA_NASZ_212_Drax_found_55_03"); //Co?! Nie! Nigdy. Zabij� ci�!
	
	NASZ_212_Drax.flags = 1;
	Npc_SetTrueGuild (NASZ_212_Drax, GIL_BDT);
	NASZ_212_Drax.guild = GIL_BDT;
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);
	B_LogEntry (TOPIC_Drax_ucieczka, "Znalaz�em go. Jest jednak na tyle oszala�y, �e chce mnie zabi�. Wygl�da na to, �e musz� si� go pozby�.");

};

var int FUNC_DRAX_DONE;
FUNC VOID KILL_DRAX()
{
	if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema)
		&& npc_isdead (NASZ_212_Drax))
		&& (!FUNC_DRAX_DONE) {
			DodajReputacje (1, REP_MYSLIWI);
			B_LogEntry (TOPIC_Drax_ucieczka, "Zabi�em Draxa. Chocia� jeden nie musi ju� cierpie� w tej przekl�tej G�rniczej Dolinie.");
			Log_SetTopicStatus (TOPIC_Drax_ucieczka, LOG_SUCCESS);
			FUNC_DRAX_DONE;
			}
		else {
	};
};