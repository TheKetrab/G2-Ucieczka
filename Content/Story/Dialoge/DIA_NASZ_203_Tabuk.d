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
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_siema_55_01"); //Nazywam si� Tabuk. Znam si� na oprawianiu twardszych sztuk. M�wi� tu o golemach, jaszczurach albo harpiach.
	AI_Output (other, self,"DIA_NASZ_203_Tabuk_siema_55_02"); //Pewnie nie�atwo co� takiego poskromi�. Ile strza� potrzeba, by zabi� jaszczura?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_siema_55_03"); //To zale�y od tego, gdzie go trafisz. Codzienny trening �uczniczy jest konieczny, by m�c z du�ej odleg�o�ci trafi� prosto w oko.
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
 	description = "Jak wygl�daj� twoje treningi?";
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
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_Train_15_00"); //Jak wygl�daj� twoje treningi?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_01"); //Najlepiej jest, oczywi�cie, strzela� do bestii. To ruchomy cel, wi�c trzeba zwraca� uwag� na kierunek i szybko�� biegu stwora.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_02"); //Czasem jednak trzeba zatrzyma� si� i skupi� ca�� uwag� na jednym punkcie. Do takich �wicze� stworzona zosta�a tarcza strzelecka.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_03"); //Mo�na ustawi� si� w dowolnej odleg�o�ci, przymierzy�, napi�� �uk i zwolni� ci�ciw�. Nawet najlepszym zdarza si� chybi�, ale uczymy si� w�a�nie na b��dach.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_04"); //Trzeba wzi�� jeszcze poprawk� na wiatr... Pod presj� walki, cz�sto o tym zapominamy, wi�c warto szkoli� swoje zmys�y na sucho.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Train_55_05"); //Mo�e chcia�by� spr�bowa�?
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
 	description = "Jasne, postaram si� trafi� w tarcz�.";
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
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_OfCourse_15_00"); //Jasne, postaram si� trafi� w tarcz�.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_OfCourse_55_01"); //B�d� mia� na ciebie oko. Chod�, sta� obok mnie i spr�buj wystrzeli�.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_OfCourse_55_02"); //Masz trzy strza�y. Spr�buj nie chybi� chocia� raz.

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
	B_LogEntry (TOPIC_Tabuk_tarcza, "Tabuk zach�ci� mnie do oddania kilku strza��w treningowych. Mam stan�� w wyznaczonym miejscu i odda� trzy strza�y do tarczy.");

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
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_00"); //Uda�o ci si�!
	
	if (Tabuk_Tarcza1_Trafiono == 2) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_01"); //Jedno pud�o to ca�kiem niez�y wynik.
	}
	else if (Tabuk_Tarcza1_Trafiono == 3) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_15_02"); //Wszystkie strza�y prosto w tarcz�. Kto by pomy�la�!	
	};
	
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone1_55_03"); //Chod� za mn�, spr�bujesz teraz z dalsza. Znowu trzy strza�y.

	Createinvitems(self,ItRw_Arrow,3);
	B_GiveInvItems(self,other,ItRw_Arrow,3);
	
	Npc_ExchangeRoutine (self, "Tarcza2");
	B_LogEntry (TOPIC_Tabuk_tarcza, "Teraz spr�buj� strzeli� do tarczy z wi�kszej odleg�o�ci. Ponownie mam trzy strza�y.");

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
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane1_15_00"); //Kiepski z ciebie strzelec, co? My�la�em, �e chocia� jedna strza�a wbije si� w tarcz�.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane1_55_01"); //Przed tob� wiele godzin treningu. Postrzelaj do tej tarczy, skup si� i traf.

	Npc_ExchangeRoutine (self, "Start");

	Tabuk_Tarcza1 = FALSE;
	ff_remove(TabukStrzelanie);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_FAILED);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Nietrafienie w tarcz� ani razu z odleg�o�ci dziesi�ciu metr�w, to troch� wstyd. Wiele nauki przede mn�.");
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
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_15_00"); //Nie postawi� bym nawet dziesi�ciu sztuk z�ota, �e trafisz. To twoje pierwsze oddane strza�y na t� tarcz�.
	AI_Output (other, self,"DIA_NASZ_203_Tabuk_Zaliczone2_15_01"); //Mia�em szcz�cie. Poza tym nie wiem, jakbym zachowa� si� w obliczu potencjalnego pogryzienia przez wilki czy, co gorsza, jaszczury.
	
	if (Tabuk_Tarcza2_Trafiono == 3) {
		AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_15_02"); //Trzy trafienia z rz�du nazywasz szcz�ciem?
	};
	
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_55_03"); //Brak stresu na prawdziwym polowaniu przyjdzie wraz z do�wiadczeniem. Nieraz trzeba nawet si�gn�� po miecz, a czasem udaje si� powali� z dystanu gromad� �cierwojad�w.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Zaliczone2_55_04"); //Wszystko przed tob�.

	Tabuk_Tarcza2 = FALSE;
	Npc_ExchangeRoutine (self, "Start");
	ff_remove(TabukStrzelanie);
	
	B_GivePlayerXP(300);
	DodajReputacje(1,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_SUCCESS);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Zaliczy�em trening �uczniczy. My�l�, �e warto co jaki� czas przyj�� tu i troch� postrzela�.");

	// TODO: jesli trafisz w tarcz�, to +1 do �uk�w i kusz (czyli razem max +6)
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
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane2_15_00"); //Tym razem nie da�e� rady. Ale i tak ca�kiem nie�le, jak na pierwsze strzelanie.
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_Nieudane2_55_01"); //Masz tu troch� strza�. Trenuj jak najwi�cej!
	
	Createinvitems (self, ItRw_Arrow, 10);
	B_GiveInvItems (self, other, ItRw_Arrow, 10);
	
	Tabuk_Tarcza2 = FALSE;
	ff_remove(TabukStrzelanie);
	Npc_ExchangeRoutine (self, "Start");
	
	B_GivePlayerXP(300);
	DodajReputacje(1,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Tabuk_tarcza, LOG_SUCCESS);
	B_LogEntry (TOPIC_Tabuk_tarcza, "Drugie strzelanie mi nie wysz�o, ale Tabuk powiedzia�, �e jak na pierwszy raz, dobrze si� spisa�em.");

	
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
 	description = "Mo�esz mnie nauczy� czego� o polowaniu?";
};

FUNC INT DIA_NASZ_203_Tabuk_teach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_203_Tabuk_teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_203_Tabuk_teach_15_00"); //Mo�esz mnie nauczy� czego� o polowaniu?
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_teach_55_01"); //Pewnie, za 400 sztuk z�ota naucz� ci� wszystkiego, co potrafi�.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Tabuk nauczy mnie rabowania trofe�w golem�w, harpii i jaszczur�w za 400 sztuk z�ota.");	

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
 	description = "Ucz mnie. (400 szt. z�ota)";
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
	AI_Output (self, other,"DIA_NASZ_203_Tabuk_kasa_55_01"); //Dobra, b�d� ci� uczy�. Mam nadziej�, �e zdo�asz zabi� bestie, kt�re zamierzasz patroszy�.
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
 	description = "Czego mo�esz mnie nauczy�?";
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
	AI_Output			(other, self, "DIA_NASZ_203_Tabuk_nauka_15_00"); //Czego mo�esz mnie nauczy�?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		||(Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		)
	{

		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_09_01"); //A co chcesz wiedzie�?

		Info_AddChoice		(DIA_NASZ_203_Tabuk_nauka, DIALOG_BACK, DIA_NASZ_203_Tabuk_nauka_BACK);

		if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, "Skradanie si�. (5PN)",  DIA_NASZ_203_Tabuk_nauka_sneak);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("J�zyk ognistego jaszczura",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_NASZ_203_Tabuk_nauka_FireTongue);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Usu� p�yty pancerza pe�zacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_NASZ_203_Tabuk_nauka_CrawlerPlate	);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("Usu� �uwaczk�",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_NASZ_203_Tabuk_nauka_Mandibles	);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("R�g smoczego z�bacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_203_Tabuk_nauka, B_BuildLearnString ("R�g cieniostwora",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_NASZ_203_Tabuk_nauka_ShadowHorn);
		};
						
	}
		
		else
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_03_03"); //Niestety, nie mog� ci powiedzie� nic, czego by� ju� nie wiedzia�.
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
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_01"); //Umiej�tno�� skradania sprawdza si� przy podchodzeniu do du�ych zwierz�t. Trolle, cieniostwory, czy w�e b�otne maj� kiepski w�ch, a ich s�uch mo�na �atwo oszuka�.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_02"); //Przede wszystkim nie tup tak! Zawsze stawiaj stopy powoli, od pi�t.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_03"); //Chodzenie na palcach wbrew temu co m�wi� ludzie, nie jest takie dobre. Stopy szybko si� m�cz� i ju� po chwili tracimy efektywno��.
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_04"); //Pami�taj o tym.

		NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
		Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
		B_LogEntry (TOPIC_TalentThief,"Umiem si� skrada�.");
		PrintScreen ("Nauka: fach z�odziejski", -1, -1, FONT_Screen, 2);

		Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 1);
		hero.lp = hero.lp - 5;
	}
	else {
		AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_sneak_03_15"); //Brak ci do�wiadczenia.
	};
};


func void DIA_NASZ_203_Tabuk_nauka_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_FireTongue_09_00"); //Musisz przytrzyma� j�zyk ognistego jaszczura r�k�. Teraz odcinasz go jednym sprawnym ruchem.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_CrawlerPlate_09_00"); //�eby zerwa� pancerze pe�zaczy, potrzebujesz naprawd� ostrego no�a.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_Mandibles_09_00"); //�uwaczki przytwierdzone s� do�� mocno do czaszki polnej bestii lub pe�zacza. Usuni�cie ich wymaga troch� wysi�ku.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_DrgSnapperHorn_09_00"); //Aby odci�� z�baczowi jego r�g, potrzebujesz naprawd� mocnego no�a. Wbij go w sam czubek g�owy.
		};
	Info_ClearChoices	(DIA_NASZ_203_Tabuk_nauka);
};

func void DIA_NASZ_203_Tabuk_nauka_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_ShadowHorn_09_00"); //Rogi cieniostwor�w zdobi� niejeden szlachecki dom. To trofeum jest tak cenne, bo tak trudno je zdoby�. Nie do��, �e trzeba upora� si� z tym potworem, to jeszcze zgrabnie wyci�gn�� mu kolec z g�owy.
			AI_Output			(self, other, "DIA_NASZ_203_Tabuk_nauka_ShadowHorn_09_01"); //To do�� obrzydliwe: Najpierw wytnij kwadrat w jego pysku i wyci�gnij ca�o��. Potem oskub z mi�sa r�g, a przed sprzeda��, najlepiej wymyj go dok�adnie w mocnej gorza�ce, aby zapobiec bakteriom.
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