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
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_00"); //Gdzie podziali siê moi uczniowie, gdzie oni s¹? Jak mam ich czegoœ nauczyæ je¿eli ¿aden z nich nie przychodzi na moje nauki?!
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_01"); //Oni powinni gdzieœ tutaj byæ... Taak, na pewno. Nie sprzeciwiliby siê przecie¿ woli naszego pana... O nie...
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_02"); //Ty! Kim jesteœ? Nie wygl¹dasz, jak jeden z moich uczniów! Czego tutaj szukasz, nieznajomy?
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_03"); //Widzê, ¿e nawet po œmierci starasz siê wykonywaæ zadania, jakie otrzyma³eœ od Baalów. Wierny swoim przekonaniom, a¿ do grobowej deski.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_04"); //O czym ty mówisz? Ja martwy? Przecie¿...
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_05"); //Masz racjê, czasami zapominam, ¿e moje ¿ycie skoñczy³o siê tak szybko. Ca³a ta si³a, jaka trzyma mego ducha w tym miejscu sprawia, ¿e ca³y czas odczuwam przedziwne wra¿enie, jakobym nadal ¿y³.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_06"); //Wiesz, jak to jest byæ martwy? Kiedy przez ca³e godziny i dnie masz œwiadomoœæ, ¿e œmiertelni bawi¹ siê w najlepsze, a ty ju¿ nie mo¿esz skosztowaæ tych zabaw?
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_07"); //Nigdy ju¿ nie zjem soczystego jab³ka, nigdy nie napijê siê dobrego wina i nigdy nie zaznam ciep³a w objêciach kobiety. To wszystko przepad³o wraz ze mn¹.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_08"); //Jedynie melodia lutni jaka rozbrzmiewa³a w pobliskim lesie dodawa³a mi otuchy i radowa³a m¹ umêczon¹ duszê, lecz jej muzyka zamar³a na wieki. Tak jak i posiadacz, który na niej gra³.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_09"); //Chcesz, abym zagra³ ci na lutni? Nie jestem w tym najlepszy, jednak uwa¿am, ¿e móg³bym chocia¿ na kilka chwil przywo³aæ tamte wspomnienia abyœ zazna³ spokoju.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lojalnosc_017_10"); //Zrobi³byœ to? Ale dlaczego œmiertelnik chce pomagaæ duszy niewiernego, który odwróci³ siê od prawdziwych bogów?
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_11"); //Poniewa¿ kiedyœ dobrze siê znaliœmy i chcê pomóc przyjacielowi. Po drugie ka¿dy z nas zas³uguje na drug¹ szansê mimo pope³nionych czynów.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lojalnosc_15_12"); //Jedynie pomagaj¹c wam, umêczonym duszom, mogê udowodniæ Baalowi, ¿e kieruj¹ mn¹ szlachetne pobudki, bowiem bez tego nigdy nie wyjawi mi sposobu na to by was uratowaæ.
		
	Log_CreateTopic (TOPIC_Joru_lutnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_lutnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_lutnia, "Joru chcia³by, abym zagra³ mu na lutni. Nie jestem w tym mo¿e najlepszy, ale czego nie robi siê dla umêczonego ducha, by ten zazna³ spokoju.");
	
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
	
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_017_00"); //Ta melodia, przypomnia³a mi o moim ¿yciu przed Koloni¹ Górnicz¹... Dziêkujê, nieznajomy! Mam nadziejê, ¿e w przesz³oœci by³em dla ciebie dobrym przyjacielem.
	AI_Output (other, self,"DIA_NASZ_017_Joru_Lutnia_15_01"); //Nawet nie wiesz jak bardzo. Wielokrotnie ratowa³eœ mi skórê z tarapatów.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_017_02"); //Zanim odejdê, w podziêce chcia³bym ci coœ daæ. Pos³uchaj:

	Info_ClearChoices	(DIA_NASZ_017_Joru_Lutnia);
	Info_AddChoice		(DIA_NASZ_017_Joru_Lutnia, "(czekaj)" ,DIA_NASZ_017_Joru_Lutnia_Wait);

};

func void DIA_NASZ_017_Joru_Lutnia_Wait() {

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");

	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_00"); //KuŸnia. Obróæ siê na po³udniowy zachód. PrzejdŸ 12 kroków, po czym obróæ siê w prawo. Za 40 kroków ponownie skrêæ w prawo miêdzy domy i przejdŸ 13 kroków.
	AI_Output (self, other,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_01"); //Potem obróæ siê lekko w lewo i przejdŸ jeszcze 16 kroków. Po prawej stronie w krzakach ukry³em skarb.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	AI_Output (other, self,"DIA_NASZ_017_Joru_Lutnia_Lutnia_Wait_55_02"); //Dziêkujê za oddanie go do mojej dyspozycji. Odnajdê go i dobrze wykorzystam.
	
	WillWieOSkarbieJoru = TRUE;
	JoruRediToTelepport = TRUE;
	
	B_LogEntry (TOPIC_Lojalnosc, "Joru poinstruowa³ mnie, gdzie mogê znaleŸæ jego skarb. Jeœli chcê dostac nagrodê za pomoc duchowi, to muszê j¹ znaleŸæ.");

	B_LogEntry (TOPIC_Joru_lutnia, "W ramach nagrody za mój okropny koncert, Joru powiedzia³ mi, gdzie mogê znaleŸæ jego skarb. Powiedzia³ dok³adnie takie s³owa: 'KuŸnia. Obróæ siê na po³udniowy zachód. PrzejdŸ 12 kroków, po czym obróæ siê w prawo. Za 40 kroków ponownie skrêæ w prawo miêdzy domy i przejdŸ 13 kroków. Potem obróæ siê lekko w lewo i przejdŸ jeszcze 16 kroków. Po prawej stronie w krzakach ukry³em skarb.'");
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
	AI_Output (self, other,"DIA_NASZ_017_Joru_siema_15_01"); //Sam ju¿ nie wiem, do którego œwiata nale¿ê - ¿ywych, czy martwych.
		
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
 	description = "Coœ ciê trapi?";
};

FUNC INT DIA_NASZ_017_Joru_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_017_Joru_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_what_15_00"); //Coœ ciê trapi?
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_01"); //Czujê siê zagubiony. Mój pan - Œni¹cy - mnie opuœci³, a wszystkich moich braci ogarn¹³ mrok.
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_02"); //Za³o¿yli ciemne maski i ruszyli za góry.
	AI_Output (self, other,"DIA_NASZ_017_Joru_what_55_03"); //Ale ja nie mogê st¹d odejœæ. To tutaj wszystko siê zaczê³o. Tutaj musi siê te¿ skoñczyæ.

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
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_017_Joru_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_017_Joru_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_017_Joru_who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_01"); //Joru, nowicjusz i niedosz³y guru.
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_02"); //Przed upadkiem bariery przekazywa³em innym naukê Œni¹cego.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_03"); //Kto to jest ten ca³y Œni¹cy?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_04"); //Nie ma Innosa, Adanosa ani Beliara. Spotka³eœ kiedyœ któregoœ z tych bogów?
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_05"); //Ee... Có¿...
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_06"); //Guru potrafili nawi¹zaæ kontakt ze Œni¹cym. Przemawia³ do nich - do mnie te¿ przemówi³.
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_07"); //W³aœnie dlatego mog³em nauczaæ nowych cz³onków naszego obozu.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_08"); //W jaki sposób porozumiewa³eœ siê ze swoim bo¿kiem?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_09"); //To BÓG a nie ¿aden bo¿ek! Ale skoro pytasz, to mo¿e te¿ chcesz spróbowaæ?
	AI_Output (self, other,"DIA_NASZ_017_Joru_who_55_10"); //Na bagnach roœnie pe³no ziela, które u³atwi ci kontakt ze Œni¹cym.
	AI_Output (other, self,"DIA_NASZ_017_Joru_who_55_11"); //Nie s¹dzê, by mi siê to uda³o.

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
 	description = "Dlaczego nie zosta³eœ guru?";
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
	AI_Output (other,self ,"DIA_NASZ_017_Joru_guru_15_00"); //Dlaczego nie zosta³eœ guru?
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_01"); //Nie skoñczy³em wszystkich nauk.
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_02"); //Mój opiekun Cor Kalom odszed³. Wyruszy³ na poszukiwanie Œni¹cego i nigdy nie wróci³.
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_03"); //Wydaje mi siê, ¿e znalaz³ naszego stwórcê i odznalaz³ spokój.
	AI_Output (other, self,"DIA_NASZ_017_Joru_guru_55_04"); //A ty nie towarzyszy³eœ swojemu opiekunowi?
	AI_Output (self, other,"DIA_NASZ_017_Joru_guru_55_05"); //Mimo ¿e bardzo chcia³em, musia³em zostaæ, by dbaæ o nowych cz³onków bractwa.

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
 	description = "Co sta³o siê po upadku bariery?";
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
	AI_Output (other,self ,"DIA_NASZ_017_Joru_bagna_15_00"); //Co sta³o siê po upadku bariery?
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_01"); //Nie mam pojêcia czemu, ale nagle z nieba zaczê³y uderzaæ pioruny.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_02"); //Przeszed³ mnie dziwny dreszcz. Widzia³em umieraj¹cych ludzi.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_03"); //I nagle us³ysza³em ciemny g³os... Beliar wzywa³ mnie do wiary w niego. Nie zgodzi³em siê.
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_05"); //Krzycza³em z ca³ych si³, ¿e Œni¹cy jest jedynym bogiem. Uciek³em i schowa³em siê tutaj.
	AI_Output (other,self ,"DIA_NASZ_017_Joru_bagna_15_06"); //I zorientowa³eœ siê, ¿e jesteœ duchem?
	AI_Output (self, other,"DIA_NASZ_017_Joru_bagna_55_07"); //W³aœnie. Nie czujê g³odu ani ¿adnego pragnienia. Nie ma ju¿ dla mnie miejsca na œwiecie, ale nie potrafiê st¹d odejœæ.
	
	Log_CreateTopic (TOPIC_Joru_sniacy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_sniacy, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_sniacy, "Joru by³ gorliwym wyznawc¹ Œni¹cego i uczniem Cor Kaloma. Z niewiadomych przyczyn nie mo¿e odejœæ z tego œwiata. Chêtnie bym mu pomóg³, ale wydaje mi siê, ¿e jego ci¹g³a wiara w Œni¹cego jest problemem.");

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
 	description = "Znalaz³em coœ, co ci siê nie spodoba.";
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
	AI_Output (other,self ,"DIA_NASZ_017_Joru_FindBook_15_00"); //Znalaz³em coœ, co ci siê nie spodoba.
	AI_Output (other, self,"DIA_NASZ_017_Joru_FindBook_55_01"); //Na bagnach odkry³em tajne laboratorium Cor Kaloma. W jednej ze skrzyñ by³a taka ksiêga.
	B_GiveInvItems (other, self, ItNa_CorKalom_Book, 1);
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_02"); //Poka¿ mi j¹.
	B_UseFakeBook();
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_03"); //Ale¿... to NIEMO¯LIWE!
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_04"); //Wierzy³em w istotê stworzon¹ przez Beliara. Wszystko nabiera sensu. Te czarne maski cz³onków bractwa i brak powrotu mojego opiekuna.
	AI_Output (self, other,"DIA_NASZ_017_Joru_FindBook_55_05"); //Odwróci³em siê od mojego boga. Teraz jestem... bluŸnierc¹. Do koñca istnienia œwiata bêdê tu pokutowa³.
	
	if (npc_knowsinfo (other, DIA_NASZ_402_Innos_workA)) {
		B_LogEntry (TOPIC_Joru_sniacy, "Joru pozna³ prawdê o Œni¹cym.");
	}
	else {
		B_LogEntry (TOPIC_Joru_sniacy, "Joru pozna³ prawdê o Œni¹cym. Niestety teraz mo¿e czekaæ tylko na ³askê od samego Innosa. Nic wiêcej nie mogê dla niego zrobiæ.");

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
 	description = "Innos chce ciê uwolniæ.";
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
	AI_Output (other,self ,"DIA_NASZ_017_Joru_InnosWantYou_15_00"); //Innos chce ciê uwolniæ.
	AI_Output (other, self,"DIA_NASZ_017_Joru_InnosWantYou_55_01"); //Wybacza ci twoje sprzeniewierzenie siê mu i pozwala ci odejœæ do œwiata umar³ych.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_02"); //Innosie... Nigdy nie chcia³em wierzyæ w Beliara. Ca³e ¿ycie obawia³em siê twojego przeciwnika.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_03"); //Mo¿e to przez to zielsko... Mo¿e z braku pomocy z jakiejkolwiek strony.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_04"); //Tobie te¿ dziêkujê... emm...
	AI_Output (other, self,"DIA_NASZ_017_Joru_InnosWantYou_15_05"); //Willu.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_06"); //Willu. Zanim odejdê, w podziêce chcia³bym ci coœ daæ. Pos³uchaj:

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");

	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_07"); //KuŸnia. Obróæ siê na po³udniowy zachód. PrzejdŸ 12 kroków, po czym obróæ siê w prawo. Za 40 kroków ponownie skrêæ w prawo miêdzy domy i przejdŸ 13 kroków.
	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_08"); //Potem obróæ siê lekko w lewo i przejdŸ jeszcze 16 kroków. Po prawej stronie w krzakach ukry³em skarb.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	AI_Output (self, other,"DIA_NASZ_017_Joru_InnosWantYou_55_09"); //Mia³ mi s³u¿yæ, w razie gdyby bariera prys³a. Mo¿e tobie siê przyda.
	
	WillWieOSkarbieJoru = TRUE;
	JoruRediToTelepport = TRUE;
	
	Log_CreateTopic (TOPIC_Joru_sniacy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Joru_sniacy, LOG_RUNNING);
	B_LogEntry (TOPIC_Joru_sniacy, "Duch w koñcu mo¿e odejœæ z tego œwiata. W ramach podziêkowañ zostawi³ mi wskazówki do skarbu ukrytego na bagnach. Powiedzia³ dok³adnie tyle: 'KuŸnia. Obróæ siê na po³udniowy zachód. PrzejdŸ 12 kroków, po czym obróæ siê w prawo. Za 40 kroków ponownie skrêæ w prawo miêdzy domy i przejdŸ 13 kroków. Potem obróæ siê lekko w lewo i przejdŸ jeszcze 16 kroków. Po prawej stronie w krzakach ukry³em skarb.'");

};*/
