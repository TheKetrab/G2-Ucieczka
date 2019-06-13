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
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_00"); //Obaj bêdziemy mieli k³opoty.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_01"); //OdejdŸ.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_02"); //Rozmowa to nie jest najlepszy pomys³.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_prehello_03_03"); //Ka¿¹ nas wybato¿yæ!
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
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_00"); //I co? Chcesz mi daæ w mordê? Œmia³o.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_hello_15_01"); //Nie, czekaj. Chcê pogadaæ.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_02"); //Ty, bandyta? Nie rozumiem...
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_hello_15_03"); //Jestem tu na przeszpiegi z polecenia Gestatha. Chcemy pomóc wam siê wydostaæ.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_hello_03_04"); //Hmm... Mów zatem, czego potrzebujesz?
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
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ilu_03_01"); //Niewolników? W obozie trzech.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ilu_03_02"); //O ile dobrze siê orientujê, to gdzieœ jest jeszcze jedna kopalnia, w której mo¿e byæ kilku kolejnych.
	
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
	description	 =	"Jak mogê dostaæ siê do szefa?";
};

func int DIA_NASZ_320_Niewolnik_nod_Condition ()
{
	return TRUE;

};
func void DIA_NASZ_320_Niewolnik_nod_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_nod_15_00"); //Jak mogê dostaæ siê do szefa?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_nod_03_01"); //Do Noda maj¹ wstêp tylko bandyci ciesz¹cy siê najwiêksz¹ reputacj¹.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_nod_03_02"); //Ten cz³owiek ma ochotê na rozmowê tylko z najbardziej zaradnymi ludŸmi...
	
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
	description	 =	"Mo¿esz mi pomóc dostaæ siê do Noda?";
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
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_help_15_00"); //Mo¿esz mi pomóc dostaæ siê do Noda?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_01"); //Có¿... Kilka dni temu s³ysza³em jak Frut i Monk siê o coœ k³ócili.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_02"); //Nie wiem, czy ci to pomo¿e, ale mo¿esz zapytaæ Monka o to zajœcie. Fruta lepiej nie dra¿niæ.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_help_15_03"); //Dlaczego?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_help_03_04"); //Ma w obozie w³adzê niczym Nod, a krzepy chyba jeszcze wiêcej... By³oby niem¹dre wkurzaæ kogoœ takiego.


	Log_CreateTopic (TOPIC_Monk_Frut, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monk_Frut, LOG_RUNNING);
	B_LogEntry (TOPIC_Monk_Frut, "Jeden z niewolników wspomnia³ o k³ótni pomiêdzy Monkiem a Frutem...");
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
	description	 =	"D³ugo ju¿ tu jesteœ?";
};

func int DIA_NASZ_320_Niewolnik_long_Condition ()
{
	return TRUE;

};
func void DIA_NASZ_320_Niewolnik_long_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_long_15_00"); //D³ugo ju¿ tu jesteœ?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_01"); //Jakieœ dwa tygodnie.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_02"); //Codziennie mamy kupê ciê¿kiej pracy, ale przynajmniej dostajemy du¿o ¿arcia.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_long_03_03"); //Idzie siê przyzwyczaiæ.
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
	description	 =	"Mogê ci siê na coœ przydaæ?";
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
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_can_15_00"); //Mogê ci siê na coœ przydaæ?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_01"); //Pewnie. Potrzebujê roœlin leczniczych do opatrzenia ran sobie i moim kolegom.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_02"); //Bam lubi nas biæ... Przynieœ mi osiem zió³ leczniczych.
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_can_15_03"); //Gdzie rosn¹ te roœliny?
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_can_03_04"); //W lasach, na polanach, wszêdzie.


	Log_CreateTopic (TOPIC_niewolnik_ziola, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_niewolnik_ziola, LOG_RUNNING);
	B_LogEntry (TOPIC_niewolnik_ziola, "Niewolnicy z obozu bandytów potrzebuj¹ 8 roœlin leczniczych do opatrywania ran.");
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
	description	 =	"Masz tu swoje osiem roœlin.";
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
	AI_Output			(other, self, "DIA_NASZ_320_Niewolnik_ziola_15_00"); //Masz tu swoje osiem zió³.

	B_giveinvitems (self, other, ItPl_Health_Herb_01, 8);

	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ziola_03_01"); //Jestem ci bardzo wdziêczny.
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_ziola_03_02"); //WeŸ te eliksiry w nagrodê. Nam siê nie przydadz¹, no a tobie... Raz jeszcze dziêki.

	Createinvitems (self, ItPo_Health_01, 4);
	B_giveinvitems (self, other, ItPo_Health_01, 4);

	DodajReputacje (1, REP_MYSLIWI);
	B_GivePlayerXP (500);
	B_LogEntry (TOPIC_niewolnik_ziola, "Roœliny dostarczone.");
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
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_00"); //Dziêki za ratunek.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_01"); //Jestem ci bardzo wdziêczny.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_02"); //Dobrze, ¿e ju¿ nie ma tych cholernych bandytów.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_320_Niewolnik_kap3_03_03"); //Œwietna robota, wielki wojowniku.
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};