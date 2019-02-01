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
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_15_00"); //A niech ci�! Kradzie� w moim obozie? Nie tylko z Ratfordem takie problemy...
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_55_01"); //S�uchaj, je�li mamy tworzy� zgrany zesp�, to nie mo�emy sobie nawzajem rzuca� k��d pod nogi. Musisz koniecznie wynagrodzi� reszcie swoje zachowanie i okaza� skruch�.
		Erak_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_15_02"); //Przyszed�e� zap�aci�?
	};
	
	var string want_to_pay; want_to_pay = "Chc� zap�aci� za kradzie�. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Mysliwi*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z�ota)");

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

	AI_Output (other,self ,"DIA_NASZ_201_Erak_InformAboutCrime_pay_15_00"); //Chc� zap�aci� za kradzie�.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_pay_55_01"); //Dobrze. Ale pami�taj, by nie robi� ju� takich rzeczy nigdy wi�cej!
		
		Thief_Counter_Mysliwi = 0;
		Erak_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_201_Erak_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_InformAboutCrime_pay_55_02"); //Jeste� takim gburem, �e nawet nie masz z�ota, by zrewan�owa� si� za kradzie�! Kiepski z ciebie z�odziej...
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
	AI_Output (other, self,"DIA_NASZ_201_Erak_PreHello_55_01"); //Nazywam si� Will.
	AI_Output (self, other,"DIA_NASZ_201_Erak_PreHello_55_02"); //Witaj wi�c, Willu. Wygl�dasz do�� marnie, zgubi�e� si�?
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
 	description = "Kim jeste�?";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_201_Erak_siema_55_01"); //Nazywam si� Erak.
	AI_Output (self, other,"DIA_NASZ_201_Erak_siema_55_02"); //Jestem dow�dc� tej oto grupy. Podlegam jednak w�adzy naszego wodza, Gestatha.		
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
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_01"); //Zosta�em wys�any wraz z moimi lud�mi na polowanie. Kr�tko m�wi�c, mamy dostarczy� do obozu mi�so.
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_02"); //I niby wszystko w porz�dku...
	AI_Output (other,self ,"DIA_NASZ_201_Erak_what_15_03"); //Ale?
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_04"); //Mi�so ju� mamy. Pojawia si� jednak kwestia dostarczeniem go do obozu.
	AI_Output (self, other,"DIA_NASZ_201_Erak_what_55_05"); //W okolicy panoszy si� jeszcze sporo bestii, z kt�rych mo�emy pozyska� wiele sk�r.	
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
 	description = "Mog� zanie�� mi�so do obozu.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mieso_15_00"); //Mog� zanie�� mi�so do obozu.
	
	if (hero.level >= 5) {

		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_01"); //No dobra, ale jak� mam gwarancj�, �e akurat nie zjesz tego mi�sa?
		AI_Output (other,self ,"DIA_NASZ_201_Erak_mieso_15_02"); //Eee... ee...
		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_03"); //Tak my�la�em. Jesli chcesz jednak pom�c, musisz znale�� kogo�, kto ni�s�by mi�so. W�wczas ochrania�by� go i mogliby�cie i�� razem.

		ERAK_GOOD_LEVEL = TRUE;
		Log_CreateTopic (TOPIC_Erak_mieso, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Erak_mieso, LOG_RUNNING);
		B_LogEntry (TOPIC_Erak_mieso, "Erak nie mo�e samemu zanie�� mi�sa do obozu my�liwych, jednak z braku zaufanie nie powierzy tego te� mnie. Mam znale�� ch�tnego na ma�� wypraw�...");

	}
	else {
		AI_Output (self, other,"DIA_NASZ_201_Erak_mieso_55_04"); //Taki s�abiak jak ty? Zapomnij.
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
 	description = "Vick zgodzi� si� nie�� mi�so.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_vick_15_00"); //Vick zgodzi� si� nie�� mi�so.
	AI_Output (self, other,"DIA_NASZ_201_Erak_vick_55_01"); //Wspaniale, zatem wiem ju� kogo wys�a�. Teraz pytanie, czy jeste� do�� odwa�ny, nie stch�rzysz i nie uciekniesz, gdy tylko pojawi� si� g�odne wilki albo, co gorsza, orkowie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_vick_55_02"); //Zanim p�jdziesz razem z Vickiem, udasz si� ze mn� na zwiad. Pod nami stacjonuje grupka ork�w. Poobserwujemy ich razem.
	
	B_LogEntry (TOPIC_Erak_mieso, "Zanim udam si� razem z Vickiem, musz� wybra� si� z Erakiem na zwiad.");

	MIS_Erak_zwiad = TRUE;
	Log_CreateTopic (TOPIC_Erak_zwiad, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_zwiad, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_zwiad, "Erak zaproponowa� mi misj� zwiadowcz�. Kto wie, mo�e powalcz� z orkami? Chocia� mo�e lepiej nie...");

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
 	description = "Ruszajmy wi�c na zwiad.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_goorc_15_00"); //Ruszajmy wi�c na zwiad.
	AI_Output (self, other,"DIA_NASZ_201_Erak_goorc_55_01"); //Dobra. Trzymaj si� blisko mnie. Nie b�dzie �atwo. Musimy st�pa� cicho, je�li nie chcemy, by orkowie nas wypatrzyli.

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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_sneak_15_01"); //Radz� sobie, je�li nie widzisz.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_02"); //Nie mia�e� jeszcze okazji si� wykaza�. Chod�, podkradniemy si� jak najbli�ej i zaatakujemy.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_sneak_15_03"); //Zaatakujemy? Nie m�wi�e� nic o walce, mieli�my tylko obserwowa�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_04"); //Patrz na t� garstk� ork�w. Nie wiem jak na tobie, ale na mnie nie wywieraj� �adnego wra�enia. Sam dam im rad�, a ty chocia� spr�buj skrada� si� razem ze mn�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_sneak_55_05"); //Nie wychod� na prz�d. Lepiej b�dzie, jak b�dziesz kilka metr�w za mn�, a ja podkradn� si� jak najbli�ej.

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
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_00"); //Ci�ko by�o?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_how_15_01"); //My�la�em, �e b�dzie gorzej.
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_02"); //Zapewne by by�o, gdyby�my weszli do �rodka jaskini. Ja jednak si� tam nie wybieram. Chyba tylko Beliar wie, co orkowie tam chowaj�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_how_55_03"); //Je�li chodzi o eskort� Vicka, to mo�ecie i�� we dw�ch. Tylko uwa�ajcie, zapach mi�sa z pewno�ci� przyci�gnie dzikie zwierz�ta.
	
	MIS_Erak_zwiad = FALSE;
	
	B_LogEntry (TOPIC_Erak_zwiad, "Erak zdecydowa� si� nie komentowa� tego, �e nie pomog�em zbytnio w walce z orkami. Niemniej pochwali� mnie za sam udzia� i zezwoli� na odprowadzenie Vicka do obozu my�liwych.");
	Log_SetTopicStatus (TOPIC_Erak_zwiad, LOG_SUCCESS);
	
	B_LogEntry (TOPIC_Erak_mieso, "Zrobi�em, co mia�em zrobi�. Teraz mog� uda� si� do obozu my�liwych razem z Vickiem.");

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
	AI_Output (self, other,"DIA_NASZ_201_Erak_Welcome_55_01"); //Dobrze ci� widzie� ca�ego, Willu.

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
 	description = "Po co tu jeste�?";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_00"); //Po co tu jeste�?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_01"); //Powiedzmy, �e musimy posprz�ta� po bandytach.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_02"); //To znaczy powynosi� ich skarby?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_03"); //Lepiej bym tego nie uj��. Troch� nam to jednak zajmie, wi�c musimy si� tu zadomowi�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_04"); //Szcz�liwie drewna na opa� jest tu pod dostatkiem. Problemem jest brak jedzenia. Nie wiem, co ci bandyci jedli?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_mission_15_05"); //Mo�e w waszym obozie wypadowym mieli�cie tak du�o mi�sa, �e dwa kawa�ki na dzie� nie wystarcz�?
	AI_Output (self, other,"DIA_NASZ_201_Erak_mission_55_06"); //Dwa? Taki kawa� ch�opa jak ja, je minimum pi��! 
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
 	description = "Przynie�� wam co�?";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meat_15_00"); //Przynie�� wam co�?
	AI_Output (self, other,"DIA_NASZ_201_Erak_meat_55_01"); //Ano. Przynie� 50 kawa�k�w mi�sa. Na pusty �o��dek nie ma nic lepszego ni� kawa�ek dziczyzny.
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meat_15_02"); //Surowego czy pieczonego?
	AI_Output (self, other,"DIA_NASZ_201_Erak_meat_55_03"); //Oboj�tne. Mam du�o czasu, wi�c w ostateczno�ci upiek�. Dobrzy by by�o, gdyby by�o �wie�e, a nie kilkudniowe.

	Log_CreateTopic (TOPIC_Erak_Meat, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_Meat, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_Meat, "Erak potrzebuje 50 sztuk surowego lub pieczonego mi�sa, �eby nie umrze� z g�odu podczas zagrabiania skarb�w bandyt�w.");

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
 	description = "Oto i mi�so.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_meatdone_15_00"); //Oto i mi�so.

	if (npc_hasitems (other, ItFoMuttonRaw) >=50) {
		B_GiveInvItems (other, self, ItFoMuttonRaw, 50);
		ERAK_MIESO_SUROWE = TRUE;
		B_GivePlayerXP (500);
	}
	else {
		B_GiveInvItems (other, self, ItFoMutton, 50);
		B_GivePlayerXP (700);
	};

	AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_55_01"); //Tyle mi�sa starczy nam na ca�y pobyt tutaj.
	AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_15_02"); //�wietnie si� spisa�e�. Piwo mamy, mi�so te� jest. Tak sobie my�l�, �e nie b�dzie tu tak �le.

	B_LogEntry (TOPIC_Erak_Meat, "Mi�so oddane.");
	Log_SetTopicStatus (TOPIC_Erak_Meat, LOG_SUCCESS);
	
	DodajReputacje (2, REP_MYSLIWI);

	if (ERAK_MIESO_SUROWE == TRUE)	{
		AI_Output (self, other,"DIA_NASZ_201_Erak_meatdone_55_03"); //A teraz id� je upiec. Nie chc� na co� zachorowa� przez jedzenie surowego mi�sa.
		// TODO: Erak idzie upiec mi�so
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
 	description = "Jest tu co� do roboty?";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_00"); //Jest tu co� do roboty?
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_01"); //Naturalnie!
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_02"); //Zamieniam si� w s�uch.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_03"); //Jak si� zapewne domy�lasz, nie wszyscy bandyci byli w obozie w chwili naszego ataku.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_04"); //Musimy pozby� si� tych, kt�rzy uciekli.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_05"); //Jestem przekonany, �e wszyscy zebrali si� w jeden punkt, w jakie� miejsce ewakuacyjne wcze�niej ustalone.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_06"); //Jako, �e tyle si� w�r�d nich ostatnio obraca�e� to mo�e wiesz co� o takiej lokacji?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_WorkBDT_15_07"); //Niestety nic.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_08"); //C�. Tak czy inaczej oferowa�e� swoj� pomoc, wi�c to zadanie nale�y do ciebie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_WorkBDT_55_09"); //Znajd� i zabij bandyt�w.

	Log_CreateTopic (TOPIC_Erak_BDT, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_BDT, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_BDT, "Musz� pozby� si� reszty bandyt�w z G�rniczej Doliny. Erak uwa�a, �e s� w jakim� miejscu ewakuacyjnym... Cholera, ale gdzie?");

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
 	description = "Pozby�em si� bandyt�w.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_BDTdone_15_00"); //Pozby�em si� bandyt�w.
	AI_Output (self, other,"DIA_NASZ_201_Erak_BDTdone_55_01"); //Skubany! Naprawd�, dobry jeste�! Powiedz, gdzie byli?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_BDTdone_15_02"); //Nad tym jeziorem poni�ej. Chyba nie byli zaskoczeni, �e tam przyszed�em.
	AI_Output (self, other,"DIA_NASZ_201_Erak_BDTdone_15_03"); //Dobrze, �e wyszed�e� z tego prawie bez �adnej rany. We� te eliksiry w nagrod�, powinny z�agodzi� nieco b�l.

	Createinvitems (self, ItPo_Health_03, 1);
	B_GiveInvItems (other, self, ItPo_Health_03, 1);
	Createinvitems (self, ItPo_Health_02, 2);
	B_GiveInvItems (other, self, ItPo_Health_02, 2);
	Createinvitems (self, ItPo_Health_01, 2);
	B_GiveInvItems (other, self, ItPo_Health_01, 2);
	
	ERAK_QUEST = TRUE;
	B_LogEntry (TOPIC_Erak_BDT, "Zabi�em bandyt�w, a Erak by� tym wr�cz zachwycony.");
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
 	description = "Chod� ze mn�.";
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
	AI_Output (other,self ,"DIA_NASZ_201_Erak_comeon_15_00"); //Chod� ze mn�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_comeon_55_01"); //Gdzie teraz?
	AI_Output (other,self ,"DIA_NASZ_201_Erak_comeon_15_02"); //Musimy zg�adzi� jaszczuroludzi.
	AI_Output (self, other,"DIA_NASZ_201_Erak_comeon_55_02"); //To mi si� podoba!

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
	AI_Output (self, other,"DIA_NASZ_201_Erak_back_55_01"); //Wiesz, gdzie mnie szuka�.

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
	AI_Output (self, other,"DIA_NASZ_201_Erak_ImportantBack_15_00"); //Koniec z jaszczurolud�mi! Nie jestem ci ju� potrzebny.
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
 	description = "Musisz uda� si� do Kanionu Trolli.";
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
	AI_Output (other, self,"DIA_NASZ_201_Erak_TrollCanyon_15_00"); //Musisz uda� si� do Kanionu Trolli.
		if (ERAK_QUEST == TRUE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_01"); //Id�, id�.
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_02"); //Wezm� te� tych biednych ch�opc�w, kt�rych przetrzymywali bandyci. Bo niby co by tu sami robili?
			Migration_ErakToTwierdza();

			B_GivePlayerXP (100);
			ERAK_GO = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Erak uda� si� do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		};
		if (ERAK_QUEST == TRUE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_03"); //Benito ma co� do zrobienia. Gl�dzi co� o jakich� jaszczuroludziach.
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_04"); //Co jak b�d� musia� mu pom�c? Nie id�.
		};
		if (ERAK_QUEST == FALSE) {
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_05"); //Ja nic nie musz�!
			AI_Output (self, other,"DIA_NASZ_201_Erak_TrollCanyon_55_06"); //Mam tu swoje sprawy do za�atwienia.
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
 	description = "We� ten pier�cie�.";
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
	AI_Output (other, self,"DIA_NASZ_201_Erak_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_201_Erak_AmmannQuest_15_01"); //Mam go ubra�?
	AI_Output (other, self,"DIA_NASZ_201_Erak_AmmannQuest_15_02"); //Powiniene�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_AmmannQuest_15_03"); //Dobra, palec mi od tego nie odpadnie.

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
	AI_Output (other, self,"DIA_NASZ_201_Erak_Kapitel4_15_00"); //Widzia�em nieumar�ych, kt�rzy zaatakowali wasz ob�z...
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_01"); //Najpierw bandyci, potem orkowie, a teraz te nieumar�e sukinsyny, kt�re ka�dego dnia kilkukrotnie atakuj� nasz w�asny ob�z. Chyba nie mo�e by� ju� gorzej.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_02"); //Dobrze, �e do nas zajrza�e�. W przeciwnym wypadku mieliby�my jeszcze wi�cej rannych ni� ta grupka, kt�ra teraz u nas przebywa. Gdybym wiedzia� co b�dzie si� dzia�o, nigdy bym ich tutaj nie zabra�.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_03"); //To ju� nie jest bezpieczne miejsce, zw�aszcza od chili kiedy n�kaj� nas te truposze. Nie to jest jednak najgorsze. Ratford ostatniej nocy widzia� w okolicy dwa cholerne demony!
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_04"); //Demony! Tak jakby ork�w nam by�o za ma�o, od tamtej pory przed brama stoi kilku ludzi, jak sam mog�e� ju� zauwa�y�.
	AI_Output (other, self,"DIA_NASZ_201_Erak_Kapitel4_15_05"); //Czy mog� wam w czym� pom�c? Widz�, �e naprawd� macie tutaj du�o roboty.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_06"); //Nie, lepiej b�dzie jak natychmiast wr�cisz do Kerolotha i przeka�esz mu raport ode mnie.
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_07"); //Je�eli naprawd� b�dziemy potrzebowali pomocy, to wy�l� do was Ratforda. On jako jedyny da rad� przekra�� si� wsz�dzie, gdzie tylko si� da.
	
	CreateInvItems(self,ItNa_RaportEraka,1);
	B_GiveInvItems(self,other,ItNa_RaportEraka,1);
	
	AI_Output (self, other,"DIA_NASZ_201_Erak_Kapitel4_15_08"); //Nawet nie wiesz, jak bardzo chcia�bym, �eby ci nieumarli wojownicy przestali nas n�ka�.
	
	B_LogEntry (TOPIC_Sprawy,"Po rozmowie z Erakiem dosta�em raport, kt�ry musz� przekaza� Kerolothowi. Sytuacja w obozie okaza�a si� by� bardziej napi�t� ni� wcze�niej podejrzewa�em. Warto wspomnie� tak�e o szkieletach, kt�re zaatakowa�y ob�z.");
	
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
 	description = "Mo�emy co� zrobi� z t� plag� ciemno�ci?";
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
	AI_Output (other, self,"DIA_NASZ_201_Erak_CanIHelpKap4_15_00"); //Mo�emy co� zrobi� z t� plag� ciemno�ci?
	AI_Output (self, other,"DIA_NASZ_201_Erak_CanIHelpKap4_55_01"); //By�oby wspaniale... Ale nie znam si� na tym.
	AI_Output (self, other,"DIA_NASZ_201_Erak_CanIHelpKap4_55_02"); //P�ki co zanie� raport Kerolothowi.

	// TODO: jesli misja ukonczona to nie mozna porozmawiac na ten temat
	Log_CreateTopic (TOPIC_Erak_plagaciemnosci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_plagaciemnosci, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "W G�rniczej Dolinie jaki� czas temu pojawi�a si� plaga ciemno�ci. Bardzo zawiedzeni s� tym my�liwi, kt�rzy nie maj� ludzi do obrony przed demonami. Tylko mag mo�e mi pom�c rozwik�a� ten problem.");

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