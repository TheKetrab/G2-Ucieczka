//*********************************************************************
//	Info EXIT 
//*********************************************************************
var int TeshinooEndFirstTime;
// ----- ----- ----- ----- -----

INSTANCE DIA_NASZ_019_Teshinoo_EXIT   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
	nr          = 999;
	condition   = DIA_NASZ_019_Teshinoo_EXIT_Condition;
	information = DIA_NASZ_019_Teshinoo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_019_Teshinoo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_019_Teshinoo_EXIT_Info()
{

	if(TeshinooEndFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_00"); //Czekaæ, morra! Musieæ coœ wiedzieæ.
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_01"); //O co ci chodzi, wielkoludzie?
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_02"); //Ty nie biæ siê z orki. Nas za du¿o. Gdy ork wojownik boli, g³oœno wyæ.
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_03"); //To obudziæ inne orki, z miasta. Ty nie daæ im rady.
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_04"); //Co z orkami innymi ni¿ wojownicy?
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_05"); //Syn Ducha mieæ cichy g³os, elita byæ silny i nie wyæ. Ale orki kuszka wyæ!
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_06"); //Dobrze, zapamiêtam radê. Mo¿e uda mi siê przemkn¹æ niepostrze¿enie.

		ff_applyonceext(OrcCityFog,5000,-1);
		
		TeshinooEndFirstTime = TRUE;
		B_LogEntry (TOPIC_OrcCity_In, "Ork w wiêzieniu uprzedzi³ mnie, ¿ebym nie walczy³ z ¿adnym orkiem-wojownikiem ani kusznikiem na widoku, bo zleci siê ich masa z miasta w g³êbi. A wiêc muszê uciekaæ, gdy któryœ z nich rzuci siê za mn¹ w pogoñ.");
	};

	AI_StopProcessInfos (self);
};

func void TeshinooSayYes() {
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_SayYes_15_00"); //Tak.
};


//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_siema   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 1;
 	condition   = DIA_NASZ_019_Teshinoo_siema_Condition;
 	information = DIA_NASZ_019_Teshinoo_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_019_Teshinoo_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_019_Teshinoo_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_siema_15_00"); //Kraty otwarte!
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_siema_15_01"); //Kim ty byæ, morra?
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_siema_15_02"); //Nazywam siê Will. Przyszed³em tu, by znaleŸæ portal stworzony przez bogów.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_siema_15_03"); //Bogów? Syn Ducha robiæ portal, nie bóg.

};

//*********************************************************************
//	Info IDK
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_IDK   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 2;
 	condition   = DIA_NASZ_019_Teshinoo_IDK_Condition;
 	information = DIA_NASZ_019_Teshinoo_IDK_Info;
 	permanent   = FALSE;
 	description = "Gdzie ja jestem?";
};

FUNC INT DIA_NASZ_019_Teshinoo_IDK_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_019_Teshinoo_IDK_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_IDK_15_00"); //Gdzie ja jestem?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_IDK_55_01"); //W du¿e miasto. Orki miasto. Tutaj wiêzienie.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_IDK_55_02"); //Sk¹d znasz jêzyk ludzki?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_IDK_55_03"); //Orki chcieæ byæ szaman. Musieæ uczyæ siê jêzyk cz³owiek.

};


//*********************************************************************
//	Info ForWhat
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_ForWhat   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 3;
 	condition   = DIA_NASZ_019_Teshinoo_ForWhat_Condition;
 	information = DIA_NASZ_019_Teshinoo_ForWhat_Info;
 	permanent   = FALSE;
 	description = "Dlaczego orkowie ciê zamknêli?";
};

FUNC INT DIA_NASZ_019_Teshinoo_ForWhat_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_IDK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_ForWhat_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_ForWhat_15_00"); //Dlaczego orkowie ciê zamknêli?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_ForWhat_55_01"); //Ja obraziæ Syn Ducha. Szamani czarowaæ nad portal. To przenieœæ orki.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_ForWhat_55_02"); //Dok¹d mia³ prowadziæ ten portal?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_ForWhat_15_03"); //U nas mówiæ KAB'HU. Ludzie mówiæ KONTYNENT.

};

//*********************************************************************
//	Info WhyPortal
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_WhyPortal   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 4;
 	condition   = DIA_NASZ_019_Teshinoo_WhyPortal_Condition;
 	information = DIA_NASZ_019_Teshinoo_WhyPortal_Info;
 	permanent   = FALSE;
 	description = "Po co wam po³¹czenie Khorinis z kontynentem?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WhyPortal_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_ForWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_WhyPortal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhyPortal_15_00"); //Po co wam po³¹czenie Khorinis z kontynentem?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_55_01"); //Orki wygraæ wojnê. Tutaj du¿a baza. Du¿o statki i orki.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_55_02"); //Du¿o miejsca musieæ. Rekrutowaæ wielki wojownik. Podbijaæ œwiat.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_15_03"); //Portal nie dzia³aæ. Teshinoo œmiaæ siê z Syn Ducha. Orki biæ Teshinoo. Zamkn¹æ tu.

	B_LogEntry (TOPIC_OrcCity_In, "Chyba powoli zaczynam rozumieæ zamys³ bogów. Orkowie maj¹ w³asny portal prowadz¹cy na Myrtanê. Teshinoo twierdzi, ¿e nie dzia³a, ale teraz po interwencji ze strony Innosa, Adanosa i Beliara, magiczny teleporter powinien dzia³aæ.");
};

//*********************************************************************
//	Info WherePortal
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_WherePortal   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 5;
 	condition   = DIA_NASZ_019_Teshinoo_WherePortal_Condition;
 	information = DIA_NASZ_019_Teshinoo_WherePortal_Info;
 	permanent   = FALSE;
 	description = "Gdzie jest ten portal?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WherePortal_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_ForWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_WherePortal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WherePortal_15_00"); //Gdzie jest ten portal?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_01"); //Ukryty. Mury... wejœcie na dó³. Tam byæ portal zamkniêty na du¿o kraty.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_02"); //Nikt nie móc iœæ do portal. Portal nie dzia³aæ. Niebezpiecznie.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_03"); //Syn Ducha naprawiaæ portal. Chcieæ spokój.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WherePortal_15_04"); //Jak mogê otworzyæ te kraty?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_05"); //Szukaæ trzy GU-RA-PA.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WherePortal_15_06"); //GU-RA-PA?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_07"); //Byæ prze³¹cznik ko³o. Ukryte w miasto.

	B_LogEntry (TOPIC_OrcCity_In, "Portal jest zamkniêty za kratami, które mogê otworzyæ dziêki okr¹g³ym prze³¹cznikom ukrytym w mieœcie orków.");

};

//*********************************************************************
//	Info WidzialesJak
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_WidzialesJak   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 6;
 	condition   = DIA_NASZ_019_Teshinoo_WidzialesJak_Condition;
 	information = DIA_NASZ_019_Teshinoo_WidzialesJak_Info;
 	permanent   = FALSE;
 	description = "Widzia³eœ, jak mnie tu zamykali?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WidzialesJak_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_019_Teshinoo_WidzialesJak_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WidzialesJak_15_00"); //Widzia³eœ, jak mnie tu zamykali?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_01"); //Byæ potrz¹s ska³. Kuro'K przynieœæ martwy cz³owiek tutaj.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_02"); //Nie wiesz, gdzie mog¹ byæ moje rzeczy?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_03"); //Mo¿e w dom Kuro'K?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_04"); //Kuro'K byæ ork-stra¿nik. Mieæ dom blisko tutaj. Wyjœæ st¹d i skrêciæ w prawo.

};

//*********************************************************************
//	Info WhatIsInCity
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_WhatIsInCity   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 7;
 	condition   = DIA_NASZ_019_Teshinoo_WhatIsInCity_Condition;
 	information = DIA_NASZ_019_Teshinoo_WhatIsInCity_Info;
 	permanent   = FALSE;
 	description = "Co znajduje siê w waszym mieœcie?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WhatIsInCity_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_WherePortal))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_WhatIsInCity_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhatIsInCity_15_00"); //Co znajduje siê w waszym mieœcie?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_01"); //Ty byæ w zewnêtrzna twierdza.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_02"); //My mieæ du¿o domy. Mieæ dom wódz. Byæ Syn Ducha.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_03"); //Du¿y Syn Ducha staæ i broniæ orki. Byæ kamieñ.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_04"); //Orki uczyæ byæ Syn Ducha w specjalne miejsce.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_05"); //I byæ portal. Du¿y.
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhatIsInCity_15_06"); //Co masz na myœli mówi¹c 'œrodkowa twierdza'?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_07"); //Kiedy wejœæ do jaskinia i przejœæ most, mo¿na skrêciæ w prawo. Tam zamkniête drzwi i du¿o wiêcej orki.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_08"); //Ty jednak skrêciæ w lewo i byæ w œrodkowa twierdza.

	B_LogEntry (TOPIC_OrcCity_In, "Z³a wiadomoœæ: Mogê wyr¿n¹æ wszystkich orków tutaj, ale ich g³ówne si³y siedz¹ zamkniête g³êboko w pieczarach. Przez portal przybêd¹ hordy orków... Wyspa Khorinis wydaje siê byæ stracona. Muszê siê st¹d wydostaæ.");

};

//*********************************************************************
//	Info WhereAreSwitch
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_WhereAreSwitch   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 8;
 	condition   = DIA_NASZ_019_Teshinoo_WhereAreSwitch_Condition;
 	information = DIA_NASZ_019_Teshinoo_WhereAreSwitch_Info;
 	permanent   = FALSE;
 	description = "Wiesz, gdzie s¹ te okr¹g³e prze³¹czniki?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WhereAreSwitch_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_WhatIsInCity))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_WhereAreSwitch_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_15_00"); //Wiesz, gdzie s¹ te okr¹g³e prze³¹czniki?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_55_01"); //Nie. Ale domyœlaæ siê, gdzie jest jeden.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_55_02"); //Wodzowie mieæ jeden. Chyba.
	
	B_LogEntry (TOPIC_OrcCity_In, "Teshinoo domyœla siê, ¿e jeden z okr¹g³ych prze³¹czników jest gdzieœ obok orkowych wodzów.");

};

var int TeshinooMozeCieProwadzic;
var int TeshinooProwadziCieGdzies;
//*********************************************************************
//	Info JestesWolny
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_JestesWolny   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 9;
 	condition   = DIA_NASZ_019_Teshinoo_JestesWolny_Condition;
 	information = DIA_NASZ_019_Teshinoo_JestesWolny_Info;
 	permanent   = FALSE;
 	description = "Jesteœ wolny, co teraz zrobisz?";
};

FUNC INT DIA_NASZ_019_Teshinoo_JestesWolny_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_019_Teshinoo_WherePortal))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_JestesWolny_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_15_00"); //Jesteœ wolny, co teraz zrobisz?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_55_01"); //Ja nie wiedzieæ.

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_JestesWolny);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_JestesWolny, "W takim razie chyba tu zostaniesz.", DIA_NASZ_019_Teshinoo_JestesWolny_yes);
		// UWAGA - w ostatecznej wersji gry chodzenie z Teshinoo zostalo usuniete, bo bylo zbyt problematyczne (rzucal sie na orkow)
		// Info_AddChoice	  (DIA_NASZ_019_Teshinoo_JestesWolny, "Mo¿esz udaæ siê ze mn¹.", DIA_NASZ_019_Teshinoo_JestesWolny_no);

};

FUNC VOID DIA_NASZ_019_Teshinoo_JestesWolny_yes()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_yes_15_00"); //W takim razie chyba tu zostaniesz.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_yes_15_01"); //Chyba tak. Mora zamkn¹æ krata. Ja prosiæ.

	Npc_ExchangeRoutine (self, "Start");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_JestesWolny);
};


FUNC VOID DIA_NASZ_019_Teshinoo_JestesWolny_no()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_no_15_00"); //Mo¿esz udaæ siê ze mn¹.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_no_15_01"); //Ty uratowaæ Teshinoo. Ja pomagaæ ci.
	
	TeshinooMozeCieProwadzic = TRUE;

	TeshinooProwadziCieGdzies = FALSE;
	
	//NASZ_019_Teshinoo.guild = GIL_DJG;
	//Npc_SetTrueGuild (NASZ_019_Teshinoo, GIL_DJG);
	
	Npc_ExchangeRoutine (self, "FollowMain");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_019_Teshinoo,1);
	
	Info_ClearChoices (DIA_NASZ_019_Teshinoo_JestesWolny);
};

//*********************************************************************
//	Info GuideMe
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_GuideMe   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 10;
 	condition   = DIA_NASZ_019_Teshinoo_GuideMe_Condition;
 	information = DIA_NASZ_019_Teshinoo_GuideMe_Info;
 	permanent   = TRUE;
 	description = "ZaprowadŸ mnie do...";
};

FUNC INT DIA_NASZ_019_Teshinoo_GuideMe_Condition()
{
	if (TeshinooMozeCieProwadzic == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_15_00"); //ZaprowadŸ mnie do...

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
		Info_AddChoice 	  (DIA_NASZ_019_Teshinoo_GuideMe, DIALOG_BACK, DIA_NASZ_019_Teshinoo_GuideMe_BACK);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...wiêzienia.", DIA_NASZ_019_Teshinoo_GuideMe_prison);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...szko³y szamanów.", DIA_NASZ_019_Teshinoo_GuideMe_school);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...kamiennego szamana.", DIA_NASZ_019_Teshinoo_GuideMe_shaman);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...portalu.", DIA_NASZ_019_Teshinoo_GuideMe_portal);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...waszych wodzów.", DIA_NASZ_019_Teshinoo_GuideMe_boss);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...bramy g³ównej.", DIA_NASZ_019_Teshinoo_GuideMe_main);

};

func void DIA_NASZ_019_Teshinoo_GuideMe_BACK()
{
	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_prison()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_prison_15_00"); //...wiêzienia.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuidePrison");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_school()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_no_15_00"); //...szko³y szamanów.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuideSchool");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_shaman()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_shaman_15_00"); //...kamiennego szamana.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuideShaman");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_portal()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_portal_15_00"); //...portalu.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuidePortal");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_boss()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_boss_15_00"); //...waszych wodzów.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuideBoss");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_main()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_main_15_00"); //...bramy g³ównej.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuideMain");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

//*********************************************************************
//	Info FollowMe
//*********************************************************************
INSTANCE DIA_NASZ_019_Teshinoo_FollowMe   (C_INFO)
{
	npc         = NASZ_019_Teshinoo;
 	nr          = 11;
 	condition   = DIA_NASZ_019_Teshinoo_FollowMe_Condition;
 	information = DIA_NASZ_019_Teshinoo_FollowMe_Info;
 	permanent   = TRUE;
 	description = "Za mn¹!";
};

FUNC INT DIA_NASZ_019_Teshinoo_FollowMe_Condition()
{
	if (TeshinooProwadziCieGdzies == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_019_Teshinoo_FollowMe_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_FollowMe_15_00"); //Za mn¹!
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = FALSE;

	Npc_ExchangeRoutine (self, "FollowMain");
};