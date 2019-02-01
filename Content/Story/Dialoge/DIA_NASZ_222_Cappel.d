//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_EXIT   (C_INFO)
{
	npc         = NASZ_222_Cappel;
	nr          = 999;
	condition   = DIA_NASZ_222_Cappel_EXIT_Condition;
	information = DIA_NASZ_222_Cappel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_222_Cappel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_222_Cappel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_siema   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 1;
 	condition   = DIA_NASZ_222_Cappel_siema_Condition;
 	information = DIA_NASZ_222_Cappel_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_222_Cappel_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_222_Cappel_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_01"); //Nazywam siê Cappel. W obozie myœliwych przypad³a mi funkcja drwala. To prawda, nie jestem najlepszym ³ucznikiem. Zwierzynê likwidowa³em raczej ostrym no¿em, gdy wystarczaj¹co siê zbli¿y³a.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_02"); //Z drugiej strony mam trochê wiêcej pracy ni¿ reszta z grupy.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_03"); //Kilka godzin dziennie przeznaczam na przygotowanie drewna na opa³. Rano wychodzê szukaæ suchych ¿erdzi, które powinny dobrze siê paliæ. Ogniska palimy niemal ca³y czas z dwóch przyczyn: œwiat³o i ciep³o.
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_siema_15_04"); //Czy poza suchymi ga³êziami zbierasz coœ jeszcze?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_05"); //Nie œcinam drzew, bo w zasadzie do niczego nie jest to potrzebne. Ale jeœli znajdê gdzieœ bukowy kij albo inny twardy i prosty patyk, to obrabiam go odpowiednio i przekazujê Dobarowi do wykoñczenia strza³y.		
};

//*********************************************************************
//	Info Nauka
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_nauka   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 2;
 	condition   = DIA_NASZ_222_Cappel_nauka_Condition;
 	information = DIA_NASZ_222_Cappel_nauka_Info;
 	permanent   = FALSE;
 	description = "Móg³byœ spróbowaæ poprawiæ moj¹ si³ê?";
};

FUNC INT DIA_NASZ_222_Cappel_nauka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_222_Cappel_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_222_Cappel_nauka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_nauka_15_00"); //Móg³byœ spróbowaæ poprawiæ moj¹ si³ê?
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_nauka_15_01"); //Nie chcê byæ chuderlakiem, który, gdy dojdzie do walki na piêœci, ucieka, gdzie pieprz roœnie.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_nauka_55_02"); //Jasne, chêtnie ci pomogê! Powiedz, kiedy chcia³byœ zacz¹æ.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Drwal Cappel pomo¿e mi zwiêkszyæ si³ê.");	
};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_zadanie   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 3;
 	condition   = DIA_NASZ_222_Cappel_zadanie_Condition;
 	information = DIA_NASZ_222_Cappel_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_NASZ_222_Cappel_zadanie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_222_Cappel_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_222_Cappel_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_zadanie_15_00"); //Mogê coœ dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_zadanie_55_01"); //Tak. Narzêdzia, gdy s¹ u¿ywane taki szmat czasu, ulegaj¹ zepsuciu. To normalne. Warto wiêc mieæ parê zapasowych przedmiotów na zbyciu.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_zadanie_55_02"); //Gdybyœ móg³ przynieœæ mi ze trzy pi³y i topór drwala, by³bym ci bardzo wdziêczny.
	
	Log_CreateTopic (TOPIC_Cappel_pily, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Cappel_pily, LOG_RUNNING);
	B_LogEntry (TOPIC_Cappel_pily, "Cappel, drwal z obozu myœliwych, poprosi³ mnie, abym przyniós³ mu 3 pi³y i topór drwala. Ciekawe, sk¹d mam to wytrzasn¹æ... Mo¿e kucharz coœ wie.");

};

//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_koniec   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 4;
 	condition   = DIA_NASZ_222_Cappel_koniec_Condition;
 	information = DIA_NASZ_222_Cappel_koniec_Info;
 	permanent   = FALSE;
 	description = "Przynios³em dla ciebie narzêdzia.";
};

FUNC INT DIA_NASZ_222_Cappel_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_222_Cappel_zadanie)
	&& npc_hasitems (other, ItMi_Saw) >=3
	&& npc_hasitems (other, ItMw_2h_Bau_Axe) >=1)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_222_Cappel_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_koniec_15_00"); //Przynios³em dla ciebie narzêdzia.
	B_GiveInvItems (other, self, ItMi_Saw, 3);
	B_GiveInvItems (other, self, ItMw_2h_Bau_Axe, 1);
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_01"); //Œwietnie! Wielkie dziêki. Dziêki tobie nie bêdê musia³ sam uganiaæ siê za nowymi, gdyby te u¿ywane teraz siê zepsu³y.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_02"); //W okolicy nie ma majstra, który wytwarza³by dobre narzêdzia. Wszycy wal¹ m³otami w kowad³o, by produkowaæ broñ i zbroje.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_03"); //Raz jeszcze dziêkujê. Oto twoja nagroda.

	Createinvitems (self, itmi_gold, 85);
	B_giveinvitems (self, other, itmi_gold, 85);

	DodajReputacje (2, REP_MYSLIWI);

	B_LogEntry (TOPIC_Cappel_pily, "Przynios³em Cappelowi narzêdzia. Wydawa³ siê byæ bardzo zadowolony.");
	Log_SetTopicStatus (TOPIC_Cappel_pily, LOG_SUCCESS);
	B_GivePlayerXP (300);

};

// *******************************************
//					Teach
// *******************************************

var int Cappel_Teach_STR;

INSTANCE DIA_NASZ_222_Cappel_Teach(C_INFO)
{
	npc		= NASZ_222_Cappel;
	nr		= 5;
	condition	= DIA_NASZ_222_Cappel_Teach_Condition;
	information	= DIA_NASZ_222_Cappel_Teach_Info;
	permanent	= TRUE;
	description	= "Ucz mnie.";
};                       

FUNC INT DIA_NASZ_222_Cappel_Teach_Condition()
{
	if (Npc_KnowsInfo (other, DIA_NASZ_222_Cappel_nauka))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_NASZ_222_Cappel_Teach_Info()
{	
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_Teach_15_00"); //Ucz mnie.

		Cappel_Teach_STR = other.attribute[ATR_STRENGTH];

		Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);
		Info_AddChoice		(DIA_NASZ_222_Cappel_Teach, DIALOG_BACK, DIA_NASZ_222_Cappel_Teach_Back);
		
		if (other.attribute[ATR_STRENGTH] < 50) {
			if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1); };
			if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5); };
		}

		else {
			if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1High); };
			if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5High); };
		};
};

FUNC VOID DIA_NASZ_222_Cappel_Teach_Back ()
{
	if (Cappel_Teach_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_NASZ_222_Cappel_Teach_Back_01_00"); //Œwietnie! Teraz mo¿esz skuteczniej wykorzystywaæ swoje umiejêtnoœci.
	};

	Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);
};

FUNC VOID DIA_NASZ_222_Cappel_Teach_STR_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 90);
	
	Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);
	
	Info_AddChoice		(DIA_NASZ_222_Cappel_Teach, DIALOG_BACK, DIA_NASZ_222_Cappel_Teach_Back);

		if (other.attribute[ATR_STRENGTH] < 50) {
			if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1); };
			if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5); };
		}

		else {
			if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1High); };
			if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5High); };
		};
};

FUNC VOID DIA_NASZ_222_Cappel_Teach_STR_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);

	Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);

	Info_AddChoice		(DIA_NASZ_222_Cappel_Teach, DIALOG_BACK, DIA_NASZ_222_Cappel_Teach_Back);

		if (other.attribute[ATR_STRENGTH] < 50) {
			if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1); };
			if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5); };
		}

		else {
			if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1High); };
			if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5High); };
		};
};

FUNC VOID DIA_NASZ_222_Cappel_Teach_STR_1High ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 90);
	
	Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);
	
	Info_AddChoice		(DIA_NASZ_222_Cappel_Teach, DIALOG_BACK, DIA_NASZ_222_Cappel_Teach_Back);

		if (other.attribute[ATR_STRENGTH] < 50) {
			if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1); };
			if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5); };
		}

		else {
			if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1High); };
			if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5High); };
		};
};

FUNC VOID DIA_NASZ_222_Cappel_Teach_STR_5High ()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);

	Info_ClearChoices (DIA_NASZ_222_Cappel_Teach);

	Info_AddChoice		(DIA_NASZ_222_Cappel_Teach, DIALOG_BACK, DIA_NASZ_222_Cappel_Teach_Back);

		if (other.attribute[ATR_STRENGTH] < 50) {
			if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1); };
			if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5); };
		}

		else {
			if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_1High); };
			if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_222_Cappel_Teach,"Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_222_Cappel_Teach_STR_5High); };
		};
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_222_Cappel_HowAreYou   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 500;
 	condition   = DIA_NASZ_222_Cappel_HowAreYou_Condition;
 	information = DIA_NASZ_222_Cappel_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Drewna nie brakuje?";
};

FUNC INT DIA_NASZ_222_Cappel_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_222_Cappel_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_222_Cappel_HowAreYou_15_00"); //Drewna nie brakuje?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_HowAreYou_55_01"); //W okolicy stoi jeszcze parê drzew.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_HowAreYou_55_02"); //Kto wie? Mo¿e bêdê musia³ œci¹æ je wszystkie, gdy zacznie brakowaæ mi surowców.	

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_222_Cappel_PICKPOCKET (C_INFO)
{
	npc			= NASZ_222_Cappel;
	nr			= 900;
	condition	= DIA_NASZ_222_Cappel_PICKPOCKET_Condition;
	information	= DIA_NASZ_222_Cappel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_222_Cappel_PICKPOCKET_Condition()
{
	C_Beklauen (26);
};
 
FUNC VOID DIA_NASZ_222_Cappel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_222_Cappel_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_222_Cappel_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_222_Cappel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_222_Cappel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_222_Cappel_PICKPOCKET_DoIt);
};

func void DIA_NASZ_222_Cappel_PICKPOCKET_DoIt()
{
	B_BeklauenGold(36);
	
	Info_ClearChoices (DIA_NASZ_222_Cappel_PICKPOCKET);
};
	
func void DIA_NASZ_222_Cappel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_222_Cappel_PICKPOCKET);
};