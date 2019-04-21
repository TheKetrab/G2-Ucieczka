//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_EXIT   (C_INFO)
{
	npc         = NASZ_216_Aran;
	nr          = 999;
	condition   = DIA_NASZ_216_Aran_EXIT_Condition;
	information = DIA_NASZ_216_Aran_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_216_Aran_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_216_Aran_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_siema   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 1;
 	condition   = DIA_NASZ_216_Aran_siema_Condition;
 	information = DIA_NASZ_216_Aran_siema_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_216_Aran_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_216_Aran_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_siema_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_216_Aran_siema_55_01"); //Dogl¹dam orków. W razie, gdybym zobaczy³, ¿e przegrupowuj¹ si³y albo buduj¹ maszyny oblê¿nicze, mam podnieœæ alarm.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_siema_15_02"); //Orkowie wiedz¹, ¿e za t¹ gór¹ macie swój obóz?
	AI_Output (self, other,"DIA_NASZ_216_Aran_siema_55_03"); //Nie s¹dzê. Te bezmyœlne istoty chyba nie zorientowa³y siê, ¿e ten ogieñ w górze, to nie ¿adne pochodnie, tylko ogniska przy których reszta spêdza czas.
	
};

//*********************************************************************
//	         Armor
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_armor   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 2;
 	condition   = DIA_NASZ_216_Aran_armor_Condition;
 	information = DIA_NASZ_216_Aran_armor_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_216_Aran_armor_Condition()	
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_armor_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_armor_15_00"); //Niez³a zbroja.
	AI_Output (self, other,"DIA_NASZ_216_Aran_armor_55_01"); //To prawda. Chroni przed k³ami wilków, a nawet odbija niektóre strza³y. Do tego jest bardzo lekka, wiêc w razie zagro¿enia mo¿na braæ nogi za pas.
	AI_Output (self, other,"DIA_NASZ_216_Aran_armor_55_02"); //Jej jedyny minus to brak twardych czêœci na kolanach i w ³okciach. Hunt mówi³, ¿e jest na to rada, ale myœliwi przynosz¹ mu zbyt ma³o skór trolli, ¿eby móg³ z³o¿yæ wystarczaj¹co gruby i rozci¹gliwy materia³.
};

//*********************************************************************
//	         Quest
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_quest   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 3;
 	condition   = DIA_NASZ_216_Aran_quest_Condition;
 	information = DIA_NASZ_216_Aran_quest_Info;
 	permanent   = FALSE;
 	description = "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_NASZ_216_Aran_quest_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_216_Aran_quest_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_00"); //Mogê coœ dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_01"); //Oczywiœcie. Jestem tutaj sam ju¿ bardzo d³ugo. Nudzê siê.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_02"); //Ale obóz jest ledwie kilkadziesi¹t metrów wy¿ej.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_03"); //Otó¿ to! S³yszê ich rozmowy, œmiechy. Niekiedy wyczuwam nawet zapach alkoholu. Wyobra¿asz sobie, jak bardzo nie podoba mi siê warta w tym miejscu?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_04"); //Goth, który stoi przy g³ównej bramie mo¿e przynajmniej po¿artowaæ z innymi myœliwymi.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_05"); //Dlaczego nie zamienicie siê miejscem na jakiœ czas?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_06"); //To niemo¿liwe. Goth nie jest tak dobrym strzelcem, jak ja. Gdy przed g³ównym wejœciem pojawi siê grupa zêbaczy, wystarczy zamkn¹æ bramê.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_07"); //Œcie¿ka z tej strony nie jest broniona, wiêc musi staæ tu ktoœ, kto ka¿d¹ strza³ê wpakuje bestii prosto do paszczy. Rozkazy Gestatha s¹ jasne dla wszystkich.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_08"); //Denerwuje mnie to. Wiem, ¿e inni s¹ blisko, a nie mogê z nikim pogadaæ.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_09"); //IdŸ do Gestatha i poproœ, by przys³a³ mi kogoœ do pomocy.

	Log_CreateTopic (TOPIC_Aran_quest, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_quest, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_quest, "Aran twierdzi, ¿e jest samotny. Poprosi³ mnie, bym powiedzia³ Gestathowi, ¿e chce mieæ towarzystwo.");
};

//*********************************************************************
//	         Zadowolony
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_Zadowolony   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 4;
 	condition   = DIA_NASZ_216_Aran_Zadowolony_Condition;
 	information = DIA_NASZ_216_Aran_Zadowolony_Info;
 	permanent   = FALSE;
 	description = "Zadowolony z nowego towarzysza?";
};

FUNC INT DIA_NASZ_216_Aran_Zadowolony_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_225_Wrzod_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_Zadowolony_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_Zadowolony_15_00"); //Zadowolony z nowego towarzysza?
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_01"); //Pewnie! Wolê, ¿eby ktoœ opowiada³ o samych pierdo³ach, ni¿ siedzieæ tu sam jak ko³ek.
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_02"); //Pozwól, ¿e oka¿ê ci swoj¹ wdziêcznoœæ. Snaf nie przynosi mi swoich obiadów, wiêc gotujê sam. Mam specjalny swój przepis.
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_03"); //WeŸ go sobie, ugotuj to i zjedz prawdziwe jad³o.

	CreateInvItems(self,ItNa_Przepis_PrzysmakMysliwych,1);
	B_GiveInvItems(self,other,ItNa_Przepis_PrzysmakMysliwych,1);
	
	B_GivePlayerXP (25);
};

var int ARAN_NOGA;
var int ARAN_QUESTKAP3;
//*********************************************************************
//	         QuestKapi3
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_QuestKapi3   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 5;
 	condition   = DIA_NASZ_216_Aran_QuestKapi3_Condition;
 	information = DIA_NASZ_216_Aran_QuestKapi3_Info;
 	permanent   = FALSE;
 	description = "Jakoœ mniej tych orków.";
};

FUNC INT DIA_NASZ_216_Aran_QuestKapi3_Condition()	
{
	if (KAPITEL >= 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_QuestKapi3_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_QuestKapi3_15_00"); //Jakoœ mniej tych orków.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_01"); //Rzuca siê to w oczy, no nie? Kilka dni temu zdecydowana wiêkszoœæ z nich przesunê³a siê na przody zamku.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_03"); //Nie mam pojêcia, czemu to zrobili, ale nadarza siê œwietna okazja do przetrz¹œniêcia po³udniowego obozu pod zamkiem.
	AI_Output (other, self,"DIA_NASZ_216_Aran_QuestKapi3_55_04"); //Skoro taka sytuacja trwa ju¿ kilka dni, to dlaczego sam siê tym nie zaj¹³eœ?
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_05"); //A widzisz, mam problem. W³aœnie kilka dni temu zacz¹³ mi doskwieraæ ból nogi. To na pewno przez tê zbrojê. Ugniata mnie w pachwinie.
	AI_Output (other, self,"DIA_NASZ_216_Aran_QuestKapi3_55_06"); //Mogê siê na coœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_07"); //Udaj siê do orkowego obozu z tej strony zamku i przeszukaj go. Ewentualnie idŸ do Kirgo i przynieœ mi jakieœ lekarstwo.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_08"); //Wtedy razem wybierzemy siê do obozu orków.

	Wld_InsertItem (ItNA_List_AranOrkowie,"NASZ_ZAMEK_FP_ARAN");

	Log_CreateTopic (TOPIC_Aran_QuestKapi3, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_QuestKapi3, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_QuestKapi3, "Orkowie przenieœli siê na przody zamku. Pojawia siê wiêc okazja na przeszukanie obozu pod po³udniowym murem zamku.");

	Log_CreateTopic (TOPIC_Aran_noga, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_noga, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_noga, "Arana bardzo boli noga. Muszê za³atwiæ mu od Kirgo lekarstwo.");
};

//*********************************************************************
//	         HaveLek
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_HaveLek   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 6;
 	condition   = DIA_NASZ_216_Aran_HaveLek_Condition;
 	information = DIA_NASZ_216_Aran_HaveLek_Info;
 	permanent   = FALSE;
 	description = "Mam dla ciebie lekarstwo.";
};

FUNC INT DIA_NASZ_216_Aran_HaveLek_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_aranok)
		&& npc_hasitems (other, ItNa_Aran_Lekarstwo) >=1) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_HaveLek_Info()
{
	LEKARSTWO_NIEZABIJA = TRUE;

	AI_Output (other, self,"DIA_NASZ_216_Aran_HaveLek_15_00"); //Mam dla ciebie lekarstwo, pij.
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveLek_15_01"); //Zobaczymy, czy mi to pomo¿e.

	B_giveinvitems (other, self, ItNa_Aran_Lekarstwo, 1);	
	AI_StopProcessInfos (self);
	B_UseItem (self, ItNa_Aran_Lekarstwo);
	
	B_LogEntry (TOPIC_Aran_noga, "Aran pad³ na ziemiê... Cholera, co jest?!");
};

//*********************************************************************
//	         AreYouOk
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_AreYouOk   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 7;
 	condition   = DIA_NASZ_216_Aran_AreYouOk_Condition;
 	information = DIA_NASZ_216_Aran_AreYouOk_Info;
 	permanent   = FALSE;
 	description = "Wszystko w porz¹dku?";
};

FUNC INT DIA_NASZ_216_Aran_AreYouOk_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_HaveLek))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_AreYouOk_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_AreYouOk_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other,"DIA_NASZ_216_Aran_AreYouOk_55_01"); //Ah... Tak, tylko jestem strasznie s³aby.
	B_giveinvitems (other, self, ItNa_Aran_Lekarstwo, 1);

	ARAN_NOGA = TRUE;
	B_LogEntry (TOPIC_Aran_noga, "Szczêœliwie nic siê nie sta³o. Noga przesta³a boleæ stra¿nika, jest tylko strasznie s³aby.");
	Log_SetTopicStatus (TOPIC_Aran_noga, LOG_SUCCESS);
	B_GivePlayerXP (700);
	DodajReputacje (2, REP_MYSLIWI);
};

//*********************************************************************
//	         GoKillOrc
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_GoKillOrc   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 7;
 	condition   = DIA_NASZ_216_Aran_GoKillOrc_Condition;
 	information = DIA_NASZ_216_Aran_GoKillOrc_Info;
 	permanent   = FALSE;
 	description = "ChodŸ ze mn¹ przeszukaæ orkowy obóz.";
};

FUNC INT DIA_NASZ_216_Aran_GoKillOrc_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_HaveLek)) && (ARAN_QUESTKAP3 == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_GoKillOrc_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_GoKillOrc_15_00"); //ChodŸ ze mn¹ przeszukaæ orkowe namioty.
	AI_Output (self, other,"DIA_NASZ_216_Aran_GoKillOrc_55_01"); //Obawiam siê, ¿e to niemo¿liwe. Noga przesta³a boleæ, ale jetem strasznie s³aby. Niezdolny do walki.
};


//*********************************************************************
//	         HaveList
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_HaveList   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 8;
 	condition   = DIA_NASZ_216_Aran_HaveList_Condition;
 	information = DIA_NASZ_216_Aran_HaveList_Info;
 	permanent   = FALSE;
 	description = "Znalaz³em taki papier.";
};

FUNC INT DIA_NASZ_216_Aran_HaveList_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_QuestKapi3)
		&& npc_hasitems (other, ItNa_List_AranOrkowie) >=1) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_HaveList_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_HaveList_15_00"); //Znalaz³em taki papier.
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveList_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItNa_List_AranOrkowie, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveList_55_02"); //Niewiele z tego rozumiem. Jest tu napisane coœ o palisadzie. Spróbujê to rozgryŸæ jeszcze póŸniej.

	ARAN_QUESTKAP3 = TRUE;
	B_LogEntry (TOPIC_Aran_QuestKapi3, "Zanios³em notatkê Aranowi.");
	Log_SetTopicStatus (TOPIC_Aran_QuestKapi3, LOG_SUCCESS);
	B_GivePlayerXP (700);
	DodajReputacje (2, REP_MYSLIWI);
};

var int ARAN_POSZEDL;
//*********************************************************************
//	         GoToKeroloth
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_GoToKeroloth   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 9;
 	condition   = DIA_NASZ_216_Aran_GoToKeroloth_Condition;
 	information = DIA_NASZ_216_Aran_GoToKeroloth_Info;
 	permanent   = TRUE;
 	description = "Musisz udaæ siê do Kerolotha.";
};

FUNC INT DIA_NASZ_216_Aran_GoToKeroloth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (ARAN_POSZEDL == FALSE)) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_GoToKeroloth_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_GoToKeroloth_15_00"); //Musisz udaæ siê do Kerolotha.

	if ((ARAN_QUESTKAP3 == FALSE) && (ARAN_NOGA == FALSE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_01"); //Najpierw muszê zaj¹æ siê swoimi sprawami.
	};

	if ((ARAN_QUESTKAP3 == TRUE) && (ARAN_NOGA == FALSE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_02"); //Niby obóz przeszukany, ale noga tak mnie boli, ¿e nie jestem w stanie chodziæ.
	};

	if ((ARAN_QUESTKAP3 == FALSE) && (ARAN_NOGA == TRUE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_03"); //Co prawda za¿egnaliœmy problem mojej nogi, ale nie ruszê siê st¹d bez przeszukania orkowego obozu.
	};

	if ((ARAN_QUESTKAP3 == TRUE) && (ARAN_NOGA == TRUE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_04"); //W porz¹dku. Docz³apiê siê tam jakoœ, a potem mo¿e odzykam si³y.
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_05"); //Gdzie mam iœæ?
		AI_Output (other, self,"DIA_NASZ_216_Aran_GoToKeroloth_55_06"); //Do Kanionu Trolli.
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_07"); //Dawno mnie tam nie by³o. Wyruszam natychmiast.

		B_GivePlayerXP (100);
		Npc_ExchangeRoutine (self, "Twierdza");
		B_LogEntry (TOPIC_Keroloth_pomoc, "Aran uda³ siê do twierdzy.");
		ARAN_POSZEDL = TRUE;
		KerolothMysliwi = KerolothMysliwi + 1;
	};

};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_AmmannQuest   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 10;
 	condition   = DIA_NASZ_216_Aran_AmmannQuest_Condition;
 	information = DIA_NASZ_216_Aran_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_216_Aran_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_216_Aran_AmmannQuest_15_01"); //Bije od niego jakaœ magiczna aura, dziêki której odzyskam si³y? Ta noga strasznie wykoñczy³a mój organizm.
	AI_Output (other, self,"DIA_NASZ_216_Aran_AmmannQuest_15_02"); //To bardzo prawdopodobne.
	AI_Output (self, other,"DIA_NASZ_216_Aran_AmmannQuest_15_03"); //W takim razie dziêki, przyda mi siê.

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda³em wszystkie pierœcienie.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);
	};

};

//*********************************************************************
//	Info InTwierdza
//*********************************************************************
INSTANCE DIA_NASZ_216_Aran_InTwierdza   (C_INFO)
{
	npc         = NASZ_216_Aran;
 	nr          = 31;
 	condition   = DIA_NASZ_216_Aran_InTwierdza_Condition;
 	information = DIA_NASZ_216_Aran_InTwierdza_Info;
 	permanent   = TRUE;
	description = "Jak noga, boli?";
};

FUNC INT DIA_NASZ_216_Aran_InTwierdza_Condition()	
{
	if (KAPITEL == 3) && (Npc_GetDistToWP	(self, "NASZ_TWIERDZA_16") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_216_Aran_InTwierdza_Info()
{
	AI_Output (other, self,"DIA_NASZ_216_Aran_InTwierdza_55_00"); //Jak noga, boli?
	AI_Output (self, other,"DIA_NASZ_216_Aran_InTwierdza_55_01"); //Nie boli, ale wci¹¿ jestem bardzo s³aby.
	AI_Output (self, other,"DIA_NASZ_216_Aran_InTwierdza_55_02"); //Mam nadziejê, ¿e to piek³o w koñcu siê skoñczy.

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_216_Aran_PICKPOCKET (C_INFO)
{
	npc			= NASZ_216_Aran;
	nr			= 900;
	condition	= DIA_NASZ_216_Aran_PICKPOCKET_Condition;
	information	= DIA_NASZ_216_Aran_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_216_Aran_PICKPOCKET_Condition()
{
	C_Beklauen (54);
};
 
FUNC VOID DIA_NASZ_216_Aran_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_216_Aran_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_216_Aran_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_216_Aran_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_216_Aran_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_216_Aran_PICKPOCKET_DoIt);
};

func void DIA_NASZ_216_Aran_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Health_02,4);
	
	Info_ClearChoices (DIA_NASZ_216_Aran_PICKPOCKET);
};
	
func void DIA_NASZ_216_Aran_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_216_Aran_PICKPOCKET);
};