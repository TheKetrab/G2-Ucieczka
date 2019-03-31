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
	B_LogEntry (TOPIC_LowcyTeacher,"Rethon szkoli ludzi w walce broni¹ bia³¹.");
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_15_00"); //Hej, ty! Jesteœ tutaj nowy? Nigdy wczeœniej ciê tutaj nie widzia³em!
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_01"); //Tak, trafi³em tutaj stosunkowo niedawno.
	
	if(npc_knowsinfo(other,DIA_NASZ_101_Korth_siema)) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_02"); //Kiedy b³¹ka³em siê po lesie, znalaz³ mnie Korth i po krótkiej rozmowie przyprowadzi³ mnie tutaj.
	};
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_03"); //Zapewne zdajesz sobie sprawê z naszego beznadziejnego po³o¿enia w tym miejscu? Niech Beliar poch³onie tych przeklêtych orków, ci¹gle mamy z nimi k³opoty.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_04"); //Musimy byæ ca³y czas gotowi do odparcia ewentualnego ataku ze strony tych bestii, a co za tym idzie, ka¿dy z nas musi intensywnie trenowaæ.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_05"); //Je¿eli chcesz prze¿yæ w tym miejscu, musisz dobrze w³adaæ orê¿em. Inaczej szybko staniesz siê przek¹sk¹ dla tutejszych zwierz¹t.

	if (hero.guild == GIL_NONE) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_06"); //No i poza tym, jeœli chcesz do³¹czyæ do jakiegoœ obozu i nie byæ zmuszany do takich prac, jak przybijanie desek czy pi³owanie drewna, to musisz siê czymœ wyró¿niaæ. 
		AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_55_07"); //W gruncie rzeczy to jeszcze nie zdecydowa³em, do kogo chcê siê przy³¹czyæ.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_08"); //Twój wybór jest nieistotny. Wszyscy znaleŸliœmy siê w takim samym po³o¿eniu i powinniœmy sobie wzajemnie pomagaæ.
	};

	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_55_09"); //Powiedz no, walczy³eœ kiedyœ mieczem?
		
	Info_ClearChoices (DIA_NASZ_109_Rethon_presiema);
		Info_AddChoice	  (DIA_NASZ_109_Rethon_presiema, "Nigdy nie by³em zbyt dobrym wojownikiem.", DIA_NASZ_109_Rethon_presiema_not);
		Info_AddChoice	  (DIA_NASZ_109_Rethon_presiema, "Oczywiœcie, ¿e tak.", DIA_NASZ_109_Rethon_presiema_oczywiscie);

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
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_00"); //Widzisz? Odpowiednia koncentracja, a tak¿e rytmiczne i równomierne ruchy ca³ego cia³a pozwalaj¹ wydobyæ ukryty potencja³ miêœni.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_01"); //Skoro ju¿ siê rozgrza³eœ, to czas, aby przyst¹piæ do prawdziwego treningu. Nie ma bowiem nic lepszego ni¿ walka z prawdziwym oponentem.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_02"); //Poæwicz z tymi ³owcami, których spotkasz na placu treningowym. Przeka¿ im, ¿e ja ciê przysy³am. Wtedy zgodz¹ siê stan¹æ z tob¹ do pojedynku.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_cd_55_03"); //Obawiam siê, ¿e nie mam z nimi szans. To przecie¿ o wiele bardziej doœwiadczeni wojownicy.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_04"); //Nie przejmuj siê, ka¿da pora¿ka to klucz do sukcesu w przysz³oœci.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_cd_55_05"); //Ucz siê na ka¿dym b³êdzie, wyci¹gaj z nich konsekwencje, a z ka¿dym takim razem bêdziesz o wiele lepszym wojownikiem.
	
	Log_CreateTopic (TOPIC_Rethon_szkolenie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_szkolenie, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_szkolenie, "Faktycznie, trening z Rethonem przyniós³ niemal natychmiastowe skutki. Teraz chce, abym wyzwa³ ³owców trenuj¹cych w jego pobli¿u na pojedynek. Obawiam siê, ¿e wynik bêdzie z góry przes¹dzony, lecz czego siê nie robi dla praktyki?");

	Lowca123_PojedynekDoRozegrania = TRUE;
	Lowca108_PojedynekDoRozegrania = TRUE;
	Info_ClearChoices (DIA_NASZ_109_Rethon_presiema);
};

FUNC VOID DIA_NASZ_109_Rethon_presiema_not()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_not_15_00"); //Nigdy nie by³em zbyt dobrym wojownikiem.
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_not_15_01"); //Przynajmniej je¿eli chodzi o orê¿ do walki wrêcz. Czêœciej mia³em do czynienia z ³ukami b¹dŸ kuszami, ni¿ z mieczami.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_not_55_02"); //To nieco komplikuje sytuacjê.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_not_55_03"); //Lecz nie z takich robi³em wojowników! Na pocz¹tek proponujê ma³¹ rozgrzewkê dla twoich miêœni jak i d³oni, by przyzwyczai³y siê do odpowiedniego chwytu miecza.
	
	DIA_NASZ_109_Rethon_presiema_cd();
};

FUNC VOID DIA_NASZ_109_Rethon_presiema_oczywiscie()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_presiema_oczywiscie_15_00"); //Oczywiœcie, ¿e tak.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_01"); //Swego czasu by³em myœliwym, lecz obawiam siê, ¿e z powodu mojej niewolniczej pracy w kopalni wiele zapomnia³em.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_02"); //Wiêc najlepiej od razu zabierajmy siê do pracy!
	AI_Output (self, other,"DIA_NASZ_109_Rethon_presiema_oczywiscie_55_03"); //Im szybciej zaczniemy trening, tym lepiej dla ciebie jak i dla nas, kiedy nadejdzie atak na obóz.

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
 	description = "Walczy³em ze wszystkimi.";
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
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_FightWithAll_15_00"); //Walczy³em ze wszystkimi.
	
	if (NASZ_112_Peter.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) //
	|| (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) // jesli hero przegral z ktoryms z nich
	|| (NASZ_123_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) //
	{
		AI_Output (other, self,"DIA_NASZ_109_Rethon_FightWithAll_55_01"); //Tak jak siê spodziewa³em, dosta³em od nich têgie manto.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_02"); //Nie stchórzy³eœ jednak i stan¹³eœ z podniesionym czo³em przeciwko wyzwaniu, jakie siê przed tob¹ zobrazowa³o. To cecha prawdziwego wojownika.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_03"); //Nie martw siê, siniaki siê zagoj¹ i znikn¹, a ty ruszysz do walki uzbrojony w now¹ wiedzê i doœwiadczenia.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Mimo tego, ¿e nie wyszed³em zwyciêsko z ka¿dej potyczki, Rethon by³ ze mnie zadowolony.");
	}
	else {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_FightWithAll_55_04"); //Da³em im radê.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_05"); //Doprawdy? Widocznie ch³opcom przyda siê wiêcej treningu, skoro pokona³ ich nowy przybysz.
		
		if(Lowca123_PojedynekWzietaTrucizna == TRUE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_06"); //Chocia¿ mog³eœ powalczyæ ze wszystkimi, a nie handlowaæ siê. Z drugiej strony wykaza³eœ siê czymœ innym ni¿ sam¹ si³¹.
		} else {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_07"); //Dobra robota! Okaza³eœ siê honorowym wojownikiem, który nie boi siê wyzwañ i dumnie stawia im czo³a.
		};
		
		B_LogEntry (TOPIC_Rethon_szkolenie, "Rethon by³ zaskoczony moj¹ postaw¹. Pewnie teraz jego rekruci bêd¹ pilnowani przy treningu jeszcze bardziej!");
	};
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_08"); //Pamiêtaj, przeciwnika nie pokonasz sam¹ si³¹. Potrzebujesz tak¿e sprytu i rozwagi.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FightWithAll_55_09"); //Powodzenia w twoich wêdrówkach!
	
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
 	description = "Mogê ci siê na coœ przydaæ?";
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
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_zadanie_15_00"); //Mogê ci siê na coœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_01"); //Bardzo mo¿liwe.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_02"); //S³uchaj, by³eœ ju¿ na arenie? Zreszt¹ niewa¿ne.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_03"); //IdŸ do Kurgana i przekonaj go do walki ze mn¹.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_zadanie_55_04"); //Skurczybyk nie przyj¹³ mojego wyzwania. Zapewne obawia siê, ¿e nie da mi rady i straci w oczach swoich gladiatorów.

	Log_CreateTopic (TOPIC_Rethon_kurgan, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_kurgan, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_kurgan, "Rethon chcia³by stoczyæ walkê na arenie z Kurganem. Muszê jakoœ przekonaæ mistrza areny do przyjêcia wyzwania.");

};


func void HeroSay_KurganSieZgodzil() {
	AI_Output (other,self ,"HeroSay_KurganSieZgodzil_15_00"); //Kurgan siê zgodzi³. Masz siê stawiæ na arenie.
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
 	description = "Kurgan siê zgodzi³.";
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
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ready_55_00"); //Nie mogê siê doczekaæ, dziêki.

	B_LogEntry (TOPIC_Rethon_kurgan, "Rethon poszed³ na arenê. Zapowiada siê niez³e widowisko.");
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
 	description = "Kurgan siê zgodzi³.";
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
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_00"); //Poczekaj, chyba zasz³o jakieœ ma³e nieporozumienie. Przecie¿ ju¿ jakiœ czas temu stoczyliœmy walkê.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_01"); //Na pewno nie by³o ciê w obozie i o niczym nie wiedzia³eœ... A ta œwinia zapewne wykorzysta³a ciê i wyœwiadczy³eœ jej przys³ugê?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_ReadyKap3_55_02"); //I tak za tê ca³¹ fatygê nale¿y ci siê nagroda. Przyjmij ten miecz i znaj moj¹ wdziêcznoœæ.

	Createinvitems (self, ItMw_ShortSword5, 1);
	B_giveinvitems (self, other, ItMw_ShortSword5, 1);

	B_LogEntry (TOPIC_Rethon_kurgan, "Jak siê okaza³o, walka odby³a siê bez mojej wiedzy, a ja i tak pomog³em Kurganowi. Ten cz³owiek ma tupet!");
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
	// TODO odkomentowaæ !!!
	//if (RethonKurganFightFinished == TRUE)
	//{
		return TRUE;
	//};
};

FUNC VOID DIA_NASZ_109_Rethon_after_Info()
{
	AI_Output (other,self ,"DIA_NASZ_109_Rethon_after_15_00"); //No i jak?

	if (RethonLostWithKurgan == TRUE) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_01"); //Wygl¹da na to, ¿e przegra³em. Ale przynajmniej troszkê siê rozerwa³em.
	}

	else {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_02"); //Zwyciê¿anie jest takie przyjemne... Twoje zdrowie!
		Createinvitems (self, ItFo_Beer, 1);
		B_UseItem (self, ItFo_Beer);
	};	

	AI_Output (self, other,"DIA_NASZ_109_Rethon_after_55_03"); //W ramach podziêkowañ, dam ci ten miecz. Przyda ci siê w twoich æwiczeniach. Jest lekki i dobrze wywa¿ony.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_after_55_04"); //Dziêki Rethon, na pewno zobaczysz mnie z nim kiedyœ na placu treningowym.
	
	Createinvitems (self, ItMw_ShortSword5, 1);
	B_giveinvitems (self, other, ItMw_ShortSword5, 1);
	
	NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 70;
	NASZ_109_Rethon.attribute[ATR_STRENGTH] = 70;
	
	B_LogEntry (TOPIC_Rethon_kurgan, "Po walce. Rethon jest zadowolony, ¿e móg³ siê trochê rozerwaæ.");
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
	description = "£owcy okradli myœliwych. Czy to prawda?";
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
	AI_Output (other, self,"DIA_NASZ_109_Rethon_goth_15_00"); //£owcy okradli myœliwych. Czy to prawda?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_goth_55_01"); //Prawda, nieprawda. Nie mam pojêcia.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_goth_55_02"); //Ale Keroloth wychodzi³ z siebie, krzycz¹c po nas, gdy dosz³y go o tym s³uchy.

	B_LogEntry (TOPIC_Goth_kradziez, "Rethon nic nie wie, chocia¿ zwróci³ uwagê na to, ¿e Keroloth ostro na nich krzycza³, gdy dowiedzia³ siê o kradzie¿y.");

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
	description = "Nie wpad³a ci mo¿e ostatnio jakaœ paczuszka w rêce?";
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
	AI_Output (other, self,"DIA_NASZ_109_Rethon_Gwozdzie_15_00"); //Nie wpad³a ci mo¿e ostatnio jakaœ paczuszka w rêce?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_Gwozdzie_55_01"); //Nie. Jedyne co mi ostatnio wpada w rêce to zap³ata od trenuj¹cych.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_Gwozdzie_55_02"); //Hahaha!

	B_LogEntry (TOPIC_Robotnik_deski, "Rethon nie widzia³ paczki.");

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
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_01"); //Biegasz ca³kiem sporo po okolicy. Mam zadanie dla kogoœ takiego jak ty.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_orkowie_55_02"); //O co chodzi? Zreszt¹, czy tylko ja wychodzê z obozu? Co z takim Korthem na przyk³ad?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_03"); //Obawiam siê, ¿e Korth nie ma jaj, by siê tym zaj¹æ. Przecie¿ to dawny stra¿nik. Oni s¹ bardziej od okaleczania pijanych mê¿czyzn w karczmie. Który z nich da³by radê kilku orkom na raz?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_04"); //Pos³uchaj: W ca³ej Górniczej Dolinie porozbijane s¹ orkowe namioty. Przy ka¿dym z nich stoi po kilku orków. Jeœli chcemy przej¹æ zamek, to musimy zacz¹æ od skasowania ich obozów zwiadowczych.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_orkowie_55_05"); //Jeœli natkniesz siê na któryœ z nich, to nie oszczêdŸ ¿adnego wielkoluda.

	Log_CreateTopic (TOPIC_Rethon_orkowie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_orkowie, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_orkowie, "W ca³ej Górniczej Dolinie porozbijane s¹ orkowe namioty. Muszê pozabijaæ zwiadowców, aby ograniczyæ wiedzê orków o sytuacji i ewentualnych ruchach strategicznych ³owców orków.");

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
	description = "Za³atwi³em orkowe obozy.";
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
	AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_15_00"); //Za³atwi³em orkowe obozy.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_01"); //Doprawdy?
	OrkowieObozyLicznik = 0;

	//MÓWIENIE O OBOZACH
	if (OrkowyObozKlif == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_02"); //Orkowie z obozu na klifie za wie¿¹ Xardasa gryz¹ ziemiê.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozPalisade == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_03"); //Przed palisad¹ znajdowa³ siê orkowy obóz.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_04"); //Znajdowa³?
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_05"); //Tak, skopa³em kilka orkowych ty³ków.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
		};
	if (OrkowyObozLasOC == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_06"); //Pozby³em siê orków z lasu.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozZamek == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_07"); //Orków w lesie miêdzy palisad¹ a zamkiem ju¿ nie ma.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_08"); //Niebezpieczne okolice... Œwietna robota.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	if (OrkowyObozKopalnia == TRUE) {
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_09"); //Wyeliminowa³em orkowy obóz nad kopalni¹ pe³zaczy.
		OrkowieObozyLicznik = OrkowieObozyLicznik +1;
	};
	
	//ZAKOÑCZENIE
	if (OrkowieObozyLicznik >= 5) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_10"); //Doskonale. Zwiedzi³eœ wzd³u¿ i wszesz c¹³¹ Górnicz¹ Dolinê.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_11"); //Obozów patroluj¹cych ju¿ nie ma. Zas³u¿y³eœ na nagrodê, ch³opcze.

		Createinvitems (self, ItFo_Booze, 2);
		B_giveinvitems (self, other, ItFo_Booze, 1);
		B_UseItem (other, ItFo_Booze);
		B_UseItem (self, ItFo_Booze);

		Createinvitems (self, ItMi_Gold, 400);
		B_giveinvitems (self, other, ItMi_Gold, 400);
	
		Log_SetTopicStatus (TOPIC_Rethon_orkowie, LOG_SUCCESS);
		B_LogEntry (TOPIC_Rethon_orkowie, "Orkowe obozy to ju¿ przesz³oœæ.");
		B_GivePlayerXP (1000);
		DodajReputacje (6, REP_LOWCY);
		
		OrkoweObozyUkonczone = TRUE;

	}
	else if (OrkowieObozyLicznik < 3) {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_12"); //To wszystko? Jestem pewien, ¿e jest jeszcze kilka obozów.
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_13"); //Poszukaj dok³adniej.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_14"); //To wszystko? Coœ mi siê wydaje, ¿e jest jeszcze jakiœ obóz...
		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_15"); //Dasz mi radê, gdzie szukaæ?
		AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_16"); //Có¿...
	
		if (OrkowyObozKlif == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_17"); //Udaj siê za wie¿ê Xardasa... To dzikie tereny. Mo¿e tam coœ znajdziesz?
		};
		if (OrkowyObozPalisade == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_18"); //Palisada to dobre miejsce do poszukiwañ.
		};
		if (OrkowyObozLasOC == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_19"); //Poszukaj w lesie miêdzy Placem Wymian a Star¹ Kopalni¹.
		};
		if (OrkowyObozZamek == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_20"); //A las obok zamku? Co ty na to? Orkowie mieliby niez³y widok na to, co dzieje siê przed zamkiem.
		};
		if (OrkowyObozKopalnia == FALSE) {
			AI_Output (self, other,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_21"); //By³eœ w rejonach górniczych? Tam, miêdzy wulkanem a Kopalni¹ Pe³zaczy.
		};

		AI_Output (other, self,"DIA_NASZ_109_Rethon_OrkowieKoniec_55_22"); //Dziêki, udam siê tam.

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
	description = "Zdobyliœmy zamek, uda³o siê!";
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
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_15_00"); //Zdobyliœmy zamek, uda³o siê!
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_01"); //Podziwiam twój entuzjazm, m³odzieñcze. Dla mnie to by³a kolejna sucha walka z têpymi orkowymi wojownikami.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_02"); //Zamek jest nasz. Tylko co z tego? I tak nie wydostaniemy siê z Górniczej Doliny i w koñcu tu umrzemy. Albo z g³odu, albo z nudów.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_03"); //Mogê jakoœ poprawiæ twój humor? Mo¿e jest jakiœ sposób, byœ poczu³ siê tutaj jak w domu?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_04"); //W moich stronach jest ca³kiem inaczej. Sto³y pe³ne ¿arcia, piwo z domieszk¹ imbiru i dziczyzna wysma¿ona w punkt. A jako zwieñczenie uczty palimy fajki rzeŸbione przez najlepszych stolarzy.
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_05"); //Czy¿byœ nie by³ amatorem bagiennego ziela?
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaStart_55_06"); //Pal¹ tu go wszyscy dooko³a. Moim ostatnim ¿yczeniem przed œmierci¹ w tej okolicy by³oby zapalenie fajki. Pytanie, czy jest tu coœ takiego?
	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaStart_55_07"); //Za czasów Bariery by³o paru specjalistów od ró¿nych wyrobów tytoniowych. Zobaczê, czy uda mi siê skombinowaæ fajkê. Pomoc nadchodzi!
	
	Log_CreateTopic (TOPIC_Rethon_fajka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rethon_fajka, LOG_RUNNING);
	B_LogEntry (TOPIC_Rethon_fajka, "Rethon chcia³by zapaliæ fajkê. Tylko jak coœ takiego za³atwiæ? Za czasów Bariery by³o paru koneserów palenia, ale wszyscy pomarli. Benito jest jedynym handlarzem tytoniu, jakiego znam.");

};



func int Npc_HasTabak(var c_npc slf) {
// zwraca itemID tytoniu, który ma slf

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
	description = "Znalaz³em fajkê i za³atwi³em odpowiedni tytoñ.";
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

	AI_Output (other, self,"DIA_NASZ_109_Rethon_FajkaEnd_15_00"); //Znalaz³em fajkê i za³atwi³em odpowiedni tytoñ.
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaEnd_55_01"); //Niebywa³e! Masz fajkê? Nawet nie wiesz, jak bardzo siê cieszê!
	
	B_GiveInvItems(other,self,ItNa_Fajka,1);
	B_GiveInvItems(other,self,tabakId,1);
	B_UseItem(self,ItNa_Fajka);
	
	AI_Output (self, other,"DIA_NASZ_109_Rethon_FajkaEnd_55_03"); //TODO nagroda
	
	Log_SetTopicStatus (TOPIC_Rethon_fajka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Rethon_fajka, "Rethon cieszy³ siê jak dziecko, gdy zapali³ fajkê. Byæ mo¿e mi tak¿e przyda³aby siê taka zabawka...");

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
		AI_Output (self, other,"DIA_Rethon_Teach_15_01"); //Nie widzisz, ¿e jestem zajêty? PrzyjdŸ jutro.
	}

	else if(Wld_IsTime(00,35,04,00)){
		AI_Output (self, other,"DIA_Rethon_Teach_15_02"); //Daj mi spaæ! Pogadamy rano.
	}

	else if(Wld_IsTime(04,00,08,00)){
		AI_Output (self, other,"DIA_Rethon_Teach_15_03"); //Widzisz, abym sta³ i trenowa³ innych? PrzyjdŸ, kiedy bêdê na placu treningowym.
	}
	else
	{

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (WalkaTarcza == FALSE) { Info_AddChoice		(DIA_Rethon_Teach, "Walka tarcz¹. (10 PN, 300 szt. z³ota)",DIA_Rethon_Teach_Shield); };

	if (other.HitChance[NPC_TALENT_1H] < 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_2H_5); };
	};
	
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_1h_5b); };
	};

	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 25) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_2H_5b); };
	};	
	
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_Rethon_Teach_1h_1c); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_Rethon_Teach_1h_5c); };
	};

	
	};
};

FUNC VOID DIA_Rethon_Teach_Back ()
{
	Info_ClearChoices (DIA_Rethon_Teach);
};

FUNC VOID DIA_Rethon_Teach_Shield()
{
	AI_Output (other, self,"DIA_Rethon_Teach_Shield_15_00"); //Naucz mnie pos³ugiwania siê tarcz¹.
	
	if (npc_hasitems (other, ItMi_Gold) < 300) {
		AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_01"); //Nie masz doœæ z³ota.
		}
	else {

		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_55_02"); //Wielu pocz¹tkuj¹cych wojowników pope³nia zasadniczy b³¹d: Trzymaj¹ tarczê ca³y czas uniesion¹ podczas walki, w dodatku spinaj¹c miêœnie bez przerwy.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_03"); //Ogranicza to szybkoœæ ciosów mieczem oraz szybko mêczy organizm.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_04"); //Podczas walki, trzymaj tarczê opuszczon¹, odbijaj tylko ciosy przeciwnika. Nie zapomnij tylko mocno spi¹æ rêki podczas parowania ciosu, inaczej Ÿle by siê to mog³o skoñczyæ.
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_15_05"); //Muszê jednak zaznaczyæ, ¿e tarcza znacznie spowolni twoje ruchy i nie bêdziesz w stanie machaæ mieczem tak szybko, jak jesteœ w stanie bez tarczy.

			B_GiveInvItems (other, self, ItMi_Gold, 300);			
			WalkaTarcza = TRUE;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: walka tarcz¹", -1, -1, FONT_Screen, 2);
			
			Npc_SetTalentSkill 	(hero, NPC_TALENT_FIREMASTER, 1);
			}

		else {
			AI_Output (self, other,"DIA_Rethon_Teach_Shield_55_06"); //Brak ci doœwiadczenia.
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_1h_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 30) && (other.HitChance[NPC_TALENT_1H] >= 10) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_1h_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_2H_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_2H_5b); };
	};	
};

FUNC VOID DIA_Rethon_Teach_2H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_2H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (1 PN, 5 szt. z³ota)",DIA_Rethon_Teach_2H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (5 PN, 25 szt. z³ota)",DIA_Rethon_Teach_2H_5); };
	};
	if (other.HitChance[NPC_TALENT_2H] < 60) && (other.HitChance[NPC_TALENT_2H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_2H_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_2H_5b); };
	};	
};

FUNC VOID DIA_Rethon_Teach_1H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_1h_5b); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_Rethon_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_Rethon_Teach_1h_5C); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5b ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_1h_5b); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_Rethon_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_Rethon_Teach_1h_5C); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);

	
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		AI_Output(self,other,"DIA_DIA_Rethon_Teach_2H_1b_04_00"); //Nie mogê ciê ju¿ niczego nauczyæ.
		AI_Output(self,other,"DIA_DIA_Rethon_Teach_2H_1b_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj siê do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_2H_1b); };
	if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_2H_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_2H_5b ()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
		
	
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_2H_5b_04_00"); //Nie mogê ciê ju¿ niczego nauczyæ.
		AI_Output(self,other,"DIA_Rethon_Teach_2H_5b_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj siê do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 1. (2 PN, 10 szt. z³ota)",DIA_Rethon_Teach_2H_1b); };
	if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ dwurêczna + 5. (10 PN, 50 szt. z³ota)",DIA_Rethon_Teach_2H_5b); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_1c ()
{
	if (hero.lp >= 3){ B_giveinvitems (other, self, ItMi_Gold, 15); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_1H_1c_04_00"); //Nie mogê ciê ju¿ niczego nauczyæ.
		AI_Output(self,other,"DIA_Rethon_Teach_1H_1c_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj siê do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_Rethon_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_Rethon_Teach_1h_5c); };
	};
};

FUNC VOID DIA_Rethon_Teach_1H_5c ()
{
	if (hero.lp >= 15){ B_giveinvitems (other, self, ItMi_Gold, 75); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"DIA_Rethon_Teach_1H_5c_04_00"); //Nie mogê ciê ju¿ niczego nauczyæ.
		AI_Output(self,other,"DIA_Rethon_Teach_1H_5c_04_01"); //Teraz potrzebujesz mistrza fechtunku. Udaj siê do Kerolotha.
		Info_ClearChoices 	(DIA_Rethon_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_Rethon_Teach);
	Info_AddChoice 		(DIA_Rethon_Teach,	DIALOG_BACK		,DIA_Rethon_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_Rethon_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_Rethon_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_Rethon_Teach_1h_5c); };
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
