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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_221_Benito_siema_55_01"); //Nazywam siê Benito. Pochodzê z dalekiego po³udnia. Jeœli ciê to interesuje, to niegdyœ zajmowa³em siê zielem i nadal mam tu jeszcze trochê zapasów.
	AI_Output (self, other,"DIA_NASZ_221_Benito_siema_55_02"); //Je¿eli bêdziesz mia³ ochotê kiedyœ zapaliæ, to zapraszam.
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
 	description = "Nie widzieliœmy siê wczeœniej.";
};

FUNC INT DIA_NASZ_221_Benito_dont_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_221_Benito_dont_Info()
{
	AI_Output (other,self ,"DIA_NASZ_221_Benito_dont_15_00"); //Nie widzieliœmy siê wczeœniej.
	AI_Output (self, other,"DIA_NASZ_221_Benito_dont_55_01"); //Rzeczywiœcie. To pewnie dlatego, ¿e rozgl¹da³em siê w lodowej krainie.
	AI_Output (self, other,"DIA_NASZ_221_Benito_dont_55_02"); //Nieczêsto ludzie siê tam zapuszczaj¹. Zreszt¹, nie maj¹ po co. Jaszczuroludzie zajêli tamte tereny na dobre.
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
	AI_Output (self, other,"DIA_NASZ_221_Benito_jaszczuroludzie_55_01"); //Có¿, orkowie to niejedyne bestie w tym przera¿aj¹cym miejscu. Ni to jaszczury, ni to ludzi. Paskudne istoty, które pojawi³y siê w Górniczej Dolinie wraz z przybyciem smoków.
	AI_Output (self, other,"DIA_NASZ_221_Benito_jaszczuroludzie_55_02"); //Teraz, gdy wszystkie smoki pad³y trupem, ca³e plemiê osiad³o w ruinach Nowego Obozu. Widocznie skuta lodem kraina i niska temperatura odpowiadaj¹ tym jaszczurkom.
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
 	description = "Czego dowiedzia³eœ siê na przeszpiegach?";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_quest_15_00"); //Czego dowiedzia³eœ siê na przeszpiegach?
	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_01"); //Dowództwo nad jaszczuroludŸmi przejê³y dwa bardziej ros³e osobniki: Kamashi i Ugosh. Obserwuj¹c ich ustali³em, ¿e wiêkszoœæ z nich schowana jest w ogromnej lodowej pieczarze.
	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_02"); //Ale nie zdo³a³em ustaliæ najwa¿niejszego, czyli jakie relacje ¿ywi¹ wobec orków.
	AI_Output (other,self ,"DIA_NASZ_221_Benito_quest_15_03"); //A gdyby mi siê uda³o?
	if (hero.guild == GIL_OUT)
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_04"); //Nie jesteœ pierwszym z brzegu myœliwym, który wybiera siê na zwyk³e polowanie. Wydaje mi siê, ¿e masz szanse przemkn¹æ niepostrze¿enie do wnêtrza ich obozu i mo¿e nawet coœ znaleŸæ.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_05"); //Nie zaszkodzi spróbowaæ, wojowniku.
	};

	AI_Output (self, other,"DIA_NASZ_221_Benito_quest_55_06"); //To bardzo wa¿ne, by siê tego dowiedzieæ. Jeœli to kolejny obóz wroga, to powinniœmy zacz¹æ siê powa¿nie obawiaæ.
	
	Log_CreateTopic (TOPIC_Benito_jaszczuroludzie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Benito_jaszczuroludzie, LOG_RUNNING);
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Lodow¹ krainê zamieszkuj¹ tajemniczy jaszczuroludzie. Nikt nie zna ich zamiarów i zadanie ich poznania przypad³o mnie.");
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
 	description = "Czego mam szukaæ?";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_help_15_00"); //Czego mam szukaæ?
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_01"); //Mo¿e znajdziesz gdzieœ jakiœ dokument, który potwierdzi ich przyjacielskie albo wrogie relacje.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_02"); //Chocia¿ to bardzo w¹tpliwe. To dzikusy, wiêc raczej szukaj czegoœ, co mo¿emy uznaæ za zawarcie paktu.
	AI_Output (other,self ,"DIA_NASZ_221_Benito_help_15_03"); //Czyli szukaj ig³y w stogu siana, gdy nawet nie masz pewnoœci, ¿e tam jest...
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_04"); //Przeszuka³em zewnêrzny pierœcieñ a¿ do bólu. Jeœli masz coœ znaleŸæ to tylko i wy³¹cznie albo w jaskini albo na zboczach gór.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_05"); //Chocia¿ na twoim miejscu spróbowa³bym od gór. Mo¿e jest gdzieœ jaskinia albo wnêka miêdzy ska³ami.
	AI_Output (self, other,"DIA_NASZ_221_Benito_help_55_06"); //Jaszczuroludzie raczej ukryliby taki symbol, jeœli w ogóle istnieje, a nie trzymali w miejscu ³atwo dostêpnym dla wszystkich.

	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Benito uwa¿a, ¿e symbol wskazuj¹cy na to, po której stronie s¹ jaszczuroludzie, znajduje siê albo w jaskini albo na zboczach gór. Jednak¿e jego zdaniem te dziwaczne istoty ukry³yby go w miejscu trudno dostêpnym dla wszystkich.");
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
 	description = "Znalaz³em dwa skrzy¿owane ze sob¹ miecze.";
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
	AI_Output (other, self,"DIA_NASZ_221_Benito_done_15_00"); //Znalaz³em dwa skrzy¿owane ze sob¹ miecze.
	AI_Output (other, self,"DIA_NASZ_221_Benito_done_55_01"); //Jeden by³ dok³adnie taki, jakie nosz¹ jaszczuroludzie, a drugi przypomina³ orkow¹ broñ.
	AI_Output (self, other,"DIA_NASZ_221_Benito_done_55_02"); //Wtakim razie wiemy, co siê szykuje. Musimy jak najszybciej siê tym zaj¹æ, ¿eby nie dopuœciæ do ataku ze strony jaszczuroludzi.

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
 	description = "Co chcesz zrobiæ?";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_names_15_00"); //Co chcesz zrobiæ?
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_01"); //Najlepsz¹ obron¹ jest atak. Musimy œci¹æ g³owy dwóm najwiêkszym jaszczurkom.	
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_02"); //Kamashi to jaszczurzy wódz. Potê¿ny i silny. Widzia³em go raz i mówiê ci: Nie chcia³byœ siê z nim zmierzyæ w pojedynku jeden na jeden.
	AI_Output (self, other,"DIA_NASZ_221_Benito_names_55_03"); //Ugosh to jego prawa rêka. Go spotyka³em chyba najczêœciej. Czêsto siê przemieszcza miêdzy dawn¹ chat¹ Ry¿owego Ksiêcia, a w³aœciwym Nowym Obozem.

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
 	description = "Gdzie dok³adnie przebywaj¹ ich wodzowie?";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_kill_15_00"); //Gdzie dok³adnie przebywaj¹ ich wodzowie?
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_01"); //Kamashi przebywa w du¿ej jaskini, za to Ugosha znajdziesz w domku obok tamy.
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_02"); //Jeœli chcesz to pójdê tam z tob¹. Mo¿esz wzi¹æ te¿ Kivo i Eraka.
	AI_Output (self, other,"DIA_NASZ_221_Benito_kill_55_03"); //We czwórkê bêdzie bezpieczniej.

	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Muszê zabiæ wszystkich wodzów. Mogê zabraæ Eraka, Benito i Kivo do pomocy w walce z jaszczuroludŸmi.");

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
 	description = "ChodŸ ze mn¹.";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_comeon_15_00"); //ChodŸ ze mn¹.
	AI_Output (self, other,"DIA_NASZ_221_Benito_comeon_55_01"); //No to w drogê!

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
 	description = "Wodzowie nie ¿yj¹.";
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
	AI_Output (other,self ,"DIA_NASZ_221_Benito_KillDone_15_00"); //Wodzowie nie ¿yj¹.
	AI_Output (self, other,"DIA_NASZ_221_Benito_KillDone_55_01"); //Tak. G³ówna si³a jaszczuroludzi zosta³a rozgromiona.
	AI_Output (self, other,"DIA_NASZ_221_Benito_KillDone_55_02"); //Zadanie wykonane.

	BENITO_QUEST_DONE = TRUE;
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Wszyscy wodzowie zostali zg³adzeni.");	
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
	AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_00"); //Ja nie wiem, gdzie ty, cholera, idziesz, ale na pewno nie zabijaæ jaszczuroludzi.
	AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_01"); //Poza³atwiaj swoje sprawy, potem zajmiemy siê tymi stworami. Tylko lepiej siê pospiesz!

	if ((NASZ_201_Erak.aivar[AIV_PARTYMEMBER] == TRUE) || (NASZ_215_Kivo.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		AI_Output (self, other,"DIA_NASZ_221_Benito_TooFar_55_02"); //Wracamy do obozu. Jeœli bêdziesz potrzebowa³ pomocy to tam nas znajdziesz.
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
	AI_Output (self, other,"DIA_NASZ_221_Benito_back_55_01"); //W porz¹dku.

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
	AI_Output (self, other,"DIA_NASZ_221_Benito_ImportantBack_15_00"); //G³adko posz³o. A wiêc problem jaszczuroludzi za¿egnany.

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
 	description = "Musisz udaæ siê do Kanionu Trolli.";
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
	AI_Output (other, self,"DIA_NASZ_221_Benito_TrollCanyon_15_00"); //Musisz udaæ siê do Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_01"); //Szykuje siê bitwa co?

		if (npc_knowsinfo (other, DIA_NASZ_221_Benito_KillDone)) {

			AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_02"); //Wyruszam w drogê od razu.
			B_GivePlayerXP (100);
			Npc_ExchangeRoutine (self, "Twierdza");
			BENITO_HELP = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Benito uda³ siê do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		}
		else {
			AI_Output (self, other,"DIA_NASZ_221_Benito_TrollCanyon_55_03"); //Najpierw musimy pozbyæ siê jaszczuroludzi.
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
 	description = "WeŸ ten pierœcieñ.";
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
	AI_Output (other, self,"DIA_NASZ_221_Benito_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_221_Benito_AmmannQuest_15_01"); //Wola³bym naszyjnik...

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda³em wszystkie pierœcienie.");
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
 	description = "Nie wiesz, gdzie mogê znaleŸæ fajkê?";
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

	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_00"); //Nie wiesz, gdzie mogê znaleŸæ fajkê?
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_01"); //Nie mam ¿adnej na stanie. Mo¿e le¿y tu gdzieœ jako pozosta³oœæ z czasów Bariery?
	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_02"); //Bractwo Œni¹cego uprawia³o bagienne ziele, by tworzyæ rozmaite skrêty...
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_03"); //No tak, ale mówi³eœ, ¿e chodzi ci o fajkê. Czy wytrórcy ziela mieli jak¹œ konkurencjê?
	AI_Output (other, self,"DIA_NASZ_221_Benito_FajkaStart_15_04"); //W³aœnie sobie przypomnia³em, ¿e w pobli¿u Nowego Obozu kilku szkodników wytwarza³o skrêty na w³asn¹ rêkê.
	AI_Output (self, other,"DIA_NASZ_221_Benito_FajkaStart_15_05"); //W takim razie musisz siê udaæ do tego miejsca i spróbowaæ tam poszukaæ. A, tylko nie zapomnij, ¿e sama fajka nie wystarczy. ¯eby zapaliæ, potrzebujesz te¿ trochê tytoniu. Chêtnie z tob¹ pohandlujê.

	B_LogEntry (TOPIC_Rethon_fajka, "Podczas rozmowy z Benito wpad³em na pomys³, gdzie mo¿e znajdowaæ siê fajka! W pobli¿u Nowego Obozu by³a jaskinia, w której paru Szkodników prowadzi³o swoj¹ w³asn¹ produkcjê ziela. Powinienem siê tam udaæ i przekopaæ kilofem wnêtrze. Byæ mo¿e pod warstw¹ œniegu znajdê jak¹œ star¹ fajkê. Benito zwróci³ te¿ uwagê na wa¿n¹ rzecz: Nie mogê przyjœæ do Rethona bez tytoniu! Muszê kupiæ przynajmniej jedn¹ paczuszkê.");
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
 	description = "Poka¿ mi swoje zio³a.";
};

FUNC INT DIA_NASZ_221_Benito_sprzedaz_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_221_Benito_sprzedaz_Info()
{
	B_GiveTradeInv(self);
	AI_Output (other,self ,"DIA_NASZ_221_Benito_sprzedaz_15_00"); //Poka¿ mi swoje zio³a.
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