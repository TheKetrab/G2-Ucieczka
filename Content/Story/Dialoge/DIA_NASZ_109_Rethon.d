//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_EXIT   (C_INFO)
{
	npc         = NASZ_109_Rethon;
	nr          = 999;
	condition   = DIA_NASZ_109_Rethon_EXIT_Condition;
	information = DIA_NASZ_109_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_109_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_109_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info PreHello 
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_presiema   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 1;
 	condition   = DIA_NASZ_109_Rethon_presiema_Condition;
 	information = DIA_NASZ_109_Rethon_presiema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_109_Rethon_presiema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_109_Rethon_presiema_Info()
{
	if (KAPITEL == 1) {
		Npc_ExchangeRoutine(self,"Start"); // bo wczesniej ma prestart
	};
	
	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Rethon szkoli ludzi w walce broni� bia��.");
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_15_00"); //Hej, ty! Jeste� tutaj nowy? Nigdy wcze�niej ci� tutaj nie widzia�em!
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_01"); //Tak, trafi�em tutaj stosunkowo niedawno.
	
	if(npc_knowsinfo(other,DIA_NASZ_101_Korth_siema)) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_02"); //Kiedy b��ka�em si� po lesie, znalaz� mnie Korth i po kr�tkiej rozmowie przyprowadzi� mnie tutaj.
	};
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_03"); //Zapewne zdajesz sobie spraw� z naszego beznadziejnego po�o�enia w tym miejscu? Niech Beliar poch�onie tych przekl�tych ork�w, ci�gle mamy z nimi k�opoty.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_04"); //Musimy by� ca�y czas gotowi do odparcia ewentualnego ataku ze strony tych bestii, a co za tym idzie, ka�dy z nas musi intensywnie trenowa�.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_05"); //Je�eli chcesz prze�y� w tym miejscu, musisz dobrze w�ada� or�em. Inaczej szybko staniesz si� przek�sk� dla tutejszych zwierz�t.

	if (hero.guild == GIL_NONE) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_06"); //No i poza tym, je�li chcesz do��czy� do jakiego� obozu i nie by� zmuszany do takich prac, jak przybijanie desek czy pi�owanie drewna, to musisz si� czym� wyr�nia�. 
		AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_07"); //W gruncie rzeczy to jeszcze nie zdecydowa�em, do kogo chc� si� przy��czy�.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_08"); //Tw�j wyb�r jest nieistotny. Wszyscy znale�li�my si� w takim samym po�o�eniu i powinni�my sobie wzajemnie pomaga�.
	};

	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_09"); //Powiedz no, walczy�e� kiedy� mieczem?
		
	Info_ClearChoices (DIA_NASZ_109_Rethon_presiema);
		Info_AddChoice	  (DIA_NASZ_109_Rethon_presiema, "Nigdy nie by�em zbyt dobrym wojownikiem.", DIA_NASZ_109_Rethon_presiema_not);
		Info_AddChoice	  (DIA_NASZ_109_Rethon_presiema, "Oczywi�cie, �e tak.", DIA_NASZ_109_Rethon_presiema_oczywiscie);

};

FUNC VOID DIA_NASZ_109_Rethon_presiema_cd()
{
	AI_ReadyMeleeWeapon	(other);
	AI_ReadyMeleeWeapon	(self);
	
	AI_PlayAni	(self,"T_1HSFREE");
	AI_PlayAni	(other,"T_1HSFREE");
	
	PrintScreen(PRINT_Learn2H_and_1H,-1,-1,FONT_Screen,2);
	B_RaiseFightTalent(other,NPC_TALENT_1H,1);
	B_RaiseFightTalent(other,NPC_TALENT_2H,1);
	
	AI_RemoveWeapon (other);
	AI_RemoveWeapon (self);	
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_00"); //Widzisz? Odpowiednia koncentracja, a tak�e rytmiczne i r�wnomierne ruchy ca�ego cia�a pozwalaj� wydoby� ukryty potencja� mi�ni.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_01"); //Skoro ju� si� rozgrza�e�, to czas, aby przyst�pi� do prawdziwego treningu. Nie ma bowiem nic lepszego ni� walka z prawdziwym oponentem.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_02"); //Po�wicz z tymi �owcami, kt�rych spotkasz na placu treningowym. Przeka� im, �e ja ci� przysy�am. Wtedy zgodz� si� stan�� z tob� do pojedynku.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_cd_55_03"); //Obawiam si�, �e nie mam z nimi szans. To przecie� o wiele bardziej do�wiadczeni wojownicy.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_04"); //Nie przejmuj si�, ka�da pora�ka to klucz do sukcesu w przysz�o�ci.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_05"); //Ucz si� na ka�dym b��dzie, wyci�gaj z nich konsekwencje, a z ka�dym takim razem b�dziesz o wiele lepszym wojownikiem.
	
	Log_CreateTopic (TOPIC_Rethon_szkolenie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_szkolenie, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_szkolenie, "Faktycznie, trening z Rethonem przyni�s� niemal natychmiastowe skutki. Teraz chce, abym wyzwa� �owc�w trenuj�cych w jego pobli�u na pojedynek. Obawiam si�, �e wynik b�dzie z g�ry przes�dzony, lecz czego si� nie robi dla praktyki?");

	Lowca123_PojedynekDoRozegrania = TRUE;
	Lowca108_PojedynekDoRozegrania = TRUE;
	Info_ClearChoices (DIA_NASZ_109_Rethon_presiema);
};

FUNC VOID DIA_NASZ_109_Rethon_presiema_not()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_not_15_00"); //Nigdy nie by�em zbyt dobrym wojownikiem.
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_not_15_01"); //Przynajmniej je�eli chodzi o or� do walki wr�cz. Cz�ciej mia�em do czynienia z �ukami b�d� kuszami, ni� z mieczami.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_not_55_02"); //To nieco komplikuje sytuacj�.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_not_55_03"); //Lecz nie z takich robi�em wojownik�w! Na pocz�tek proponuj� ma�� rozgrzewk� dla twoich mi�ni jak i d�oni, by przyzwyczai�y si� do odpowiedniego chwytu miecza.
	
	DIA_NASZ_109_Rethon_presiema_cd();
};

FUNC VOID DIA_NASZ_109_Rethon_presiema_oczywiscie()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_oczywiscie_15_00"); //Oczywi�cie, �e tak.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_01"); //Swego czasu by�em my�liwym, lecz obawiam si�, �e z powodu mojej niewolniczej pracy w kopalni wiele zapomnia�em.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_02"); //Wi�c najlepiej od razu zabierajmy si� do pracy!
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_03"); //Im szybciej zaczniemy trening, tym lepiej dla ciebie jak i dla nas, kiedy nadejdzie atak na ob�z.

	DIA_NASZ_109_Rethon_presiema_cd();
};	



//*********************************************************************
//	Info FightWithAll
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_FightWithAll   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 2;
 	condition   = DIA_NASZ_109_Rethon_FightWithAll_Condition;
 	information = DIA_NASZ_109_Rethon_FightWithAll_Info;
 	permanent   = FALSE;
 	description = "Walczy�em ze wszystkimi.";
};

FUNC INT DIA_NASZ_109_Rethon_FightWithAll_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_presiema))
	&& (PhillPojedynek_Done == TRUE)
	&& (Lowca108Pojedynek_Done == TRUE)
	&& ((Lowca123Pojedynek_Done == TRUE) || (Lowca123_NaBanicji == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_FightWithAll_Info()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_FightWithAll_15_00"); //Walczy�em ze wszystkimi.
	
	if (NASZ_112_Peter.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) //
	|| (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) // jesli hero przegral z ktoryms z nich
	|| (NASZ_123_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) //
	{
		AI_Output (other, self,"DIA_NASZ_109_Rethon_FightWithAll_55_01"); //Tak jak si� spodziewa�em, dosta�em od nich t�gie manto.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_02"); //Nie stch�rzy�e� jednak i stan��e� z podniesionym czo�em przeciwko wyzwaniu, jakie si� przed tob� zobrazowa�o. To cecha prawdziwego wojownika.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_03"); //Nie martw si�, siniaki si� zagoj� i znikn�, a ty ruszysz do walki uzbrojony w now� wiedz� i do�wiadczenia.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Mimo tego, �e nie wyszed�em zwyci�sko z ka�dej potyczki, Rethon by� ze mnie zadowolony.");
	}
	else {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_FightWithAll_55_04"); //Da�em im rad�.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_05"); //Doprawdy? Widocznie ch�opcom przyda si� wi�cej treningu, skoro pokona� ich nowy przybysz.
		
		if(Lowca123_PojedynekWzietaTrucizna == TRUE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_06"); //Chocia� mog�e� powalczy� ze wszystkimi, a nie handlowa� si�. Z drugiej strony wykaza�e� si� czym� innym ni� sam� si��.
		} else {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_07"); //Dobra robota! Okaza�e� si� honorowym wojownikiem, kt�ry nie boi si� wyzwa� i dumnie stawia im czo�a.
		};
		
		B_LogEntry (TOPIC_Rethon_szkolenie, "Rethon by� zaskoczony moj� postaw�. Pewnie teraz jego rekruci b�d� pilnowani przy treningu jeszcze bardziej!");
	};
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_08"); //Pami�taj, przeciwnika nie pokonasz sam� si��. Potrzebujesz tak�e sprytu i rozwagi.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_09"); //Powodzenia w twoich w�dr�wkach!
	
	B_GivePlayerXP(300);
	Log_SetTopicStatus (TOPIC_Rethon_szkolenie, LOG_SUCCESS);
	DodajReputacje (4, REP_LOWCY);
	
};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_zadanie   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 2;
 	condition   = DIA_NASZ_109_Rethon_zadanie_Condition;
 	information = DIA_NASZ_109_Rethon_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mog� ci si� na co� przyda�?";
};

FUNC INT DIA_NASZ_109_Rethon_zadanie_Condition()
{
	// TODO odkomentowac
	//if(npc_knowsinfo(other,DIA_NASZ_109_Rethon_FightWithAll))
	//{
		return TRUE;
	//};
};

FUNC VOID DIA_NASZ_109_Rethon_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_zadanie_15_00"); //Mog� ci si� na co� przyda�?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_01"); //Bardzo mo�liwe.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_02"); //S�uchaj, by�e� ju� na arenie? Zreszt� niewa�ne.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_03"); //Id� do Kurgana i przekonaj go do walki ze mn�.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_04"); //Skurczybyk nie przyj�� mojego wyzwania. Zapewne obawia si�, �e nie da mi rady i straci w oczach swoich gladiator�w.

	Log_CreateTopic (TOPIC_Rethon_kurgan, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_kurgan, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_kurgan, "Rethon chcia�by stoczy� walk� na arenie z Kurganem. Musz� jako� przekona� mistrza areny do przyj�cia wyzwania.");

};


func void HeroSay_KurganSieZgodzil() {
	AI_Output (other,self ,"HeroSay_KurganSieZgodzil_15_00"); //Kurgan si� zgodzi�. Masz si� stawi� na arenie.
};

//*********************************************************************
//	Info Ready
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_ready   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 3;
 	condition   = DIA_NASZ_109_Rethon_ready_Condition;
 	information = DIA_NASZ_109_Rethon_ready_Info;
 	permanent   = FALSE;
 	description = "Kurgan si� zgodzi�.";
};

FUNC INT DIA_NASZ_109_Rethon_ready_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_zadanie)
	&& (Kurgan_OK == TRUE))
	&& (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_ready_Info()
{
	HeroSay_KurganSieZgodzil();
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ready_55_00"); //Nie mog� si� doczeka�, dzi�ki.

	B_LogEntry (TOPIC_Rethon_kurgan, "Rethon poszed� na aren�. Zapowiada si� niez�e widowisko.");
	Npc_ExchangeRoutine (NASZ_109_Rethon, "BeforeRethonKurganFight");
	Npc_ExchangeRoutine (NASZ_115_Kurgan, "BeforeRethonKurganFight");
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info ReadyKap3
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_ReadyKap3   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 3;
 	condition   = DIA_NASZ_109_Rethon_ReadyKap3_Condition;
 	information = DIA_NASZ_109_Rethon_ReadyKap3_Info;
 	permanent   = FALSE;
 	description = "Kurgan si� zgodzi�.";
};

FUNC INT DIA_NASZ_109_Rethon_ReadyKap3_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_zadanie)
	&& (Kurgan_OK == TRUE))
	&& (KAPITEL >= 3)
	&& !(npc_knowsinfo(other,DIA_NASZ_109_Rethon_ready))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_ReadyKap3_Info()
{
	HeroSay_KurganSieZgodzil();
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_00"); //Poczekaj, chyba zasz�o jakie� ma�e nieporozumienie. Przecie� ju� jaki� czas temu stoczyli�my walk�.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_01"); //Na pewno nie by�o ci� w obozie i o niczym nie wiedzia�e�... A ta �winia zapewne wykorzysta�a ci� i wy�wiadczy�e� jej przys�ug�?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_02"); //I tak za t� ca�� fatyg� nale�y ci si� nagroda. Przyjmij ten miecz i znaj moj� wdzi�czno��.

	Createinvitems (self, ItMw_ShortSword5, 1);
	B_giveinvitems (self, other, ItMw_ShortSword5, 1);

	B_LogEntry (TOPIC_Rethon_kurgan, "Jak si� okaza�o, walka odby�a si� bez mojej wiedzy, a ja i tak pomog�em Kurganowi. Ten cz�owiek ma tupet!");
	Log_SetTopicStatus (TOPIC_Rethon_kurgan, LOG_SUCCESS);
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
};



//*********************************************************************
//	Info After
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_after   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 4;
 	condition   = DIA_NASZ_109_Rethon_after_Condition;
 	information = DIA_NASZ_109_Rethon_after_Info;
 	permanent   = FALSE;
 	description = "No i jak?";
};

FUNC INT DIA_NASZ_109_Rethon_after_Condition()
{
	// TODO odkomentowa� !!!
	//if (RethonKurganFightFinished == TRUE)
	//{
		return TRUE;
	//};
};

FUNC VOID DIA_NASZ_109_Rethon_after_Info()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_after_15_00"); //No i jak?

	if (RethonLostWithKurgan == TRUE) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_01"); //Wygl�da na to, �e przegra�em. Ale przynajmniej troszk� si� rozerwa�em.
	}

	else {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_02"); //Zwyci�anie jest takie przyjemne... Twoje zdrowie!
		Createinvitems (self, ItFo_Beer, 1);
		B_UseItem (self, ItFo_Beer);
	};	

	AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_03"); //W ramach podzi�kowa�, dam ci ten miecz. Przyda ci si� w twoich �wiczeniach. Jest lekki i dobrze wywa�ony.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_after_55_04"); //Dzi�ki Rethon, na pewno zobaczysz mnie z nim kiedy� na placu treningowym.
	
	Createinvitems (self, ItMw_ShortSword5, 1);
	B_giveinvitems (self, other, ItMw_ShortSword5, 1);
	
	NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 70;
	NASZ_109_Rethon.attribute[ATR_STRENGTH] = 70;
	
	B_LogEntry (TOPIC_Rethon_kurgan, "Po walce. Rethon jest zadowolony, �e m�g� si� troch� rozerwa�.");
	Log_SetTopicStatus (TOPIC_Rethon_kurgan, LOG_SUCCESS);
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_goth   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 5;
 	condition   = DIA_NASZ_109_Rethon_goth_Condition;
 	information = DIA_NASZ_109_Rethon_goth_Info;
 	permanent   = FALSE;
	description = "�owcy okradli my�liwych. Czy to prawda?";
};

FUNC INT DIA_NASZ_109_Rethon_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_109_Rethon_goth_15_00"); //�owcy okradli my�liwych. Czy to prawda?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_goth_55_01"); //Prawda, nieprawda. Nie mam poj�cia.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_goth_55_02"); //Ale Keroloth wychodzi� z siebie, krzycz�c po nas, gdy dosz�y go o tym s�uchy.

	B_LogEntry (TOPIC_Goth_kradziez, "Rethon nic nie wie, chocia� zwr�ci� uwag� na to, �e Keroloth ostro na nich krzycza�, gdy dowiedzia� si� o kradzie�y.");

};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_Gwozdzie   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 6;
 	condition   = DIA_NASZ_109_Rethon_Gwozdzie_Condition;
 	information = DIA_NASZ_109_Rethon_Gwozdzie_Info;
 	permanent   = FALSE;
	description = "Nie wpad�a ci mo�e ostatnio jaka� paczuszka w r�ce?";
};

FUNC INT DIA_NASZ_109_Rethon_Gwozdzie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie))
	&& (WillKnowGwozdzieThief == FALSE)  && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_Gwozdzie_Info()
{
	AI_Output (other, self,"DIA_NASZ_109_Rethon_Gwozdzie_15_00"); //Nie wpad�a ci mo�e ostatnio jaka� paczuszka w r�ce?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_Gwozdzie_55_01"); //Nie. Jedyne co mi ostatnio wpada w r�ce to zap�ata od trenuj�cych.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_Gwozdzie_55_02"); //Hahaha!

	B_LogEntry (TOPIC_Robotnik_deski, "Rethon nie widzia� paczki.");

};

//*********************************************************************
//	Info Orkowie
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_orkowie   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 11;
 	condition   = DIA_NASZ_109_Rethon_orkowie_Condition;
 	information = DIA_NASZ_109_Rethon_orkowie_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_109_Rethon_orkowie_Condition()	
{
	if (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_orkowie_Info()
{
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_01"); //Biegasz ca�kiem sporo po okolicy. Mam zadanie dla kogo� takiego jak ty.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_orkowie_55_02"); //O co chodzi? Zreszt�, czy tylko ja wychodz� z obozu? Co z takim Korthem na przyk�ad?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_03"); //Obawiam si�, �e Korth nie ma jaj, by si� tym zaj��. Przecie� to dawny stra�nik. Oni s� bardziej od okaleczania pijanych m�czyzn w karczmie. Kt�ry z nich da�by rad� kilku orkom na raz?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_04"); //Pos�uchaj: W ca�ej G�rniczej Dolinie porozbijane s� orkowe namioty. Przy ka�dym z nich stoi po kilku ork�w. Je�li chcemy przej�� zamek, to musimy zacz�� od skasowania ich oboz�w zwiadowczych.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_05"); //Je�li natkniesz si� na kt�ry� z nich, to nie oszcz�d� �adnego wielkoluda.

	Log_CreateTopic (TOPIC_Rethon_orkowie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_orkowie, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_orkowie, "W ca�ej G�rniczej Dolinie porozbijane s� orkowe namioty. Musz� pozabija� zwiadowc�w, aby ograniczy� wiedz� ork�w o sytuacji i ewentualnych ruchach strategicznych �owc�w ork�w.");

};

var int OrkowieObozyLicznik;
var int OrkoweObozyUkonczone;
//*********************************************************************
//	Info OrkowieKoniec
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_OrkowieKoniec   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 12;
 	condition   = DIA_NASZ_109_Rethon_OrkowieKoniec_Condition;
 	information = DIA_NASZ_109_Rethon_OrkowieKoniec_Info;
 	permanent   = TRUE;
	description = "Za�atwi�em orkowe obozy.";
};

FUNC INT DIA_NASZ_109_Rethon_OrkowieKoniec_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_Orkowie)
	&& (OrkoweObozyRozwalone >= 1)) && (OrkoweObozyUkonczone == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_OrkowieKoniec_Info()
{
	AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_15_00"); //Za�atwi�em orkowe obozy.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_01"); //Doprawdy?
	OrkowieObozyLicznik = 0;

	//M�WIENIE O OBOZACH
	if (OrkowyObozKlif == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_02"); //Orkowie z obozu na klifie za wie�� Xardasa gryz� ziemi�.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozPalisade == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_03"); //Przed palisad� znajdowa� si� orkowy ob�z.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_04"); //Znajdowa�?
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_05"); //Tak, skopa�em kilka orkowych ty�k�w.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
		};
	if (OrkowyObozLasOC == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_06"); //Pozby�em si� ork�w z lasu.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozZamek == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_07"); //Ork�w w lesie mi�dzy palisad� a zamkiem ju� nie ma.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_08"); //Niebezpieczne okolice... �wietna robota.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozKopalnia == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_09"); //Wyeliminowa�em orkowy ob�z nad kopalni� pe�zaczy.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	
	//ZAKO�CZENIE
	if (OrkowieObozyLicznik >= 5) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_10"); //Doskonale. Zwiedzi�e� wzd�u� i wszesz c��� G�rnicz� Dolin�.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_11"); //Oboz�w patroluj�cych ju� nie ma. Zas�u�y�e� na nagrod�, ch�opcze.

		Createinvitems (self, ItFo_Booze, 2);
		B_giveinvitems (self, other, ItFo_Booze, 1);
		B_UseItem (other, ItFo_Booze);
		B_UseItem (self, ItFo_Booze);

		Createinvitems (self, ItMi_Gold, 400);
		B_giveinvitems (self, other, ItMi_Gold, 400);
	
		Log_SetTopicStatus (TOPIC_Rethon_orkowie, LOG_SUCCESS);
		B_LogEntry (TOPIC_Rethon_orkowie, "Orkowe obozy to ju� przesz�o��.");
		B_GivePlayerXP (1000);
		DodajReputacje (6, REP_LOWCY);
		
		OrkoweObozyUkonczone = TRUE;

	}
	else if (OrkowieObozyLicznik < 3) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_12"); //To wszystko? Jestem pewien, �e jest jeszcze kilka oboz�w.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_13"); //Poszukaj dok�adniej.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_14"); //To wszystko? Co� mi si� wydaje, �e jest jeszcze jaki� ob�z...
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_15"); //Dasz mi rad�, gdzie szuka�?
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_16"); //C�...
	
		if (OrkowyObozKlif == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_17"); //Udaj si� za wie�� Xardasa... To dzikie tereny. Mo�e tam co� znajdziesz?
		};
		if (OrkowyObozPalisade == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_18"); //Palisada to dobre miejsce do poszukiwa�.
		};
		if (OrkowyObozLasOC == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_19"); //Poszukaj w lesie mi�dzy Placem Wymian a Star� Kopalni�.
		};
		if (OrkowyObozZamek == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_20"); //A las obok zamku? Co ty na to? Orkowie mieliby niez�y widok na to, co dzieje si� przed zamkiem.
		};
		if (OrkowyObozKopalnia == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_21"); //By�e� w rejonach g�rniczych? Tam, mi�dzy wulkanem a Kopalni� Pe�zaczy.
		};

		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_22"); //Dzi�ki, udam si� tam.

	};

};


//*********************************************************************
//	Info FajkaStart
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_FajkaStart   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 11;
 	condition   = DIA_NASZ_109_Rethon_FajkaStart_Condition;
 	information = DIA_NASZ_109_Rethon_FajkaStart_Info;
 	permanent   = FALSE;
	description = "Zdobyli�my zamek, uda�o si�!";
};

FUNC INT DIA_NASZ_109_Rethon_FajkaStart_Condition()	
{
	if (KAPITEL >= 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_FajkaStart_Info()
{
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_15_00"); //Zdobyli�my zamek, uda�o si�!
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_01"); //Podziwiam tw�j entuzjazm, m�odzie�cze. Dla mnie to by�a kolejna sucha walka z t�pymi orkowymi wojownikami.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_02"); //Zamek jest nasz. Tylko co z tego? I tak nie wydostaniemy si� z G�rniczej Doliny i w ko�cu tu umrzemy. Albo z g�odu, albo z nud�w.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_03"); //Mog� jako� poprawi� tw�j humor? Mo�e jest jaki� spos�b, by� poczu� si� tutaj jak w domu?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_04"); //W moich stronach jest ca�kiem inaczej. Sto�y pe�ne �arcia, piwo z domieszk� imbiru i dziczyzna wysma�ona w punkt. A jako zwie�czenie uczty palimy fajki rze�bione przez najlepszych stolarzy.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_05"); //Czy�by� nie by� amatorem bagiennego ziela?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_06"); //Pal� tu go wszyscy dooko�a. Moim ostatnim �yczeniem przed �mierci� w tej okolicy by�oby zapalenie fajki. Pytanie, czy jest tu co� takiego?
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_07"); //Za czas�w Bariery by�o paru specjalist�w od r�nych wyrob�w tytoniowych. Zobacz�, czy uda mi si� skombinowa� fajk�. Pomoc nadchodzi!
	
	Log_CreateTopic (TOPIC_Rethon_fajka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_fajka, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_fajka, "Rethon chcia�by zapali� fajk�. Tylko jak co� takiego za�atwi�? Za czas�w Bariery by�o paru koneser�w palenia, ale wszyscy pomarli. Benito jest jedynym handlarzem tytoniu, jakiego znam.");

};



func int Npc_HasTabak(var c_npc slf) {
// zwraca itemID tytoniu, kt�ry ma slf

	if (Npc_HasItems(slf,ItMi_ApfelTabak)) { return ItMi_ApfelTabak; };
	if (Npc_HasItems(slf,ItMi_PilzTabak)) { return ItMi_PilzTabak; };
	if (Npc_HasItems(slf,ItMi_DoppelTabak)) { return ItMi_DoppelTabak; };
	if (Npc_HasItems(slf,ItMi_Honigtabak)) { return ItMi_Honigtabak; };
	if (Npc_HasItems(slf,ItMi_SumpfTabak)) { return ItMi_SumpfTabak; };

	return -1;
};

//*********************************************************************
//	Info FajkaEnd
//*********************************************************************
INSTANCE DIA_NASZ_109_Rethon_FajkaEnd   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 11;
 	condition   = DIA_NASZ_109_Rethon_FajkaEnd_Condition;
 	information = DIA_NASZ_109_Rethon_FajkaEnd_Info;
 	permanent   = FALSE;
	description = "Znalaz�em fajk� i za�atwi�em odpowiedni tyto�.";
};

FUNC INT DIA_NASZ_109_Rethon_FajkaEnd_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_109_Rethon_FajkaStart))
	&& (npc_hasitems(other,ItNa_Fajka) >=1)
	&& (Npc_HasTabak(other) != -1) // ma jakis tyton
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_109_Rethon_FajkaEnd_Info()
{
	var int tabakId; tabakId = Npc_HasTabak(other);

	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaEnd_15_00"); //Znalaz�em fajk� i za�atwi�em odpowiedni tyto�.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaEnd_55_01"); //Niebywa�e! Masz fajk�? Nawet nie wiesz, jak bardzo si� ciesz�!
	
	B_GiveInvItems(other,self,ItNa_Fajka,1);
	B_GiveInvItems(other,self,tabakId,1);
	B_UseItem(self,ItNa_Fajka);
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaEnd_55_03"); //TODO nagroda
	
	Log_SetTopicStatus (TOPIC_Rethon_fajka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Rethon_fajka, "Rethon cieszy� si� jak dziecko, gdy zapali� fajk�. By� mo�e mi tak�e przyda�aby si� taka zabawka...");

};

//*********************************************************************
//	Info Nauka
//*********************************************************************
INSTANCE DIA_Rethon_Teach   (C_INFO)
{
	npc         = NASZ_109_Rethon;
 	nr          = 100;
 	condition   = DIA_Rethon_Teach_Condition;
 	information = DIA_Rethon_Teach_Info;
 	permanent   = TRUE;
 	description = "Ucz mnie.";
};

FUNC INT DIA_Rethon_Teach_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_presiema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Rethon_Teach_Info()
{
	AI_Output (other,self ,"DIA_Rethon_Teach_15_00"); //Ucz mnie.

	if(Wld_IsTime(21,00,00,35)){
		AI_Output (self, other,"DIA_Rethon_Teach_15_01"); //Nie widzisz, �e jestem zaj�ty? Przyjd� jutro.
	}

	else if(Wld_IsTime(00,35,04,00)){
		AI_Output (self, other,"DIA_Rethon_Teach_15_02"); //Daj mi spa�! Pogadamy rano.
	}

	else if(Wld_IsTime(04,00,08,00)){
		AI_Output (self, other,"DIA_Rethon_Teach_15_03"); //Widzisz, abym sta� i trenowa� innych? Przyjd�, kiedy b�d� na placu treningowym.
	}
	else
	{

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (WalkaTarcza == FALSE) { Info_AddChoice		(DIA_Rethon_Teach, "Walka tarcz�. (10 PN, 300 szt. z�ota)",DIA_Rethon_Teach_Shield); };

	if (other.HitChance[NPC_TALENT_1H] < 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_2H_5); };
	};
	
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_1h_5b); };
	};

	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 25) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_2H_5b); };
	};	
	
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_Rethon_Teach_1h_1c); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_Rethon_Teach_1h_5c); };
	};

	
	};
};

FUNC VOID DIA_Rethon_Teach_Back ()
{
	Info_ClearChoices (DIA_Rethon_Teach);
};

FUNC VOID DIA_Rethon_Teach_Shield()
{
	AI_Output (other, self,"DIA_Rethon_Teach_Shield_15_00"); //Naucz mnie pos�ugiwania si� tarcz�.
	
	if (npc_hasitems (other, ItMi_Gold) < 300) {
		AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_01"); //Nie masz do�� z�ota.
		}
	else {

		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_55_02"); //Wielu pocz�tkuj�cych wojownik�w pope�nia zasadniczy b��d: Trzymaj� tarcz� ca�y czas uniesion� podczas walki, w dodatku spinaj�c mi�nie bez przerwy.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_03"); //Ogranicza to szybko�� cios�w mieczem oraz szybko m�czy organizm.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_04"); //Podczas walki, trzymaj tarcz� opuszczon�, odbijaj tylko ciosy przeciwnika. Nie zapomnij tylko mocno spi�� r�ki podczas parowania ciosu, inaczej �le by si� to mog�o sko�czy�.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_05"); //Musz� jednak zaznaczy�, �e tarcza znacznie spowolni twoje ruchy i nie b�dziesz w stanie macha� mieczem tak szybko, jak jeste� w stanie bez tarczy.

			B_GiveInvItems (other, self, ItMi_Gold, 300);			
			WalkaTarcza = TRUE;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: walka tarcz�", -1, -1, FONT_Screen, 2);
			
			Npc_SetTalentSkill 	(hero, NPC_TALENT_FIREMASTER, 1);
			}

		else {
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_55_06"); //Brak ci do�wiadczenia.
		};
	};
};

FUNC VOID DIA_Rethon_Teach_1H_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_1h_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_1h_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_2H_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_2H_5b); };
	};	
};

FUNC VOID DIA_Rethon_Teach_2H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (1 PN, 5 szt. z�ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (5 PN, 25 szt. z�ota)",DIA_Rethon_Teach_2H_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_2H_5b); };
	};	
};

FUNC VOID DIA_Rethon_Teach_1H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_1h_5b); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_Rethon_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_Rethon_Teach_1h_5C); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5b ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_1h_5b); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_Rethon_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_Rethon_Teach_1h_5C); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);

	
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		AI_Output(self,other,"DIA_DIA_Rethon_Teach_2H_1b_04_00"); //Nie mog� ci� ju� niczego nauczy�.
		AI_Output(self,other,"DIA_DIA_Rethon_Teach_2H_1b_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj si� do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_2H_1b); };
	if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_2H_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_5b ()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
		
	
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_2H_5b_04_00"); //Nie mog� ci� ju� niczego nauczy�.
		AI_Output(self,other,"DIA_Rethon_Teach_2H_5b_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj si� do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 1. (2 PN, 10 szt. z�ota)",DIA_Rethon_Teach_2H_1b); };
	if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� dwur�czna + 5. (10 PN, 50 szt. z�ota)",DIA_Rethon_Teach_2H_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_1c ()
{
	if (hero.lp >= 3){ B_giveinvitems (other, self, ItMi_Gold, 15); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_1H_1c_04_00"); //Nie mog� ci� ju� niczego nauczy�.
		AI_Output(self,other,"DIA_Rethon_Teach_1H_1c_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj si� do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_Rethon_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_Rethon_Teach_1h_5c); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5c ()
{
	if (hero.lp >= 15){ B_giveinvitems (other, self, ItMi_Gold, 75); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_1H_5c_04_00"); //Nie mog� ci� ju� niczego nauczy�.
		AI_Output(self,other,"DIA_Rethon_Teach_1H_5c_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj si� do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_Rethon_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_Rethon_Teach_1h_5c); };
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_109_Rethon_PICKPOCKET (C_INFO)
{
	npc			= NASZ_109_Rethon;
	nr			= 900;
	condition	= DIA_NASZ_109_Rethon_PICKPOCKET_Condition;
	information	= DIA_NASZ_109_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_109_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (62);
};
 
FUNC VOID DIA_NASZ_109_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_109_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_109_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_109_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_109_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_109_Rethon_PICKPOCKET_DoIt);
};

func void DIA_NASZ_109_Rethon_PICKPOCKET_DoIt()
{
	B_BeklauenGold(82);
	Info_ClearChoices (DIA_NASZ_109_Rethon_PICKPOCKET);
};
	
func void DIA_NASZ_109_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_109_Rethon_PICKPOCKET);
};
