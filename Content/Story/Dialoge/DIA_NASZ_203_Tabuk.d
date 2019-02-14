//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_EXIT   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
	nr          = 999;
	condition   = DIA_NASZ_203_Tabuk_EXIT_Condition;
	information = DIA_NASZ_203_Tabuk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_203_Tabuk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_203_Tabuk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_siema   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 1;
 	condition   = DIA_NASZ_203_Tabuk_siema_Condition;
 	information = DIA_NASZ_203_Tabuk_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_203_Tabuk_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_siema_55_01"); //Nazywam siê Tabuk. Znam siê na oprawianiu twardszych sztuk. Mówiê tu o golemach, jaszczurach albo harpiach.
	AI_Output (other, self,"DIA_NASZ_203_Tabuk_siema_55_02"); //Pewnie nie³atwo coœ takiego poskromiæ. Ile strza³ potrzeba, by zabiæ jaszczura?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_siema_55_03"); //To zale¿y od tego, gdzie go trafisz. Codzienny trening ³uczniczy jest konieczny, by móc z du¿ej odleg³oœci trafiæ prosto w oko.
};

//*********************************************************************
//	Info Train 
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_Train   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 2;
 	condition   = DIA_NASZ_203_Tabuk_Train_Condition;
 	information = DIA_NASZ_203_Tabuk_Train_Info;
 	permanent   = FALSE;
 	description = "Jak wygl¹daj¹ twoje treningi?";
};

FUNC INT DIA_NASZ_203_Tabuk_Train_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_203_Tabuk_siema))
	&& (KAPITEL <= 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_Train_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_Train_15_00"); //Jak wygl¹daj¹ twoje treningi?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_01"); //Najlepiej jest, oczywiœcie, strzelaæ do bestii. To ruchomy cel, wiêc trzeba zwracaæ uwagê na kierunek i szybkoœæ biegu stwora.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_02"); //Czasem jednak trzeba zatrzymaæ siê i skupiæ ca³¹ uwagê na jednym punkcie. Do takich æwiczeñ stworzona zosta³a tarcza strzelecka.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_03"); //Mo¿na ustawiæ siê w dowolnej odleg³oœci, przymierzyæ, napi¹æ ³uk i zwolniæ ciêciwê. Nawet najlepszym zdarza siê chybiæ, ale uczymy siê w³aœnie na b³êdach.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_04"); //Trzeba wzi¹æ jeszcze poprawkê na wiatr... Pod presj¹ walki, czêsto o tym zapominamy, wiêc warto szkoliæ swoje zmys³y na sucho.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_05"); //Mo¿e chcia³byœ spróbowaæ?
};


//*********************************************************************
//	Info OfCourse 
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_OfCourse   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 3;
 	condition   = DIA_NASZ_203_Tabuk_OfCourse_Condition;
 	information = DIA_NASZ_203_Tabuk_OfCourse_Info;
 	permanent   = FALSE;
 	description = "Jasne, postaram siê trafiæ w tarczê.";
};

FUNC INT DIA_NASZ_203_Tabuk_OfCourse_Condition()
{
	if(npc_knowsinfo(other,DIA_NASZ_203_Tabuk_train))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_OfCourse_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_OfCourse_15_00"); //Jasne, postaram siê trafiæ w tarczê.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_OfCourse_55_01"); //Bêdê mia³ na ciebie oko. ChodŸ, stañ obok mnie i spróbuj wystrzeliæ.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_OfCourse_55_02"); //Masz trzy strza³y. Spróbuj nie chybiæ chocia¿ raz.

	Createinvitems(self,ItRw_Arrow,3);
	B_GiveInvItems(self,other,ItRw_Arrow,3);
	
	Npc_ExchangeRoutine (self, "Tarcza1");

	Tabuk_Tarcza1 = TRUE;
	Tabuk_HeroMunition = GetMunitionAmmount(hero);
	Tabuk_Tarcza1_Wystrzelono = 0;
	Tabuk_Tarcza1_Trafiono = 0;	
	FF_ApplyOnceExt(TabukStrzelanie,1000,-1);
	
	Print(IntToString(Tabuk_HeroMunition));

	Log_CreateTopic (TOPIC_Tabuk_tarcza, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_RUNNING);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Tabuk zachêci³ mnie do oddania kilku strza³ów treningowych. Mam stan¹æ w wyznaczonym miejscu i oddaæ trzy strza³y do tarczy.");

};

//*********************************************************************
//	Info Zaliczone1 
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_Zaliczone1   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 1;
 	condition   = DIA_NASZ_203_Tabuk_Zaliczone1_Condition;
 	information = DIA_NASZ_203_Tabuk_Zaliczone1_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_203_Tabuk_Zaliczone1_Condition()
{
	if(npc_knowsinfo(other,DIA_NASZ_203_Tabuk_ofcourse))
	&& (Tabuk_Tarcza1_Wystrzelono >= 3) 
	&& (Tabuk_Tarcza1_Trafiono >= 1)
	&& !(Npc_IsInFightMode(other, FMODE_FAR)) // jesli Will schowal luk
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_Zaliczone1_Info()
{
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_00"); //Uda³o ci siê!
	
	if (Tabuk_Tarcza1_Trafiono == 2) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_01"); //Jedno pud³o to ca³kiem niez³y wynik.
	}
	else if (Tabuk_Tarcza1_Trafiono == 3) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_02"); //Wszystkie strza³y prosto w tarczê. Kto by pomyœla³!	
	};
	
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_55_03"); //ChodŸ za mn¹, spróbujesz teraz z dalsza. Znowu trzy strza³y.

	Createinvitems(self,ItRw_Arrow,3);
	B_GiveInvItems(self,other,ItRw_Arrow,3);
	
	Npc_ExchangeRoutine (self, "Tarcza2");
	B_LogEntry (TOPIC_Tabuk_tarcza, "Teraz spróbujê strzeliæ do tarczy z wiêkszej odleg³oœci. Ponownie mam trzy strza³y.");

	Tabuk_Tarcza1 = FALSE;
	Tabuk_Tarcza2 = TRUE;
	Tabuk_HeroMunition = GetMunitionAmmount(hero);
	Tabuk_Tarcza2_Wystrzelono = 0;
	Tabuk_Tarcza2_Trafiono = 0;	

	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Nieudane1
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_Nieudane1   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 1;
 	condition   = DIA_NASZ_203_Tabuk_Nieudane1_Condition;
 	information = DIA_NASZ_203_Tabuk_Nieudane1_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_203_Tabuk_Nieudane1_Condition()
{
	if(npc_knowsinfo(other,DIA_NASZ_203_Tabuk_ofcourse))
	&& (Tabuk_Tarcza1_Wystrzelono >= 3)
	&& (Tabuk_Tarcza1_Trafiono == 0)
	&& !(Npc_IsInFightMode(other, FMODE_FAR)) // jesli Will schowal luk
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_Nieudane1_Info()
{
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane1_15_00"); //Kiepski z ciebie strzelec, co? Myœla³em, ¿e chocia¿ jedna strza³a wbije siê w tarczê.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane1_55_01"); //Przed tob¹ wiele godzin treningu. Postrzelaj do tej tarczy, skup siê i traf.

	Npc_ExchangeRoutine (self, "Start");

	Tabuk_Tarcza1 = FALSE;
	ff_remove(TabukStrzelanie);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_FAILED);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Nietrafienie w tarczê ani razu z odleg³oœci dziesiêciu metrów, to trochê wstyd. Wiele nauki przede mn¹.");
};

//*********************************************************************
//	Info Zaliczone2
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_Zaliczone2   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 1;
 	condition   = DIA_NASZ_203_Tabuk_Zaliczone2_Condition;
 	information = DIA_NASZ_203_Tabuk_Zaliczone2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_203_Tabuk_Zaliczone2_Condition()
{
	if(npc_knowsinfo(other,DIA_NASZ_203_Tabuk_Zaliczone1))
	&& (Tabuk_Tarcza2_Wystrzelono >= 3) 
	&& (Tabuk_Tarcza2_Trafiono >= 1)
	&& !(Npc_IsInFightMode(other, FMODE_FAR)) // jesli Will schowal luk
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_Zaliczone2_Info()
{
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_15_00"); //Nie postawi³ bym nawet dziesiêciu sztuk z³ota, ¿e trafisz. To twoje pierwsze oddane strza³y na tê tarczê.
	AI_Output (other, self,"DIA_NASZ_203_Tabuk_Zaliczone2_15_01"); //Mia³em szczêœcie. Poza tym nie wiem, jakbym zachowa³ siê w obliczu potencjalnego pogryzienia przez wilki czy, co gorsza, jaszczury.
	
	if (Tabuk_Tarcza2_Trafiono == 3) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_15_02"); //Trzy trafienia z rzêdu nazywasz szczêœciem?
	};
	
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_55_03"); //Brak stresu na prawdziwym polowaniu przyjdzie wraz z doœwiadczeniem. Nieraz trzeba nawet siêgn¹æ po miecz, a czasem udaje siê powaliæ z dystanu gromadê œcierwojadów.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_55_04"); //Wszystko przed tob¹.

	Tabuk_Tarcza2 = FALSE;
	Npc_ExchangeRoutine (self, "Start");
	ff_remove(TabukStrzelanie);
	
	B_GivePlayerXP(300);
	DodajReputacje(1,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_SUCCESS);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Zaliczy³em trening ³uczniczy. Myœlê, ¿e warto co jakiœ czas przyjœæ tu i trochê postrzelaæ.");

	// TODO: jesli trafisz w tarczê, to +1 do ³uków i kusz (czyli razem max +6)
};


//*********************************************************************
//	Info Nieudane2
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_Nieudane2   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 1;
 	condition   = DIA_NASZ_203_Tabuk_Nieudane2_Condition;
 	information = DIA_NASZ_203_Tabuk_Nieudane2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_203_Tabuk_Nieudane2_Condition()
{
	if(npc_knowsinfo(other,DIA_NASZ_203_Tabuk_Zaliczone1))
	&& (Tabuk_Tarcza2_Wystrzelono >= 3) 
	&& (Tabuk_Tarcza2_Trafiono == 0)
	&& !(Npc_IsInFightMode(other, FMODE_FAR)) // jesli Will schowal luk
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_Nieudane2_Info()
{
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane2_15_00"); //Tym razem nie da³eœ rady. Ale i tak ca³kiem nieŸle, jak na pierwsze strzelanie.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane2_55_01"); //Masz tu trochê strza³. Trenuj jak najwiêcej!
	
	Createinvitems (self, ItRw_Arrow, 10);
	B_GiveInvItems (self, other, ItRw_Arrow, 10);
	
	Tabuk_Tarcza2 = FALSE;
	ff_remove(TabukStrzelanie);
	Npc_ExchangeRoutine (self, "Start");
	
	B_GivePlayerXP(300);
	DodajReputacje(1,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_SUCCESS);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Drugie strzelanie mi nie wysz³o, ale Tabuk powiedzia³, ¿e jak na pierwszy raz, dobrze siê spisa³em.");

	
};


//*********************************************************************
//	Info Teach
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_teach   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 2;
 	condition   = DIA_NASZ_203_Tabuk_teach_Condition;
 	information = DIA_NASZ_203_Tabuk_teach_Info;
 	permanent   = FALSE;
 	description = "Mo¿esz mnie nauczyæ czegoœ o polowaniu?";
};

FUNC INT DIA_NASZ_203_Tabuk_teach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_203_Tabuk_teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_teach_15_00"); //Mo¿esz mnie nauczyæ czegoœ o polowaniu?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_teach_55_01"); //Pewnie, za 400 sztuk z³ota nauczê ciê wszystkiego, co potrafiê.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Tabuk nauczy mnie rabowania trofeów golemów, harpii i jaszczurów za 400 sztuk z³ota.");	

};

//*********************************************************************
//	Info Kasa
//*********************************************************************
INSTANCE DIA_NASZ_203_Tabuk_kasa   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 3;
 	condition   = DIA_NASZ_203_Tabuk_kasa_Condition;
 	information = DIA_NASZ_203_Tabuk_kasa_Info;
 	permanent   = FALSE;
 	description = "Ucz mnie. (400 szt. z³ota)";
};

FUNC INT DIA_NASZ_203_Tabuk_kasa_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_203_Tabuk_teach)
	&& (npc_hasitems (other, ItMi_Gold) >=400))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_203_Tabuk_kasa_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_kasa_15_00"); //Ucz mnie.
	B_giveinvitems (other, self, ItMi_Gold, 400);
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_kasa_55_01"); //Dobra, bêdê ciê uczy³. Mam nadziejê, ¿e zdo³asz zabiæ bestie, które zamierzasz patroszyæ.
};

//*********************************************************************
//	Info Nauka 
//*********************************************************************
var int TabukCantLearnMore;
//**********************************************
INSTANCE DIA_NASZ_203_Tabuk_nauka   (C_INFO)
{
	npc         = NASZ_203_Tabuk;
 	nr          = 3;
 	condition   = DIA_NASZ_203_Tabuk_nauka_Condition;
 	information = DIA_NASZ_203_Tabuk_nauka_Info;
 	permanent   = TRUE;
 	description = "Czego mo¿esz mnie nauczyæ?";
};

FUNC INT DIA_NASZ_203_Tabuk_nauka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_203_Tabuk_kasa )
		&& (TabukCantLearnMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_203_Tabuk_nauka_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_203_Tabuk_nauka_15_00"); //Czego mo¿esz mnie nauczyæ?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		||(Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		)
	{

		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_09_01"); //A co chcesz wiedzieæ?

		Info_AddChoice		(DIA_NASZ_203_Tabuk_nauka, DIALOG_BACK, DIA_NASZ_203_Tabuk_nauka_BACK);

		if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, "Skradanie siê. (5PN)",  DIA_NASZ_203_Tabuk_nauka_sneak);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Jêzyk ognistego jaszczura",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_NASZ_203_Tabuk_nauka_FireTongue);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Usuñ p³yty pancerza pe³zacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_NASZ_203_Tabuk_nauka_CrawlerPlate	);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Usuñ ¿uwaczkê",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_NASZ_203_Tabuk_nauka_Mandibles	);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Róg smoczego zêbacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Róg cieniostwora",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_NASZ_203_Tabuk_nauka_ShadowHorn);
		};
						
	}
		
		else
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_03_03"); //Niestety, nie mogê ci powiedzieæ nic, czego byœ ju¿ nie wiedzia³.
			TabukCantLearnMore = TRUE;
			B_GivePlayerXP (1000);
		};	
};

func void DIA_NASZ_203_Tabuk_nauka_BACK()
{
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_sneak()
{
	if (hero.lp >= 5){
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_01"); //Umiejêtnoœæ skradania sprawdza siê przy podchodzeniu do du¿ych zwierz¹t. Trolle, cieniostwory, czy wê¿e b³otne maj¹ kiepski wêch, a ich s³uch mo¿na ³atwo oszukaæ.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_02"); //Przede wszystkim nie tup tak! Zawsze stawiaj stopy powoli, od piêt.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_03"); //Chodzenie na palcach wbrew temu co mówi¹ ludzie, nie jest takie dobre. Stopy szybko siê mêcz¹ i ju¿ po chwili tracimy efektywnoœæ.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_04"); //Pamiêtaj o tym.

		NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
		Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
		B_LogEntry (TOPIC_TalentThief,"Umiem siê skradaæ.");
		PrintScreen ("Nauka: fach z³odziejski", -1, -1, FONT_Screen, 2);

		Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 1);
		hero.lp = hero.lp - 5;
	}
	else {
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_15"); //Brak ci doœwiadczenia.
	};
};


func void DIA_NASZ_203_Tabuk_nauka_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_FireTongue_09_00"); //Musisz przytrzymaæ jêzyk ognistego jaszczura rêk¹. Teraz odcinasz go jednym sprawnym ruchem.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_CrawlerPlate_09_00"); //¯eby zerwaæ pancerze pe³zaczy, potrzebujesz naprawdê ostrego no¿a.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_Mandibles_09_00"); //¯uwaczki przytwierdzone s¹ doœæ mocno do czaszki polnej bestii lub pe³zacza. Usuniêcie ich wymaga trochê wysi³ku.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn_09_00"); //Aby odci¹æ zêbaczowi jego róg, potrzebujesz naprawdê mocnego no¿a. Wbij go w sam czubek g³owy.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_ShadowHorn_09_00"); //Rogi cieniostworów zdobi¹ niejeden szlachecki dom. To trofeum jest tak cenne, bo tak trudno je zdobyæ. Nie doœæ, ¿e trzeba uporaæ siê z tym potworem, to jeszcze zgrabnie wyci¹gn¹æ mu kolec z g³owy.
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_ShadowHorn_09_01"); //To doœæ obrzydliwe: Najpierw wytnij kwadrat w jego pysku i wyci¹gnij ca³oœæ. Potem oskub z miêsa róg, a przed sprzeda¿¹, najlepiej wymyj go dok³adnie w mocnej gorza³ce, aby zapobiec bakteriom.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_203_Tabuk_PICKPOCKET (C_INFO)
{
	npc			= NASZ_203_Tabuk;
	nr			= 900;
	condition	= DIA_NASZ_203_Tabuk_PICKPOCKET_Condition;
	information	= DIA_NASZ_203_Tabuk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_203_Tabuk_PICKPOCKET_Condition()
{
	C_Beklauen (47);
};
 
FUNC VOID DIA_NASZ_203_Tabuk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_203_Tabuk_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_203_Tabuk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_203_Tabuk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_203_Tabuk_PICKPOCKET_DoIt);
};

func void DIA_NASZ_203_Tabuk_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,56);
	
	Info_ClearChoices (DIA_NASZ_203_Tabuk_PICKPOCKET);
};
	
func void DIA_NASZ_203_Tabuk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_203_Tabuk_PICKPOCKET);
};