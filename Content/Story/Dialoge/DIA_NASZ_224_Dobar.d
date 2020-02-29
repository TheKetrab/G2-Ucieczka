var int JAN_PACZKI;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_EXIT   (C_INFO)
{
	npc         = NASZ_224_Dobar;
	nr          = 999;
	condition   = DIA_NASZ_224_Dobar_EXIT_Condition;
	information = DIA_NASZ_224_Dobar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_224_Dobar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_siema   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_siema_Condition;
 	information = DIA_NASZ_224_Dobar_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_siema_15_00"); //Jesteœ kowalem?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_siema_55_01"); //Tak, do cholery. Po co zadajesz tak idiotyczne pytanie?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_siema_55_02"); //Skoro ju¿ zawracasz mi g³owê, to pytaj o coœ normalnego. 

		
};

//*********************************************************************
//	Info how
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_how   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 2;
 	condition   = DIA_NASZ_224_Dobar_how_Condition;
 	information = DIA_NASZ_224_Dobar_how_Info;
 	permanent   = FALSE;
 	description = "Jak siê tu znalaz³eœ?";
};

FUNC INT DIA_NASZ_224_Dobar_how_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_how_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_how_15_00"); //Jak siê tu znalaz³eœ?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_01"); //Przyby³em do zamku wraz z ekspedycj¹ paladynów. Potem zaczê³y siê te niemi³e przygody ze smokami. Ci¹g³e naloty, a do tego oblê¿enie przez orków.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_02"); //Czmychn¹³em kilka nocy po tej, w której zaatakowa³ smok. B³¹ka³em siê po okolicy a¿ do czasu, gdy znalaz³em to miejsce.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_03"); //Spêdzi³em tu kilka, mo¿e kilkanaœcie dni i wtedy pojawi³ siê Gestath wraz z kilkoma ch³opcami.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_04"); //Teraz zajmujê siê wyrabianiem sztyletów i no¿y dla myœliwych.
};

//*********************************************************************
//	Info Buy
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_buy   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 4;
 	condition   = DIA_NASZ_224_Dobar_buy_Condition;
 	information = DIA_NASZ_224_Dobar_buy_Info;
 	permanent   = FALSE;
 	description = "Mogê coœ u ciebie kupiæ?";
};

FUNC INT DIA_NASZ_224_Dobar_buy_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_buy_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_buy_15_00"); //Mogê coœ u ciebie kupiæ?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_buy_55_01"); //Nie, handel to nie mój dzia³. Kupiæ mo¿esz tylko od Hunta.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_buy_55_02"); //Ja tylko czasami dajê myœliwym coœ bezpoœrednio do rêki. I to tylko na polecenie szefa.

};

//*********************************************************************
//	Info GetKnife
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GetKnife   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 5;
 	condition   = DIA_NASZ_224_Dobar_GetKnife_Condition;
 	information = DIA_NASZ_224_Dobar_GetKnife_Info;
 	permanent   = FALSE;
 	description = "Gestath powiedzia³, ¿e masz dla mnie nó¿.";
};

FUNC INT DIA_NASZ_224_Dobar_GetKnife_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_BeAMysliwy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GetKnife_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_GetKnife_15_00"); //Gestath powiedzia³, ¿e masz dla mnie nó¿.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GetKnife_55_01"); //Tak, mam. Tylko nie utnij sobie paluszków.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GetKnife_55_02"); //Poprzedni, któremu dawa³em pierwszy nó¿, niejaki Dymoondo, prawie straci³ rêkê, próbuj¹c œci¹gn¹æ pierwsz¹ wilcz¹ skórê.

	Createinvitems (self, ItMw_1H_Sword_L_03, 1);
	B_giveinvitems (self, other, ItMw_1H_Sword_L_03, 1);	
};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
var int Zadanie_Dobar_Dick;
INSTANCE DIA_NASZ_224_Dobar_zadanie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 6;
 	condition   = DIA_NASZ_224_Dobar_zadanie_Condition;
 	information = DIA_NASZ_224_Dobar_zadanie_Info;
 	permanent   = FALSE;
 	description = "Chcia³bym ci siê na coœ przydaæ.";
};

FUNC INT DIA_NASZ_224_Dobar_zadanie_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanie_15_00"); //Chcia³bym ci siê na coœ przydaæ.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_55_01"); //Przydaæ? A na có¿ kowalowi pomoc od kogoœ innego? Doskonale radzê sobie z kowad³em i nie brak mi na nic czasu.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanie_15_02"); //Na pewno jest coœ, co móg³bym zrobiæ. Pójœæ gdzieœ za ciebie, przynieœæ ci coœ...
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_55_04"); //Faktycznie, mo¿esz przynieœæ mi kilka paczek od Jana z obozu ³owców orków albo spróbowaæ swoich si³ w... czymœ specjalnym.

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
		Info_AddChoice	  (DIA_NASZ_224_Dobar_zadanie, "Lepiej za³atwiê ci te paczki.", DIA_NASZ_224_Dobar_zadanie_paczka);
		Info_AddChoice	  (DIA_NASZ_224_Dobar_zadanie, "Myœlê, ¿e lepiej nadam siê do 'czegoœ specjalnego'.", DIA_NASZ_224_Dobar_zadanie_przyniesc);

};

func void DobarSay_AboutJan() {
	AI_Output (self, other,"DobarSay_AboutJan_55_00"); //Jan to kowal ³owców orków. Po prostu powiedz mu, ¿e to ja ciê przys³a³em. Bêdzie wiedzia³, co ci daæ.
};

func void DobarSay_MrokPolnocy() {
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_00"); //Za³atw mi 5 skrêtów Mroku Pó³nocy. Zwyk³e bagienne ziele mi ju¿ nie wystarcza.
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_01"); //Potrzebujê tego!
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_02"); //Ju¿ nie dajê rady, po prostu mam doœæ. Czasem chcê uciec od problemów Górniczej Doliny.
	AI_Output (other,self ,"DobarSay_MrokPolnocy_15_03"); //5 skrêtów? Pestka.
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_paczka()
{

	AI_Output (other,self ,"DIA_NASZ_224_Dobar_zadanie_paczka_15_00"); //Lepiej za³atwiê ci te paczki.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_paczka_55_01"); //Super. Nie bêdê musia³ p³aciæ potê¿nych sum goñcowi Jana.
	DobarSay_AboutJan();
	
	JAN_PACZKI = TRUE;
	Wld_InsertNpc	(Warg,"FP_ROAM_ORC_07");
	B_StartOtherRoutine (NASZ_107_Brutus,"BeforeDie");
	
	Createinvitems (NASZ_107_Brutus, ItNa_PaczkaJana, 3);

	Log_CreateTopic (TOPIC_Dobar_paczka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_paczka, "Muszê siê udaæ do Jana i odebraæ paczki dla Dobara.");

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_przyniesc()
{

	AI_Output (other,self ,"DIA_NASZ_224_Dobar_zadanie_przyniesc_15_00"); //Myœlê, ¿e lepiej nadam siê do 'czegoœ specjalnego'.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_przyniesc_55_01"); //Ah tak?
	AI_PlayAni(self, "T_SEARCH");
	DobarSay_MrokPolnocy();

	Zadanie_Dobar_Dick = TRUE;
	Log_CreateTopic (TOPIC_Dobar_skrety, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_skrety, "Trzeba za³atwiæ 5 skrêtów Mroku Pó³nocy Dobarowi. Tylko sk¹d ja wezmê to zielsko?");

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
};	


//*********************************************************************
//	Info ZadanieKap2
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_zadanieKap2   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 7;
 	condition   = DIA_NASZ_224_Dobar_zadanieKap2_Condition;
 	information = DIA_NASZ_224_Dobar_zadanieKap2_Info;
 	permanent   = FALSE;
 	description = "Mogê coœ jeszcze zrobiæ?";
};

FUNC INT DIA_NASZ_224_Dobar_zadanieKap2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_zadanie))
	&& (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_zadanieKap2_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanieKap2_15_00"); //Mogê coœ jeszcze zrobiæ?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanieKap2_55_01"); //Pewnie!
		if (JAN_PACZKI == TRUE)
		{
			AI_PlayAni(self, "T_SEARCH");
			DobarSay_MrokPolnocy();

			Zadanie_Dobar_Dick = TRUE;
			Log_CreateTopic (TOPIC_Dobar_skrety, LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_RUNNING);
			B_LogEntry (TOPIC_Dobar_skrety, "Trzeba za³atwiæ 5 skrêtów Mroku Pó³nocy Dobarowi. Tylko sk¹d ja wezmê to zielsko?");

		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanieKap2_15_06"); //Przynieœ mi paczki od Jana.
			DobarSay_AboutJan();
	
			JAN_PACZKI = TRUE;
			Wld_InsertNpc	(Warg,"FP_ROAM_ORC_07");
			B_StartOtherRoutine (NASZ_107_Brutus,"BeforeDie");
			NASZ_107_Brutus.flags = 0;
			B_KillNpc(NASZ_107_Brutus);
			//Createinvitems (NASZ_107_Brutus, ItNa_PaczkaJana, 3);

			Log_CreateTopic (TOPIC_Dobar_paczka, LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_RUNNING);
			B_LogEntry (TOPIC_Dobar_paczka, "Muszê siê udaæ do Jana i odebraæ paczki dla Dobara.");

		};

};

//*********************************************************************
//	Info KoniecPaczka
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_koniecpaczka   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 8;
 	condition   = DIA_NASZ_224_Dobar_koniecpaczka_Condition;
 	information = DIA_NASZ_224_Dobar_koniecpaczka_Info;
 	permanent   = FALSE;
 	description = "Trzymaj. Twoje paczki.";
};

FUNC INT DIA_NASZ_224_Dobar_koniecpaczka_Condition()
{
	if (JAN_PACZKI == TRUE)
	&& (npc_hasitems (other, ItNa_PaczkaJana) >=3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_koniecpaczka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_koniecpaczka_15_00"); //Trzymaj. Twoje paczki.
	B_giveinvitems (other, self, ItNa_PaczkaJana, 3);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecpaczka_55_01"); //Dziêki. WeŸ to z³oto, nale¿y ci siê.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);

	B_LogEntry (TOPIC_Dobar_paczka, "Przynios³em paczki od Jana. Szkoda tylko, ¿e Brutusowi siê nie uda³o...");
	Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

};

//*********************************************************************
//	Info KoniecSkrety
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_koniecskrety   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 9;
 	condition   = DIA_NASZ_224_Dobar_koniecskrety_Condition;
 	information = DIA_NASZ_224_Dobar_koniecskrety_Info;
 	permanent   = FALSE;
 	description = "Mam coœ dla ciebie...";
};

FUNC INT DIA_NASZ_224_Dobar_koniecskrety_Condition()
{
	if (Zadanie_Dobar_Dick == TRUE)
	&& (npc_hasitems (other, ItNa_MrokPolnocy) >=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_koniecskrety_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_koniecskrety_15_00"); //Mam coœ dla ciebie...
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecskrety_55_01"); //¯esz ty, w mordê! Dawaj.
	B_giveinvitems (other, self, ItNa_MrokPolnocy, 5);
	B_UseItem (self, ItNa_MrokPolnocy);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecskrety_55_02"); //O tak! Trzymaj, trochê z³ota.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);

	Zadanie_Dobar_Dick = TRUE;
	B_LogEntry (TOPIC_Dobar_skrety, "Dobar wydawa³ siê byæ wniebowziêty, gdy zapali³ Mrok Pó³nocy. Widaæ, mamy nowego na³ogowca.");
	Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_Gwozdzie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 10;
 	condition   = DIA_NASZ_224_Dobar_Gwozdzie_Condition;
 	information = DIA_NASZ_224_Dobar_Gwozdzie_Info;
 	permanent   = FALSE;
 	description = "Potrzebujê gwoŸdzi.";
};

FUNC INT DIA_NASZ_224_Dobar_Gwozdzie_Condition()
{
	if (WillGwozdzieGoToKowal == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_Gwozdzie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_Gwozdzie_15_00"); //Potrzebujê gwoŸdzi.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_01"); //GwoŸdzi? Doœæ nietypowe zamówienie, nieprawda¿?
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_Gwozdzie_15_02"); //Drwal Phill potrzebuje paczkê ma³ych gwoŸdzi. Zrobi³byœ takie dla mnie?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_03"); //Nie ma sprawy. Potrzebujê jednak stalowego prêta, no i z³ota oczywiœcie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_04"); //Za ka¿dy gwóŸdŸ policzê sobie dwie sztuki z³ota.

	WillGwozdzieGoToKowal = 2;

	B_LogEntry (TOPIC_Robotnik_deski, "Dobar zrobi dla mnie gwoŸdzie, jeœli przyniosê mu stalowy prêt.");

};

var int DobarGwozdzieFirstDay;
var int DobarGwozdzieFirstHour;
//*********************************************************************
//	Info GwozdzieBuy
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieBuy   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 11;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieBuy_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieBuy_Info;
 	permanent   = TRUE;
 	description = "Zrób dla mnie gwoŸdzie.";
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieBuy_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_Gwozdzie))
	&& (npc_hasitems (other, ItMiSwordraw) >=1)
	&& (GwozdzieKupione == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieBuy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuy_15_00"); //Zrób dla mnie gwoŸdzie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuy_55_01"); //Ilu sztuk potrzebujesz?
	
	DobarGwozdzieFirstDay  = Wld_GetDay();
	DobarGwozdzieFirstHour = Wld_GetTimeHour();

	Info_ClearChoices 	(DIA_NASZ_224_Dobar_GwozdzieBuy);
	Info_AddChoice 		(DIA_NASZ_224_Dobar_GwozdzieBuy,	DIALOG_BACK		,DIA_NASZ_224_Dobar_GwozdzieBuy_Back);

	if (npc_hasitems (other, ItMi_Gold) >=100) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Piêædziesi¹t: 1 stalowy prêt, 100 szt. z³ota",DIA_NASZ_224_Dobar_GwozdzieBuy_50);
	};
	if (npc_hasitems (other, ItMi_Gold) >=40) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Dwadzieœcia: 1 stalowy prêt, 40 szt. z³ota",DIA_NASZ_224_Dobar_GwozdzieBuy_20);
	};
	if (npc_hasitems (other, ItMi_Gold) >=20) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Dziesiêæ: 1 stalowy prêt, 20 szt. z³ota",DIA_NASZ_224_Dobar_GwozdzieBuy_10);
	};

};

func void DobarSay_BackHour() {
	AI_Output(self,other,"DobarSay_BackHour_01_00"); //Wróæ za godzinê. Zamówienie bêdzie gotowe.
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_Back ()
{
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_50 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_50_01_00"); //Piêædziesi¹t.
	B_giveinvitems (other, self, ItMi_Gold, 100);
	B_giveinvitems (other, self, ItMiSwordraw, 1);	
	DobarSay_BackHour();

	GwozdzieKupione = 50;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_20 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_20_01_00"); //Dwadzieœcia.
	B_giveinvitems (other, self, ItMi_Gold, 40);
	B_giveinvitems (other, self, ItMiSwordraw, 1);
	DobarSay_BackHour();

	GwozdzieKupione = 20;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_10 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_10_01_00"); //Dziesiêæ.
	B_giveinvitems (other, self, ItMi_Gold, 20);
	B_giveinvitems (other, self, ItMiSwordraw, 1);
	DobarSay_BackHour();

	GwozdzieKupione = 10;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

//*********************************************************************
//	Info GwozdzieReady
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieReady   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 12;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieReady_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieReady_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieReady_Condition()
{
	if (GwozdzieKupione > 0)
	&& TimeIsUp(-1,1,DobarGwozdzieFirstDay,DobarGwozdzieFirstHour) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieReady_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady_15_00"); //To by³o ca³kiem ciekawe zajêcie. Nieczêsto mam okazjê wyrabiaæ narzêdzia.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady_55_01"); //To twoja paczka, trzymaj.
	
	Createinvitems (self, ItNa_PaczkaMalychGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaMalychGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "Mam ma³e gwoŸdzie. Teraz zaniosê je Phillowi.");

};

var int DobarGwozdzieSecondDay;
var int DobarGwozdzieSecondHour;
//*********************************************************************
//	Info GwozdzieBuyMore
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieBuyMore   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 13;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieBuyMore_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieBuyMore_Info;
 	permanent   = FALSE;
 	description = "Potrzebujê wiêcej gwoŸdzi.";
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieBuyMore_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_GwozdzieDone))
	&& (npc_hasitems (other, ItMi_Gold) >=20)
	&& (WillGwozdzieGoToKowal == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieBuyMore_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_15_00"); //Potrzebujê wiêcej gwoŸdzi.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_55_01"); //Znowu? Ile tym razem?
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_15_02"); //Dziesiêæ. Trzymaj, dwadzieœcia sztuk z³ota. Potrzebujesz te¿ stal, czy zosta³o ci trochê?
	B_giveinvitems (other, self, ItMi_Gold, 20);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_55_03"); //Zosta³o, nie martw siê. Wróæ za godzinê.
	
	DobarGwozdzieSecondDay  = Wld_GetDay();
	DobarGwozdzieSecondHour = Wld_GetTimeHour();

};

//*********************************************************************
//	Info GwozdzieReady2
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieReady2   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 14;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieReady2_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieReady2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieReady2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_GwozdzieBuyMore))
	&& TimeIsUp(-1,1,DobarGwozdzieSecondDay,DobarGwozdzieSecondHour) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieReady2_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady2_15_00"); //Masz, to dla ciebie.

	Createinvitems (self, ItNa_PaczkaMalychGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaMalychGwozdzi, 1);

	AI_Output (other,self,"DIA_NASZ_224_Dobar_GwozdzieReady2_55_01"); //Dziêki.
	
	B_LogEntry (TOPIC_Robotnik_deski, "No, teraz Phill musi daæ mi paczkê gwoŸdzi.");

};

//*********************************************************************
//	Artefakt
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_artefakt   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 21;
 	condition   = DIA_NASZ_224_Dobar_artefakt_Condition;
 	information = DIA_NASZ_224_Dobar_artefakt_Info;
 	permanent   = FALSE;
 	description = "Potrafi³byœ po³¹czyæ te trzy kawa³ki?";
};

FUNC INT DIA_NASZ_224_Dobar_artefakt_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_coteraz))
	&& !(npc_knowsinfo (other, DIA_NASZ_106_Jan_artefakt))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_artefakt_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_artefakt_15_00"); //Potrafi³byœ po³¹czyæ te trzy kawa³ki?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_artefakt_55_01"); //Ju¿ ci mówi³em, ¿e zajmujê siê g³ównie ¿elastwem. Bi¿uteria to nie moja dzia³ka. 

};


//*********************************************************************
//	Info PancerzeStart
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeStart   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeStart_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeStart_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeStart_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	&& (npc_knowsinfo(other,DIA_NASZ_213_Gestath_OUTDobarQuest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeStart_Info()
{
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_00"); //Nie przeszkadzaj mi. Jestem w trakcie wykonywania roboty dla Gestatha.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_55_01"); //To w³aœnie on mnie przys³a³. Ponoæ masz ju¿ plan, jak polepszyæ pancerze innych myœliwych.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_55_02"); //Oczywiœcie, ¿e mam! Uda³o mi siê wytworzyæ p³ytkê z nowego stopu metali, która jest elastyczna i nie traci swoich w³aœciwoœci obronnych.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_03"); //Wystarczy wiêc wszyæ j¹ w odpowiednio wytrzyma³e futro i mamy wspania³y pancerz. Wiem ju¿ nawet jakie futro mo¿e siê do tego nadaæ.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_15_04"); //Zamieniam siê w s³uch.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_05"); //Futro, jak i skóra orkowych psów, jest bardzo wytrzyma³a i jednoczeœnie rozci¹gliwa. Co prawda œmierdzi, jednak jest najbardziej odpowiednim sk³adnikiem tego stroju.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_06"); //Wys³a³em ju¿ na poszukiwania Jehena, lecz do tej pory jeszcze nie wróci³. Móg³byœ go poszukaæ?
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_15_07"); //W jakim kierunku ruszy³?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_08"); //Wydaje mi siê, ze mówi³ coœ o terenach starej górskiej twierdzy, ale móg³ tam nawet nie dotrzeæ. Kto go tam wie...

	B_StartOtherRoutine(NASZ_232_Jehen,"Namiot");
	B_LogEntry (TOPIC_Dobar_pancerze, "Dobar opowiedzia³ mi o swoim pomyœle na wzmocnienie pancerza za pomoc¹ nowego stopu metali. Aby tego dokonaæ potrzebuje skór orkowych psów, po które zosta³ wys³any Jehen. Wed³ug Dobara wyruszy³ w stronê starej górskiej twierdzy, ale móg³ tam nie dotrzeæ. Lepiej udam siê tam pieszo, by przypadkiem siê z nim nie min¹æ.");
};

func void DobarSay_Super() {
	AI_Output (self, other,"DobarSay_Super_55_00"); //Doskonale! Mam tu dla ciebie specjaln¹ nagrodê w ramach podziêkowañ.
	AI_Output (self, other,"DobarSay_Super_55_01"); //Czterysta ostrych strza³ powinno zwróciæ z nawi¹zk¹ strza³y, które zu¿y³eœ podczas polowania.
};

var int WillMusiDoniescSkoryOrkowychPsow;
//*********************************************************************
//	Info PancerzeOddawanie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeOddawanie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeOddawanie_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeOddawanie_Info;
 	permanent   = FALSE;
	description = "Znalaz³em lepszy materia³ na zbroje.";
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeOddawanie_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_232_Jehen_Part2Finish))
	&& (npc_hasitems(other,ItNa_LuskaBestii)>=6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeOddawanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_00"); //Znalaz³em lepszy materia³ na zbroje.
	B_GiveInvItems(other,self,ItNa_LuskaBestii,6);
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_01"); //To ³uski jakichœ tajemniczych i demonicznych bestii. S¹ bardzo twarde.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_02"); //Poka¿ no, niech siê przyjrzê.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_03"); //Faktycznie, wygl¹daj¹ ca³kiem solidnie. Wykorzystam je do wzmocnienia zbroi, jednak nie wystarczy mi na wszystkie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_04"); //Masz ze sob¹ skóry orkowych psów, o które prosi³em?
	
	if (npc_hasitems(other,ItNa_SkoraOrkowegoPsa) >= 5) {
	
		AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_05"); //Tak, proszê.
		B_GiveInvItems(other,self,ItNa_SkoraOrkowegoPsa,5);
		DobarSay_Super();

		Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_SUCCESS);
		B_LogEntry (TOPIC_Dobar_pancerze, "Przynios³em Dobarowi to, co potrzebowa³, by wzmocniæ pancerze.");
		WillSkonczylZadanieDobaraPancerze = TRUE;

		Createinvitems(self,ItNa_OstraStrzala,400);
		B_giveinvitems(self,other,ItNa_OstraStrzala,400);
		B_GivePlayerXP(700);
		DodajReputacje(4,REP_MYSLIWI);
	}
	
	else {
		AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_06"); //Nie. Myœla³em, ¿e w tej sytuacji obejdzie siê bez nich.
		AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_07"); //Pomyli³eœ siê wiêc. Musisz donieœæ mi skóry.

		WillMusiDoniescSkoryOrkowychPsow = TRUE;
		B_LogEntry (TOPIC_Dobar_pancerze, "Dobar ucieszy³ siê, ¿e przynios³em mu ³uski, ale i tak potrzebuje 5 skór orkowych psów.");
	};

};




//*********************************************************************
//	Info PancerzeDoniesienie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeDoniesienie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeDoniesienie_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeDoniesienie_Info;
 	permanent   = FALSE;
	description = "Przynios³em skóry orkowych psów.";
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeDoniesienie_Condition()
{
	if (WillMusiDoniescSkoryOrkowychPsow)
	&& (npc_hasitems(other,ItNa_SkoraOrkowegoPsa)>=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeDoniesienie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeDoniesienie_15_00"); //Przynios³em skóry orkowych psów.
	B_GiveInvItems(other,self,ItNa_SkoraOrkowegoPsa,5);
	DobarSay_Super();
	
	WillSkonczylZadanieDobaraPancerze = TRUE;

	Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_SUCCESS);
	B_LogEntry (TOPIC_Dobar_pancerze, "Przynios³em Dobarowi to, co potrzebowa³, by wzmocniæ pancerze.");

	Createinvitems(self,ItNa_OstraStrzala,400);
	B_giveinvitems(self,other,ItNa_OstraStrzala,400);
	B_GivePlayerXP(700);
	DodajReputacje(4,REP_MYSLIWI);
};




















//*********************************************************************
//	Info Kap4Wrzod
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_Kap4Wrzod   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 41;
 	condition   = DIA_NASZ_224_Dobar_Kap4Wrzod_Condition;
 	information = DIA_NASZ_224_Dobar_Kap4Wrzod_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_Kap4Wrzod_Condition()
{
	if (! npc_knowsinfo (other, DIA_NASZ_225_Wrzod_Kap4Start)) && (KAPITEL == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_Kap4Wrzod_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_00"); //Hej, Willu! S³yszysz te wrzaski?
	AI_Output (other,self,"DIA_NASZ_224_Dobar_Kap4Wrzod_55_02"); //W³aœnie siê zastanawiam, kto kogo torturuje.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_03"); //Od wczoraj, Wrzód jêczy bez przerwy. Nie wiem o co mu chodzi, ale wszyscy maj¹ go ju¿ doœæ.
	AI_Output (other,self,"DIA_NASZ_224_Dobar_Kap4Wrzod_55_04"); //W takim razie zajrzê do niego.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_05"); //W razie gdyby dobrowolnie siê nie zamkn¹³, poder¿nij mu gard³o.

	Log_CreateTopic (TOPIC_Wrzod_zwierzeta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_RUNNING);
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Dobar wyjaœni³ mi, sk¹d bior¹ siê te odg³osy w obozie myœliwych. Mo¿na siê by³o spodziewaæ, ¿e to Wrzód. Chyba muszê z³o¿yæ mu wizytê.");

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_224_Dobar_PICKPOCKET (C_INFO)
{
	npc			= NASZ_224_Dobar;
	nr			= 900;
	condition	= DIA_NASZ_224_Dobar_PICKPOCKET_Condition;
	information	= DIA_NASZ_224_Dobar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_224_Dobar_PICKPOCKET_Condition()
{
	C_Beklauen (32);
};
 
FUNC VOID DIA_NASZ_224_Dobar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_224_Dobar_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_224_Dobar_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_224_Dobar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_224_Dobar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_224_Dobar_PICKPOCKET_DoIt);
};

func void DIA_NASZ_224_Dobar_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,73);
	
	Info_ClearChoices (DIA_NASZ_224_Dobar_PICKPOCKET);
};
	
func void DIA_NASZ_224_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_224_Dobar_PICKPOCKET);
};