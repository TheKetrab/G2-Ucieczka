var int JoruRediToTelepport;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_EXIT   (C_INFO)
{
	npc         = NASZ_017_Joru;
	nr          = 999;
	condition   = DIA_NASZ_017_Joru_EXIT_Condition;
	information = DIA_NASZ_017_Joru_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_017_Joru_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_017_Joru_EXIT_Info()
{
	if (JoruRediToTelepport == TRUE)
	{
		//Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		//Snd_Play ("MFX_TELEPORT_CAST");
		//Npc_ClearAIQueue(self);
		
		//Npc_ExchangeRoutine  (NASZ_017_Joru,"JoruTot");
		//AI_Teleport (self, "TOT"); 
		B_StartOtherRoutine (self,"JoruTot");
		AI_StopProcessInfos (self);
		}
	
	else
	
	{
		AI_StopProcessInfos (self);
	};
};

//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_Before   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 1;
 	condition   = DIA_NASZ_017_Joru_Before_Condition;
 	information = DIA_NASZ_017_Joru_Before_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_017_Joru_Before_Condition()
{
	if (!Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_017_Joru_Before_017_00"); //MMMM.
	
};

//*********************************************************************
//	Info Lojalnosc
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_Lojalnosc   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 1;
 	condition   = DIA_NASZ_017_Joru_Lojalnosc_Condition;
 	information = DIA_NASZ_017_Joru_Lojalnosc_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_017_Joru_Lojalnosc_Condition()
{
	if (Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_Lojalnosc_Info()
{
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_00"); //Gdzie podziali si� moi uczniowie, gdzie oni s�? Jak mam ich czego� nauczy� je�eli �aden z nich nie przychodzi na moje nauki?!
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_01"); //Oni powinni gdzie� tutaj by�... Taak, na pewno. Nie sprzeciwiliby si� przecie� woli naszego pana... O nie...
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_02"); //Ty! Kim jeste�? Nie wygl�dasz, jak jeden z moich uczni�w! Czego tutaj szukasz, nieznajomy?
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_03"); //Widz�, �e nawet po �mierci starasz si� wykonywa� zadania, jakie otrzyma�e� od Baal�w. Wierny swoim przekonaniom, a� do grobowej deski.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_04"); //O czym ty m�wisz? Ja martwy? Przecie�...
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_05"); //Masz racj�, czasami zapominam, �e moje �ycie sko�czy�o si� tak szybko. Ca�a ta si�a, jaka trzyma mego ducha w tym miejscu sprawia, �e ca�y czas odczuwam przedziwne wra�enie, jakobym nadal �y�.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_06"); //Wiesz, jak to jest by� martwy? Kiedy przez ca�e godziny i dnie masz �wiadomo��, �e �miertelni bawi� si� w najlepsze, a ty ju� nie mo�esz skosztowa� tych zabaw?
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_07"); //Nigdy ju� nie zjem soczystego jab�ka, nigdy nie napij� si� dobrego wina i nigdy nie zaznam ciep�a w obj�ciach kobiety. To wszystko przepad�o wraz ze mn�.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_08"); //Jedynie melodia lutni jaka rozbrzmiewa�a w pobliskim lesie dodawa�a mi otuchy i radowa�a m� um�czon� dusz�, lecz jej muzyka zamar�a na wieki. Tak jak i posiadacz, kt�ry na niej gra�.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_09"); //Chcesz, abym zagra� ci na lutni? Nie jestem w tym najlepszy, jednak uwa�am, �e m�g�bym chocia� na kilka chwil przywo�a� tamte wspomnienia aby� zazna� spokoju.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_10"); //Zrobi�by� to? Ale dlaczego �miertelnik chce pomaga� duszy niewiernego, kt�ry odwr�ci� si� od prawdziwych bog�w?
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_11"); //Poniewa� kiedy� dobrze si� znali�my i chc� pom�c przyjacielowi. Po drugie ka�dy z nas zas�uguje na drug� szans� mimo pope�nionych czyn�w.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_12"); //Jedynie pomagaj�c wam, um�czonym duszom, mog� udowodni� Baalowi, �e kieruj� mn� szlachetne pobudki, bowiem bez tego nigdy nie wyjawi mi sposobu na to by was uratowa�.
		
	Log_CreateTopic (TOPIC_Joru_lutnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_lutnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_lutnia, "Joru chcia�by, abym zagra� mu na lutni. Nie jestem w tym mo�e najlepszy, ale czego nie robi si� dla um�czonego ducha, by ten zazna� spokoju.");
	
};

//*********************************************************************
//	Info Lutnia
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_Lutnia   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 2;
 	condition   = DIA_NASZ_017_Joru_Lutnia_Condition;
 	information = DIA_NASZ_017_Joru_Lutnia_Info;
 	permanent   = FALSE;
	description	= "(Zagraj na lutni)";
};

FUNC INT DIA_NASZ_017_Joru_Lutnia_Condition()
{
	if (Npc_HasItems(hero,ItMi_Lute) &&Npc_KnowsInfo(other, DIA_NASZ_017_Joru_Lojalnosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_Lutnia_Info()
{
	AI_UseItemToState(hero,ItMi_Lute,1);
	AI_UseItemToState(hero,ItMi_Lute,2);
	AI_UseItemToState(hero,ItMi_Lute,3);
	AI_UseItemToState(hero,ItMi_Lute,4);
	
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_017_00"); //Ta melodia, przypomnia�a mi o moim �yciu przed Koloni� G�rnicz�... Dzi�kuj�, nieznajomy! Mam nadziej�, �e w przesz�o�ci by�em dla ciebie dobrym przyjacielem.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lutnia_15_01"); //Nawet nie wiesz jak bardzo. Wielokrotnie ratowa�e� mi sk�r� z tarapat�w.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_017_02"); //Zanim odejd�, w podzi�ce chcia�bym ci co� da�. Pos�uchaj:

	Info_ClearChoices	(DIA_NASZ_017_Joru_Lutnia);
	Info_AddChoice		(DIA_NASZ_017_Joru_Lutnia, "(czekaj)" ,DIA_NASZ_017_Joru_Lutnia_Wait);

};

func void DIA_NASZ_017_Joru_Lutnia_Wait() {

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");

	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_00"); //Ku�nia. Obr�� si� na po�udniowy zach�d. Przejd� 12 krok�w, po czym obr�� si� w prawo. Za 40 krok�w ponownie skr�� w prawo mi�dzy domy i przejd� 13 krok�w.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_01"); //Potem obr�� si� lekko w lewo i przejd� jeszcze 16 krok�w. Po prawej stronie w krzakach ukry�em skarb.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	AI_Output (other, self,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_02"); //Dzi�kuj� za oddanie go do mojej dyspozycji. Odnajd� go i dobrze wykorzystam.
	
	WillWieOSkarbieJoru = TRUE;
	JoruRediToTelepport = TRUE;
	
	B_LogEntry (TOPIC_Lojalnosc, "Joru poinstruowa� mnie, gdzie mog� znale�� jego skarb. Je�li chc� dostac nagrod� za pomoc duchowi, to musz� j� znale��.");

	B_LogEntry (TOPIC_Joru_lutnia, "W ramach nagrody za m�j okropny koncert, Joru powiedzia� mi, gdzie mog� znale�� jego skarb. Powiedzia� dok�adnie takie s�owa: 'Ku�nia. Obr�� si� na po�udniowy zach�d. Przejd� 12 krok�w, po czym obr�� si� w prawo. Za 40 krok�w ponownie skr�� w prawo mi�dzy domy i przejd� 13 krok�w. Potem obr�� si� lekko w lewo i przejd� jeszcze 16 krok�w. Po prawej stronie w krzakach ukry�em skarb.'");
};



/*
//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_siema   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 1;
 	condition   = DIA_NASZ_017_Joru_siema_Condition;
 	information = DIA_NASZ_017_Joru_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_017_Joru_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_017_Joru_siema_15_00"); //Duch?
	AI_Output (self, other,"DIA_NASZ_017_Joru_siema_15_01"); //Sam ju� nie wiem, do kt�rego �wiata nale�� - �ywych, czy martwych.
		
};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_what   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 2;
 	condition   = DIA_NASZ_017_Joru_what_Condition;
 	information = DIA_NASZ_017_Joru_what_Info;
 	permanent   = FALSE;
 	description = "Co� ci� trapi?";
};

FUNC INT DIA_NASZ_017_Joru_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_017_Joru_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_what_15_00"); //Co� ci� trapi?
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_01"); //Czuj� si� zagubiony. M�j pan - �ni�cy - mnie opu�ci�, a wszystkich moich braci ogarn�� mrok.
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_02"); //Za�o�yli ciemne maski i ruszyli za g�ry.
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_03"); //Ale ja nie mog� st�d odej��. To tutaj wszystko si� zacz�o. Tutaj musi si� te� sko�czy�.

};

//*********************************************************************
//	Info Who
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_who   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 3;
 	condition   = DIA_NASZ_017_Joru_who_Condition;
 	information = DIA_NASZ_017_Joru_who_Info;
 	permanent   = FALSE;
 	description = "Kim jeste�?";
};

FUNC INT DIA_NASZ_017_Joru_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_017_Joru_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_01"); //Joru, nowicjusz i niedosz�y guru.
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_02"); //Przed upadkiem bariery przekazywa�em innym nauk� �ni�cego.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_03"); //Kto to jest ten ca�y �ni�cy?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_04"); //Nie ma Innosa, Adanosa ani Beliara. Spotka�e� kiedy� kt�rego� z tych bog�w?
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_05"); //Ee... C�...
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_06"); //Guru potrafili nawi�za� kontakt ze �ni�cym. Przemawia� do nich - do mnie te� przem�wi�.
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_07"); //W�a�nie dlatego mog�em naucza� nowych cz�onk�w naszego obozu.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_08"); //W jaki spos�b porozumiewa�e� si� ze swoim bo�kiem?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_09"); //To B�G a nie �aden bo�ek! Ale skoro pytasz, to mo�e te� chcesz spr�bowa�?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_10"); //Na bagnach ro�nie pe�no ziela, kt�re u�atwi ci kontakt ze �ni�cym.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_11"); //Nie s�dz�, by mi si� to uda�o.

};

//*********************************************************************
//	Info Guru
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_guru   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 4;
 	condition   = DIA_NASZ_017_Joru_guru_Condition;
 	information = DIA_NASZ_017_Joru_guru_Info;
 	permanent   = FALSE;
 	description = "Dlaczego nie zosta�e� guru?";
};

FUNC INT DIA_NASZ_017_Joru_guru_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_017_Joru_who))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_guru_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_guru_15_00"); //Dlaczego nie zosta�e� guru?
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_01"); //Nie sko�czy�em wszystkich nauk.
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_02"); //M�j opiekun Cor Kalom odszed�. Wyruszy� na poszukiwanie �ni�cego i nigdy nie wr�ci�.
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_03"); //Wydaje mi si�, �e znalaz� naszego stw�rc� i odznalaz� spok�j.
	AI_Output (other, self,"DIA_NASZ_017_Joru_guru_55_04"); //A ty nie towarzyszy�e� swojemu opiekunowi?
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_05"); //Mimo �e bardzo chcia�em, musia�em zosta�, by dba� o nowych cz�onk�w bractwa.

};

//*********************************************************************
//	Info Bagna
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_bagna   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 5;
 	condition   = DIA_NASZ_017_Joru_bagna_Condition;
 	information = DIA_NASZ_017_Joru_bagna_Info;
 	permanent   = FALSE;
 	description = "Co sta�o si� po upadku bariery?";
};

FUNC INT DIA_NASZ_017_Joru_bagna_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_017_Joru_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_bagna_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_bagna_15_00"); //Co sta�o si� po upadku bariery?
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_01"); //Nie mam poj�cia czemu, ale nagle z nieba zacz�y uderza� pioruny.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_02"); //Przeszed� mnie dziwny dreszcz. Widzia�em umieraj�cych ludzi.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_03"); //I nagle us�ysza�em ciemny g�os... Beliar wzywa� mnie do wiary w niego. Nie zgodzi�em si�.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_05"); //Krzycza�em z ca�ych si�, �e �ni�cy jest jedynym bogiem. Uciek�em i schowa�em si� tutaj.
	AI_Output (other,self ,"DIA_NASZ_017_Joru_bagna_15_06"); //I zorientowa�e� si�, �e jeste� duchem?
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_07"); //W�a�nie. Nie czuj� g�odu ani �adnego pragnienia. Nie ma ju� dla mnie miejsca na �wiecie, ale nie potrafi� st�d odej��.
	
	Log_CreateTopic (TOPIC_Joru_sniacy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_sniacy, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_sniacy, "Joru by� gorliwym wyznawc� �ni�cego i uczniem Cor Kaloma. Z niewiadomych przyczyn nie mo�e odej�� z tego �wiata. Ch�tnie bym mu pom�g�, ale wydaje mi si�, �e jego ci�g�a wiara w �ni�cego jest problemem.");

};

//*********************************************************************
//	Info FindBook
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_FindBook   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 6;
 	condition   = DIA_NASZ_017_Joru_FindBook_Condition;
 	information = DIA_NASZ_017_Joru_FindBook_Info;
 	permanent   = FALSE;
 	description = "Znalaz�em co�, co ci si� nie spodoba.";
};

FUNC INT DIA_NASZ_017_Joru_FindBook_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_017_Joru_guru))
	&& (npc_hasitems (other, ItNa_CorKalom_Book) >=1)
	&& (WillKnowKalomBook == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_FindBook_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_FindBook_15_00"); //Znalaz�em co�, co ci si� nie spodoba.
	AI_Output (other, self,"DIA_NASZ_017_Joru_FindBook_55_01"); //Na bagnach odkry�em tajne laboratorium Cor Kaloma. W jednej ze skrzy� by�a taka ksi�ga.
	B_GiveInvItems (other, self, ItNa_CorKalom_Book, 1);
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_02"); //Poka� mi j�.
	B_UseFakeBook();
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_03"); //Ale�... to NIEMO�LIWE!
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_04"); //Wierzy�em w istot� stworzon� przez Beliara. Wszystko nabiera sensu. Te czarne maski cz�onk�w bractwa i brak powrotu mojego opiekuna.
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_05"); //Odwr�ci�em si� od mojego boga. Teraz jestem... blu�nierc�. Do ko�ca istnienia �wiata b�d� tu pokutowa�.
	
	if (npc_knowsinfo (other, DIA_NASZ_402_Innos_workA)) {
		B_LogEntry (TOPIC_Joru_sniacy, "Joru pozna� prawd� o �ni�cym.");
	}
	else {
		B_LogEntry (TOPIC_Joru_sniacy, "Joru pozna� prawd� o �ni�cym. Niestety teraz mo�e czeka� tylko na �ask� od samego Innosa. Nic wi�cej nie mog� dla niego zrobi�.");

	};

};

//*********************************************************************
//	Info InnosWantYou
//*********************************************************************
INSTANCE DIA_NASZ_017_Joru_InnosWantYou   (C_INFO)
{
	npc         = NASZ_017_Joru;
 	nr          = 6;
 	condition   = DIA_NASZ_017_Joru_InnosWantYou_Condition;
 	information = DIA_NASZ_017_Joru_InnosWantYou_Info;
 	permanent   = FALSE;
 	description = "Innos chce ci� uwolni�.";
};

FUNC INT DIA_NASZ_017_Joru_InnosWantYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_017_Joru_FindBook))
	&& (npc_knowsinfo (other, DIA_NASZ_402_Innos_workA))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_017_Joru_InnosWantYou_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_InnosWantYou_15_00"); //Innos chce ci� uwolni�.
	AI_Output (other, self,"DIA_NASZ_017_Joru_InnosWantYou_55_01"); //Wybacza ci twoje sprzeniewierzenie si� mu i pozwala ci odej�� do �wiata umar�ych.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_02"); //Innosie... Nigdy nie chcia�em wierzy� w Beliara. Ca�e �ycie obawia�em si� twojego przeciwnika.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_03"); //Mo�e to przez to zielsko... Mo�e z braku pomocy z jakiejkolwiek strony.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_04"); //Tobie te� dzi�kuj�... emm...
	AI_Output (other, self,"DIA_NASZ_017_Joru_InnosWantYou_15_05"); //Willu.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_06"); //Willu. Zanim odejd�, w podzi�ce chcia�bym ci co� da�. Pos�uchaj:

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");

	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_07"); //Ku�nia. Obr�� si� na po�udniowy zach�d. Przejd� 12 krok�w, po czym obr�� si� w prawo. Za 40 krok�w ponownie skr�� w prawo mi�dzy domy i przejd� 13 krok�w.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_08"); //Potem obr�� si� lekko w lewo i przejd� jeszcze 16 krok�w. Po prawej stronie w krzakach ukry�em skarb.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_09"); //Mia� mi s�u�y�, w razie gdyby bariera prys�a. Mo�e tobie si� przyda.
	
	WillWieOSkarbieJoru = TRUE;
	JoruRediToTelepport = TRUE;
	
	Log_CreateTopic (TOPIC_Joru_sniacy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_sniacy, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_sniacy, "Duch w ko�cu mo�e odej�� z tego �wiata. W ramach podzi�kowa� zostawi� mi wskaz�wki do skarbu ukrytego na bagnach. Powiedzia� dok�adnie tyle: 'Ku�nia. Obr�� si� na po�udniowy zach�d. Przejd� 12 krok�w, po czym obr�� si� w prawo. Za 40 krok�w ponownie skr�� w prawo mi�dzy domy i przejd� 13 krok�w. Potem obr�� si� lekko w lewo i przejd� jeszcze 16 krok�w. Po prawej stronie w krzakach ukry�em skarb.'");

};*/
