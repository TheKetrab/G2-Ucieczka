//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_EXIT   (C_INFO)
{
	npc         = NASZ_221_Benito;
	nr          = 999;
	condition   = DIA_NASZ_221_Benito_EXIT_Condition;
	information = DIA_NASZ_221_Benito_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_221_Benito_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_221_Benito_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_siema   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 1;
 	condition   = DIA_NASZ_221_Benito_siema_Condition;
 	information = DIA_NASZ_221_Benito_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_221_Benito_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_221_Benito_siema_55_01"); //Nazywam si� Benito. Pochodz� z dalekiego po�udnia. Je�li ci� to interesuje, to niegdy� zajmowa�em si� zielem i nadal mam tu jeszcze troch� zapas�w.
	AI_Output (self, other,"DIA_NASZ_221_Benito_siema_55_02"); //Je�eli b�dziesz mia� ochot� kiedy� zapali�, to zapraszam.
};


//*********************************************************************
//	Info Dont
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_dont   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 2;
 	condition   = DIA_NASZ_221_Benito_dont_Condition;
 	information = DIA_NASZ_221_Benito_dont_Info;
 	permanent   = FALSE;
 	description = "Nie widzieli�my si� wcze�niej.";
};

FUNC INT DIA_NASZ_221_Benito_dont_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_221_Benito_dont_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_dont_15_00"); //Nie widzieli�my si� wcze�niej.
	AI_Output (self, other,"DIA_NASZ_221_Benito_dont_55_01"); //Rzeczywi�cie. To pewnie dlatego, �e rozgl�da�em si� w lodowej krainie.
	AI_Output (self, other,"DIA_NASZ_221_Benito_dont_55_02"); //Niecz�sto ludzie si� tam zapuszczaj�. Zreszt�, nie maj� po co. Jaszczuroludzie zaj�li tamte tereny na dobre.
};

//*********************************************************************
//	Info Jaszczuroludze
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_jaszczuroludzie   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 3;
 	condition   = DIA_NASZ_221_Benito_jaszczuroludzie_Condition;
 	information = DIA_NASZ_221_Benito_jaszczuroludzie_Info;
 	permanent   = FALSE;
 	description = "Jaszczuroludzie?";
};

FUNC INT DIA_NASZ_221_Benito_jaszczuroludzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_dont))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_jaszczuroludzie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_jaszczuroludzie_15_00"); //Jaszczuroludzie?
	AI_Output (self, other,"DIA_NASZ_221_Benito_jaszczuroludzie_55_01"); //C�, orkowie to niejedyne bestie w tym przera�aj�cym miejscu. Ni to jaszczury, ni to ludzi. Paskudne istoty, kt�re pojawi�y si� w G�rniczej Dolinie wraz z przybyciem smok�w.
	AI_Output (self, other,"DIA_NASZ_221_Benito_jaszczuroludzie_55_02"); //Teraz, gdy wszystkie smoki pad�y trupem, ca�e plemi� osiad�o w ruinach Nowego Obozu. Widocznie skuta lodem kraina i niska temperatura odpowiadaj� tym jaszczurkom.
};

//*********************************************************************
//	         Quest
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_quest   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 5;
 	condition   = DIA_NASZ_221_Benito_quest_Condition;
 	information = DIA_NASZ_221_Benito_quest_Info;
 	permanent   = FALSE;
 	description = "Czego dowiedzia�e� si� na przeszpiegach?";
};

FUNC INT DIA_NASZ_221_Benito_quest_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_jaszczuroludzie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_quest_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_quest_15_00"); //Czego dowiedzia�e� si� na przeszpiegach?
	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_01"); //Dow�dztwo nad jaszczurolud�mi przej�y dwa bardziej ros�e osobniki: Kamashi i Ugosh. Obserwuj�c ich ustali�em, �e wi�kszo�� z nich schowana jest w ogromnej lodowej pieczarze.
	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_02"); //Ale nie zdo�a�em ustali� najwa�niejszego, czyli jakie relacje �ywi� wobec ork�w.
	AI_Output (other,self ,"DIA_NASZ_221_Benito_quest_15_03"); //A gdyby mi si� uda�o?
	if (hero.guild == GIL_OUT)
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_04"); //Nie jeste� pierwszym z brzegu my�liwym, kt�ry wybiera si� na zwyk�e polowanie. Wydaje mi si�, �e masz szanse przemkn�� niepostrze�enie do wn�trza ich obozu i mo�e nawet co� znale��.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_05"); //Nie zaszkodzi spr�bowa�, wojowniku.
	};

	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_06"); //To bardzo wa�ne, by si� tego dowiedzie�. Je�li to kolejny ob�z wroga, to powinni�my zacz�� si� powa�nie obawia�.
	
	Log_CreateTopic (TOPIC_Benito_jaszczuroludzie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Benito_jaszczuroludzie, LOG_RUNNING);
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Lodow� krain� zamieszkuj� tajemniczy jaszczuroludzie. Nikt nie zna ich zamiar�w i zadanie ich poznania przypad�o mnie.");
	//Wld_InsertItem (ItNa_List_Jaszczuroludzie,"NASZ_JASZCZUROLUDZIE_A");
	WillGoToIceregion = TRUE;
};


//*********************************************************************
//	         Help
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_help   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 6;
 	condition   = DIA_NASZ_221_Benito_help_Condition;
 	information = DIA_NASZ_221_Benito_help_Info;
 	permanent   = FALSE;
 	description = "Czego mam szuka�?";
};

FUNC INT DIA_NASZ_221_Benito_help_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_help_15_00"); //Czego mam szuka�?
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_01"); //Mo�e znajdziesz gdzie� jaki� dokument, kt�ry potwierdzi ich przyjacielskie albo wrogie relacje.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_02"); //Chocia� to bardzo w�tpliwe. To dzikusy, wi�c raczej szukaj czego�, co mo�emy uzna� za zawarcie paktu.
	AI_Output (other,self ,"DIA_NASZ_221_Benito_help_15_03"); //Czyli szukaj ig�y w stogu siana, gdy nawet nie masz pewno�ci, �e tam jest...
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_04"); //Przeszuka�em zewn�rzny pier�cie� a� do b�lu. Je�li masz co� znale�� to tylko i wy��cznie albo w jaskini albo na zboczach g�r.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_05"); //Chocia� na twoim miejscu spr�bowa�bym od g�r. Mo�e jest gdzie� jaskinia albo wn�ka mi�dzy ska�ami.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_06"); //Jaszczuroludzie raczej ukryliby taki symbol, je�li w og�le istnieje, a nie trzymali w miejscu �atwo dost�pnym dla wszystkich.

	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Benito uwa�a, �e symbol wskazuj�cy na to, po kt�rej stronie s� jaszczuroludzie, znajduje si� albo w jaskini albo na zboczach g�r. Jednak�e jego zdaniem te dziwaczne istoty ukry�yby go w miejscu trudno dost�pnym dla wszystkich.");
};

//*********************************************************************
//	         Done
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_done   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 7;
 	condition   = DIA_NASZ_221_Benito_done_Condition;
 	information = DIA_NASZ_221_Benito_done_Info;
 	permanent   = FALSE;
 	description = "Znalaz�em dwa skrzy�owane ze sob� miecze.";
};

FUNC INT DIA_NASZ_221_Benito_done_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_help))
		&& (WillFoundSwordsOrcAndDraconian == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_done_Info()
{
	AI_Output (other, self,"DIA_NASZ_221_Benito_done_15_00"); //Znalaz�em dwa skrzy�owane ze sob� miecze.
	AI_Output (other, self,"DIA_NASZ_221_Benito_done_55_01"); //Jeden by� dok�adnie taki, jakie nosz� jaszczuroludzie, a drugi przypomina� orkow� bro�.
	AI_Output (self, other,"DIA_NASZ_221_Benito_done_55_02"); //Wtakim razie wiemy, co si� szykuje. Musimy jak najszybciej si� tym zaj��, �eby nie dopu�ci� do ataku ze strony jaszczuroludzi.

	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_16_02");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_16_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_29_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_29_02");	
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_3_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_3_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_4_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_4_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_7_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_7_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_6_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_6_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_8_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_8_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_6_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_17_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_15_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_15_02");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_33");	
	
};

//*********************************************************************
//	         Names
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_names   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 8;
 	condition   = DIA_NASZ_221_Benito_names_Condition;
 	information = DIA_NASZ_221_Benito_names_Info;
 	permanent   = FALSE;
 	description = "Co chcesz zrobi�?";
};

FUNC INT DIA_NASZ_221_Benito_names_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_done))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_names_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_names_15_00"); //Co chcesz zrobi�?
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_01"); //Najlepsz� obron� jest atak. Musimy �ci�� g�owy dw�m najwi�kszym jaszczurkom.	
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_02"); //Kamashi to jaszczurzy w�dz. Pot�ny i silny. Widzia�em go raz i m�wi� ci: Nie chcia�by� si� z nim zmierzy� w pojedynku jeden na jeden.
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_03"); //Ugosh to jego prawa r�ka. Go spotyka�em chyba najcz�ciej. Cz�sto si� przemieszcza mi�dzy dawn� chat� Ry�owego Ksi�cia, a w�a�ciwym Nowym Obozem.

	Wld_InsertNpc	(Ugosh,"OW_ICEREGION_34");
	Wld_InsertNpc	(Kamashi,"OW_ICEDRAGON_01");
};

//*********************************************************************
//	         Kill
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_kill   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 9;
 	condition   = DIA_NASZ_221_Benito_kill_Condition;
 	information = DIA_NASZ_221_Benito_kill_Info;
 	permanent   = FALSE;
 	description = "Gdzie dok�adnie przebywaj� ich wodzowie?";
};

FUNC INT DIA_NASZ_221_Benito_kill_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_names))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_kill_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_kill_15_00"); //Gdzie dok�adnie przebywaj� ich wodzowie?
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_01"); //Kamashi przebywa w du�ej jaskini, za to Ugosha znajdziesz w domku obok tamy.
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_02"); //Je�li chcesz to p�jd� tam z tob�. Mo�esz wzi�� te� Kivo i Eraka.
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_03"); //We czw�rk� b�dzie bezpieczniej.

	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Musz� zabi� wszystkich wodz�w. Mog� zabra� Eraka, Benito i Kivo do pomocy w walce z jaszczurolud�mi.");

};

var int BENITO_QUEST_DONE;
//*********************************************************************
//	         ComeOn
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_comeon   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 11;
 	condition   = DIA_NASZ_221_Benito_comeon_Condition;
 	information = DIA_NASZ_221_Benito_comeon_Info;
 	permanent   = TRUE;
 	description = "Chod� ze mn�.";
};

FUNC INT DIA_NASZ_221_Benito_comeon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_comeon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_comeon_15_00"); //Chod� ze mn�.
	AI_Output (self, other,"DIA_NASZ_221_Benito_comeon_55_01"); //No to w drog�!

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Follow");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_221_Benito,1);
};

//*********************************************************************
//	         KillDone
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_KillDone   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 12;
 	condition   = DIA_NASZ_221_Benito_KillDone_Condition;
 	information = DIA_NASZ_221_Benito_KillDone_Info;
 	permanent   = FALSE;
 	description = "Wodzowie nie �yj�.";
};

FUNC INT DIA_NASZ_221_Benito_KillDone_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_names)
		&& WODZOWIE_KILLED == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_KillDone_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_KillDone_15_00"); //Wodzowie nie �yj�.
	AI_Output (self, other,"DIA_NASZ_221_Benito_KillDone_55_01"); //Tak. G��wna si�a jaszczuroludzi zosta�a rozgromiona.
	AI_Output (self, other,"DIA_NASZ_221_Benito_KillDone_55_02"); //Zadanie wykonane.

	BENITO_QUEST_DONE = TRUE;
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Wszyscy wodzowie zostali zg�adzeni.");	
	Log_SetTopicStatus (TOPIC_Benito_jaszczuroludzie, LOG_SUCCESS);
	B_GivePlayerXP (700);
	DodajReputacje (4, REP_MYSLIWI);

};

//*********************************************************************
//	         TooFar
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_TooFar   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 13;
 	condition   = DIA_NASZ_221_Benito_TooFar_Condition;
 	information = DIA_NASZ_221_Benito_TooFar_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_221_Benito_TooFar_Condition()	
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((Npc_GetDistToWP (self, "OW_PATH_063") < 3000)
		|| (Npc_GetDistToWP (self, "OW_DJG_ICECAMP_04") < 3000)
		|| (Npc_GetDistToWP (self, "OW_PATH_157") < 3000)
		|| (Npc_GetDistToWP (self, "SPAWN_OW_WARAN_NC_03") < 3000)
		|| (Npc_GetDistToWP (self, "OW_PATH_038") < 3000)
		|| (Npc_GetDistToWP (self, "OW_PATH_3_07") < 3000)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_TooFar_Info()
{
	AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_00"); //Ja nie wiem, gdzie ty, cholera, idziesz, ale na pewno nie zabija� jaszczuroludzi.
	AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_01"); //Poza�atwiaj swoje sprawy, potem zajmiemy si� tymi stworami. Tylko lepiej si� pospiesz!

	if ((NASZ_201_Erak.aivar[AIV_PARTYMEMBER] == TRUE) || (NASZ_215_Kivo.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_02"); //Wracamy do obozu. Je�li b�dziesz potrzebowa� pomocy to tam nas znajdziesz.
		}
	else {
		AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_03"); //Wracam do obozu. Tam mnie znajdziesz.
	};


	Npc_ExchangeRoutine (NASZ_221_Benito, "Bandyci");
	Npc_ExchangeRoutine (NASZ_201_Erak, "Bandyci");
	Npc_ExchangeRoutine (NASZ_215_Kivo, "Bandyci");
	//NASZ_221_Benito.aivar[AIV_PARTYMEMBER] = FALSE;
	//if (NASZ_221_Benito.aivar[AIV_PARTYMEMBER] == TRUE) { Druzyna (NASZ_221_Benito); };
	//NASZ_201_Erak.aivar[AIV_PARTYMEMBER] = FALSE;
	//if (NASZ_201_Erak.aivar[AIV_PARTYMEMBER] == TRUE) { Druzyna (NASZ_201_Erak); };
	//NASZ_215_Kivo.aivar[AIV_PARTYMEMBER] = FALSE;
	//if (NASZ_215_Kivo.aivar[AIV_PARTYMEMBER] == TRUE) { Druzyna (NASZ_215_Kivo); };
	Druzyna (NASZ_221_Benito,0);
	Druzyna (NASZ_201_Erak,0);
	Druzyna (NASZ_215_Kivo,0);
	
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	         Back
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_back   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 14;
 	condition   = DIA_NASZ_221_Benito_back_Condition;
 	information = DIA_NASZ_221_Benito_back_Info;
 	permanent   = TRUE;
 	description = "Wracaj.";
};

FUNC INT DIA_NASZ_221_Benito_back_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_back_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_back_15_00"); //Wracaj.
	AI_Output (self, other,"DIA_NASZ_221_Benito_back_55_01"); //W porz�dku.

	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_221_Benito,0);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	         ImportantBack
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_ImportantBack   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 15;
 	condition   = DIA_NASZ_221_Benito_ImportantBack_Condition;
 	information = DIA_NASZ_221_Benito_ImportantBack_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_221_Benito_ImportantBack_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_ImportantBack_Info()
{
	AI_Output (self, other,"DIA_NASZ_221_Benito_ImportantBack_15_00"); //G�adko posz�o. A wi�c problem jaszczuroludzi za�egnany.

	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_221_Benito,0);
};

var int BENITO_HELP;
//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_TrollCanyon   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 16;
 	condition   = DIA_NASZ_221_Benito_TrollCanyon_Condition;
 	information = DIA_NASZ_221_Benito_TrollCanyon_Info;
 	permanent   = TRUE;
 	description = "Musisz uda� si� do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_221_Benito_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (!BENITO_HELP))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_221_Benito_TrollCanyon_15_00"); //Musisz uda� si� do Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_01"); //Szykuje si� bitwa co?

		if (npc_knowsinfo (other, DIA_NASZ_221_Benito_KillDone)) {

			AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_02"); //Wyruszam w drog� od razu.
			B_GivePlayerXP (100);
			Npc_ExchangeRoutine (self, "Twierdza");
			BENITO_HELP = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Benito uda� si� do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		}
		else {
			AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_03"); //Najpierw musimy pozby� si� jaszczuroludzi.
		};
};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_AmmannQuest   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 17;
 	condition   = DIA_NASZ_221_Benito_AmmannQuest_Condition;
 	information = DIA_NASZ_221_Benito_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "We� ten pier�cie�.";
};

FUNC INT DIA_NASZ_221_Benito_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_221_Benito_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_221_Benito_AmmannQuest_15_01"); //Wola�bym naszyjnik...

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda�em wszystkie pier�cienie.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);
	};

};



//*********************************************************************
//	         FajkaStart
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_FajkaStart   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 17;
 	condition   = DIA_NASZ_221_Benito_FajkaStart_Condition;
 	information = DIA_NASZ_221_Benito_FajkaStart_Info;
 	permanent   = FALSE;
 	description = "Nie wiesz, gdzie mog� znale�� fajk�?";
};

FUNC INT DIA_NASZ_221_Benito_FajkaStart_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_109_Rethon_FajkaStart))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_221_Benito_FajkaStart_Info()
{

	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_00"); //Nie wiesz, gdzie mog� znale�� fajk�?
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_01"); //Nie mam �adnej na stanie. Mo�e le�y tu gdzie� jako pozosta�o�� z czas�w Bariery?
	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_02"); //Bractwo �ni�cego uprawia�o bagienne ziele, by tworzy� rozmaite skr�ty...
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_03"); //No tak, ale m�wi�e�, �e chodzi ci o fajk�. Czy wytr�rcy ziela mieli jak�� konkurencj�?
	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_04"); //W�a�nie sobie przypomnia�em, �e w pobli�u Nowego Obozu kilku szkodnik�w wytwarza�o skr�ty na w�asn� r�k�.
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_05"); //W takim razie musisz si� uda� do tego miejsca i spr�bowa� tam poszuka�. A, tylko nie zapomnij, �e sama fajka nie wystarczy. �eby zapali�, potrzebujesz te� troch� tytoniu. Ch�tnie z tob� pohandluj�.

	B_LogEntry (TOPIC_Rethon_fajka, "Podczas rozmowy z Benito wpad�em na pomys�, gdzie mo�e znajdowa� si� fajka! W pobli�u Nowego Obozu by�a jaskinia, w kt�rej paru Szkodnik�w prowadzi�o swoj� w�asn� produkcj� ziela. Powinienem si� tam uda� i przekopa� kilofem wn�trze. By� mo�e pod warstw� �niegu znajd� jak�� star� fajk�. Benito zwr�ci� te� uwag� na wa�n� rzecz: Nie mog� przyj�� do Rethona bez tytoniu! Musz� kupi� przynajmniej jedn� paczuszk�.");
	Rethon_Fajka_Quest_Running = TRUE;
	
};



//*********************************************************************
//	         Sprzedaz 
//*********************************************************************
INSTANCE DIA_NASZ_221_Benito_sprzedaz   (C_INFO)
{
	npc         = NASZ_221_Benito;
 	nr          = 100;
 	condition   = DIA_NASZ_221_Benito_sprzedaz_Condition;
 	information = DIA_NASZ_221_Benito_sprzedaz_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka� mi swoje zio�a.";
};

FUNC INT DIA_NASZ_221_Benito_sprzedaz_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_221_Benito_sprzedaz_Info()
{
	B_GiveTradeInv(self);
	AI_Output (other,self ,"DIA_NASZ_221_Benito_sprzedaz_15_00"); //Poka� mi swoje zio�a.
	AI_Output (self, other,"DIA_NASZ_221_Benito_sprzedaz_55_01"); //Mam wszystko, czego zapragnie twoja dusza, Synu Ziela.
	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_221_Benito_PICKPOCKET (C_INFO)
{
	npc			= NASZ_221_Benito;
	nr			= 900;
	condition	= DIA_NASZ_221_Benito_PICKPOCKET_Condition;
	information	= DIA_NASZ_221_Benito_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_221_Benito_PICKPOCKET_Condition()
{
	C_Beklauen (63);
};
 
FUNC VOID DIA_NASZ_221_Benito_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_221_Benito_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_221_Benito_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_221_Benito_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_221_Benito_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_221_Benito_PICKPOCKET_DoIt);
};

func void DIA_NASZ_221_Benito_PICKPOCKET_DoIt()
{
	B_BeklauenGold(72);
	
	Info_ClearChoices (DIA_NASZ_221_Benito_PICKPOCKET);
};
	
func void DIA_NASZ_221_Benito_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_221_Benito_PICKPOCKET);
};