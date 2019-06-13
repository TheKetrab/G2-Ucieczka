///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_320_Niewolnik_EXIT   (C_INFO)
{
	npc         = NASZ_320_Niewolnik;
	nr          = 999;
	condition   = DIA_NASZ_320_Niewolnik_EXIT_Condition;
	information = DIA_NASZ_320_Niewolnik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_320_Niewolnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_320_Niewolnik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PreHello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_prehello		(C_INFO)
{
	npc		 = 	NASZ_320_Niewolnik;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_320_Niewolnik_prehello_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_prehello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_320_Niewolnik_prehello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk) && (Npc_GetDistToWP (self, "NASZ_BANDYCI_OBOZ_01") >= 600)) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_prehello_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_00"); //Obaj b�dziemy mieli k�opoty.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_01"); //Odejd�.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_02"); //Rozmowa to nie jest najlepszy pomys�.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_03"); //Ka�� nas wybato�y�!
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_hello		(C_INFO)
{
	npc		 = 	NASZ_320_Niewolnik;
	nr		 = 	2;
	condition	 = 	DIA_NASZ_320_Niewolnik_hello_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int DIA_NASZ_320_Niewolnik_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk) && (Npc_GetDistToWP (self, "NASZ_BANDYCI_OBOZ_01") < 600))
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_hello_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_00"); //I co? Chcesz mi da� w mord�? �mia�o.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_hello_15_01"); //Nie, czekaj. Chc� pogada�.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_02"); //Ty, bandyta? Nie rozumiem...
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_hello_15_03"); //Jestem tu na przeszpiegi z polecenia Gestatha. Chcemy pom�c wam si� wydosta�.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_04"); //Hmm... M�w zatem, czego potrzebujesz?
};

///////////////////////////////////////////////////////////////////////
//	Info Ilu
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_ilu		(C_INFO)
{
	npc			 = 	NASZ_320_Niewolnik;
	nr		 	 = 	3;
	condition	 = 	DIA_NASZ_320_Niewolnik_ilu_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_ilu_Info;
	permanent	 = 	FALSE;
	description	 =	"Ilu was tu jest?";
};

func int DIA_NASZ_320_Niewolnik_ilu_Condition ()
{
	return TRUE;

};
func void DIA_NASZ_320_Niewolnik_ilu_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_ilu_15_00"); //Ilu was tu jest?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ilu_03_01"); //Niewolnik�w? W obozie trzech.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ilu_03_02"); //O ile dobrze si� orientuj�, to gdzie� jest jeszcze jedna kopalnia, w kt�rej mo�e by� kilku kolejnych.
	
};

///////////////////////////////////////////////////////////////////////
//	Info Where
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_where		(C_INFO)
{
	npc			 = 	NASZ_320_Niewolnik;
	nr			 = 	4;
	condition	 = 	DIA_NASZ_320_Niewolnik_where_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_where_Info;
	permanent	 = 	FALSE;
	description	 =	"Czy wiesz, gdzie jest ta kopalnia?";
};

func int DIA_NASZ_320_Niewolnik_where_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_ilu))
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_where_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_where_15_00"); //Czy wiesz, gdzie jest ta kopalnia?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_where_03_01"); //Niestety nie...	
};

///////////////////////////////////////////////////////////////////////
//	Info Nod
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_nod		(C_INFO)
{
	npc			 = 	NASZ_320_Niewolnik;
	nr			 = 	5;
	condition	 = 	DIA_NASZ_320_Niewolnik_nod_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_nod_Info;
	permanent	 = 	FALSE;
	description	 =	"Jak mog� dosta� si� do szefa?";
};

func int DIA_NASZ_320_Niewolnik_nod_Condition ()
{
	return TRUE;

};
func void DIA_NASZ_320_Niewolnik_nod_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_nod_15_00"); //Jak mog� dosta� si� do szefa?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_nod_03_01"); //Do Noda maj� wst�p tylko bandyci ciesz�cy si� najwi�ksz� reputacj�.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_nod_03_02"); //Ten cz�owiek ma ochot� na rozmow� tylko z najbardziej zaradnymi lud�mi...
	
};


///////////////////////////////////////////////////////////////////////
//	Info Help
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_help		(C_INFO)
{
	npc			 = 	NASZ_320_Niewolnik;
	nr			 = 	6;
	condition	 = 	DIA_NASZ_320_Niewolnik_help_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_help_Info;
	permanent	 = 	FALSE;
	description	 =	"Mo�esz mi pom�c dosta� si� do Noda?";
};

func int DIA_NASZ_320_Niewolnik_help_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_nod))
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_help_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_help_15_00"); //Mo�esz mi pom�c dosta� si� do Noda?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_01"); //C�... Kilka dni temu s�ysza�em jak Frut i Monk si� o co� k��cili.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_02"); //Nie wiem, czy ci to pomo�e, ale mo�esz zapyta� Monka o to zaj�cie. Fruta lepiej nie dra�ni�.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_help_15_03"); //Dlaczego?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_04"); //Ma w obozie w�adz� niczym Nod, a krzepy chyba jeszcze wi�cej... By�oby niem�dre wkurza� kogo� takiego.


	Log_CreateTopic (TOPIC_Monk_Frut, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monk_Frut, LOG_RUNNING);
	B_LogEntry (TOPIC_Monk_Frut, "Jeden z niewolnik�w wspomnia� o k��tni pomi�dzy Monkiem a Frutem...");
};


///////////////////////////////////////////////////////////////////////
//	Info Long
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_long		(C_INFO)
{
	npc		 = 	NASZ_320_Niewolnik;
	nr		 = 	7;
	condition	 = 	DIA_NASZ_320_Niewolnik_long_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_long_Info;
	permanent	 = 	FALSE;
	description	 =	"D�ugo ju� tu jeste�?";
};

func int DIA_NASZ_320_Niewolnik_long_Condition ()
{
	return TRUE;

};
func void DIA_NASZ_320_Niewolnik_long_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_long_15_00"); //D�ugo ju� tu jeste�?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_01"); //Jakie� dwa tygodnie.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_02"); //Codziennie mamy kup� ci�kiej pracy, ale przynajmniej dostajemy du�o �arcia.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_03"); //Idzie si� przyzwyczai�.
};


///////////////////////////////////////////////////////////////////////
//	Info Can
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_can		(C_INFO)
{
	npc		 = 	NASZ_320_Niewolnik;
	nr		 = 	8;
	condition	 = 	DIA_NASZ_320_Niewolnik_can_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_can_Info;
	permanent	 = 	FALSE;
	description	 =	"Mog� ci si� na co� przyda�?";
};

func int DIA_NASZ_320_Niewolnik_can_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_long))
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_can_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_can_15_00"); //Mog� ci si� na co� przyda�?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_01"); //Pewnie. Potrzebuj� ro�lin leczniczych do opatrzenia ran sobie i moim kolegom.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_02"); //Bam lubi nas bi�... Przynie� mi osiem zi� leczniczych.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_can_15_03"); //Gdzie rosn� te ro�liny?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_04"); //W lasach, na polanach, wsz�dzie.


	Log_CreateTopic (TOPIC_niewolnik_ziola, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_niewolnik_ziola, LOG_RUNNING);
	B_LogEntry (TOPIC_niewolnik_ziola, "Niewolnicy z obozu bandyt�w potrzebuj� 8 ro�lin leczniczych do opatrywania ran.");
};

///////////////////////////////////////////////////////////////////////
//	Info Ziola
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_ziola		(C_INFO)
{
	npc			 = 	NASZ_320_Niewolnik;
	nr			 = 	9;
	condition	 = 	DIA_NASZ_320_Niewolnik_ziola_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_ziola_Info;
	permanent	 = 	FALSE;
	description	 =	"Masz tu swoje osiem ro�lin.";
};

func int DIA_NASZ_320_Niewolnik_ziola_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_can)
		&& npc_hasitems (other, ItPl_Health_Herb_01) >= 8)
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_ziola_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_ziola_15_00"); //Masz tu swoje osiem zi�.

	B_giveinvitems (self, other, ItPl_Health_Herb_01, 8);

	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ziola_03_01"); //Jestem ci bardzo wdzi�czny.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ziola_03_02"); //We� te eliksiry w nagrod�. Nam si� nie przydadz�, no a tobie... Raz jeszcze dzi�ki.

	Createinvitems (self, ItPo_Health_01, 4);
	B_giveinvitems (self, other, ItPo_Health_01, 4);

	DodajReputacje (1, REP_MYSLIWI);
	B_GivePlayerXP (500);
	B_LogEntry (TOPIC_niewolnik_ziola, "Ro�liny dostarczone.");
	Log_SetTopicStatus (TOPIC_niewolnik_ziola, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_320_Niewolnik_kap3		(C_INFO)
{
	npc		 	 = 	NASZ_320_Niewolnik;
	nr		 	 = 	10;
	condition	 = 	DIA_NASZ_320_Niewolnik_kap3_Condition;
	information	 = 	DIA_NASZ_320_Niewolnik_kap3_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_320_Niewolnik_kap3_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && (KAPITEL >= 3) && (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_ziola))
	{
		return TRUE;
	};
};
func void DIA_NASZ_320_Niewolnik_kap3_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_00"); //Dzi�ki za ratunek.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_01"); //Jestem ci bardzo wdzi�czny.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_02"); //Dobrze, �e ju� nie ma tych cholernych bandyt�w.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_03"); //�wietna robota, wielki wojowniku.
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};