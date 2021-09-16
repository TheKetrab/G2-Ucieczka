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

const int Cappel_STR_MAX = 90;
var int Cappel_Teach_STR;
var int Cappel_Teach_NoMore;

func void CappelAddChoicesSTR() {

	if (AlignRequestedAmountToTeacherMax(LEARN_STR, 1, Cappel_STR_MAX) > 0) {
		Info_AddChoice		(DIA_Cappel_Teach, BuildLearnString(LEARN_STR, 1, Cappel_STR_MAX), DIA_Cappel_Teach_STR_1); 
	};
	if (AlignRequestedAmountToTeacherMax(LEARN_STR, 5, Cappel_STR_MAX) > 1) {
		Info_AddChoice		(DIA_Cappel_Teach, BuildLearnString(LEARN_STR, 5, Cappel_STR_MAX), DIA_Cappel_Teach_STR_5); 
	};

};

func void CappelSay_CantTeachYou() {
	AI_Output(self,other,"CappelSay_CantTeachYou_55_00"); //Niestety, niczego wiêcej ju¿ ciê nie nauczê.
	Cappel_Teach_NoMore = TRUE;
};

func void CappelSay_NoMoney() {
	AI_Output (self, other,"CappelSay_NoMoney_55_00"); //Nie masz doœæ z³ota.
};

func void CappelSay_NoExp() {
	AI_Output (self, other,"CappelSay_NoExp_55_00"); //Brak ci doœwiadczenia.
};

INSTANCE DIA_Cappel_Teach   (C_INFO)
{
	npc         = NASZ_222_Cappel;
 	nr          = 100;
 	condition   = DIA_Cappel_Teach_Condition;
 	information = DIA_Cappel_Teach_Info;
 	permanent   = TRUE;
 	description = "Ucz mnie.";
};

FUNC INT DIA_Cappel_Teach_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_222_Cappel_nauka))
	&& (Cappel_Teach_NoMore == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cappel_Teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_Teach_15_00"); //Ucz mnie.

	if (GetTalentNow(LEARN_STR) >= Cappel_STR_MAX)
	{
		CappelSay_CantTeachYou();
		Info_ClearChoices 	(DIA_Cappel_Teach);
		return;
	};
		
	Cappel_Teach_STR = other.attribute[ATR_STRENGTH];

	Info_ClearChoices   (DIA_Cappel_Teach);
	Info_AddChoice 		(DIA_Cappel_Teach, DIALOG_BACK, DIA_Cappel_Teach_BACK);
	CappelAddChoicesSTR();
};

func void DIA_Cappel_Teach_BACK()
{
	if (Cappel_Teach_STR < other.attribute[ATR_STRENGTH] && other.attribute[ATR_STRENGTH] < Cappel_STR_MAX)
	{
		AI_Output (self, other, "DIA_NASZ_222_Cappel_Teach_Back_01_00"); //Œwietnie! Teraz mo¿esz skuteczniej wykorzystywaæ swoje umiejêtnoœci.
	};
	
	Info_ClearChoices (DIA_Cappel_Teach);
};

FUNC VOID DIA_Cappel_Teach_STR_1 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_STR,1,Cappel_STR_MAX)) {
		CappelSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_STR,1,Cappel_STR_MAX)) {
		CappelSay_NoExp();
	}
	else {
	
		B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, Cappel_STR_MAX);
	
		if (GetTalentNow(LEARN_STR) >= Cappel_STR_MAX)
		{
			CappelSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Cappel_Teach);
			return;
		};
	
		Info_ClearChoices 	(DIA_Cappel_Teach);
		Info_AddChoice 		(DIA_Cappel_Teach,	DIALOG_BACK		,DIA_Cappel_Teach_Back);
		CappelAddChoicesSTR();
	};

};

FUNC VOID DIA_Cappel_Teach_STR_5 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_STR,5,Cappel_STR_MAX)) {
		CappelSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_STR,5,Cappel_STR_MAX)) {
		CappelSay_NoExp();
	}
	else {
	
		var int amount; amount = AlignRequestedAmountToTeacherMax(LEARN_STR,5,Cappel_STR_MAX);
		B_TeachAttributePoints (self, other, ATR_STRENGTH, amount, Cappel_STR_MAX);

		if (GetTalentNow(LEARN_STR) >= Cappel_STR_MAX)
		{
			CappelSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Cappel_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Cappel_Teach);
		Info_AddChoice 		(DIA_Cappel_Teach,	DIALOG_BACK		,DIA_Cappel_Teach_Back);
		CappelAddChoicesSTR();
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