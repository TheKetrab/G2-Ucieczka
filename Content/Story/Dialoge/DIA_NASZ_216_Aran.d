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
	AI_Output (self, other,"DIA_NASZ_216_Aran_siema_55_01"); //Dogl�dam ork�w. W razie, gdybym zobaczy�, �e przegrupowuj� si�y albo buduj� maszyny obl�nicze, mam podnie�� alarm.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_siema_15_02"); //Orkowie wiedz�, �e za t� g�r� macie sw�j ob�z?
	AI_Output (self, other,"DIA_NASZ_216_Aran_siema_55_03"); //Nie s�dz�. Te bezmy�lne istoty chyba nie zorientowa�y si�, �e ten ogie� w g�rze, to nie �adne pochodnie, tylko ogniska przy kt�rych reszta sp�dza czas.
	
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
	AI_Output (other,self ,"DIA_NASZ_216_Aran_armor_15_00"); //Niez�a zbroja.
	AI_Output (self, other,"DIA_NASZ_216_Aran_armor_55_01"); //To prawda. Chroni przed k�ami wilk�w, a nawet odbija niekt�re strza�y. Do tego jest bardzo lekka, wi�c w razie zagro�enia mo�na bra� nogi za pas.
	AI_Output (self, other,"DIA_NASZ_216_Aran_armor_55_02"); //Jej jedyny minus to brak twardych cz�ci na kolanach i w �okciach. Hunt m�wi�, �e jest na to rada, ale my�liwi przynosz� mu zbyt ma�o sk�r trolli, �eby m�g� z�o�y� wystarczaj�co gruby i rozci�gliwy materia�.
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
 	description = "Mog� co� dla ciebie zrobi�?";
};

FUNC INT DIA_NASZ_216_Aran_quest_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_216_Aran_quest_Info()
{
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_00"); //Mog� co� dla ciebie zrobi�?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_01"); //Oczywi�cie. Jestem tutaj sam ju� bardzo d�ugo. Nudz� si�.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_02"); //Ale ob�z jest ledwie kilkadziesi�t metr�w wy�ej.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_03"); //Ot� to! S�ysz� ich rozmowy, �miechy. Niekiedy wyczuwam nawet zapach alkoholu. Wyobra�asz sobie, jak bardzo nie podoba mi si� warta w tym miejscu?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_04"); //Goth, kt�ry stoi przy g��wnej bramie mo�e przynajmniej po�artowa� z innymi my�liwymi.
	AI_Output (other,self ,"DIA_NASZ_216_Aran_quest_15_05"); //Dlaczego nie zamienicie si� miejscem na jaki� czas?
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_06"); //To niemo�liwe. Goth nie jest tak dobrym strzelcem, jak ja. Gdy przed g��wnym wej�ciem pojawi si� grupa z�baczy, wystarczy zamkn�� bram�.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_07"); //�cie�ka z tej strony nie jest broniona, wi�c musi sta� tu kto�, kto ka�d� strza�� wpakuje bestii prosto do paszczy. Rozkazy Gestatha s� jasne dla wszystkich.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_08"); //Denerwuje mnie to. Wiem, �e inni s� blisko, a nie mog� z nikim pogada�.
	AI_Output (self, other,"DIA_NASZ_216_Aran_quest_55_09"); //Id� do Gestatha i popro�, by przys�a� mi kogo� do pomocy.

	Log_CreateTopic (TOPIC_Aran_quest, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_quest, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_quest, "Aran twierdzi, �e jest samotny. Poprosi� mnie, bym powiedzia� Gestathowi, �e chce mie� towarzystwo.");
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
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_01"); //Pewnie! Wol�, �eby kto� opowiada� o samych pierdo�ach, ni� siedzie� tu sam jak ko�ek.
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_02"); //Pozw�l, �e oka�� ci swoj� wdzi�czno��. Snaf nie przynosi mi swoich obiad�w, wi�c gotuj� sam. Mam specjalny sw�j przepis.
	AI_Output (self, other,"DIA_NASZ_216_Aran_Zadowolony_55_03"); //We� go sobie, ugotuj to i zjedz prawdziwe jad�o.

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
 	description = "Jako� mniej tych ork�w.";
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
	AI_Output (other,self ,"DIA_NASZ_216_Aran_QuestKapi3_15_00"); //Jako� mniej tych ork�w.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_01"); //Rzuca si� to w oczy, no nie? Kilka dni temu zdecydowana wi�kszo�� z nich przesun�a si� na przody zamku.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_03"); //Nie mam poj�cia, czemu to zrobili, ale nadarza si� �wietna okazja do przetrz��ni�cia po�udniowego obozu pod zamkiem.
	AI_Output (other, self,"DIA_NASZ_216_Aran_QuestKapi3_55_04"); //Skoro taka sytuacja trwa ju� kilka dni, to dlaczego sam si� tym nie zaj��e�?
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_05"); //A widzisz, mam problem. W�a�nie kilka dni temu zacz�� mi doskwiera� b�l nogi. To na pewno przez t� zbroj�. Ugniata mnie w pachwinie.
	AI_Output (other, self,"DIA_NASZ_216_Aran_QuestKapi3_55_06"); //Mog� si� na co� przyda�?
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_07"); //Udaj si� do orkowego obozu z tej strony zamku i przeszukaj go. Ewentualnie id� do Kirgo i przynie� mi jakie� lekarstwo.
	AI_Output (self, other,"DIA_NASZ_216_Aran_QuestKapi3_55_08"); //Wtedy razem wybierzemy si� do obozu ork�w.

	Wld_InsertItem (ItNA_List_AranOrkowie,"NASZ_ZAMEK_FP_ARAN");

	Log_CreateTopic (TOPIC_Aran_QuestKapi3, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_QuestKapi3, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_QuestKapi3, "Orkowie przenie�li si� na przody zamku. Pojawia si� wi�c okazja na przeszukanie obozu pod po�udniowym murem zamku.");

	Log_CreateTopic (TOPIC_Aran_noga, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Aran_noga, LOG_RUNNING);
	B_LogEntry (TOPIC_Aran_noga, "Arana bardzo boli noga. Musz� za�atwi� mu od Kirgo lekarstwo.");
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
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveLek_15_01"); //Zobaczymy, czy mi to pomo�e.

	B_giveinvitems (other, self, ItNa_Aran_Lekarstwo, 1);	
	AI_StopProcessInfos (self);
	B_UseItem (self, ItNa_Aran_Lekarstwo);
	
	B_LogEntry (TOPIC_Aran_noga, "Aran pad� na ziemi�... Cholera, co jest?!");
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
 	description = "Wszystko w porz�dku?";
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
	AI_Output (other, self,"DIA_NASZ_216_Aran_AreYouOk_15_00"); //Wszystko w porz�dku?
	AI_Output (self, other,"DIA_NASZ_216_Aran_AreYouOk_55_01"); //Ah... Tak, tylko jestem strasznie s�aby.
	B_giveinvitems (other, self, ItNa_Aran_Lekarstwo, 1);

	ARAN_NOGA = TRUE;
	B_LogEntry (TOPIC_Aran_noga, "Szcz�liwie nic si� nie sta�o. Noga przesta�a bole� stra�nika, jest tylko strasznie s�aby.");
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
 	description = "Chod� ze mn� przeszuka� orkowy ob�z.";
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
	AI_Output (other, self,"DIA_NASZ_216_Aran_GoKillOrc_15_00"); //Chod� ze mn� przeszuka� orkowe namioty.
	AI_Output (self, other,"DIA_NASZ_216_Aran_GoKillOrc_55_01"); //Obawiam si�, �e to niemo�liwe. Noga przesta�a bole�, ale jetem strasznie s�aby. Niezdolny do walki.
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
 	description = "Znalaz�em taki papier.";
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
	AI_Output (other, self,"DIA_NASZ_216_Aran_HaveList_15_00"); //Znalaz�em taki papier.
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveList_55_01"); //Poka�.
	B_giveinvitems (other, self, ItNa_List_AranOrkowie, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_216_Aran_HaveList_55_02"); //Niewiele z tego rozumiem. Jest tu napisane co� o palisadzie. Spr�buj� to rozgry�� jeszcze p�niej.

	ARAN_QUESTKAP3 = TRUE;
	B_LogEntry (TOPIC_Aran_QuestKapi3, "Zanios�em notatk� Aranowi.");
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
 	description = "Musisz uda� si� do Kerolotha.";
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
	AI_Output (other, self,"DIA_NASZ_216_Aran_GoToKeroloth_15_00"); //Musisz uda� si� do Kerolotha.

	if ((ARAN_QUESTKAP3 == FALSE) && (ARAN_NOGA == FALSE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_01"); //Najpierw musz� zaj�� si� swoimi sprawami.
	};

	if ((ARAN_QUESTKAP3 == TRUE) && (ARAN_NOGA == FALSE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_02"); //Niby ob�z przeszukany, ale noga tak mnie boli, �e nie jestem w stanie chodzi�.
	};

	if ((ARAN_QUESTKAP3 == FALSE) && (ARAN_NOGA == TRUE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_03"); //Co prawda za�egnali�my problem mojej nogi, ale nie rusz� si� st�d bez przeszukania orkowego obozu.
	};

	if ((ARAN_QUESTKAP3 == TRUE) && (ARAN_NOGA == TRUE)) {
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_04"); //W porz�dku. Docz�api� si� tam jako�, a potem mo�e odzykam si�y.
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_05"); //Gdzie mam i��?
		AI_Output (other, self,"DIA_NASZ_216_Aran_GoToKeroloth_55_06"); //Do Kanionu Trolli.
		AI_Output (self, other,"DIA_NASZ_216_Aran_GoToKeroloth_55_07"); //Dawno mnie tam nie by�o. Wyruszam natychmiast.

		B_GivePlayerXP (100);
		Npc_ExchangeRoutine (self, "Twierdza");
		B_LogEntry (TOPIC_Keroloth_pomoc, "Aran uda� si� do twierdzy.");
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
 	description = "We� ten pier�cie�.";
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
	AI_Output (other, self,"DIA_NASZ_216_Aran_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_216_Aran_AmmannQuest_15_01"); //Bije od niego jaka� magiczna aura, dzi�ki kt�rej odzyskam si�y? Ta noga strasznie wyko�czy�a m�j organizm.
	AI_Output (other, self,"DIA_NASZ_216_Aran_AmmannQuest_15_02"); //To bardzo prawdopodobne.
	AI_Output (self, other,"DIA_NASZ_216_Aran_AmmannQuest_15_03"); //W takim razie dzi�ki, przyda mi si�.

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda�em wszystkie pier�cienie.");
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
	AI_Output (self, other,"DIA_NASZ_216_Aran_InTwierdza_55_01"); //Nie boli, ale wci�� jestem bardzo s�aby.
	AI_Output (self, other,"DIA_NASZ_216_Aran_InTwierdza_55_02"); //Mam nadziej�, �e to piek�o w ko�cu si� sko�czy.

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