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
	description	 =	"Kim jesteœ?";
};

func int DIA_NASZ_326_Domenic_who_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_326_Domenic_who_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_who_55_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_who_03_01"); //Nazywam siê Domenic. Specjalizujê siê w kusznictwie, a dobrych strzelców nigdy nie za wielu.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_who_03_02"); //Jak¿e wygl¹da³by aborda¿ bez ostrza³u z armat i gradu be³tów?

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
	description	 =	"Mogê ci jakoœ pomóc?";
};

func int DIA_NASZ_326_Domenic_help_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_326_Domenic_help_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_help_55_00"); //Mogê ci jakoœ pomóc?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_01"); //Jeœli masz wiêcej czasu ode mnie, to tak.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_02"); //Kiedy ch³opcy stawiali palisadê, ja i dwóch innych kolesi, poszliœmy rozejrzeæ siê po okolicy. Doœæ szybko siê roz³¹czyliœmy: Ja pobieg³em na wschód st¹d, a oni na pó³noc.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_03"); //Ustrzeli³em kilka dzików i po ka¿dym popi³em porz¹dnego ³yka ginu. Nagle zorientowa³em siê, ¿e zgubi³em jedn¹ ze swoich kusz... Pewnie zostawi³em j¹ przy jakimœ pniaku, przy którym siedzia³em.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_04"); //Nie odchodzi³em zbyt daleko, powinna byæ gdzieœ w tym zagajniku obok obozu.
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_help_03_05"); //Czemu sam jej nie poszukasz, skoro to ca³kiem blisko?
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_06"); //Widzisz, jesteœ pierwsz¹ osob¹, która o tym wie. Zwykle nie³atwo mnie przepiæ, wiêc nie mogê powiedzieæ innym ch³opcom, ¿e nawali³em siê i zgubi³em kuszê!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_help_03_07"); //Co, gdyby Monk zobaczy³, ¿e szukam w lesie kuszy? Przynieœ mi kuszê, a zap³acê ci za fatygê.

	Wld_InsertItem (ItNa_Kusza_Domenic,"FP_NASZ_KUSZA_DOMENIC");
	
	Log_CreateTopic (TOPIC_Domenic_kusza, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Domenic_kusza, LOG_RUNNING);
	B_LogEntry (TOPIC_Domenic_kusza, "Bandyta Domenic zgubi³ swoj¹ kuszê podczas wêdrówki. Spodziewa siê, ¿e kusza le¿y gdzieœ w niewielkim lesie na wschód od ich obozu. Mam znaleŸæ jego broñ i mu j¹ oddaæ.");

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
	description	 =	"Znalaz³em twoj¹ kuszê.";
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
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_helpdone_55_00"); //Znalaz³em twoj¹ kuszê.

	B_giveinvitems (other, self, ItNa_Kusza_Domenic, 1);

	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_01"); //A niech ciê! Gdzie by³a?
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_helpdone_03_02"); //Tak jak siê spodziewa³eœ, le¿a³a obok któregoœ pnia. Jest trochê brudna od wymiocin, ale umyæ musisz j¹ samemu.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_03"); //Zajmê siê tym od razu! Dziêki!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_helpdone_03_04"); //WeŸ to z³oto. Nie potrafiê inaczej wyraziæ swojej wdziêcznoœci.

	Createinvitems (self, ItMi_Gold, 130);
	B_giveinvitems (self, other, ItMi_Gold, 130);

	B_LogEntry (TOPIC_Domenic_kusza, "Odda³em kuszê Domenicowi.");
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
	description	 =	"Hej, patrz! Dziki tutaj lec¹!";
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
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_OdwracanieUwagi_55_00"); //Hej, patrz! Dziki tutaj lec¹!
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_OdwracanieUwagi_03_01"); //Co, gdzie?
	AI_Output			(other, self, "DIA_NASZ_326_Domenic_OdwracanieUwagi_55_02"); //Tam, z lasu. Leæ tam i je ustrzel.
	AI_Output			(self, other, "DIA_NASZ_326_Domenic_OdwracanieUwagi_03_03"); //Zaraz siê ich pozbêdê.
	
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