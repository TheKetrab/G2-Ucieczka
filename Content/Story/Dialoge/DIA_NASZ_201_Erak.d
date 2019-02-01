//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_EXIT   (C_INFO)
{
	npc         = NASZ_201_Erak;
	nr          = 999;
	condition   = DIA_NASZ_201_Erak_EXIT_Condition;
	information = DIA_NASZ_201_Erak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_201_Erak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_201_Erak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info InformAboutCrime 
//*********************************************************************
var int Erak_Talk_Crime_First_Time;

INSTANCE DIA_NASZ_201_Erak_InformAboutCrime   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 1;
 	condition   = DIA_NASZ_201_Erak_InformAboutCrime_Condition;
 	information = DIA_NASZ_201_Erak_InformAboutCrime_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_InformAboutCrime_Condition()
{
	if (Thief_Counter_Mysliwi > 0)
	&& (KAPITEL >= 4) // jak juz nie ma Gestatha
	&& ((Erak_Talk_Crime_First_Time == FALSE) || (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_InformAboutCrime_Info()
{
	if (Erak_Talk_Crime_First_Time == FALSE) {
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_15_00"); //A niech ciê! Kradzie¿ w moim obozie? Nie tylko z Ratfordem takie problemy...
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_55_01"); //S³uchaj, jeœli mamy tworzyæ zgrany zespó³, to nie mo¿emy sobie nawzajem rzucaæ k³ód pod nogi. Musisz koniecznie wynagrodziæ reszcie swoje zachowanie i okazaæ skruchê.
		Erak_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_15_02"); //Przyszed³eœ zap³aciæ?
	};
	
	var string want_to_pay; want_to_pay = "Chcê zap³aciæ za kradzie¿. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Mysliwi*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z³ota)");

	Info_ClearChoices (DIA_NASZ_201_Erak_InformAboutCrime);
		Info_AddChoice	  (DIA_NASZ_201_Erak_InformAboutCrime, "KONIEC", DIA_NASZ_201_Erak_InformAboutCrime_end);
		Info_AddChoice	  (DIA_NASZ_201_Erak_InformAboutCrime, want_to_pay, DIA_NASZ_201_Erak_InformAboutCrime_pay);

};

FUNC VOID DIA_NASZ_201_Erak_InformAboutCrime_end()
{
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_201_Erak_InformAboutCrime_pay()
{
	var int want_to_pay_money;
	want_to_pay_money = Thief_Counter_Mysliwi*30;

	AI_Output (other,self ,"DIA_NASZ_201_Erak_InformAboutCrime_pay_15_00"); //Chcê zap³aciæ za kradzie¿.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_pay_55_01"); //Dobrze. Ale pamiêtaj, by nie robiæ ju¿ takich rzeczy nigdy wiêcej!
		
		Thief_Counter_Mysliwi = 0;
		Erak_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_201_Erak_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_pay_55_02"); //Jesteœ takim gburem, ¿e nawet nie masz z³ota, by zrewan¿owaæ siê za kradzie¿! Kiepski z ciebie z³odziej...
		AI_StopProcessInfos(self);
	};
};	

//*********************************************************************
//	Info PreHello 
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_PreHello   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 1;
 	condition   = DIA_NASZ_201_Erak_PreHello_Condition;
 	information = DIA_NASZ_201_Erak_PreHello_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_PreHello_Condition()
{
	if (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_PreHello_Info()
{
	AI_Output (self, other,"DIA_NASZ_201_Erak_PreHello_15_00"); //Kogo my tu mamy?
	AI_Output (other, self,"DIA_NASZ_201_Erak_PreHello_55_01"); //Nazywam siê Will.
	AI_Output (self, other,"DIA_NASZ_201_Erak_PreHello_55_02"); //Witaj wiêc, Willu. Wygl¹dasz doœæ marnie, zgubi³eœ siê?
};


//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_siema   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 2;
 	condition   = DIA_NASZ_201_Erak_siema_Condition;
 	information = DIA_NASZ_201_Erak_siema_Info;
 	permanent   = FALSE;
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_201_Erak_siema_Condition()
{
	if (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_201_Erak_siema_55_01"); //Nazywam siê Erak.
	AI_Output (self, other,"DIA_NASZ_201_Erak_siema_55_02"); //Jestem dowódc¹ tej oto grupy. Podlegam jednak w³adzy naszego wodza, Gestatha.		
};

//*********************************************************************
//	Info What 
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_what   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 3;
 	condition   = DIA_NASZ_201_Erak_what_Condition;
 	information = DIA_NASZ_201_Erak_what_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_201_Erak_what_Condition()
{
	if (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_what_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_01"); //Zosta³em wys³any wraz z moimi ludŸmi na polowanie. Krótko mówi¹c, mamy dostarczyæ do obozu miêso.
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_02"); //I niby wszystko w porz¹dku...
	AI_Output (other,self ,"DIA_NASZ_201_Erak_what_15_03"); //Ale?
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_04"); //Miêso ju¿ mamy. Pojawia siê jednak kwestia dostarczeniem go do obozu.
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_05"); //W okolicy panoszy siê jeszcze sporo bestii, z których mo¿emy pozyskaæ wiele skór.	
};

var int ERAK_GOOD_LEVEL;
//*********************************************************************
//	         Mieso
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_mieso   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 9;
 	condition   = DIA_NASZ_201_Erak_mieso_Condition;
 	information = DIA_NASZ_201_Erak_mieso_Info;
 	permanent   = TRUE;
 	description = "Mogê zanieœæ miêso do obozu.";
};

FUNC INT DIA_NASZ_201_Erak_mieso_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_what) && (KAPITEL < 3)
	&& (ERAK_GOOD_LEVEL == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_mieso_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mieso_15_00"); //Mogê zanieœæ miêso do obozu.
	
	if (hero.level >= 5) {

		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_01"); //No dobra, ale jak¹ mam gwarancjê, ¿e akurat nie zjesz tego miêsa?
		AI_Output (other,self ,"DIA_NASZ_201_Erak_mieso_15_02"); //Eee... ee...
		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_03"); //Tak myœla³em. Jesli chcesz jednak pomóc, musisz znaleŸæ kogoœ, kto niós³by miêso. Wówczas ochrania³byœ go i moglibyœcie iœæ razem.

		ERAK_GOOD_LEVEL = TRUE;
		Log_CreateTopic (TOPIC_Erak_mieso, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Erak_mieso, LOG_RUNNING);
		B_LogEntry (TOPIC_Erak_mieso, "Erak nie mo¿e samemu zanieœæ miêsa do obozu myœliwych, jednak z braku zaufanie nie powierzy tego te¿ mnie. Mam znaleŸæ chêtnego na ma³¹ wyprawê...");

	}
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_04"); //Taki s³abiak jak ty? Zapomnij.
		PrintScreen	("Wymagany poziom: 5", -1, 45, FONT_ScreenSmall, 2);
	};
};

//*********************************************************************
//	         Vick
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_vick   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 10;
 	condition   = DIA_NASZ_201_Erak_vick_Condition;
 	information = DIA_NASZ_201_Erak_vick_Info;
 	permanent   = FALSE;
 	description = "Vick zgodzi³ siê nieœæ miêso.";
};

FUNC INT DIA_NASZ_201_Erak_vick_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_204_Vick_mieso)) && (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_vick_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_vick_15_00"); //Vick zgodzi³ siê nieœæ miêso.
	AI_Output (self, other,"DIA_NASZ_201_Erak_vick_55_01"); //Wspaniale, zatem wiem ju¿ kogo wys³aæ. Teraz pytanie, czy jesteœ doœæ odwa¿ny, nie stchórzysz i nie uciekniesz, gdy tylko pojawi¹ siê g³odne wilki albo, co gorsza, orkowie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_vick_55_02"); //Zanim pójdziesz razem z Vickiem, udasz siê ze mn¹ na zwiad. Pod nami stacjonuje grupka orków. Poobserwujemy ich razem.
	
	B_LogEntry (TOPIC_Erak_mieso, "Zanim udam siê razem z Vickiem, muszê wybraæ siê z Erakiem na zwiad.");

	MIS_Erak_zwiad = TRUE;
	Log_CreateTopic (TOPIC_Erak_zwiad, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_zwiad, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_zwiad, "Erak zaproponowa³ mi misjê zwiadowcz¹. Kto wie, mo¿e powalczê z orkami? Chocia¿ mo¿e lepiej nie...");

};




//*********************************************************************
//	         Go Orc
//*********************************************************************
var int WillCanSneak;
//*********************************
INSTANCE DIA_NASZ_201_Erak_goorc   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 6;
 	condition   = DIA_NASZ_201_Erak_goorc_Condition;
 	information = DIA_NASZ_201_Erak_goorc_Info;
 	permanent   = FALSE;
 	description = "Ruszajmy wiêc na zwiad.";
};

FUNC INT DIA_NASZ_201_Erak_goorc_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_vick) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_goorc_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_goorc_15_00"); //Ruszajmy wiêc na zwiad.
	AI_Output (self, other,"DIA_NASZ_201_Erak_goorc_55_01"); //Dobra. Trzymaj siê blisko mnie. Nie bêdzie ³atwo. Musimy st¹paæ cicho, jeœli nie chcemy, by orkowie nas wypatrzyli.

	Npc_ExchangeRoutine (NASZ_201_Erak, "Guide");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_201_Erak);
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	         Go Sneak
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_sneak   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 7;
 	condition   = DIA_NASZ_201_Erak_sneak_Condition;
 	information = DIA_NASZ_201_Erak_sneak_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_sneak_Condition()	
{
	if (Npc_GetDistToWP	(self, "OW_WATERFALL_GOBBO10") < 750) && (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_sneak_Info()
{
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_00"); //I jak?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_sneak_15_01"); //Radzê sobie, jeœli nie widzisz.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_02"); //Nie mia³eœ jeszcze okazji siê wykazaæ. ChodŸ, podkradniemy siê jak najbli¿ej i zaatakujemy.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_sneak_15_03"); //Zaatakujemy? Nie mówi³eœ nic o walce, mieliœmy tylko obserwowaæ.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_04"); //Patrz na tê garstkê orków. Nie wiem jak na tobie, ale na mnie nie wywieraj¹ ¿adnego wra¿enia. Sam dam im radê, a ty chocia¿ spróbuj skradaæ siê razem ze mn¹.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_05"); //Nie wychodŸ na przód. Lepiej bêdzie, jak bêdziesz kilka metrów za mn¹, a ja podkradnê siê jak najbli¿ej.

	self.flags = 2;

	Npc_ExchangeRoutine (NASZ_201_Erak, "GuideSneak");
	AI_StopProcessInfos(self);
};


//*********************************************************************
//	         Go How
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_how   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 8;
 	condition   = DIA_NASZ_201_Erak_how_Condition;
 	information = DIA_NASZ_201_Erak_how_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_how_Condition()	
{
	if (KAPITEL < 3)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_29_04")
		&& npc_isdead (Orc_Erak_A)
		&& npc_isdead (Orc_Erak_B)
		&& npc_isdead (Orc_Erak_C)
		&& npc_isdead (Orc_Erak_D)
		&& npc_isdead (Orc_Erak_E)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_how_Info()
{
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_00"); //Ciê¿ko by³o?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_how_15_01"); //Myœla³em, ¿e bêdzie gorzej.
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_02"); //Zapewne by by³o, gdybyœmy weszli do œrodka jaskini. Ja jednak siê tam nie wybieram. Chyba tylko Beliar wie, co orkowie tam chowaj¹.
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_03"); //Jeœli chodzi o eskortê Vicka, to mo¿ecie iœæ we dwóch. Tylko uwa¿ajcie, zapach miêsa z pewnoœci¹ przyci¹gnie dzikie zwierzêta.
	
	MIS_Erak_zwiad = FALSE;
	
	B_LogEntry (TOPIC_Erak_zwiad, "Erak zdecydowa³ siê nie komentowaæ tego, ¿e nie pomog³em zbytnio w walce z orkami. Niemniej pochwali³ mnie za sam udzia³ i zezwoli³ na odprowadzenie Vicka do obozu myœliwych.");
	Log_SetTopicStatus (TOPIC_Erak_zwiad, LOG_SUCCESS);
	
	B_LogEntry (TOPIC_Erak_mieso, "Zrobi³em, co mia³em zrobiæ. Teraz mogê udaæ siê do obozu myœliwych razem z Vickiem.");

	B_GivePlayerXP (300);
	DodajReputacje (1, REP_MYSLIWI);
	
	self.flags = 1;
	
	Npc_ExchangeRoutine (NASZ_201_Erak, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_201_Erak);
	AI_StopProcessInfos(self);
};


//*********************************************************************
//	         Welcome
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_Welcome   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 30;
 	condition   = DIA_NASZ_201_Erak_Welcome_Condition;
 	information = DIA_NASZ_201_Erak_Welcome_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_Welcome_Condition()	
{
	if (Npc_IsInState(self, ZS_TALK) && (KAPITEL==3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_Welcome_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_Welcome_15_00"); //Witam nowego szefa.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Welcome_55_01"); //Dobrze ciê widzieæ ca³ego, Willu.

};

//*********************************************************************
//	         Mission
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_mission   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 31;
 	condition   = DIA_NASZ_201_Erak_mission_Condition;
 	information = DIA_NASZ_201_Erak_mission_Info;
 	permanent   = FALSE;
 	description = "Po co tu jesteœ?";
};

FUNC INT DIA_NASZ_201_Erak_mission_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_Welcome))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_mission_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_00"); //Po co tu jesteœ?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_01"); //Powiedzmy, ¿e musimy posprz¹taæ po bandytach.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_02"); //To znaczy powynosiæ ich skarby?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_03"); //Lepiej bym tego nie uj¹³. Trochê nam to jednak zajmie, wiêc musimy siê tu zadomowiæ.
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_04"); //Szczêœliwie drewna na opa³ jest tu pod dostatkiem. Problemem jest brak jedzenia. Nie wiem, co ci bandyci jedli?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_05"); //Mo¿e w waszym obozie wypadowym mieliœcie tak du¿o miêsa, ¿e dwa kawa³ki na dzieñ nie wystarcz¹?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_06"); //Dwa? Taki kawa³ ch³opa jak ja, je minimum piêæ! 
};

//*********************************************************************
//	        Meat
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_meat   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 32;
 	condition   = DIA_NASZ_201_Erak_meat_Condition;
 	information = DIA_NASZ_201_Erak_meat_Info;
 	permanent   = FALSE;
 	description = "Przynieœæ wam coœ?";
};

FUNC INT DIA_NASZ_201_Erak_meat_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_mission))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_meat_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meat_15_00"); //Przynieœæ wam coœ?
	AI_Output (self, other,"DIA_NASZ_201_Erak_meat_55_01"); //Ano. Przynieœ 50 kawa³ków miêsa. Na pusty ¿o³¹dek nie ma nic lepszego ni¿ kawa³ek dziczyzny.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meat_15_02"); //Surowego czy pieczonego?
	AI_Output (self, other,"DIA_NASZ_201_Erak_meat_55_03"); //Obojêtne. Mam du¿o czasu, wiêc w ostatecznoœci upiekê. Dobrzy by by³o, gdyby by³o œwie¿e, a nie kilkudniowe.

	Log_CreateTopic (TOPIC_Erak_Meat, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_Meat, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_Meat, "Erak potrzebuje 50 sztuk surowego lub pieczonego miêsa, ¿eby nie umrzeæ z g³odu podczas zagrabiania skarbów bandytów.");

};

var int ERAK_MIESO_SUROWE;
//*********************************************************************
//	        MeatDone
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_meatdone   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 33;
 	condition   = DIA_NASZ_201_Erak_meatdone_Condition;
 	information = DIA_NASZ_201_Erak_meatdone_Info;
 	permanent   = FALSE;
 	description = "Oto i miêso.";
};

FUNC INT DIA_NASZ_201_Erak_meatdone_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_meat)
		&& (npc_hasitems (other, ItFoMuttonRaw) >=50 || npc_hasitems (other, ItFoMutton) >=50))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_meatdone_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meatdone_15_00"); //Oto i miêso.

	if (npc_hasitems (other, ItFoMuttonRaw) >=50) {
		B_GiveInvItems (other, self, ItFoMuttonRaw, 50);
		ERAK_MIESO_SUROWE = TRUE;
		B_GivePlayerXP (500);
	}
	else {
		B_GiveInvItems (other, self, ItFoMutton, 50);
		B_GivePlayerXP (700);
	};

	AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_55_01"); //Tyle miêsa starczy nam na ca³y pobyt tutaj.
	AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_15_02"); //Œwietnie siê spisa³eœ. Piwo mamy, miêso te¿ jest. Tak sobie myœlê, ¿e nie bêdzie tu tak Ÿle.

	B_LogEntry (TOPIC_Erak_Meat, "Miêso oddane.");
	Log_SetTopicStatus (TOPIC_Erak_Meat, LOG_SUCCESS);
	
	DodajReputacje (2, REP_MYSLIWI);

	if (ERAK_MIESO_SUROWE == TRUE)	{
		AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_55_03"); //A teraz idê je upiec. Nie chcê na coœ zachorowaæ przez jedzenie surowego miêsa.
		// TODO: Erak idzie upiec miêso
	};
};

var int ERAK_QUEST;
//*********************************************************************
//	        WorkBDT
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_WorkBDT   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 34;
 	condition   = DIA_NASZ_201_Erak_WorkBDT_Condition;
 	information = DIA_NASZ_201_Erak_WorkBDT_Info;
 	permanent   = FALSE;
 	description = "Jest tu coœ do roboty?";
};

FUNC INT DIA_NASZ_201_Erak_WorkBDT_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_mission))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_WorkBDT_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_00"); //Jest tu coœ do roboty?
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_01"); //Naturalnie!
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_02"); //Zamieniam siê w s³uch.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_03"); //Jak siê zapewne domyœlasz, nie wszyscy bandyci byli w obozie w chwili naszego ataku.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_04"); //Musimy pozbyæ siê tych, którzy uciekli.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_05"); //Jestem przekonany, ¿e wszyscy zebrali siê w jeden punkt, w jakieœ miejsce ewakuacyjne wczeœniej ustalone.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_06"); //Jako, ¿e tyle siê wœród nich ostatnio obraca³eœ to mo¿e wiesz coœ o takiej lokacji?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_07"); //Niestety nic.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_08"); //Có¿. Tak czy inaczej oferowa³eœ swoj¹ pomoc, wiêc to zadanie nale¿y do ciebie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_09"); //ZnajdŸ i zabij bandytów.

	Log_CreateTopic (TOPIC_Erak_BDT, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_BDT, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_BDT, "Muszê pozbyæ siê reszty bandytów z Górniczej Doliny. Erak uwa¿a, ¿e s¹ w jakimœ miejscu ewakuacyjnym... Cholera, ale gdzie?");

};

//*********************************************************************
//	        BDTDone
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_BDTdone   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 35;
 	condition   = DIA_NASZ_201_Erak_BDTdone_Condition;
 	information = DIA_NASZ_201_Erak_BDTdone_Info;
 	permanent   = FALSE;
 	description = "Pozby³em siê bandytów.";
};

FUNC INT DIA_NASZ_201_Erak_BDTdone_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_WorkBDT))
	&& (BanditKilled(FALSE) >= 7)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_BDTdone_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_BDTdone_15_00"); //Pozby³em siê bandytów.
	AI_Output (self, other,"DIA_NASZ_201_Erak_BDTdone_55_01"); //Skubany! Naprawdê, dobry jesteœ! Powiedz, gdzie byli?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_BDTdone_15_02"); //Nad tym jeziorem poni¿ej. Chyba nie byli zaskoczeni, ¿e tam przyszed³em.
	AI_Output (self, other,"DIA_NASZ_201_Erak_BDTdone_15_03"); //Dobrze, ¿e wyszed³eœ z tego prawie bez ¿adnej rany. WeŸ te eliksiry w nagrodê, powinny z³agodziæ nieco ból.

	Createinvitems (self, ItPo_Health_03, 1);
	B_GiveInvItems (other, self, ItPo_Health_03, 1);
	Createinvitems (self, ItPo_Health_02, 2);
	B_GiveInvItems (other, self, ItPo_Health_02, 2);
	Createinvitems (self, ItPo_Health_01, 2);
	B_GiveInvItems (other, self, ItPo_Health_01, 2);
	
	ERAK_QUEST = TRUE;
	B_LogEntry (TOPIC_Erak_BDT, "Zabi³em bandytów, a Erak by³ tym wrêcz zachwycony.");
	Log_SetTopicStatus (TOPIC_Erak_BDT, LOG_SUCCESS);
	B_GivePlayerXP (700);
	DodajReputacje (4, REP_MYSLIWI);
};

//*********************************************************************
//	         ComeOn
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_comeon   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 36;
 	condition   = DIA_NASZ_201_Erak_comeon_Condition;
 	information = DIA_NASZ_201_Erak_comeon_Info;
 	permanent   = TRUE;
 	description = "ChodŸ ze mn¹.";
};

FUNC INT DIA_NASZ_201_Erak_comeon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_comeon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_comeon_15_00"); //ChodŸ ze mn¹.
	AI_Output (self, other,"DIA_NASZ_201_Erak_comeon_55_01"); //Gdzie teraz?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_comeon_15_02"); //Musimy zg³adziæ jaszczuroludzi.
	AI_Output (self, other,"DIA_NASZ_201_Erak_comeon_55_02"); //To mi siê podoba!

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Follow");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_201_Erak);
};

//*********************************************************************
//	         Back
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_back   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 37;
 	condition   = DIA_NASZ_201_Erak_back_Condition;
 	information = DIA_NASZ_201_Erak_back_Info;
 	permanent   = TRUE;
 	description = "Wracaj.";
};

FUNC INT DIA_NASZ_201_Erak_back_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_back_Info()
{
	AI_Output (other,self ,"DIA_NASZ_201_Erak_back_15_00"); //Wracaj.
	AI_Output (self, other,"DIA_NASZ_201_Erak_back_55_01"); //Wiesz, gdzie mnie szukaæ.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_201_Erak);
};

//*********************************************************************
//	         ImportantBack
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_ImportantBack   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 38;
 	condition   = DIA_NASZ_201_Erak_ImportantBack_Condition;
 	information = DIA_NASZ_201_Erak_ImportantBack_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_ImportantBack_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_ImportantBack_Info()
{
	AI_Output (self, other,"DIA_NASZ_201_Erak_ImportantBack_15_00"); //Koniec z jaszczuroludŸmi! Nie jestem ci ju¿ potrzebny.
	AI_Output (self, other,"DIA_NASZ_201_Erak_ImportantBack_55_01"); //Bywaj.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_201_Erak);
};

var int ERAK_GO;
//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_TrollCanyon   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 39;
 	condition   = DIA_NASZ_201_Erak_TrollCanyon_Condition;
 	information = DIA_NASZ_201_Erak_TrollCanyon_Info;
 	permanent   = TRUE;
 	description = "Musisz udaæ siê do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_201_Erak_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (!ERAK_GO))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_201_Erak_TrollCanyon_15_00"); //Musisz udaæ siê do Kanionu Trolli.
		if (ERAK_QUEST == TRUE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_01"); //Idê, idê.
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_02"); //Wezmê te¿ tych biednych ch³opców, których przetrzymywali bandyci. Bo niby co by tu sami robili?
			Migration_ErakToTwierdza();

			B_GivePlayerXP (100);
			ERAK_GO = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Erak uda³ siê do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		};
		if (ERAK_QUEST == TRUE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_03"); //Benito ma coœ do zrobienia. Glêdzi coœ o jakichœ jaszczuroludziach.
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_04"); //Co jak bêdê musia³ mu pomóc? Nie idê.
		};
		if (ERAK_QUEST == FALSE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_05"); //Ja nic nie muszê!
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_06"); //Mam tu swoje sprawy do za³atwienia.
		};
};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_AmmannQuest   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 40;
 	condition   = DIA_NASZ_201_Erak_AmmannQuest_Condition;
 	information = DIA_NASZ_201_Erak_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_201_Erak_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_201_Erak_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_201_Erak_AmmannQuest_15_01"); //Mam go ubraæ?
	AI_Output (other, self,"DIA_NASZ_201_Erak_AmmannQuest_15_02"); //Powinieneœ.
	AI_Output (self, other,"DIA_NASZ_201_Erak_AmmannQuest_15_03"); //Dobra, palec mi od tego nie odpadnie.

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
//	Info KAPITEL4
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_Kapitel4   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 50;
 	condition   = DIA_NASZ_201_Erak_Kapitel4_Condition;
 	information = DIA_NASZ_201_Erak_Kapitel4_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_201_Erak_Kapitel4_Condition()	
{
	if (Npc_IsInState(self, ZS_TALK) && (KAPITEL == 4))
	&& (npc_knowsinfo(other,DIA_NASZ_214_Goth_Undeads))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_Kapitel4_Info()
{
	AI_Output (other, self,"DIA_NASZ_201_Erak_Kapitel4_15_00"); //Widzia³em nieumar³ych, którzy zaatakowali wasz obóz...
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_01"); //Najpierw bandyci, potem orkowie, a teraz te nieumar³e sukinsyny, które ka¿dego dnia kilkukrotnie atakuj¹ nasz w³asny obóz. Chyba nie mo¿e byæ ju¿ gorzej.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_02"); //Dobrze, ¿e do nas zajrza³eœ. W przeciwnym wypadku mielibyœmy jeszcze wiêcej rannych ni¿ ta grupka, która teraz u nas przebywa. Gdybym wiedzia³ co bêdzie siê dzia³o, nigdy bym ich tutaj nie zabra³.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_03"); //To ju¿ nie jest bezpieczne miejsce, zw³aszcza od chili kiedy nêkaj¹ nas te truposze. Nie to jest jednak najgorsze. Ratford ostatniej nocy widzia³ w okolicy dwa cholerne demony!
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_04"); //Demony! Tak jakby orków nam by³o za ma³o, od tamtej pory przed brama stoi kilku ludzi, jak sam mog³eœ ju¿ zauwa¿yæ.
	AI_Output (other, self,"DIA_NASZ_201_Erak_Kapitel4_15_05"); //Czy mogê wam w czymœ pomóc? Widzê, ¿e naprawdê macie tutaj du¿o roboty.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_06"); //Nie, lepiej bêdzie jak natychmiast wrócisz do Kerolotha i przeka¿esz mu raport ode mnie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_07"); //Je¿eli naprawdê bêdziemy potrzebowali pomocy, to wyœlê do was Ratforda. On jako jedyny da radê przekraœæ siê wszêdzie, gdzie tylko siê da.
	
	CreateInvItems(self,ItNa_RaportEraka,1);
	B_GiveInvItems(self,other,ItNa_RaportEraka,1);
	
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_08"); //Nawet nie wiesz, jak bardzo chcia³bym, ¿eby ci nieumarli wojownicy przestali nas nêkaæ.
	
	B_LogEntry (TOPIC_Sprawy,"Po rozmowie z Erakiem dosta³em raport, który muszê przekazaæ Kerolothowi. Sytuacja w obozie okaza³a siê byæ bardziej napiêt¹ ni¿ wczeœniej podejrzewa³em. Warto wspomnieæ tak¿e o szkieletach, które zaatakowa³y obóz.");
	
};


//*********************************************************************
//	         CanIHelpKap4
//*********************************************************************
INSTANCE DIA_NASZ_201_Erak_CanIHelpKap4   (C_INFO)
{
	npc         = NASZ_201_Erak;
 	nr          = 52;
 	condition   = DIA_NASZ_201_Erak_CanIHelpKap4_Condition;
 	information = DIA_NASZ_201_Erak_CanIHelpKap4_Info;
 	permanent   = FALSE;
 	description = "Mo¿emy coœ zrobiæ z t¹ plag¹ ciemnoœci?";
};

FUNC INT DIA_NASZ_201_Erak_CanIHelpKap4_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_Kapitel4))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_201_Erak_CanIHelpKap4_Info()
{
	AI_Output (other, self,"DIA_NASZ_201_Erak_CanIHelpKap4_15_00"); //Mo¿emy coœ zrobiæ z t¹ plag¹ ciemnoœci?
	AI_Output (self, other,"DIA_NASZ_201_Erak_CanIHelpKap4_55_01"); //By³oby wspaniale... Ale nie znam siê na tym.
	AI_Output (self, other,"DIA_NASZ_201_Erak_CanIHelpKap4_55_02"); //Póki co zanieœ raport Kerolothowi.

	// TODO: jesli misja ukonczona to nie mozna porozmawiac na ten temat
	Log_CreateTopic (TOPIC_Erak_plagaciemnosci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_plagaciemnosci, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "W Górniczej Dolinie jakiœ czas temu pojawi³a siê plaga ciemnoœci. Bardzo zawiedzeni s¹ tym myœliwi, którzy nie maj¹ ludzi do obrony przed demonami. Tylko mag mo¿e mi pomóc rozwik³aæ ten problem.");

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_201_Erak_PICKPOCKET (C_INFO)
{
	npc			= NASZ_201_Erak;
	nr			= 900;
	condition	= DIA_NASZ_201_Erak_PICKPOCKET_Condition;
	information	= DIA_NASZ_201_Erak_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_201_Erak_PICKPOCKET_Condition()
{
	C_Beklauen (82);
};
 
FUNC VOID DIA_NASZ_201_Erak_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_201_Erak_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_201_Erak_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_201_Erak_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_201_Erak_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_201_Erak_PICKPOCKET_DoIt);
};

func void DIA_NASZ_201_Erak_PICKPOCKET_DoIt()
{
	B_BeklauenGold(144);
	
	Info_ClearChoices (DIA_NASZ_201_Erak_PICKPOCKET);
};
	
func void DIA_NASZ_201_Erak_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_201_Erak_PICKPOCKET);
};