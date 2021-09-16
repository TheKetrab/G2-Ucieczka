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
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_01"); //Nazywam si� Cappel. W obozie my�liwych przypad�a mi funkcja drwala. To prawda, nie jestem najlepszym �ucznikiem. Zwierzyn� likwidowa�em raczej ostrym no�em, gdy wystarczaj�co si� zbli�y�a.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_02"); //Z drugiej strony mam troch� wi�cej pracy ni� reszta z grupy.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_03"); //Kilka godzin dziennie przeznaczam na przygotowanie drewna na opa�. Rano wychodz� szuka� suchych �erdzi, kt�re powinny dobrze si� pali�. Ogniska palimy niemal ca�y czas z dw�ch przyczyn: �wiat�o i ciep�o.
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_siema_15_04"); //Czy poza suchymi ga��ziami zbierasz co� jeszcze?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_siema_55_05"); //Nie �cinam drzew, bo w zasadzie do niczego nie jest to potrzebne. Ale je�li znajd� gdzie� bukowy kij albo inny twardy i prosty patyk, to obrabiam go odpowiednio i przekazuj� Dobarowi do wyko�czenia strza�y.		
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
 	description = "M�g�by� spr�bowa� poprawi� moj� si��?";
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
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_nauka_15_00"); //M�g�by� spr�bowa� poprawi� moj� si��?
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_nauka_15_01"); //Nie chc� by� chuderlakiem, kt�ry, gdy dojdzie do walki na pi�ci, ucieka, gdzie pieprz ro�nie.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_nauka_55_02"); //Jasne, ch�tnie ci pomog�! Powiedz, kiedy chcia�by� zacz��.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Drwal Cappel pomo�e mi zwi�kszy� si��.");	
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
 	description = "Mog� co� dla ciebie zrobi�?";
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
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_zadanie_15_00"); //Mog� co� dla ciebie zrobi�?
	AI_Output (self, other,"DIA_NASZ_222_Cappel_zadanie_55_01"); //Tak. Narz�dzia, gdy s� u�ywane taki szmat czasu, ulegaj� zepsuciu. To normalne. Warto wi�c mie� par� zapasowych przedmiot�w na zbyciu.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_zadanie_55_02"); //Gdyby� m�g� przynie�� mi ze trzy pi�y i top�r drwala, by�bym ci bardzo wdzi�czny.
	
	Log_CreateTopic (TOPIC_Cappel_pily, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Cappel_pily, LOG_RUNNING);
	B_LogEntry (TOPIC_Cappel_pily, "Cappel, drwal z obozu my�liwych, poprosi� mnie, abym przyni�s� mu 3 pi�y i top�r drwala. Ciekawe, sk�d mam to wytrzasn��... Mo�e kucharz co� wie.");

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
 	description = "Przynios�em dla ciebie narz�dzia.";
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
	AI_Output (other,self ,"DIA_NASZ_222_Cappel_koniec_15_00"); //Przynios�em dla ciebie narz�dzia.
	B_GiveInvItems (other, self, ItMi_Saw, 3);
	B_GiveInvItems (other, self, ItMw_2h_Bau_Axe, 1);
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_01"); //�wietnie! Wielkie dzi�ki. Dzi�ki tobie nie b�d� musia� sam ugania� si� za nowymi, gdyby te u�ywane teraz si� zepsu�y.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_02"); //W okolicy nie ma majstra, kt�ry wytwarza�by dobre narz�dzia. Wszycy wal� m�otami w kowad�o, by produkowa� bro� i zbroje.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_koniec_55_03"); //Raz jeszcze dzi�kuj�. Oto twoja nagroda.

	Createinvitems (self, itmi_gold, 85);
	B_giveinvitems (self, other, itmi_gold, 85);

	DodajReputacje (2, REP_MYSLIWI);

	B_LogEntry (TOPIC_Cappel_pily, "Przynios�em Cappelowi narz�dzia. Wydawa� si� by� bardzo zadowolony.");
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
	AI_Output(self,other,"CappelSay_CantTeachYou_55_00"); //Niestety, niczego wi�cej ju� ci� nie naucz�.
	Cappel_Teach_NoMore = TRUE;
};

func void CappelSay_NoMoney() {
	AI_Output (self, other,"CappelSay_NoMoney_55_00"); //Nie masz do�� z�ota.
};

func void CappelSay_NoExp() {
	AI_Output (self, other,"CappelSay_NoExp_55_00"); //Brak ci do�wiadczenia.
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
		AI_Output (self, other, "DIA_NASZ_222_Cappel_Teach_Back_01_00"); //�wietnie! Teraz mo�esz skuteczniej wykorzystywa� swoje umiej�tno�ci.
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
	AI_Output (self, other,"DIA_NASZ_222_Cappel_HowAreYou_55_01"); //W okolicy stoi jeszcze par� drzew.
	AI_Output (self, other,"DIA_NASZ_222_Cappel_HowAreYou_55_02"); //Kto wie? Mo�e b�d� musia� �ci�� je wszystkie, gdy zacznie brakowa� mi surowc�w.	

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