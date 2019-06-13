
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_EXIT   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 999;
	condition   = DIA_NASZ_218_Ammann_EXIT_Condition;
	information = DIA_NASZ_218_Ammann_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_218_Ammann_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_218_Ammann_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_Hello   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 1;
	condition   = DIA_NASZ_218_Ammann_Hello_Condition;
	information = DIA_NASZ_218_Ammann_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_218_Ammann_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_218_Ammann_Hello_Info()
{
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Hello_55_00"); //Jesteœ wreszcie! Myœla³em, ¿e nie przyjdziesz i w koñcu sam siê wybiorê po pierœcienie.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Hello_55_01"); //Ile¿ mo¿na czekaæ? D³u¿ej siê nie da³o?

	Info_ClearChoices (DIA_NASZ_218_Ammann_Hello);

		Info_AddChoice	  (DIA_NASZ_218_Ammann_Hello, "Oczywiœcie, ¿e siê da³o.", DIA_NASZ_218_Ammann_Hello_yea);
		Info_AddChoice	  (DIA_NASZ_218_Ammann_Hello, "Wybacz, Gestath poinformowa³ mnie póŸno.", DIA_NASZ_218_Ammann_Hello_sry);
};

FUNC VOID DIA_NASZ_218_Ammann_Hello_yea()
{

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Hello_yea_15_00"); //Oczywiœcie, ¿e siê da³o.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_yea_55_01"); //Mocni w gêbie jesteœmy, co?
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_yea_55_02"); //Zobaczymy, co poka¿esz w walce. Koniec koñców, po to mi ciê tu przys³ano.

	Info_ClearChoices (DIA_NASZ_218_Ammann_Hello);
};

FUNC VOID DIA_NASZ_218_Ammann_Hello_sry()
{

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Hello_sry_15_00"); //Wybacz, Gestath poinformowa³ mnie póŸno.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_sry_55_01"); //No dobra, ale chodŸ ju¿.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_sry_55_02"); //Nie wiem jak z twoim czasem, ale mój jest cenny.

	Info_ClearChoices (DIA_NASZ_218_Ammann_Hello);
};


//*********************************************************************
//	Info History
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_History   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 2;
	condition   = DIA_NASZ_218_Ammann_History_Condition;
	information = DIA_NASZ_218_Ammann_History_Info;
	permanent   = FALSE;
	description = "Opowiedz mi trochê o sobie.";
};

FUNC INT DIA_NASZ_218_Ammann_History_Condition()
{
	if (Npc_KnowsInfo (other,DIA_NASZ_218_Ammann_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_218_Ammann_History_Info()
{
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_00"); //Opowiedz mi trochê o sobie.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_01"); //Có¿, jak ju¿ zapewne powiedzia³ ci Gestath, nazywam siê Ammann.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_02"); //Pochodzê z Nordmaru, z Klanu Wilka. W górach polowa³em na rozpruwacze i cieszy³em siê wieczornymi biesiadami.
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_03"); //Jak trafi³eœ tutaj? Myœla³em, ¿e ludziom z Nordmaru nie pali siê, by opuœciæ œnie¿ne krainy.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_04"); //Kiedyœ razem z kilkoma pijanymi kompanami zeszliœmy na któr¹œ z prze³êczy i zabawiliœmy siê w polowanie na bizony. To bardzo popularna rozrywka wœród m³odych Nordmarczyków.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_05"); //Pech tak chcia³, ¿e znaleŸliœmy siê na terenach ³owieckich króla. Zostaliœmy pojmani i wys³ani na wyspê Khorinis.
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_06"); //Pracowa³eœ w kopalni?
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_07"); //Nie. Doœæ szybko wszed³em w krêgi stra¿ników i zosta³em jednym z ochroniarzy konwojów transportuj¹cych rudê na prze³êcz.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_08"); //Od tamtej pory minê³o wiele czasu. To miejsce bardzo siê zmieni³o.

};

//*********************************************************************
//	Info Wiernosc
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_Wiernosc   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 3;
	condition   = DIA_NASZ_218_Ammann_Wiernosc_Condition;
	information = DIA_NASZ_218_Ammann_Wiernosc_Info;
	permanent   = FALSE;
	description = "Czym s¹ te pierœcienie wiernoœci?";
};

FUNC INT DIA_NASZ_218_Ammann_Wiernosc_Condition()
{
	if (Npc_KnowsInfo (other,DIA_NASZ_218_Ammann_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_218_Ammann_Wiernosc_Info()
{
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Wiernosc_15_00"); //Czym s¹ te pierœcienie wiernoœci?
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_01"); //Nie wiem o nich zbyt wiele. Ponoæ jest ich 9 i jeœli dziewiêciu posiadaczy walczy razem, staj¹ siê silniejsi.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_02"); //Zweryfikujemy to przy najbli¿szej okazji. W ka¿dym razie krêci³em siê w okolicach jeziora i znalaz³em manuskrypt. Wynika³o z niego jasno, ¿e pierœcienie zosta³y ukryte gdzieœ w górskiej fortecy.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_03"); //Tam w³aœnie siê wybieramy.

	B_LogEntry (TOPIC_Ammann_wiernosc, "Pierœcienie wiernoœci, gdy posiadacze walcz¹ razem, czyni¹ ich silniejszymi. Jest ich 9 i znajduj¹ siê gdzieœ w górskiej fortecy.");

};


//*********************************************************************
//	Let's Go First
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_gofirst   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 4;
	condition   = DIA_NASZ_218_Ammann_gofirst_Condition;
	information = DIA_NASZ_218_Ammann_gofirst_Info;
	permanent   = FALSE;
	description = "Ruszajmy wiêc!";
};

FUNC INT DIA_NASZ_218_Ammann_gofirst_Condition()
{
	if (Npc_KnowsInfo (other,DIA_NASZ_218_Ammann_Wiernosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_218_Ammann_gofirst_Info()
{
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_gofirst_15_00"); //Ruszajmy wiêc!
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_01"); //Gdy na ciebie czeka³em, przygl¹da³em siê fortecy. Zajêli j¹ orkowie. To jeden z powodów, dla którego zdecydowa³em siê cierpliwie czekaæ, a¿ przyjdziesz.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_02"); //Wybieraæ siê tam w pojedynkê nie jest zbyt rozs¹dne. We dwóch za to mamy szansê!
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_03"); //ChodŸ!	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Forteca");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_218_Ammann,1);

};

//*********************************************************************
//	Finish second
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_finishsecond   (C_INFO)
{
	npc         = NASZ_218_Ammann;
 	nr          = 7;
 	condition   = DIA_NASZ_218_Ammann_finishsecond_Condition;
 	information = DIA_NASZ_218_Ammann_finishsecond_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_218_Ammann_finishsecond_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_218_Ammann_gofirst))
	&& (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN7") < 500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_218_Ammann_finishsecond_Info()
{
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_00"); //Na Innosa! Nie doœæ, ¿e pod górê, to jeszcze trzeba zabijaæ tych cholernych orków.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_01"); //Na wy¿szych poziomach fortecy s³ychaæ kolejnych orków. Zostanê tu, w razie gdyby nas zwêszyli. Jeœli weszlibyœmy tam razem, to nie mielibyœmy innej drogi ucieczki.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_02"); //Trzeba by³oby przebiæ siê przez armiê orków.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_03"); //W³aŸ do œrodka i przeszukaj parter. Gdybyœ us³ysza³ jakieœ odg³osy walki, to pieronem wracaj do mnie i zabieramy siê st¹d. 

	B_LogEntry (TOPIC_Ammann_wiernosc, "Muszê wejœæ do fortecy i znaleŸæ te pierœcienie.");
	
	Npc_ExchangeRoutine (self, "After");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_218_Ammann,0);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_218_Ammann_done   (C_INFO)
{
	npc         = NASZ_218_Ammann;
	nr          = 8;
	condition   = DIA_NASZ_218_Ammann_done_Condition;
	information = DIA_NASZ_218_Ammann_done_Info;
	permanent   = FALSE;
	description = "Mam to, po co tu przybyliœmy.";
};

FUNC INT DIA_NASZ_218_Ammann_done_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_218_Ammann_finishsecond) 
	&& npc_hasitems (other, ItNa_Wiernosc) >= 9)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_218_Ammann_done_Info()
{
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_done_15_00"); //Mam to, po co tu przybyliœmy.
	B_giveinvitems (other, self, ItNa_Wiernosc, 9);
	
	if (hero.guild == GIL_OUT) {
		AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_02"); //Rozdaj pierœcienie stra¿nikom, Gestathowi i Erakowi. Jeden jest twój.
		AmmannQuestKontynuacja = TRUE;
		B_giveinvitems (self, other, ItNa_Wiernosc, 8);
		B_LogEntry (TOPIC_Ammann_wiernosc, "Trzeba rozdaæ pierœcienie wszystkim stra¿nikom, Erakowi i Gestathowi. Jeden jest mój.");

	}
	else {
		// jesli sie jest lowca i misja nie jest kontynuowana
		AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_03"); //Oddam je Gestathowi. Ciekawe, czy faktycznie bêdziemy dziêki nim silniejsi?
		B_LogEntry (TOPIC_Ammann_wiernosc, "Znalaz³em pierœcienie i odda³em Ammannowi.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);	
	};

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_done_15_04"); //Masz siê udaæ do Kanionu Trolli. Gestath wzywa stra¿ników.	
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_05"); //To daleko st¹d. Wyruszam w tej chwili! Do zobaczenia.

	KerolothMysliwi = KerolothMysliwi + 1;
	Npc_ExchangeRoutine (self, "Twierdza");
	B_LogEntry (TOPIC_Keroloth_pomoc, "Ammann uda³ siê do twierdzy.");
	AI_StopProcessInfos (self);

};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_218_Ammann_PICKPOCKET (C_INFO)
{
	npc			= NASZ_218_Ammann;
	nr			= 900;
	condition	= DIA_NASZ_218_Ammann_PICKPOCKET_Condition;
	information	= DIA_NASZ_218_Ammann_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_218_Ammann_PICKPOCKET_Condition()
{
	C_Beklauen (57);
};
 
FUNC VOID DIA_NASZ_218_Ammann_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_218_Ammann_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_218_Ammann_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_218_Ammann_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_218_Ammann_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_218_Ammann_PICKPOCKET_DoIt);
};

func void DIA_NASZ_218_Ammann_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,88);
	
	Info_ClearChoices (DIA_NASZ_218_Ammann_PICKPOCKET);
};
	
func void DIA_NASZ_218_Ammann_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_218_Ammann_PICKPOCKET);
};