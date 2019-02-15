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
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_03"); //Czekam, a� jaki� �mia�ek podejmie si� walki ze mn�. Walczy�e� ju� na arenie?
	
	if (npc_knowsinfo (other, DIA_NASZ_117_Fed_arena)) {
		AI_Output (other, self,"DIA_NASZ_116_Kjorn_siema_55_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_116_Kjorn_siema_55_05"); //�wietnie. W takim razie niebawem mo�e skrzy�ujemy miecze.
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
 	description = "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_NASZ_116_Kjorn_PlsHelp_Condition()
{
	return TRUE;

};

FUNC VOID DIA_NASZ_116_Kjorn_PlsHelp_Info()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_PlsHelp_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PlsHelp_55_01"); //Walka lekkim sztyletem wymaga przede wszystkim precyzji.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PlsHelp_55_02"); //Nie jestem mistrzem �wiata, ale mog� poprawi� nieco twoj� zr�czno��.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Z Kjornem mog� pracowa� nad zr�czno�ci�.");
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
	description = "Chod� ze mn�. Pora zrobi� co� ciekawszego ni� trening.";
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
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_GoToRenegaci_15_00"); //Chod� ze mn�. Pora zrobi� co� ciekawszego ni� trening.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_GoToRenegaci_55_01"); //Zr�b mi niespodziank� i nie m�w o co chodzi. Id� w ciemno.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_GoToRenegaci_55_02"); //Wszystko jest ciekawsze ni� gnicie w tym zasranym obozie.
	
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
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_arena_55_00"); //W ko�cu si� doczeka�em! Walcz.

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
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_afterwon_55_00"); //Gratuluj�. Wiesz, tobie chyba bardziej si� przyda.
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
 	description = "Chc� by� zr�czniejszy.";
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
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Teach_15_00"); //Chc� by� zr�czniejszy.

	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);
	
	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};
func void DIA_NASZ_116_Kjorn_TEACH_5()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};

func void DIA_NASZ_116_Kjorn_TEACH_1High()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
	};
};
func void DIA_NASZ_116_Kjorn_TEACH_5High()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_116_Kjorn_TEACH);
	
	Info_AddChoice 		(DIA_NASZ_116_Kjorn_TEACH, DIALOG_BACK, DIA_NASZ_116_Kjorn_TEACH_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_116_Kjorn_TEACH, "Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_116_Kjorn_TEACH_5High); };
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
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_02"); //Pami�tasz jak szturmowali�my razem zamek? Wys�ali�my wszystkich ork�w do Beliara.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_03"); //Gdy p�niej wracali�my do twierdzy, poszed�em si� odla�.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_04"); //Do G�rniczej Doliny przyby�em jako �owca smok�w, a teraz �api� cykora na widok ork�w... Ta wyprawa pokaza�a mi, czym jest strach.
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_05"); //M�w do rzeczy. Nie mam zbyt wiele czasu.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_PiecBraciQuest_55_06"); //No wi�c, gdy si� za�atwia�em, dopatrzy�em, w ziemi jaki� kawa�ek pergaminu. Zainteresowa�o mnie to, wi�c si�gn��em po papier. By�a to mapa.

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
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_01"); //We�.
	
	Createinvitems (self, ItNa_Mapa_Bracia, 1);
	B_giveinvitems (self, other, ItNa_Mapa_Bracia, 1);
	
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_02"); //Domy�lam si�, �e ta mapa przedstawia ulokowanie miejsc �mierci pi�ciu braci.
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Map_15_03"); //Jakich pi�ciu braci?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_04"); //Zanim zdecydowa�em si� zaci�gn�� jako �owca Smok�w, sporo czyta�em o G�rniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_05"); //Pono� przed utworzeniem kolonii karnej, na tych terenach zamieszkiwa�o dzikie plemi�. Prymitywna kultura dzikus�w.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_06"); //Mieszkali w jaskiniach w po�udniowo-wschodniej cz�ci G�rniczej Doliny.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_07"); //Stare ksi�gi wspominaj� r�wnie� o jakim� rytuale, w kt�rym z�o�ono ofiar� z pi�ciu braci. Ta sama krew w pi�ciu r�nych miejscach. Jakie� bzdury.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_08"); //Jednak�e, je�li ta mapa rzeczywi�ce wskazuje po�o�enia szkielet�w ofiarowanych braci, to mo�na zaryzykowa� rozwik�anie tej tajemnicy.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_55_09"); //Co ty na to?

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Map);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Map, "Nie mam czasu na takie bzdury.", DIA_NASZ_116_Kjorn_Map_no);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Map, "Zajm� si� tym.", DIA_NASZ_116_Kjorn_Map_yes);
};

FUNC VOID DIA_NASZ_116_Kjorn_Map_no()
{
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Map_no_55_01"); //Nie mam czasu na takie bzdury.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_no_55_02"); //Gadasz g�upoty... Jak zmienisz zdanie, to wpadnij do mnie.
	KjornOdrzucenie = TRUE;

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Map);
};

FUNC VOID DIA_NASZ_116_Kjorn_Map_yes()
{

	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Map_yes_15_03"); //Zajm� si� tym.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Map_yes_15_04"); //No dobra, w takim razie ruszaj!

	BraciaMissionReady = TRUE;
	KjornOkej = TRUE;

	Log_CreateTopic (TOPIC_Kjorn_bracia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kjorn_bracia, "Kjorn znalaz� map� wskazuj�c� miejsca poch�wku pi�ciu braci, kt�rzy niegdy� zostali z�o�eni w ofierze. Musz� uda� si� tam i znale�� ich szkielety. Mo�e znajd� przy nich co� ciekawego?");


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
 	description = "Zdecydowa�em, �e ci pomog�.";
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
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_IHelpYou_15_00"); //Zdecydowa�em, �e ci pomog�.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_IHelpYou_55_01"); //No dobra, w takim razie ruszaj!

	Log_CreateTopic (TOPIC_Kjorn_bracia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kjorn_bracia, "Kjorn znalaz� map� wskazuj�c� miejsca poch�wku pi�ciu braci, kt�rzy niegdy� zostali z�o�eni w ofierze. Musz� uda� si� tam i znale�� ich szkielety. Mo�e znajd� przy nich co� ciekawego?");
	
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
 	description = "Znalaz�em tylko ko�ci ka�dego z braci.";
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

	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_HaveBones_15_00"); //Znalaz�em tylko ko�ci ka�dego z braci.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_HaveBones_55_01"); //Zawsze co�... Zastan�wmy si�, czy mo�e by� w to zamieszana jaka� magia?
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_HaveBones_55_02"); //Zerknij na map�, o ile dobrze pami�tam, to gwiazda, kt�ra narysowana jest na mapie, �rodek ma na niewielkim jeziorku pod wodospadem. Spr�buj tam si� uda�.

	Wld_InsertItem (ItNa_AmuletZRudy,"NASZ_ITEM_BRACIA_6");
	
	B_LogEntry (TOPIC_Kjorn_bracia, "Teraz mam uda� si� do jeziorka, kt�re jest na �rodku gwiazdy wyznaczonej przez miejsca poch�wku braci...");

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
 	description = "By�em nad jeziorem.";
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
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_15_00"); //By�em nad jeziorem.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_01"); //I jak? Znalaz�e� tam co�? M�w szybko!
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Finito_55_02"); //Mo�na by powiedzie�, �e spotka�em si� z pi�cioma bra�mi. Ale ju� nie tylko z ich ko�cmi, a ca�ymi szkieletami.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_03"); //Strzegli jakiego� artefaktu?
	AI_Output (other, self,"DIA_NASZ_116_Kjorn_Finito_55_04"); //Tak, mieli przy sobie amulet z rudy. Mam go tutaj ze sob�.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_55_05"); //To by�oby spe�nienie moich marze�! Ile za niego chcesz?
	
		Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Daj mi sto sztuk z�ota.", DIA_NASZ_116_Kjorn_Finito_100);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Daj mi trzysta sztuk z�ota.", DIA_NASZ_116_Kjorn_Finito_300);
		Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "Postanowi�em zatrzyma� go dla siebie.", DIA_NASZ_116_Kjorn_Finito_nothing);

};

func void FinishQuestKjorn(var int mode) {

	if (mode == 1) { // zloto
		Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_SUCCESS);
		B_LogEntry (TOPIC_Kjorn_bracia, "Odsprzeda�em Kjornowi amulet. Niech mu s�u�y. Z�oto przyda mi si� bardziej.");
		B_GivePlayerXP(700);
	}
	else if (mode == 2) { // zostawienie dla siebie
		Log_SetTopicStatus (TOPIC_Kjorn_bracia, LOG_SUCCESS);
		B_LogEntry (TOPIC_Kjorn_bracia, "Stwierdzi�em, �e zachowam amulet dla siebie. Kjorn powiedzia�, �e nie b�dzie ju� mnie uczy� zr�czno�ci, ale c�... Znajdzie si� kto� inny, kto mnie nauczy.");
		B_GivePlayerXP(700);	
	}
	else {
		Print(ConcatStrings("error: FinishQuestKjorn, mode = ",IntToString(mode)));
	};
};


func void KjornSayKeep() {
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_KjornSayKeep_15_01"); //Trzymaj. Nale�y ci si�.
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_100()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_100_15_00"); //Daj mi sto sztuk z�ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,100);
	B_GiveInvItems(self,other,itmi_gold,100);
	
	FinishQuestKjorn(1);
	
	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_300()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_300_15_00"); //Daj mi trzysta sztuk z�ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,300);
	B_GiveInvItems(self,other,itmi_gold,300);

	FinishQuestKjorn(1);

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_700()
{
	B_GiveInvItems(other,self,ItNa_AmuletZRudy,1);
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //No dobra, ale daj mi siedemset sztuk z�ota.
	KjornSayKeep();
	Createinvitems(self,itmi_gold,700);
	B_GiveInvItems(self,other,itmi_gold,700);

	FinishQuestKjorn(1);

	Info_ClearChoices (DIA_NASZ_116_Kjorn_Finito);
};

FUNC VOID DIA_NASZ_116_Kjorn_Finito_nothing()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //Postanowi�em zatrzyma� go dla siebie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_01"); //Przemy�l to, przyjacielu. Naprawd�, bardzo chcia�bym go mie�.

	Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "No dobra, ale daj mi siedemset sztuk z�ota.", DIA_NASZ_116_Kjorn_Finito_700);
	Info_AddChoice	  (DIA_NASZ_116_Kjorn_Finito, "I tak my�l�, �e mi bardziej si� przyda.", DIA_NASZ_116_Kjorn_Finito_nothing2);
};
	
FUNC VOID DIA_NASZ_116_Kjorn_Finito_nothing2()
{
	AI_Output (other,self ,"DIA_NASZ_116_Kjorn_Finito_700_15_00"); //I tak my�l�, �e mi bardziej si� przyda.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_01"); //A niech ci�... Ten egoizm odwr�ci si� przeciwko tobie.
	AI_Output (self, other,"DIA_NASZ_116_Kjorn_Finito_700_15_02"); //Odejd�. I nie licz, �e b�d� ci� jeszcze uczy�. Skoro ty nie zrobisz czego� dla mnie, to ja nie b�d� robi� niczego dla ciebie.

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


