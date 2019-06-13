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
	AI_Output (self, other,"DIA_NASZ_219_Dick_siema_55_01"); //¯egnaj.
	
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
	description = "Nie jesteœ zbyt rozmowny, co?";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_wiecej_15_00"); //Nie jesteœ zbyt rozmowny, co?
	AI_Output (self, other,"DIA_NASZ_219_Dick_wiecej_55_01"); //Nie. Za to jestem bardzo z³y.
	
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
	description = "Co ciê gryzie?";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_why_15_00"); //Co ciê gryzie?
	AI_Output (self, other,"DIA_NASZ_219_Dick_why_55_01"); //W nocy ktoœ zabra³ mi moje ziele i nie mam czym siê zadowalaæ. Bez tego czujê siê jak œcierwojad na wielkim oceanie.
	AI_Output (self, other,"DIA_NASZ_219_Dick_why_55_02"); //Nie wiem, co robiæ, nie wiem, jak dalej ¿yæ. Najgorsze jest to, ¿e kogo bym nie poprosi³ o pomoc, œmieje siê i mówi, ¿e kilka dni bez palenia dobrze mi zrobi.
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
	description = "Czy wiesz, kim by³ ten z³odziej?";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_thief_15_00"); //Czy wiesz, kim by³ ten z³odziej?
	AI_Output (self, other,"DIA_NASZ_219_Dick_thief_55_01"); //Jakbym wiedzia³, to ju¿ dawno poci¹³bym go na drobne kawa³eczki i rzuci³ na po¿arcie wilkom.

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
	description = "Co byœ powiedzia³ na to, ¿ebym przyniós³ ci skradzione ziele?";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_15_00"); //Co byœ powiedzia³ na to, ¿ebym przyniós³ ci skradzione ziele?
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_55_01"); //Ty? Pierwszy cz³owiek, który mówi do rzeczy! Œwietnie.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_55_02"); //Powiedzmy, ¿e je¿eli przyniesiesz mi moje ziele, to dostaniesz sto sztuk z³ota. Nadal zainteresowany poszukiwaniami?
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_15_03"); //Do³ó¿ do tego jeszcze jedn¹ ³odygê bagiennego ziela i zamieniam siê w detektywa!

	Wld_InsertItem (ItNa_PaczkaZiela,"NASZ_FP_DICK_PACZKA");
	Log_CreateTopic (TOPIC_Dick_ziele, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dick_ziele, LOG_RUNNING);
	B_LogEntry (TOPIC_Dick_ziele, "Dick z obozu myœliwych chcia³by odzyskaæ swoje skradzione ziele. Pewnie ktoœ je schowa³, ¿eby Dick w koñcu siê ogarn¹³.");
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
	description = "Mam twoj¹ paczkê ziela.";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_ziele_finish_15_00"); //Mam twoj¹ paczkê ziela.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_01"); //Nie wierzê. Dawaj!
	B_giveinvitems (other, self, ItNa_PaczkaZiela, 1);
	Createinvitems (self, ItMi_Joint, 1);	
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_02"); //Ahh! Tak. Tego potrzebowa³em.
	AI_Output (self, other,"DIA_NASZ_219_Dick_ziele_finish_55_03"); //Oto twoja zap³ata. Chcia³eœ bucha, prawda? Zapalimy razem.

	Createinvitems (self, ItMi_Joint, 2);
	B_giveinvitems (self, other, ItMi_Joint, 1);

	Createinvitems (self, itmi_gold, 50);
	B_giveinvitems (self, other, itmi_gold, 50);

	B_UseItem (self, ItMi_Joint);
	B_UseItem (other, ItMi_Joint);
		
	Log_SetTopicStatus (TOPIC_Dick_ziele, LOG_SUCCESS);
	B_LogEntry (TOPIC_Dick_ziele, "Odda³em paczkê w³aœcicielowi.");
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
	description = "Za³atwisz mi parê sztuk Mroku Pó³nocy?";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_Dobar_15_00"); //Za³atwisz mi parê sztuk Mroku Pó³nocy?
	
	if (npc_knowsinfo (other, DIA_NASZ_219_Dick_ziele_finish)) {
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_01"); //Pewnie. Ile potrzebujesz?
		AI_Output (other, self,"DIA_NASZ_219_Dick_Dobar_15_02"); //5 ³odyg.
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_03"); //Wiesz, ¿e to nie jest tani towar...
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_04"); //Za ka¿dego skrêta policzê ci 25 sztuk z³ota - koniec koñców dziêki tobie jakieœ mam.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_219_Dick_Dobar_55_05"); //A sk¹d go mam wzi¹æ? Przynieœ mi moj¹ paczkê, wtedy pogadamy.
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
	description = "Sprzedaj mi Mrok Pó³nocy. (125 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_DobarKupowanie_15_00"); //Sprzedaj mi Mrok Pó³nocy.
	
	if (npc_hasitems(other,ItMi_Gold) < 125) {
		DobarSayNoMoney();
		return;
	};
	
	DobarMrokPolnocyKupiony = TRUE;
	
	AI_Output (self, other,"DIA_NASZ_219_Dick_DobarKupowanie_55_01"); //Interesy z tob¹ to sama przyjemnoœæ.
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
	description = "Chcia³bym kupiæ bagienne ziele.";
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
		B_LogEntry (TOPIC_MysliwiTrader,"Dick mo¿e sprzedaæ mi trochê ze swojego zapasu bagiennego ziela.");
	};


	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_15_00"); //Chcia³bym kupiæ bagienne ziele.
	
	Info_ClearChoices	(DIA_NASZ_219_Dick_BagienneZiele);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, DIALOG_BACK 		,DIA_NASZ_219_Dick_BagienneZiele_Back);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "Ca³a roœlina. (5 szt. z³ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Herb);
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "£odyga bagiennego ziela. (10 szt. z³ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Joint);
	
};

func void DIA_NASZ_219_Dick_BagienneZiele_Back()
{
	Info_ClearChoices (DIA_NASZ_219_Dick_BagienneZiele);
};

func void DIA_NASZ_219_Dick_BagienneZiele_Herb()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_Herb_15_00"); //Ca³a roœlina.
	
	if (npc_hasitems(other,ItMi_Gold) < 5) {
		DobarSayNoMoney();
		return;
	};

	B_giveinvitems(other,self,ItMi_Gold,5);
	AI_Output (self, other,"DIA_NASZ_219_Dick_BagienneZiele_Herb_15_01"); //Specjalnie dla ciebie!
	Createinvitems (self, ItPl_SwampHerb, 1);
	B_giveinvitems (self, other, ItPl_SwampHerb, 1);
	
	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "Ca³a roœlina. (5 szt. z³ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Herb);

};

func void DIA_NASZ_219_Dick_BagienneZiele_Joint()
{
	AI_Output (other, self,"DIA_NASZ_219_Dick_BagienneZiele_Joint_15_00"); //£odyga bagiennego ziela.
	
	if (npc_hasitems(other,ItMi_Gold) < 10) {
		DobarSayNoMoney();
		return;
	};

	B_giveinvitems(other,self,ItMi_Gold,10);
	AI_Output (self, other,"DIA_NASZ_219_Dick_BagienneZiele_Joint_15_01"); //Ten towar nigdy mi siê nie skoñczy!
	Createinvitems (self, ItMi_Joint, 1);	
	B_giveinvitems (self, other, ItMi_Joint, 1);

	Info_AddChoice		(DIA_NASZ_219_Dick_BagienneZiele, "£odyga bagiennego ziela. (10 szt. z³ota)"	,DIA_NASZ_219_Dick_BagienneZiele_Joint);

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
	description = "Masz szczêœcie, ¿e ¿yjesz.";
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_PresjaCzasu_15_00"); //Masz szczêœcie, ¿e ¿yjesz.
	AI_Output (self, other,"DIA_NASZ_219_Dick_PresjaCzasu_55_01"); //A niech ciê! Ju¿ myœla³em, ¿e nawi¹za³em kontakt z zielonoskórymi i ¿e uda mi siê z nimi trochê zapaliæ.
	AI_Output (other, self,"DIA_NASZ_219_Dick_PresjaCzasu_15_02"); //Wracaj do obozu. O ile w ogóle jesteœ w stanie tam trafiæ...
	
	NASZ_219_Dick.guild = GIL_OUT;
	Npc_SetTrueGuild (NASZ_219_Dick, GIL_OUT);
	
	Npc_ExchangeRoutine(self,"Start");
	Log_SetTopicStatus (TOPIC_Udar_presja, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_presja, "Nie wiem, czy wielkim sensem by³o uratowanie Dicka, ale przynajmniej zabi³em orków zagra¿aj¹cym myœliwym.");
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
	AI_Output (other, self,"DIA_NASZ_219_Dick_HowAreYou_15_00"); //Tylko nie przepal sobie p³uc. Mózg ju¿ przepali³eœ.
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