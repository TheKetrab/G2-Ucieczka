//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_EXIT   (C_INFO)
{
	npc         = NASZ_219_Dick;
	nr          = 999;
	condition   = DIA_NASZ_219_Dick_EXIT_Condition;
	information = DIA_NASZ_219_Dick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_219_Dick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_219_Dick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_siema   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 1;
 	condition   = DIA_NASZ_219_Dick_siema_Condition;
 	information = DIA_NASZ_219_Dick_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_219_Dick_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_siema_15_00"); //Witaj.
	AI_Output (self, other,"DIA_NASZ_219_Dick_siema_55_01"); //�egnaj.
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Wiecej
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_wiecej   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 2;
 	condition   = DIA_NASZ_219_Dick_wiecej_Condition;
 	information = DIA_NASZ_219_Dick_wiecej_Info;
 	permanent   = FALSE;
	description = "Nie jeste� zbyt rozmowny, co?";
};

FUNC INT DIA_NASZ_219_Dick_wiecej_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_wiecej_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_wiecej_15_00"); //Nie jeste� zbyt rozmowny, co?
	AI_Output (self, other,"DIA_NASZ_219_Dick_wiecej_55_01"); //Nie. Za to jestem bardzo z�y.
	
};


//*********************************************************************
//	Info Why
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_why   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 3;
 	condition   = DIA_NASZ_219_Dick_why_Condition;
 	information = DIA_NASZ_219_Dick_why_Info;
 	permanent   = FALSE;
	description = "Co ci� gryzie?";
};

FUNC INT DIA_NASZ_219_Dick_why_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_wiecej))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_why_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_why_15_00"); //Co ci� gryzie?
	AI_Output (self, other,"DIA_NASZ_219_Dick_why_55_01"); //W nocy kto� zabra� mi moje ziele i nie mam czym si� zadowala�. Bez tego czuj� si� jak �cierwojad na wielkim oceanie.
	AI_Output (self, other,"DIA_NASZ_219_Dick_why_55_02"); //Nie wiem, co robi�, nie wiem, jak dalej �y�. Najgorsze jest to, �e kogo bym nie poprosi� o pomoc, �mieje si� i m�wi, �e kilka dni bez palenia dobrze mi zrobi.
};

//*********************************************************************
//	Info Thief
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_thief   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 4;
 	condition   = DIA_NASZ_219_Dick_thief_Condition;
 	information = DIA_NASZ_219_Dick_thief_Info;
 	permanent   = FALSE;
	description = "Czy wiesz, kim by� ten z�odziej?";
};

FUNC INT DIA_NASZ_219_Dick_thief_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_why))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_thief_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_thief_15_00"); //Czy wiesz, kim by� ten z�odziej?
	AI_Output (self, other,"DIA_NASZ_219_Dick_thief_55_01"); //Jakbym wiedzia�, to ju� dawno poci��bym go na drobne kawa�eczki i rzuci� na po�arcie wilkom.

};

//*********************************************************************
//	Info Ziele
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_ziele   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 5;
 	condition   = DIA_NASZ_219_Dick_ziele_Condition;
 	information = DIA_NASZ_219_Dick_ziele_Info;
 	permanent   = FALSE;
	description = "Co by� powiedzia� na to, �ebym przyni�s� ci skradzione ziele?";
};

FUNC INT DIA_NASZ_219_Dick_ziele_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_why))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_ziele_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_15_00"); //Co by� powiedzia� na to, �ebym przyni�s� ci skradzione ziele?
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_55_01"); //Ty? Pierwszy cz�owiek, kt�ry m�wi do rzeczy! �wietnie.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_55_02"); //Powiedzmy, �e je�eli przyniesiesz mi moje ziele, to dostaniesz sto sztuk z�ota. Nadal zainteresowany poszukiwaniami?
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_15_03"); //Do�� do tego jeszcze jedn� �odyg� bagiennego ziela i zamieniam si� w detektywa!

	Wld_InsertItem (ItNa_PaczkaZiela,"NASZ_FP_DICK_PACZKA");
	Log_CreateTopic (TOPIC_Dick_ziele, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dick_ziele, LOG_RUNNING);
	B_LogEntry (TOPIC_Dick_ziele, "Dick z obozu my�liwych chcia�by odzyska� swoje skradzione ziele. Pewnie kto� je schowa�, �eby Dick w ko�cu si� ogarn��.");
};

//*********************************************************************
//	Info Ziele Finish
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_ziele_finish   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 6;
 	condition   = DIA_NASZ_219_Dick_ziele_finish_Condition;
 	information = DIA_NASZ_219_Dick_ziele_finish_Info;
 	permanent   = FALSE;
	description = "Mam twoj� paczk� ziela.";
};

FUNC INT DIA_NASZ_219_Dick_ziele_finish_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele)
		&& npc_hasitems (other, ItNa_PaczkaZiela) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_ziele_finish_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_finish_15_00"); //Mam twoj� paczk� ziela.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_01"); //Nie wierz�. Dawaj!
	B_giveinvitems (other, self, ItNa_PaczkaZiela, 1);
	Createinvitems (self, ItMi_Joint, 1);	
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_02"); //Ahh! Tak. Tego potrzebowa�em.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_03"); //Oto twoja zap�ata. Chcia�e� bucha, prawda? Zapalimy razem.

	Createinvitems (self, ItMi_Joint, 2);
	B_giveinvitems (self, other, ItMi_Joint, 1);

	Createinvitems (self, itmi_gold, 50);
	B_giveinvitems (self, other, itmi_gold, 50);

	B_UseItem (self, ItMi_Joint);
	B_UseItem (other, ItMi_Joint);
		
	Log_SetTopicStatus (TOPIC_Dick_ziele, LOG_SUCCESS);
	B_LogEntry (TOPIC_Dick_ziele, "Odda�em paczk� w�a�cicielowi.");
	B_GivePlayerXP (300);
	DodajReputacje (1, REP_MYSLIWI);
};

//*********************************************************************
//	Info Dobar
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_Dobar   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 7;
 	condition   = DIA_NASZ_219_Dick_Dobar_Condition;
 	information = DIA_NASZ_219_Dick_Dobar_Info;
 	permanent   = FALSE;
	description = "Za�atwisz mi par� sztuk Mroku P�nocy?";
};

FUNC INT DIA_NASZ_219_Dick_Dobar_Condition()	
{
	if (Zadanie_Dobar_Dick == TRUE)
		&& (npc_knowsinfo (other, DIA_NASZ_219_Dick_why))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_Dobar_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_Dobar_15_00"); //Za�atwisz mi par� sztuk Mroku P�nocy?
	
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele_finish)) {
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_01"); //Pewnie. Ile potrzebujesz?
		AI_Output (other, self,"DIA_NASZ_219_Dick_Dobar_15_02"); //5 �odyg.
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_03"); //Wiesz, �e to nie jest tani towar...
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_04"); //Za ka�dego skr�ta policz� ci 25 sztuk z�ota - koniec ko�c�w dzi�ki tobie jakie� mam.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_05"); //A sk�d go mam wzi��? Przynie� mi moj� paczk�, wtedy pogadamy.
	};

};


func void DobarSayNoMoney() {
	AI_Output (self, other,"DIA_NASZ_219_Dick_DobarSayNoMoney_55_00"); //Palenie kosztuje! Nie dostaniesz ode mnie niczego za darmo!
};

var int DobarMrokPolnocyKupiony;
//*********************************************************************
//	Info Dobar Kupowanie
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_DobarKupowanie   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 8;
 	condition   = DIA_NASZ_219_Dick_DobarKupowanie_Condition;
 	information = DIA_NASZ_219_Dick_DobarKupowanie_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi Mrok P�nocy. (125 szt. z�ota)";
};

FUNC INT DIA_NASZ_219_Dick_DobarKupowanie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_Dobar) && npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele_finish))
	&& (DobarMrokPolnocyKupiony == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_DobarKupowanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_DobarKupowanie_15_00"); //Sprzedaj mi Mrok P�nocy.
	
	if (npc_hasitems(other,ItMi_Gold) < 125) {
		DobarSayNoMoney();
		return;
	};
	
	DobarMrokPolnocyKupiony = TRUE;
	
	AI_Output (self, other,"DIA_NASZ_219_Dick_DobarKupowanie_55_01"); //Interesy z tob� to sama przyjemno��.
	B_giveinvitems (other, self, ItMi_Gold, 125);

	Createinvitems (self, ItNa_MrokPolnocy, 5);	
	B_giveinvitems (self, other, ItNa_MrokPolnocy, 5);

};

//*********************************************************************
//	Info BagienneZiele
//*********************************************************************
var int DickBagienneZieleOneTime;
INSTANCE DIA_NASZ_219_Dick_BagienneZiele  (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 8;
 	condition   = DIA_NASZ_219_Dick_BagienneZiele_Condition;
 	information = DIA_NASZ_219_Dick_BagienneZiele_Info;
 	permanent   = TRUE;
	description = "Chcia�bym kupi� bagienne ziele.";
};

FUNC INT DIA_NASZ_219_Dick_BagienneZiele_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele_finish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_BagienneZiele_Info()
{
	if (DickBagienneZieleOneTime == FALSE) {
		DickBagienneZieleOneTime = TRUE;
		Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
		B_LogEntry (TOPIC_MysliwiTrader,"Dick mo�e sprzeda� mi troch� ze swojego zapasu bagiennego ziela.");
	};


	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_15_00"); //Chcia�bym kupi� bagienne ziele.
	
	Info_ClearChoices	(DIA_NASZ_219_Dick_BagienneZiele);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, DIALOG_BACK 		,DIA_NASZ_219_Dick_BagienneZiele_Back);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "Ca�a ro�lina. (5 szt. z�ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Herb);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "�odyga bagiennego ziela. (10 szt. z�ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Joint);
	
};

func void DIA_NASZ_219_Dick_BagienneZiele_Back()
{
	Info_ClearChoices (DIA_NASZ_219_Dick_BagienneZiele);
};

func void DIA_NASZ_219_Dick_BagienneZiele_Herb()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_Herb_15_00"); //Ca�a ro�lina.
	
	if (npc_hasitems(other,ItMi_Gold) < 5) {
		DobarSayNoMoney();
		return;
	};

	B_giveinvitems(other,self,ItMi_Gold,5);
	AI_Output (self, other,"DIA_NASZ_219_Dick_BagienneZiele_Herb_15_01"); //Specjalnie dla ciebie!
	Createinvitems (self, ItPl_SwampHerb, 1);
	B_giveinvitems (self, other, ItPl_SwampHerb, 1);
	
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "Ca�a ro�lina. (5 szt. z�ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Herb);

};

func void DIA_NASZ_219_Dick_BagienneZiele_Joint()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_Joint_15_00"); //�odyga bagiennego ziela.
	
	if (npc_hasitems(other,ItMi_Gold) < 10) {
		DobarSayNoMoney();
		return;
	};

	B_giveinvitems(other,self,ItMi_Gold,10);
	AI_Output (self, other,"DIA_NASZ_219_Dick_BagienneZiele_Joint_15_01"); //Ten towar nigdy mi si� nie sko�czy!
	Createinvitems (self, ItMi_Joint, 1);	
	B_giveinvitems (self, other, ItMi_Joint, 1);

	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "�odyga bagiennego ziela. (10 szt. z�ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Joint);

};


//*********************************************************************
//	Info PresjaCzasu
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_PresjaCzasu   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 8;
 	condition   = DIA_NASZ_219_Dick_PresjaCzasu_Condition;
 	information = DIA_NASZ_219_Dick_PresjaCzasu_Info;
 	permanent   = FALSE;
	description = "Masz szcz�cie, �e �yjesz.";
};

FUNC INT DIA_NASZ_219_Dick_PresjaCzasu_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_PresjaCzasu))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_PresjaCzasu_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_PresjaCzasu_15_00"); //Masz szcz�cie, �e �yjesz.
	AI_Output (self, other,"DIA_NASZ_219_Dick_PresjaCzasu_55_01"); //A niech ci�! Ju� my�la�em, �e nawi�za�em kontakt z zielonosk�rymi i �e uda mi si� z nimi troch� zapali�.
	AI_Output (other, self,"DIA_NASZ_219_Dick_PresjaCzasu_15_02"); //Wracaj do obozu. O ile w og�le jeste� w stanie tam trafi�...
	
	NASZ_219_Dick.guild = GIL_OUT;
	Npc_SetTrueGuild (NASZ_219_Dick, GIL_OUT);
	
	Npc_ExchangeRoutine(self,"Start");
	Log_SetTopicStatus (TOPIC_Udar_presja, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_presja, "Nie wiem, czy wielkim sensem by�o uratowanie Dicka, ale przynajmniej zabi�em ork�w zagra�aj�cym my�liwym.");
	B_GivePlayerXP(700);
	
	DodajReputacje(4,REP_MYSLIWI);
	
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_219_Dick_HowAreYou   (C_INFO)
{
	npc         = NASZ_219_Dick;
 	nr          = 500;
 	condition   = DIA_NASZ_219_Dick_HowAreYou_Condition;
 	information = DIA_NASZ_219_Dick_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "(Zdenerwuj Dicka)";
};

FUNC INT DIA_NASZ_219_Dick_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele_finish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_219_Dick_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_HowAreYou_15_00"); //Tylko nie przepal sobie p�uc. M�zg ju� przepali�e�.
	AI_Output (self, other,"DIA_NASZ_219_Dick_HowAreYou_55_01"); //Tsaaa.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_219_Dick_PICKPOCKET (C_INFO)
{
	npc			= NASZ_219_Dick;
	nr			= 900;
	condition	= DIA_NASZ_219_Dick_PICKPOCKET_Condition;
	information	= DIA_NASZ_219_Dick_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_219_Dick_PICKPOCKET_Condition()
{
	C_Beklauen (37);
};
 
FUNC VOID DIA_NASZ_219_Dick_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_219_Dick_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_219_Dick_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_219_Dick_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_219_Dick_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_219_Dick_PICKPOCKET_DoIt);
};

func void DIA_NASZ_219_Dick_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItMi_Joint,6);
	
	Info_ClearChoices (DIA_NASZ_219_Dick_PICKPOCKET);
};
	
func void DIA_NASZ_219_Dick_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_219_Dick_PICKPOCKET);
};