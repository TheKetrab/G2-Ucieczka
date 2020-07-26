///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_326_Domenic_EXIT   (C_INFO)
{
	npc         = NASZ_326_Domenic;
	nr          = 999;
	condition   = DIA_NASZ_326_Domenic_EXIT_Condition;
	information = DIA_NASZ_326_Domenic_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_326_Domenic_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_326_Domenic_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_Obcy		(C_INFO)
{
	npc		 = 	NASZ_326_Domenic;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_326_Domenic_Obcy_Condition;
	information	 = 	DIA_NASZ_326_Domenic_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_326_Domenic_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_326_Domenic_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_hello		(C_INFO)
{
	npc		 = 	NASZ_326_Domenic;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_326_Domenic_hello_Condition;
	information	 = 	DIA_NASZ_326_Domenic_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_326_Domenic_hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_NASZ_326_Domenic_hello_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_hello_03_00"); //Tak?

};

///////////////////////////////////////////////////////////////////////
//	Info Who
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_who		(C_INFO)
{
	npc		 = 	NASZ_326_Domenic;
	nr		 = 	2;
	condition	 = 	DIA_NASZ_326_Domenic_who_Condition;
	information	 = 	DIA_NASZ_326_Domenic_who_Info;
	permanent	 = 	FALSE;
	description	 =	"Kim jeste�?";
};

func int DIA_NASZ_326_Domenic_who_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_326_Domenic_who_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_who_55_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_who_03_01"); //Nazywam si� Domenic. Specjalizuj� si� w kusznictwie, a dobrych strzelc�w nigdy nie za wielu.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_who_03_02"); //Jak�e wygl�da�by aborda� bez ostrza�u z armat i gradu be�t�w?

};

///////////////////////////////////////////////////////////////////////
//	Info Help
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_help		(C_INFO)
{
	npc		 = 	NASZ_326_Domenic;
	nr		 = 	3;
	condition	 = 	DIA_NASZ_326_Domenic_help_Condition;
	information	 = 	DIA_NASZ_326_Domenic_help_Info;
	permanent	 = 	FALSE;
	description	 =	"Mog� ci jako� pom�c?";
};

func int DIA_NASZ_326_Domenic_help_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_326_Domenic_help_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_help_55_00"); //Mog� ci jako� pom�c?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_01"); //Je�li masz wi�cej czasu ode mnie, to tak.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_02"); //Kiedy ch�opcy stawiali palisad�, ja i dw�ch innych kolesi, poszli�my rozejrze� si� po okolicy. Do�� szybko si� roz��czyli�my: Ja pobieg�em na wsch�d st�d, a oni na p�noc.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_03"); //Ustrzeli�em kilka dzik�w i po ka�dym popi�em porz�dnego �yka ginu. Nagle zorientowa�em si�, �e zgubi�em jedn� ze swoich kusz... Pewnie zostawi�em j� przy jakim� pniaku, przy kt�rym siedzia�em.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_04"); //Nie odchodzi�em zbyt daleko, powinna by� gdzie� w tym zagajniku obok obozu.
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_help_03_05"); //Czemu sam jej nie poszukasz, skoro to ca�kiem blisko?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_06"); //Widzisz, jeste� pierwsz� osob�, kt�ra o tym wie. Zwykle nie�atwo mnie przepi�, wi�c nie mog� powiedzie� innym ch�opcom, �e nawali�em si� i zgubi�em kusz�!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_07"); //Co, gdyby Monk zobaczy�, �e szukam w lesie kuszy? Przynie� mi kusz�, a zap�ac� ci za fatyg�.

	Wld_InsertItem (ItNa_Kusza_Domenic,"FP_NASZ_KUSZA_DOMENIC");
	
	Log_CreateTopic (TOPIC_Domenic_kusza, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Domenic_kusza, LOG_RUNNING);
	B_LogEntry (TOPIC_Domenic_kusza, "Bandyta Domenic zgubi� swoj� kusz� podczas w�dr�wki. Spodziewa si�, �e kusza le�y gdzie� w niewielkim lesie na wsch�d od ich obozu. Mam znale�� jego bro� i mu j� odda�.");

};

///////////////////////////////////////////////////////////////////////
//	Info HelpDone
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_helpdone		(C_INFO)
{
	npc		 = 	NASZ_326_Domenic;
	nr		 = 	4;
	condition	 = 	DIA_NASZ_326_Domenic_helpdone_Condition;
	information	 = 	DIA_NASZ_326_Domenic_helpdone_Info;
	permanent	 = 	FALSE;
	description	 =	"Znalaz�em twoj� kusz�.";
};

func int DIA_NASZ_326_Domenic_helpdone_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_326_Domenic_help) 
		&& npc_hasitems (other, ItNa_Kusza_Domenic) >= 1)
	{
		return TRUE;
	};
};

func void DIA_NASZ_326_Domenic_helpdone_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_helpdone_55_00"); //Znalaz�em twoj� kusz�.

	B_giveinvitems (other, self, ItNa_Kusza_Domenic, 1);

	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_01"); //A niech ci�! Gdzie by�a?
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_helpdone_03_02"); //Tak jak si� spodziewa�e�, le�a�a obok kt�rego� pnia. Jest troch� brudna od wymiocin, ale umy� musisz j� samemu.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_03"); //Zajm� si� tym od razu! Dzi�ki!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_04"); //We� to z�oto. Nie potrafi� inaczej wyrazi� swojej wdzi�czno�ci.

	Createinvitems (self, ItMi_Gold, 130);
	B_giveinvitems (self, other, ItMi_Gold, 130);

	B_LogEntry (TOPIC_Domenic_kusza, "Odda�em kusz� Domenicowi.");
	Log_SetTopicStatus (TOPIC_Domenic_kusza, LOG_SUCCESS);
	B_GivePlayerXP (400);
	DodajReputacje (5, REP_BANDYCI);

};

///////////////////////////////////////////////////////////////////////
//	Info OdwracanieUwagi
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_326_Domenic_OdwracanieUwagi		(C_INFO)
{
	npc		 	 = 	NASZ_326_Domenic;
	nr		 	 = 	4;
	condition	 = 	DIA_NASZ_326_Domenic_OdwracanieUwagi_Condition;
	information	 = 	DIA_NASZ_326_Domenic_OdwracanieUwagi_Info;
	permanent	 = 	FALSE;
	description	 =	"Hej, patrz! Dziki tutaj lec�!";
};

func int DIA_NASZ_326_Domenic_OdwracanieUwagi_Condition ()
{
	if (MIS_Psikusy_Ready > 0)
	&& ((Wld_IsTime(22,00,00,00)) || (Wld_IsTime(00,00,03,00)))
	{
		return TRUE;
	};
};

func void DIA_NASZ_326_Domenic_OdwracanieUwagi_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_OdwracanieUwagi_55_00"); //Hej, patrz! Dziki tutaj lec�!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_OdwracanieUwagi_03_01"); //Co, gdzie?
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_OdwracanieUwagi_55_02"); //Tam, z lasu. Le� tam i je ustrzel.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_OdwracanieUwagi_03_03"); //Zaraz si� ich pozb�d�.
	
	MIS_Psikusy_Domenic_Odlecial = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (NASZ_326_Domenic, "Odwrocenie");
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_326_Domenic_PICKPOCKET (C_INFO)
{
	npc			= NASZ_326_Domenic;
	nr			= 900;
	condition	= DIA_NASZ_326_Domenic_PICKPOCKET_Condition;
	information	= DIA_NASZ_326_Domenic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_326_Domenic_PICKPOCKET_Condition()
{
	C_Beklauen (34);
};
 
FUNC VOID DIA_NASZ_326_Domenic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_326_Domenic_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_326_Domenic_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_326_Domenic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_326_Domenic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_326_Domenic_PICKPOCKET_DoIt);
};

func void DIA_NASZ_326_Domenic_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Bolt,52);
	
	Info_ClearChoices (DIA_NASZ_326_Domenic_PICKPOCKET);
};
	
func void DIA_NASZ_326_Domenic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_326_Domenic_PICKPOCKET);
};