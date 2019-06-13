
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
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Hello_55_00"); //Jeste� wreszcie! My�la�em, �e nie przyjdziesz i w ko�cu sam si� wybior� po pier�cienie.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Hello_55_01"); //Ile� mo�na czeka�? D�u�ej si� nie da�o?

	Info_ClearChoices (DIA_NASZ_218_Ammann_Hello);

		Info_AddChoice	  (DIA_NASZ_218_Ammann_Hello, "Oczywi�cie, �e si� da�o.", DIA_NASZ_218_Ammann_Hello_yea);
		Info_AddChoice	  (DIA_NASZ_218_Ammann_Hello, "Wybacz, Gestath poinformowa� mnie p�no.", DIA_NASZ_218_Ammann_Hello_sry);
};

FUNC VOID DIA_NASZ_218_Ammann_Hello_yea()
{

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Hello_yea_15_00"); //Oczywi�cie, �e si� da�o.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_yea_55_01"); //Mocni w g�bie jeste�my, co?
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_yea_55_02"); //Zobaczymy, co poka�esz w walce. Koniec ko�c�w, po to mi ci� tu przys�ano.

	Info_ClearChoices (DIA_NASZ_218_Ammann_Hello);
};

FUNC VOID DIA_NASZ_218_Ammann_Hello_sry()
{

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Hello_sry_15_00"); //Wybacz, Gestath poinformowa� mnie p�no.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_sry_55_01"); //No dobra, ale chod� ju�.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_Hello_sry_55_02"); //Nie wiem jak z twoim czasem, ale m�j jest cenny.

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
	description = "Opowiedz mi troch� o sobie.";
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
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_00"); //Opowiedz mi troch� o sobie.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_01"); //C�, jak ju� zapewne powiedzia� ci Gestath, nazywam si� Ammann.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_02"); //Pochodz� z Nordmaru, z Klanu Wilka. W g�rach polowa�em na rozpruwacze i cieszy�em si� wieczornymi biesiadami.
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_03"); //Jak trafi�e� tutaj? My�la�em, �e ludziom z Nordmaru nie pali si�, by opu�ci� �nie�ne krainy.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_04"); //Kiedy� razem z kilkoma pijanymi kompanami zeszli�my na kt�r�� z prze��czy i zabawili�my si� w polowanie na bizony. To bardzo popularna rozrywka w�r�d m�odych Nordmarczyk�w.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_05"); //Pech tak chcia�, �e znale�li�my si� na terenach �owieckich kr�la. Zostali�my pojmani i wys�ani na wysp� Khorinis.
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_History_15_06"); //Pracowa�e� w kopalni?
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_07"); //Nie. Do�� szybko wszed�em w kr�gi stra�nik�w i zosta�em jednym z ochroniarzy konwoj�w transportuj�cych rud� na prze��cz.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_History_55_08"); //Od tamtej pory min�o wiele czasu. To miejsce bardzo si� zmieni�o.

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
	description = "Czym s� te pier�cienie wierno�ci?";
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
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_Wiernosc_15_00"); //Czym s� te pier�cienie wierno�ci?
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_01"); //Nie wiem o nich zbyt wiele. Pono� jest ich 9 i je�li dziewi�ciu posiadaczy walczy razem, staj� si� silniejsi.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_02"); //Zweryfikujemy to przy najbli�szej okazji. W ka�dym razie kr�ci�em si� w okolicach jeziora i znalaz�em manuskrypt. Wynika�o z niego jasno, �e pier�cienie zosta�y ukryte gdzie� w g�rskiej fortecy.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_Wiernosc_55_03"); //Tam w�a�nie si� wybieramy.

	B_LogEntry (TOPIC_Ammann_wiernosc, "Pier�cienie wierno�ci, gdy posiadacze walcz� razem, czyni� ich silniejszymi. Jest ich 9 i znajduj� si� gdzie� w g�rskiej fortecy.");

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
	description = "Ruszajmy wi�c!";
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
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_gofirst_15_00"); //Ruszajmy wi�c!
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_01"); //Gdy na ciebie czeka�em, przygl�da�em si� fortecy. Zaj�li j� orkowie. To jeden z powod�w, dla kt�rego zdecydowa�em si� cierpliwie czeka�, a� przyjdziesz.
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_02"); //Wybiera� si� tam w pojedynk� nie jest zbyt rozs�dne. We dw�ch za to mamy szans�!
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_gofirst_55_03"); //Chod�!	
	
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
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_00"); //Na Innosa! Nie do��, �e pod g�r�, to jeszcze trzeba zabija� tych cholernych ork�w.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_01"); //Na wy�szych poziomach fortecy s�ycha� kolejnych ork�w. Zostan� tu, w razie gdyby nas zw�szyli. Je�li weszliby�my tam razem, to nie mieliby�my innej drogi ucieczki.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_02"); //Trzeba by�oby przebi� si� przez armi� ork�w.
	AI_Output (self, other,"DIA_NASZ_218_Ammann_finishsecond_55_03"); //W�a� do �rodka i przeszukaj parter. Gdyby� us�ysza� jakie� odg�osy walki, to pieronem wracaj do mnie i zabieramy si� st�d. 

	B_LogEntry (TOPIC_Ammann_wiernosc, "Musz� wej�� do fortecy i znale�� te pier�cienie.");
	
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
	description = "Mam to, po co tu przybyli�my.";
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
	AI_Output (other,self ,"DIA_NASZ_218_Ammann_done_15_00"); //Mam to, po co tu przybyli�my.
	B_giveinvitems (other, self, ItNa_Wiernosc, 9);
	
	if (hero.guild == GIL_OUT) {
		AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_02"); //Rozdaj pier�cienie stra�nikom, Gestathowi i Erakowi. Jeden jest tw�j.
		AmmannQuestKontynuacja = TRUE;
		B_giveinvitems (self, other, ItNa_Wiernosc, 8);
		B_LogEntry (TOPIC_Ammann_wiernosc, "Trzeba rozda� pier�cienie wszystkim stra�nikom, Erakowi i Gestathowi. Jeden jest m�j.");

	}
	else {
		// jesli sie jest lowca i misja nie jest kontynuowana
		AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_03"); //Oddam je Gestathowi. Ciekawe, czy faktycznie b�dziemy dzi�ki nim silniejsi?
		B_LogEntry (TOPIC_Ammann_wiernosc, "Znalaz�em pier�cienie i odda�em Ammannowi.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);	
	};

	AI_Output (other,self ,"DIA_NASZ_218_Ammann_done_15_04"); //Masz si� uda� do Kanionu Trolli. Gestath wzywa stra�nik�w.	
	AI_Output (self ,other,"DIA_NASZ_218_Ammann_done_55_05"); //To daleko st�d. Wyruszam w tej chwili! Do zobaczenia.

	KerolothMysliwi = KerolothMysliwi + 1;
	Npc_ExchangeRoutine (self, "Twierdza");
	B_LogEntry (TOPIC_Keroloth_pomoc, "Ammann uda� si� do twierdzy.");
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