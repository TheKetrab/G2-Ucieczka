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
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_00"); //Czeka�, morra! Musie� co� wiedzie�.
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_01"); //O co ci chodzi, wielkoludzie?
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_02"); //Ty nie bi� si� z orki. Nas za du�o. Gdy ork wojownik boli, g�o�no wy�.
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_03"); //To obudzi� inne orki, z miasta. Ty nie da� im rady.
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_04"); //Co z orkami innymi ni� wojownicy?
		AI_Output (self, other,"DIA_NASZ_019_Teshinoo_exit_15_05"); //Syn Ducha mie� cichy g�os, elita by� silny i nie wy�. Ale orki kuszka wy�!
		AI_Output (other, self,"DIA_NASZ_019_Teshinoo_exit_15_06"); //Dobrze, zapami�tam rad�. Mo�e uda mi si� przemkn�� niepostrze�enie.

		ff_applyonceext(OrcCityFog,5000,-1);
		
		TeshinooEndFirstTime = TRUE;
		B_LogEntry (TOPIC_OrcCity_In, "Ork w wi�zieniu uprzedzi� mnie, �ebym nie walczy� z �adnym orkiem-wojownikiem ani kusznikiem na widoku, bo zleci si� ich masa z miasta w g��bi. A wi�c musz� ucieka�, gdy kt�ry� z nich rzuci si� za mn� w pogo�.");
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
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_siema_15_01"); //Kim ty by�, morra?
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_siema_15_02"); //Nazywam si� Will. Przyszed�em tu, by znale�� portal stworzony przez bog�w.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_siema_15_03"); //Bog�w? Syn Ducha robi� portal, nie b�g.

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
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_IDK_55_01"); //W du�e miasto. Orki miasto. Tutaj wi�zienie.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_IDK_55_02"); //Sk�d znasz j�zyk ludzki?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_IDK_55_03"); //Orki chcie� by� szaman. Musie� uczy� si� j�zyk cz�owiek.

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
 	description = "Dlaczego orkowie ci� zamkn�li?";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_ForWhat_15_00"); //Dlaczego orkowie ci� zamkn�li?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_ForWhat_55_01"); //Ja obrazi� Syn Ducha. Szamani czarowa� nad portal. To przenie�� orki.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_ForWhat_55_02"); //Dok�d mia� prowadzi� ten portal?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_ForWhat_15_03"); //U nas m�wi� KAB'HU. Ludzie m�wi� KONTYNENT.

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
 	description = "Po co wam po��czenie Khorinis z kontynentem?";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhyPortal_15_00"); //Po co wam po��czenie Khorinis z kontynentem?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_55_01"); //Orki wygra� wojn�. Tutaj du�a baza. Du�o statki i orki.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_55_02"); //Du�o miejsca musie�. Rekrutowa� wielki wojownik. Podbija� �wiat.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhyPortal_15_03"); //Portal nie dzia�a�. Teshinoo �mia� si� z Syn Ducha. Orki bi� Teshinoo. Zamkn�� tu.

	B_LogEntry (TOPIC_OrcCity_In, "Chyba powoli zaczynam rozumie� zamys� bog�w. Orkowie maj� w�asny portal prowadz�cy na Myrtan�. Teshinoo twierdzi, �e nie dzia�a, ale teraz po interwencji ze strony Innosa, Adanosa i Beliara, magiczny teleporter powinien dzia�a�.");
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
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_01"); //Ukryty. Mury... wej�cie na d�. Tam by� portal zamkni�ty na du�o kraty.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_02"); //Nikt nie m�c i�� do portal. Portal nie dzia�a�. Niebezpiecznie.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_03"); //Syn Ducha naprawia� portal. Chcie� spok�j.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WherePortal_15_04"); //Jak mog� otworzy� te kraty?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_05"); //Szuka� trzy GU-RA-PA.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WherePortal_15_06"); //GU-RA-PA?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WherePortal_55_07"); //By� prze��cznik ko�o. Ukryte w miasto.

	B_LogEntry (TOPIC_OrcCity_In, "Portal jest zamkni�ty za kratami, kt�re mog� otworzy� dzi�ki okr�g�ym prze��cznikom ukrytym w mie�cie ork�w.");

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
 	description = "Widzia�e�, jak mnie tu zamykali?";
};

FUNC INT DIA_NASZ_019_Teshinoo_WidzialesJak_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_019_Teshinoo_WidzialesJak_Info()
{
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WidzialesJak_15_00"); //Widzia�e�, jak mnie tu zamykali?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_01"); //By� potrz�s ska�. Kuro'K przynie�� martwy cz�owiek tutaj.
	AI_Output (other, self,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_02"); //Nie wiesz, gdzie mog� by� moje rzeczy?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_03"); //Mo�e w dom Kuro'K?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WidzialesJak_55_04"); //Kuro'K by� ork-stra�nik. Mie� dom blisko tutaj. Wyj�� st�d i skr�ci� w prawo.

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
 	description = "Co znajduje si� w waszym mie�cie?";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhatIsInCity_15_00"); //Co znajduje si� w waszym mie�cie?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_01"); //Ty by� w zewn�trzna twierdza.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_02"); //My mie� du�o domy. Mie� dom w�dz. By� Syn Ducha.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_03"); //Du�y Syn Ducha sta� i broni� orki. By� kamie�.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_04"); //Orki uczy� by� Syn Ducha w specjalne miejsce.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_05"); //I by� portal. Du�y.
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhatIsInCity_15_06"); //Co masz na my�li m�wi�c '�rodkowa twierdza'?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_07"); //Kiedy wej�� do jaskinia i przej�� most, mo�na skr�ci� w prawo. Tam zamkni�te drzwi i du�o wi�cej orki.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhatIsInCity_55_08"); //Ty jednak skr�ci� w lewo i by� w �rodkowa twierdza.

	B_LogEntry (TOPIC_OrcCity_In, "Z�a wiadomo��: Mog� wyr�n�� wszystkich ork�w tutaj, ale ich g��wne si�y siedz� zamkni�te g��boko w pieczarach. Przez portal przyb�d� hordy ork�w... Wyspa Khorinis wydaje si� by� stracona. Musz� si� st�d wydosta�.");

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
 	description = "Wiesz, gdzie s� te okr�g�e prze��czniki?";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_15_00"); //Wiesz, gdzie s� te okr�g�e prze��czniki?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_55_01"); //Nie. Ale domy�la� si�, gdzie jest jeden.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_WhereAreSwitch_55_02"); //Wodzowie mie� jeden. Chyba.
	
	B_LogEntry (TOPIC_OrcCity_In, "Teshinoo domy�la si�, �e jeden z okr�g�ych prze��cznik�w jest gdzie� obok orkowych wodz�w.");

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
 	description = "Jeste� wolny, co teraz zrobisz?";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_15_00"); //Jeste� wolny, co teraz zrobisz?
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_55_01"); //Ja nie wiedzie�.

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_JestesWolny);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_JestesWolny, "W takim razie chyba tu zostaniesz.", DIA_NASZ_019_Teshinoo_JestesWolny_yes);
		// UWAGA - w ostatecznej wersji gry chodzenie z Teshinoo zostalo usuniete, bo bylo zbyt problematyczne (rzucal sie na orkow)
		// Info_AddChoice	  (DIA_NASZ_019_Teshinoo_JestesWolny, "Mo�esz uda� si� ze mn�.", DIA_NASZ_019_Teshinoo_JestesWolny_no);

};

FUNC VOID DIA_NASZ_019_Teshinoo_JestesWolny_yes()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_yes_15_00"); //W takim razie chyba tu zostaniesz.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_yes_15_01"); //Chyba tak. Mora zamkn�� krata. Ja prosi�.

	Npc_ExchangeRoutine (self, "Start");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_JestesWolny);
};


FUNC VOID DIA_NASZ_019_Teshinoo_JestesWolny_no()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_JestesWolny_no_15_00"); //Mo�esz uda� si� ze mn�.
	AI_Output (self, other,"DIA_NASZ_019_Teshinoo_JestesWolny_no_15_01"); //Ty uratowa� Teshinoo. Ja pomaga� ci.
	
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
 	description = "Zaprowad� mnie do...";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_15_00"); //Zaprowad� mnie do...

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
		Info_AddChoice 	  (DIA_NASZ_019_Teshinoo_GuideMe, DIALOG_BACK, DIA_NASZ_019_Teshinoo_GuideMe_BACK);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...wi�zienia.", DIA_NASZ_019_Teshinoo_GuideMe_prison);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...szko�y szaman�w.", DIA_NASZ_019_Teshinoo_GuideMe_school);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...kamiennego szamana.", DIA_NASZ_019_Teshinoo_GuideMe_shaman);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...portalu.", DIA_NASZ_019_Teshinoo_GuideMe_portal);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...waszych wodz�w.", DIA_NASZ_019_Teshinoo_GuideMe_boss);
		Info_AddChoice	  (DIA_NASZ_019_Teshinoo_GuideMe, "...bramy g��wnej.", DIA_NASZ_019_Teshinoo_GuideMe_main);

};

func void DIA_NASZ_019_Teshinoo_GuideMe_BACK()
{
	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_prison()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_prison_15_00"); //...wi�zienia.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuidePrison");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_school()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_no_15_00"); //...szko�y szaman�w.
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

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_boss_15_00"); //...waszych wodz�w.
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = TRUE;
	
	Npc_ExchangeRoutine (self, "GuideBoss");

	Info_ClearChoices (DIA_NASZ_019_Teshinoo_GuideMe);
};

FUNC VOID DIA_NASZ_019_Teshinoo_GuideMe_main()
{

	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_GuideMe_main_15_00"); //...bramy g��wnej.
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
 	description = "Za mn�!";
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
	AI_Output (other,self ,"DIA_NASZ_019_Teshinoo_FollowMe_15_00"); //Za mn�!
	TeshinooSayYes();

	TeshinooProwadziCieGdzies = FALSE;

	Npc_ExchangeRoutine (self, "FollowMain");
};