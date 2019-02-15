var int KjornNieBedzieUczylZrecznosci;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_EXIT   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
	nr          = 999;
	condition   = DIA_NASZ_116_Kjorn_EXIT_Condition;
	information = DIA_NASZ_116_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_116_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_116_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_siema   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 1;
 	condition   = DIA_NASZ_116_Kjorn_siema_Condition;
 	information = DIA_NASZ_116_Kjorn_siema_Info;
 	permanent   = FALSE;
 	description = "Co porabiasz?";
};

FUNC INT DIA_NASZ_116_Kjorn_siema_Condition()
{
	if (Npc_IsInState (self, ZS_Talk)) && (Kurgan_walka<2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_siema_15_00"); //Co porabiasz?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_01"); //Czekam.
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_siema_15_02"); //Czekasz?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_03"); //Czekam, a¿ jakiœ œmia³ek podejmie siê walki ze mn¹. Walczy³eœ ju¿ na arenie?
	
	if (npc_knowsinfo (other, DIA_NASZ_117_Fed_arena)) {
		AI_Output (other, self,"DIA_NASZ_116_Kjorn_siema_55_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_05"); //Œwietnie. W takim razie niebawem mo¿e skrzy¿ujemy miecze.
	}
	else {
		AI_Output (other, self,"DIA_NASZ_116_Kjorn_siema_55_06"); //Nie.
		AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_07"); //Pogadaj z Kurganem. To on organizuje walki.
	};
};

//*********************************************************************
//	PlsHelp
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_PlsHelp   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 2;
 	condition   = DIA_NASZ_116_Kjorn_PlsHelp_Condition;
 	information = DIA_NASZ_116_Kjorn_PlsHelp_Info;
 	permanent   = FALSE;
 	description = "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_NASZ_116_Kjorn_PlsHelp_Condition()
{
	return TRUE;

};

FUNC VOID DIA_NASZ_116_Kjorn_PlsHelp_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_PlsHelp_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PlsHelp_55_01"); //Walka lekkim sztyletem wymaga przede wszystkim precyzji.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PlsHelp_55_02"); //Nie jestem mistrzem œwiata, ale mogê poprawiæ nieco twoj¹ zrêcznoœæ.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Z Kjornem mogê pracowaæ nad zrêcznoœci¹.");
};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 4;
 	condition   = DIA_NASZ_116_Kjorn_GoToRenegaci_Condition;
 	information = DIA_NASZ_116_Kjorn_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "ChodŸ ze mn¹. Pora zrobiæ coœ ciekawszego ni¿ trening.";
};

FUNC INT DIA_NASZ_116_Kjorn_GoToRenegaci_Condition()	
{
	if (KerolothRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_GoToRenegaci_15_00"); //ChodŸ ze mn¹. Pora zrobiæ coœ ciekawszego ni¿ trening.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_GoToRenegaci_55_01"); //Zrób mi niespodziankê i nie mów o co chodzi. Idê w ciemno.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_GoToRenegaci_55_02"); //Wszystko jest ciekawsze ni¿ gnicie w tym zasranym obozie.
	
	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_116_Kjorn,1);
};



//*********************************************************************
//	Arena 
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_arena   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 3;
 	condition   = DIA_NASZ_116_Kjorn_arena_Condition;
 	information = DIA_NASZ_116_Kjorn_arena_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_116_Kjorn_arena_Condition()
{
	if ((Kurgan_walka==2)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_LOWCY_ARENA_01")
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_arena_Info()
{
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_arena_55_00"); //W koñcu siê doczeka³em! Walcz.

	KJORN_WALCZY = TRUE;
	Arena_Opuszczasz_Raz = FALSE;
	Arena_Przegrana_Raz = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//*********************************************************************
//	After Won
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_afterwon   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 4;
 	condition   = DIA_NASZ_116_Kjorn_afterwon_Condition;
 	information = DIA_NASZ_116_Kjorn_afterwon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_116_Kjorn_afterwon_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_arena)
		&& self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_afterwon_Info()
{
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_afterwon_55_00"); //Gratulujê. Wiesz, tobie chyba bardziej siê przyda.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_afterwon_55_01"); //Trzymaj.

	Createinvitems (self, ItPo_Perm_STR, 1);
	B_Giveinvitems (self, other, ItPo_Perm_STR, 1);
};

//*********************************************************************
//	Teach
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_Teach   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 100;
 	condition   = DIA_NASZ_116_Kjorn_Teach_Condition;
 	information = DIA_NASZ_116_Kjorn_Teach_Info;
 	permanent   = TRUE;
 	description = "Chcê byæ zrêczniejszy.";
};

FUNC INT DIA_NASZ_116_Kjorn_Teach_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_PlsHelp))
	&& (KjornNieBedzieUczylZrecznosci == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_Teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Teach_15_00"); //Chcê byæ zrêczniejszy.

	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);
	
	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};
func void DIA_NASZ_116_Kjorn_TEACH_BACK()
{
	Info_ClearChoices (DIA_NASZ_116_Kjorn_TEACH);
};
func void DIA_NASZ_116_Kjorn_TEACH_1()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};
func void DIA_NASZ_116_Kjorn_TEACH_5()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};

func void DIA_NASZ_116_Kjorn_TEACH_1High()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};
func void DIA_NASZ_116_Kjorn_TEACH_5High()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};


//*********************************************************************
//			PiecBraciQuest
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_PiecBraciQuest   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 41;
 	condition   = DIA_NASZ_116_Kjorn_PiecBraciQuest_Condition;
 	information = DIA_NASZ_116_Kjorn_PiecBraciQuest_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_116_Kjorn_PiecBraciQuest_Condition()
{
	if (KAPITEL == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_PiecBraciQuest_Info()
{
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_00"); //Hej, ty! Poczekaj.
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_01"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_02"); //Pamiêtasz jak szturmowaliœmy razem zamek? Wys³aliœmy wszystkich orków do Beliara.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_03"); //Gdy póŸniej wracaliœmy do twierdzy, poszed³em siê odlaæ.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_04"); //Do Górniczej Doliny przyby³em jako ³owca smoków, a teraz ³apiê cykora na widok orków... Ta wyprawa pokaza³a mi, czym jest strach.
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_05"); //Mów do rzeczy. Nie mam zbyt wiele czasu.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_06"); //No wiêc, gdy siê za³atwia³em, dopatrzy³em, w ziemi jakiœ kawa³ek pergaminu. Zainteresowa³o mnie to, wiêc siêgn¹³em po papier. By³a to mapa.

};

var int KjornOdrzucenie;
var int KjornOkej;
//*********************************************************************
//	Map
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_Map   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 42;
 	condition   = DIA_NASZ_116_Kjorn_Map_Condition;
 	information = DIA_NASZ_116_Kjorn_Map_Info;
 	permanent   = FALSE;
 	description = "Co to za mapa?";
};

FUNC INT DIA_NASZ_116_Kjorn_Map_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_PiecBraciQuest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_Map_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Map_15_00"); //Co to za mapa?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_01"); //WeŸ.
	
	Createinvitems (self, ItNa_Mapa_Bracia, 1);
	B_giveinvitems (self, other, ItNa_Mapa_Bracia, 1);
	
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_02"); //Domyœlam siê, ¿e ta mapa przedstawia ulokowanie miejsc œmierci piêciu braci.
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Map_15_03"); //Jakich piêciu braci?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_04"); //Zanim zdecydowa³em siê zaci¹gn¹æ jako £owca Smoków, sporo czyta³em o Górniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_05"); //Ponoæ przed utworzeniem kolonii karnej, na tych terenach zamieszkiwa³o dzikie plemiê. Prymitywna kultura dzikusów.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_06"); //Mieszkali w jaskiniach w po³udniowo-wschodniej czêœci Górniczej Doliny.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_07"); //Stare ksiêgi wspominaj¹ równie¿ o jakimœ rytuale, w którym z³o¿ono ofiarê z piêciu braci. Ta sama krew w piêciu ró¿nych miejscach. Jakieœ bzdury.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_08"); //Jednak¿e, jeœli ta mapa rzeczywiœce wskazuje po³o¿enia szkieletów ofiarowanych braci, to mo¿na zaryzykowaæ rozwik³anie tej tajemnicy.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_09"); //Co ty na to?

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Map);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Map, "Nie mam czasu na takie bzdury.", DIA_NASZ_116_Kjorn_Map_no);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Map, "Zajmê siê tym.", DIA_NASZ_116_Kjorn_Map_yes);
};

FUNC VOID DIA_NASZ_116_Kjorn_Map_no()
{
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Map_no_55_01"); //Nie mam czasu na takie bzdury.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_no_55_02"); //Gadasz g³upoty... Jak zmienisz zdanie, to wpadnij do mnie.
	KjornOdrzucenie = TRUE;

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Map);
};

FUNC VOID DIA_NASZ_116_Kjorn_Map_yes()
{

	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Map_yes_15_03"); //Zajmê siê tym.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_yes_15_04"); //No dobra, w takim razie ruszaj!

	BraciaMissionReady = TRUE;
	KjornOkej = TRUE;

	Log_CreateTopic (TOPIC_Kjorn_bracia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kjorn_bracia, "Kjorn znalaz³ mapê wskazuj¹c¹ miejsca pochówku piêciu braci, którzy niegdyœ zostali z³o¿eni w ofierze. Muszê udaæ siê tam i znaleŸæ ich szkielety. Mo¿e znajdê przy nich coœ ciekawego?");


	Info_ClearChoices (DIA_NASZ_116_Kjorn_Map);
};

//*********************************************************************
//	IHelpYou
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_IHelpYou   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 43;
 	condition   = DIA_NASZ_116_Kjorn_IHelpYou_Condition;
 	information = DIA_NASZ_116_Kjorn_IHelpYou_Info;
 	permanent   = FALSE;
 	description = "Zdecydowa³em, ¿e ci pomogê.";
};

FUNC INT DIA_NASZ_116_Kjorn_IHelpYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_Map)) && (KjornOdrzucenie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_IHelpYou_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_IHelpYou_15_00"); //Zdecydowa³em, ¿e ci pomogê.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_IHelpYou_55_01"); //No dobra, w takim razie ruszaj!

	Log_CreateTopic (TOPIC_Kjorn_bracia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kjorn_bracia, "Kjorn znalaz³ mapê wskazuj¹c¹ miejsca pochówku piêciu braci, którzy niegdyœ zostali z³o¿eni w ofierze. Muszê udaæ siê tam i znaleŸæ ich szkielety. Mo¿e znajdê przy nich coœ ciekawego?");
	
	BraciaMissionReady = TRUE;
	KjornOkej = TRUE;
	
};

//*********************************************************************
//	HaveBones
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_HaveBones   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 44;
 	condition   = DIA_NASZ_116_Kjorn_HaveBones_Condition;
 	information = DIA_NASZ_116_Kjorn_HaveBones_Info;
 	permanent   = FALSE;
 	description = "Znalaz³em tylko koœci ka¿dego z braci.";
};

FUNC INT DIA_NASZ_116_Kjorn_HaveBones_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_Map)) && (KjornOkej == TRUE) && (npc_hasitems (other, ItNa_KoscBrata) >= 5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_HaveBones_Info()
{
	B_GivePlayerXP(500);

	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_HaveBones_15_00"); //Znalaz³em tylko koœci ka¿dego z braci.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_HaveBones_55_01"); //Zawsze coœ... Zastanówmy siê, czy mo¿e byæ w to zamieszana jakaœ magia?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_HaveBones_55_02"); //Zerknij na mapê, o ile dobrze pamiêtam, to gwiazda, która narysowana jest na mapie, œrodek ma na niewielkim jeziorku pod wodospadem. Spróbuj tam siê udaæ.

	Wld_InsertItem (ItNa_AmuletZRudy,"NASZ_ITEM_BRACIA_6");
	
	B_LogEntry (TOPIC_Kjorn_bracia, "Teraz mam udaæ siê do jeziorka, które jest na œrodku gwiazdy wyznaczonej przez miejsca pochówku braci...");

};

//*********************************************************************
//	Finito
//*********************************************************************
INSTANCE DIA_NASZ_116_Kjorn_Finito   (C_INFO)
{
	npc         = NASZ_116_Kjorn;
 	nr          = 44;
 	condition   = DIA_NASZ_116_Kjorn_Finito_Condition;
 	information = DIA_NASZ_116_Kjorn_Finito_Info;
 	permanent   = FALSE;
 	description = "By³em nad jeziorem.";
};

FUNC INT DIA_NASZ_116_Kjorn_Finito_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_HaveBones)) && (npc_hasitems (other, ItNa_AmuletZRudy) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_15_00"); //By³em nad jeziorem.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_01"); //I jak? Znalaz³eœ tam coœ? Mów szybko!
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Finito_55_02"); //Mo¿na by powiedzieæ, ¿e spotka³em siê z piêcioma braæmi. Ale ju¿ nie tylko z ich koœcmi, a ca³ymi szkieletami.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_03"); //Strzegli jakiegoœ artefaktu?
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Finito_55_04"); //Tak, mieli przy sobie amulet z rudy. Mam go tutaj ze sob¹.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_05"); //To by³oby spe³nienie moich marzeñ! Ile za niego chcesz?
	
		Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Daj mi sto sztuk z³ota.", DIA_NASZ_116_Kjorn_Finito_100);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Daj mi trzysta sztuk z³ota.", DIA_NASZ_116_Kjorn_Finito_300);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Postanowi³em zatrzymaæ go dla siebie.", DIA_NASZ_116_Kjorn_Finito_nothing);

};

func void FinishQuestKjorn(var int mode) {

	if (mode == 1) { // zloto
		Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_SUCCESS);
		B_LogEntry (TOPIC_Kjorn_bracia, "Odsprzeda³em Kjornowi amulet. Niech mu s³u¿y. Z³oto przyda mi siê bardziej.");
		B_GivePlayerXP(700);
	}
	else if (mode == 2) { // zostawienie dla siebie
		Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_SUCCESS);
		B_LogEntry (TOPIC_Kjorn_bracia, "Stwierdzi³em, ¿e zachowam amulet dla siebie. Kjorn powiedzia³, ¿e nie bêdzie ju¿ mnie uczy³ zrêcznoœci, ale có¿... Znajdzie siê ktoœ inny, kto mnie nauczy.");
		B_GivePlayerXP(700);	
	}
	else {
		Print(ConcatStrings("error: FinishQuestKjorn, mode = ",IntToString(mode)));
	};
};


func void KjornSayKeep() {
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_KjornSayKeep_15_01"); //Trzymaj. Nale¿y ci siê.
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_100()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_100_15_00"); //Daj mi sto sztuk z³ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,100);
	B_GiveInvItems(self,other,itmi_gold,100);
	
	FinishQuestKjorn(1);
	
	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_300()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_300_15_00"); //Daj mi trzysta sztuk z³ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,300);
	B_GiveInvItems(self,other,itmi_gold,300);

	FinishQuestKjorn(1);

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_700()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //No dobra, ale daj mi siedemset sztuk z³ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,700);
	B_GiveInvItems(self,other,itmi_gold,700);

	FinishQuestKjorn(1);

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_nothing()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //Postanowi³em zatrzymaæ go dla siebie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_01"); //Przemyœl to, przyjacielu. Naprawdê, bardzo chcia³bym go mieæ.

	Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "No dobra, ale daj mi siedemset sztuk z³ota.", DIA_NASZ_116_Kjorn_Finito_700);
	Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "I tak myœlê, ¿e mi bardziej siê przyda.", DIA_NASZ_116_Kjorn_Finito_nothing2);
};
	
FUNC VOID DIA_NASZ_116_Kjorn_Finito_nothing2()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //I tak myœlê, ¿e mi bardziej siê przyda.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_01"); //A niech ciê... Ten egoizm odwróci siê przeciwko tobie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_02"); //OdejdŸ. I nie licz, ¿e bêdê ciê jeszcze uczy³. Skoro ty nie zrobisz czegoœ dla mnie, to ja nie bêdê robi³ niczego dla ciebie.

	FinishQuestKjorn(2);

	KjornNieBedzieUczylZrecznosci = TRUE;
	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_116_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= NASZ_116_Kjorn;
	nr			= 900;
	condition	= DIA_NASZ_116_Kjorn_PICKPOCKET_Condition;
	information	= DIA_NASZ_116_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_116_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (67);
};
 
FUNC VOID DIA_NASZ_116_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_116_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_116_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_116_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_116_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_116_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_NASZ_116_Kjorn_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Speed,2);
	Info_ClearChoices (DIA_NASZ_116_Kjorn_PICKPOCKET);
};
	
func void DIA_NASZ_116_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_116_Kjorn_PICKPOCKET);
};


