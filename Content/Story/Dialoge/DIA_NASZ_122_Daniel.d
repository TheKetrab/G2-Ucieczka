// ----- ----- ----- ----- ----- ----- -----
//		GORNICTWO - system
// ----- ----- ----- ----- ----- ----- -----
// 1. startujesz i masz 20% - tytu³ Kiepski
// 2. jeœli masz mniej ni¿ 30% to kopi¹c co 3 wykopania +5%
// 3. jeœli masz 30% to Daniel moze cie nauczyc do 40% i zyskujesz tytu³ Kopacz
// 4. jesli masz 40%<x<55% to co 5 wykopañ +5%
// 5. jeœli masz 55% to Daniel mo¿e ciê nauczyæ do 65% i zyskuejsz tytu³ Zawodowiec
// 6. jeœli masz 65%<x<80% to co 7 wykopan +5%
// 7. jesli masz 80% to Daniel moze cie nauczyc do 90% - i zyskuejsz tytu³ Mistrz
// 8. jesli masz 90%<x<=100% to co 10 wykopan +5%
// 9. jesli masz 100% to zyskujesz tytu³ Guru
// ----- ----- ----- ----- ----- ----- -----







var int DANIEL_KILOF_OK;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_122_Daniel_EXIT   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 999;
	condition   = DIA_NASZ_122_Daniel_EXIT_Condition;
	information = DIA_NASZ_122_Daniel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_122_Daniel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_122_Daniel_EXIT_Info()
{
	if (DANIEL_KILOF_OK == TRUE) {
		AI_Output (self, other,"DIA_NASZ_122_Daniel_EXIT_15_00"); //Skoro mam ju¿ kilof, to wyruszam kopaæ z³oto dalej!
		AI_Output (other, self,"DIA_NASZ_122_Daniel_EXIT_15_01"); //Dok¹d siê udasz?
		AI_Output (self, other,"DIA_NASZ_122_Daniel_EXIT_15_02"); //Na po³udnie. W pobli¿u tej straszliwej opuszczonej wie¿y na po³udniu jest najwiêcej z³ó¿. Mam w okolicy taki ma³y obozik. Tam w³aœnie pójdê.
		AI_Output (other, self,"DIA_NASZ_122_Daniel_EXIT_15_03"); //Powodzenia.
		Npc_ExchangeRoutine (self, "Gold");
		DANIEL_KILOF_OK = FALSE;
		};

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_122_Daniel_siema   (C_INFO)
{
	npc         = NASZ_122_Daniel;
 	nr          = 1;
 	condition   = DIA_NASZ_122_Daniel_siema_Condition;
 	information = DIA_NASZ_122_Daniel_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_122_Daniel_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_122_Daniel_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_122_Daniel_siema_15_00"); //Czo³em.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_siema_55_01"); //Czo³em. Widzê, ¿eœ nowy. Te¿ kopacz?
	AI_Output (other, self,"DIA_NASZ_122_Daniel_siema_55_02"); //Mo¿e.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_siema_55_03"); //Dobra, dobra. Swój swego pozna. Bardzo dobrze siê sk³ada, ¿e jesteœ kopaczem.

};

//*********************************************************************
//	Info Why
//*********************************************************************
INSTANCE DIA_NASZ_122_Daniel_why   (C_INFO)
{
	npc         = NASZ_122_Daniel;
 	nr          = 2;
 	condition   = DIA_NASZ_122_Daniel_why_Condition;
 	information = DIA_NASZ_122_Daniel_why_Info;
 	permanent   = FALSE;
 	description = "Dlaczego?";
};

FUNC INT DIA_NASZ_122_Daniel_why_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_122_Daniel_why_Info()
{
	AI_Output (other,self ,"DIA_NASZ_122_Daniel_why_15_00"); //Dlaczego?
	AI_Output (self, other,"DIA_NASZ_122_Daniel_why_55_01"); //Potrzebujê kilofa. Masz mo¿e jakiœ?
	AI_Output (self, other,"DIA_NASZ_122_Daniel_why_55_02"); //Mój z³ama³ siê kilka dni temu i zamiast wydobywaæ surowce, czekam a¿ Jan ³askawie wykuje dla mnie nowy.

};

//*********************************************************************
//	Info Kilof
//*********************************************************************
INSTANCE DIA_NASZ_122_Daniel_kilof   (C_INFO)
{
	npc         = NASZ_122_Daniel;
 	nr          = 3;
 	condition   = DIA_NASZ_122_Daniel_kilof_Condition;
 	information = DIA_NASZ_122_Daniel_kilof_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten.";
};

FUNC INT DIA_NASZ_122_Daniel_kilof_Condition()
{
	if ((npc_hasitems (other, ItMw_2H_Axe_L_01) >=1) 
		&& (npc_knowsinfo (other, DIA_NASZ_122_Daniel_why)))
		{
			return TRUE;
		};
};

FUNC VOID DIA_NASZ_122_Daniel_kilof_Info()
{

	AI_Output (other,self ,"DIA_NASZ_122_Daniel_kilof_15_00"); //WeŸ ten.
		B_giveinvitems (other, self, ItMw_2H_Axe_L_01, 1);
	AI_Output (self, other,"DIA_NASZ_122_Daniel_kilof_55_01"); //Wielkie dziêki. To narzêdzie to ca³e moje ¿ycie.
	DANIEL_KILOF_OK = TRUE;

	B_GivePlayerXP (200);
};

//*********************************************************************
//	Info WhatAreUDoing
//*********************************************************************
INSTANCE DIA_NASZ_122_Daniel_WhatAreUDoing (C_INFO)
{
	npc         = NASZ_122_Daniel;
 	nr          = 4;
 	condition   = DIA_NASZ_122_Daniel_WhatAreUDoing_Condition;
 	information = DIA_NASZ_122_Daniel_WhatAreUDoing_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_122_Daniel_WhatAreUDoing_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_122_Daniel_WhatAreUDoing_Info()
{

	AI_Output (other,self ,"DIA_NASZ_122_Daniel_WhatAreUDoing_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_01"); //Jestem górnikiem. Ca³e ¿ycie kopa³em rudê i z³oto.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_02"); //Œmiem twierdziæ, ¿e jestem w tym doœæ dobry.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_03"); //Tyle bandziorów kopie rudê i co? Nie umiej¹ nic wykopaæ! Wiesz dlaczego? Powiem ci: Ruda jest stosunkowo ³atwa do wydobycia. Trudniej, jeœli chodzi o z³oto.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_04"); //Wal¹c kilofem w bry³ê magicznej rudy, zedrzemy j¹ w proch... Ale jeœli mówimy o prawdziwym górnictwie, to wykopanie porz¹dnego samorodka rudy jest du¿o trudniejsze.

};

//---------------------------------------------------------------------
//	Info WhereDidYouLearn
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_WhereDidYouLearn   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 5;
	condition   = DIA_NASZ_122_Daniel_WhereDidYouLearn_Condition;
	information = DIA_NASZ_122_Daniel_WhereDidYouLearn_Info;
	permanent   = FALSE;
	description = "Gdzie nauczy³eœ siê wydobycia z³ota?";
};
FUNC INT DIA_NASZ_122_Daniel_WhereDidYouLearn_Condition()
{	
	if Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_WhatAreUDoing)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_WhereDidYouLearn_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhereDidYouLearn_15_00"); //Gdzie nauczy³eœ siê wydobycia z³ota?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_01"); //Na wyspie Khorinis, za pó³nocnymi górami w potê¿nej dolinie znajduj¹ siê z³o¿a z³ota.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_02"); //Nale¿¹ do bandytów.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_03"); //Pracowa³em dla nich kiedyœ. Zrezygnowa³em, bo praca tam nie by³a przyjemna, a w dodatku ci troglodyci odbierali mi znaczn¹ czêœæ z³ota, które wykopa³em.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_04"); //Wyruszy³em na po³udnie w poszukiwaniu z³ota. Jest tu go du¿o mniej, ale przynajmniej kopiê teraz wy³¹cznie na swój rachunek.

};

//---------------------------------------------------------------------
//	Info JanWantGold
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_JanWantGold   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 6;
	condition   = DIA_NASZ_122_Daniel_JanWantGold_Condition;
	information = DIA_NASZ_122_Daniel_JanWantGold_Info;
	permanent   = FALSE;
	description = "Jan przys³a³ mnie po bry³ki z³ota.";
};
FUNC INT DIA_NASZ_122_Daniel_JanWantGold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_NASZ_106_Jan_finish1)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_JanWantGold_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_JanWantGold_15_00"); //Jan przys³a³ mnie po bry³ki z³ota.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_01"); //Powinien klepaæ miecze z rudy, a nie ze z³ota...
	AI_Output (other, self, "DIA_NASZ_122_Daniel_JanWantGold_01_02"); //Mo¿e to wymaga wiêkszych umiejêtnoœci?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_03"); //Nie wydaje mi siê. Po prostu Jan uwielbia œwiec¹ce siê rzeczy.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_04"); //Hej, a gdyby tak zrobiæ mu psikusa?
};

var int DanielUczyZaDarmo;
//---------------------------------------------------------------------
//	Info WhatDoYouMean
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_WhatDoYouMean   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 7;
	condition   = DIA_NASZ_122_Daniel_WhatDoYouMean_Condition;
	information = DIA_NASZ_122_Daniel_WhatDoYouMean_Info;
	permanent   = FALSE;
	description = "Co masz na myœli?";
};
FUNC INT DIA_NASZ_122_Daniel_WhatDoYouMean_Condition()
{	
	if Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_JanWantGold)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_WhatDoYouMean_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhatDoYouMean_15_00"); //Co masz na myœli?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_01"); //Umiejêtnie wykopiesz z³oto i wetkniesz do œrodka trochê gliny.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_02"); //Gdy Jan wykuje miecz z tego z³ota, nie bêdzie a¿ tak b³yszcza³.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_03"); //A co ja bêdê z tego mia³?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_04"); //Hmm, niech pomyœlê... Bêdê uczy³ ciê górnictwa za darmo.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_05"); //To jak bêdzie, zainteresowany?

	Info_ClearChoices (DIA_NASZ_122_Daniel_WhatDoYouMean);
		Info_AddChoice	  (DIA_NASZ_122_Daniel_WhatDoYouMean, "Chêtnie siê tym zajmê.", DIA_NASZ_122_Daniel_WhatDoYouMean_yes);
		Info_AddChoice	  (DIA_NASZ_122_Daniel_WhatDoYouMean, "Niespecjalnie. Lepiej daj mi bry³ki.", DIA_NASZ_122_Daniel_WhatDoYouMean_no);

};

FUNC VOID DIA_NASZ_122_Daniel_WhatDoYouMean_yes()
{
	AI_Output (other,self ,"DIA_NASZ_122_Daniel_WhatDoYouMean_yes_15_00"); //Chêtnie siê tym zajmê.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_yes_15_01"); //Œwietnie! Naukê mo¿emy rozpocz¹æ w dowolnym momencie.

	MozeszKopacBrudneSamorodki = TRUE;
	DanielUczyZaDarmo = TRUE;
	B_LogEntry (TOPIC_Jan_zloto, "Wygl¹da na to, ¿e Daniela te¿ irytuje Jan, który ma obsesjê na punkcie ³adnych broni. Proponuje udzia³ w ¿arcie i w zamian za pomoc, bêdzie mnie uczyæ górnictwa za darmo. Muszê wykopaæ trochê gliny ze z³otem i zanieœæ to Janowi.");
	Info_ClearChoices (DIA_NASZ_122_Daniel_WhatDoYouMean);
};
	
FUNC VOID DIA_NASZ_122_Daniel_WhatDoYouMean_no()
{
	AI_Output (other, self,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_00"); //Niespecjalnie. Lepiej daj mi bry³ki.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_01"); //Szkoda... Oby orkowa stal nie okaza³a siê trwalsza od œwiec¹cych mieczy.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_02"); //Trzymaj, dziesiêæ bry³ek.

	CreateInvItems (self, ItMi_GoldNugget_Addon, 10);
	B_giveinvitems (self, other, ItMi_GoldNugget_Addon, 10);
	
	B_LogEntry (TOPIC_Jan_zloto, "Daniel da³ mi 10 z³otych samorodków. Teraz muszê zanieœæ je do kowala.");
	Info_ClearChoices (DIA_NASZ_122_Daniel_WhatDoYouMean);
};


//---------------------------------------------------------------------
//	Info AnyProblems
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_AnyProblems   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 31;
	condition   = DIA_NASZ_122_Daniel_AnyProblems_Condition;
	information = DIA_NASZ_122_Daniel_AnyProblems_Info;
	permanent   = FALSE;
	description = "Jakieœ problemy?";
};
FUNC INT DIA_NASZ_122_Daniel_AnyProblems_Condition()
{	
	if (KAPITEL >= 3)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_AnyProblems_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_AnyProblems_15_00"); //Jakieœ problemy?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_01"); //Mo¿na tak powiedzieæ.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_02"); //Zdo³a³em otworzyæ kratê do kopalni pe³zaczy. Liczy³em, ¿e te bestie zdech³y z g³odu, a ja zajmê tê kopalniê i zacznê eksploatacjê.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_03"); //Nic z tego... Te cholerne pajêczaki ¿yj¹ i maj¹ siê w najlepsze!
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_04"); //Jeœli ju¿ pytasz o problemy, to mo¿e zechcesz siê ich pozbyæ? Szczerze mówi¹c, chcia³bym dobraæ siê do z³ó¿, które tam pozosta³y.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_AnyProblems_15_05"); //Zobaczê, co da siê zrobiæ.

	Log_CreateTopic (TOPIC_Daniel_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Daniel_kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Daniel_kopalnia, "Daniel otworzy³ kratê do kopalni, ale wewn¹trz jest pe³no pe³zaczy. Muszê siê ich pozbyæ.");

};

//---------------------------------------------------------------------
//	Info MineDone
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_MineDone   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 32;
	condition   = DIA_NASZ_122_Daniel_MineDone_Condition;
	information = DIA_NASZ_122_Daniel_MineDone_Info;
	permanent   = FALSE;
	description = "Zaj¹³em siê pe³zaczami.";
};
FUNC INT DIA_NASZ_122_Daniel_MineDone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_AnyProblems) && (npc_isdead (MinecrawlerWarrior_Boss))
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_MineDone_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_MineDone_15_00"); //Zaj¹³em siê pe³zaczami.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_01"); //Du¿o ich tam by³o? Czym siê ¿ywi³y?
	AI_Output (other, self, "DIA_NASZ_122_Daniel_MineDone_15_02"); //Zabi³em ich samca. Zapewne ich przywódca dawa³ im w jakiœ sposób dostêp do po¿ywienia.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_03"); //Widocznie...
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_04"); //Niewa¿ne, ruszam opró¿niæ grotê!
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_05"); //Proszê, weŸ tê miksturê.
	
	Npc_ExchangeRoutine (self, "InMine");
	
	B_GivePlayerXP(700);
	DodajReputacje(2,REP_LOWCY);
	
	if (hero.guild == GIL_OUT) {
		Createinvitems (self, ItPo_Perm_Dex, 1);
		B_Giveinvitems (self, other, ItPo_Perm_Dex, 1);
	} else {
		Createinvitems (self, ItPo_Perm_Str, 1);
		B_Giveinvitems (self, other, ItPo_Perm_Str, 1);
	};
		
	Log_SetTopicStatus (TOPIC_Daniel_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Daniel_kopalnia, "Daniel poszed³ kopaæ rudê.");

};


//---------------------------------------------------------------------
//	Info Gornictwo
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_Gornictwo   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 100;
	condition   = DIA_NASZ_122_Daniel_Gornictwo_Condition;
	information = DIA_NASZ_122_Daniel_Gornictwo_Info;
	permanent   = FALSE;
	description = "Nauczysz mnie górnictwa?";
};
FUNC INT DIA_NASZ_122_Daniel_Gornictwo_Condition()
{	
	if Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_WhatAreUDoing)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_NASZ_122_Daniel_Gornictwo_Info()
{
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_00"); //Nauczysz mnie górnictwa?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Gornictwo_01_01"); //Jasne, ale wtedy bêdziesz mieæ wiêcej z³ota.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_02"); //W³aœnie o to chodzi.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Gornictwo_01_03"); //Dobra, ale powinieneœ oddaæ mi jak¹œ jego czêœæ.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_04"); //Có¿...

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Daniel nauczy mnie górnictwa.");
};

//---------------------------------------------------------------------
//	Training
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_Training   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 102;
	condition   = DIA_NASZ_122_Daniel_Training_Condition;
	information = DIA_NASZ_122_Daniel_Training_Info;
	permanent   = TRUE;
	description = "Naucz mnie górnictwa.";
};

FUNC INT DIA_NASZ_122_Daniel_Training_Condition()
{	
	if (LevelMiner <= 80) && Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_Gornictwo) && (DanielUczyZaDarmo == FALSE)
	{	
		return TRUE;
	};	
};

func void DanielSay_WhereIsGold() {
	AI_Output (self, other, "DanielSay_WhereIsGold_01_00"); //A gdzie z³oto?
};

func void DanielSay_NoExp() {
	AI_Output (self, other, "DanielSay_NoExp_01_00"); //Brak ci doœwiadczenia.
};

func void DanielSay_Train1() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train1_01_00"); //S³uchaj uwa¿nie. Trzeba uderzaæ spokojnie i jednostajnie. Pracuj powoli, ale nie tak, ¿ebyœ mi tu mia³ usn¹æ.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train1_01_01"); //Nie wal ci¹gle w jedno miejsce. Zamiast tego spróbuj wyci¹æ spory kawa³ek surowca.
};


func void DanielSay_Train2() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_00"); //Ju¿ wiesz, jak siê kopie. Ale co zrobiæ, by wydobywaæ wiêcej samorodków? To wymaga wiêkszej uwagi.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_01"); //Podczas wyci¹gania kilofa z samorodka podkrêæ go do góry.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_02"); //Nie bêdzie to proste, ale nauczysz siê.
};


func void DanielSay_Train3() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_00"); //Prawdziwi mistrzowie czerpi¹ wiêcej si³y do uderzenia z odpowiedniego zamachu. Spróbuj odchyliæ siê bardziej do ty³u i w praw¹ stronê.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_01"); //Co wiêcej - bij obiema stronami kilofa. Po kilku uderzeniach jedna siê têpi, a wtedy druga jest niezast¹piona.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_02"); //To wszystko, co mo¿na wiedzieæ o górnictwie. Prawdziw¹ wiedz¹ jest wiedza o miejscach do wykopywania.
};

FUNC VOID DIA_NASZ_122_Daniel_Training_Info()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_Training);
	Info_AddChoice (DIA_NASZ_122_Daniel_Training,DIALOG_BACK, DIA_NASZ_122_Daniel_Training_back);
	
	if(LevelMiner <= 80) && (LevelMiner > 55)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% górnictwa) 15 PN, 300 szt. z³ota",DIA_NASZ_122_Daniel_Training_mistrz);
	}
	else if(LevelMiner <= 55) && (LevelMiner > 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% górnictwa) 15 PN, 300 szt. z³ota",DIA_NASZ_122_Daniel_Training_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Zawodowiec (Wymagane 55% górnictwa) 10 PN, 200 szt. z³ota",DIA_NASZ_122_Daniel_Training_zawodowiec);
	}
	else if(LevelMiner <= 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% górnictwa) 15 PN, 300 szt. z³ota",DIA_NASZ_122_Daniel_Training_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Zawodowiec (Wymagane 55% górnictwa) 10 PN, 200 szt. z³ota",DIA_NASZ_122_Daniel_Training_zawodowiec);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Kopacz     (Wymagane 30% górnictwa) 5  PN, 100 szt. z³ota",DIA_NASZ_122_Daniel_Training_kopacz);
	};
};

func void DIA_NASZ_122_Daniel_Training_back()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_Training);
};

func void DIA_NASZ_122_Daniel_Training_mistrz()
{
	if (LevelMiner == 80)
	&& (hero.lp >= 5)
	{
		if (npc_hasitems (other, ItMi_Gold) >= 300)
		{
			B_giveinvitems (other, self, ItMi_Gold, 300);
			DanielSay_Train3();

			hero.lp -= 15;
			LevelMiner += 10;
			PrintScreen ("Górnictwo: Mistrz", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(300);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 80% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};

func void DIA_NASZ_122_Daniel_Training_zawodowiec()
{
	if (LevelMiner == 55)
	&& (hero.lp >= 10)
	{
		if (npc_hasitems (other, ItMi_Gold) >= 200)
		{
			B_giveinvitems (other, self, ItMi_Gold, 200);
			DanielSay_Train2();
			
			hero.lp -= 10;
			LevelMiner += 10;
			PrintScreen ("Górnictwo: Zawodowiec", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(200);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 55% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};

func void DIA_NASZ_122_Daniel_Training_kopacz()
{
	if (LevelMiner == 30)
	&& (hero.lp >= 5)
	{
		if (npc_hasitems (other, ItMi_Gold) >= 100)
		{
			B_giveinvitems (other, self, ItMi_Gold, 100);
			DanielSay_Train1();
			
			hero.lp -= 5;
			LevelMiner += 10;
			PrintScreen ("Górnictwo: Kopacz", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(100);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 30% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};


// *** *** *** FREE *** *** ***
//---------------------------------------------------------------------
//	TrainingFree
//---------------------------------------------------------------------
INSTANCE DIA_NASZ_122_Daniel_TrainingFree   (C_INFO)
{
	npc         = NASZ_122_Daniel;
	nr          = 102;
	condition   = DIA_NASZ_122_Daniel_TrainingFree_Condition;
	information = DIA_NASZ_122_Daniel_TrainingFree_Info;
	permanent   = TRUE;
	description = "Naucz mnie górnictwa.";
};

FUNC INT DIA_NASZ_122_Daniel_TrainingFree_Condition()
{	
	if (LevelMiner <= 80) && Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_Gornictwo) && (DanielUczyZaDarmo == TRUE)
	{	
		return TRUE;
	};	
};

FUNC VOID DIA_NASZ_122_Daniel_TrainingFree_Info()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_TrainingFree);
	Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,DIALOG_BACK, DIA_NASZ_122_Daniel_TrainingFree_back);
	
	if(LevelMiner <= 80) && (LevelMiner > 55)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% górnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
	}
	else if(LevelMiner <= 55) && (LevelMiner > 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% górnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Zawodowiec (Wymagane 55% górnictwa) 10 PN",DIA_NASZ_122_Daniel_TrainingFree_zawodowiec);
	}
	else if(LevelMiner <= 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% górnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Zawodowiec (Wymagane 55% górnictwa) 10 PN",DIA_NASZ_122_Daniel_TrainingFree_zawodowiec);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Kopacz     (Wymagane 30% górnictwa) 5  PN",DIA_NASZ_122_Daniel_TrainingFree_kopacz);
	};
};

func void DIA_NASZ_122_Daniel_TrainingFree_back()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_TrainingFree);
};

func void DIA_NASZ_122_Daniel_TrainingFree_mistrz()
{
	if (LevelMiner == 80)
	&& (hero.lp >= 15)
	{
		DanielSay_Train3();
	
		hero.lp -= 15;
		LevelMiner += 10;
		PrintScreen ("Górnictwo: Mistrz", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 80% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};

func void DIA_NASZ_122_Daniel_TrainingFree_zawodowiec()
{
	if (LevelMiner == 55)
	&& (hero.lp >= 10)
	{
		DanielSay_Train2();
		
		hero.lp -= 10;
		LevelMiner += 10;
		PrintScreen ("Górnictwo: Zawodowiec", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 55% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};

func void DIA_NASZ_122_Daniel_TrainingFree_kopacz()
{
	if (LevelMiner == 30)
	&& (hero.lp >= 5)
	{	
		DanielSay_Train1();
		
		hero.lp -= 5;
		LevelMiner += 10;
		PrintScreen ("Górnictwo: Kopacz", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 30% górnictwa!", -1, -1, FONT_Screen, 2);
		DanielSay_NoExp();
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_122_Daniel_PICKPOCKET (C_INFO)
{
	npc			= NASZ_122_Daniel;
	nr			= 900;
	condition	= DIA_NASZ_122_Daniel_PICKPOCKET_Condition;
	information	= DIA_NASZ_122_Daniel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_122_Daniel_PICKPOCKET_Condition()
{
	C_Beklauen (55);
};
 
FUNC VOID DIA_NASZ_122_Daniel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_122_Daniel_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_122_Daniel_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_122_Daniel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_122_Daniel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_122_Daniel_PICKPOCKET_DoIt);
};

func void DIA_NASZ_122_Daniel_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItMi_Nugget,6);
	Info_ClearChoices (DIA_NASZ_122_Daniel_PICKPOCKET);
};
	
func void DIA_NASZ_122_Daniel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_PICKPOCKET);
};
