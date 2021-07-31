// ----- ----- ----- ----- ----- ----- -----
//		GORNICTWO - system
// ----- ----- ----- ----- ----- ----- -----
// 1. startujesz i masz 20% - tytu� Kiepski
// 2. je�li masz mniej ni� 30% to kopi�c co 3 wykopania +5%
// 3. je�li masz 30% to Daniel moze cie nauczyc do 40% i zyskujesz tytu� Kopacz
// 4. jesli masz 40%<x<55% to co 5 wykopa� +5%
// 5. je�li masz 55% to Daniel mo�e ci� nauczy� do 65% i zyskuejsz tytu� Zawodowiec
// 6. je�li masz 65%<x<80% to co 7 wykopan +5%
// 7. jesli masz 80% to Daniel moze cie nauczyc do 90% - i zyskuejsz tytu� Mistrz
// 8. jesli masz 90%<x<=100% to co 10 wykopan +5%
// 9. jesli masz 100% to zyskujesz tytu� Guru
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
		AI_Output (self, other,"DIA_NASZ_122_Daniel_EXIT_15_00"); //Skoro mam ju� kilof, to wyruszam kopa� z�oto dalej!
		AI_Output (other, self,"DIA_NASZ_122_Daniel_EXIT_15_01"); //Dok�d si� udasz?
		AI_Output (self, other,"DIA_NASZ_122_Daniel_EXIT_15_02"); //Na po�udnie. W pobli�u tej straszliwej opuszczonej wie�y na po�udniu jest najwi�cej z��. Mam w okolicy taki ma�y obozik. Tam w�a�nie p�jd�.
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
	AI_Output (other, self,"DIA_NASZ_122_Daniel_siema_15_00"); //Czo�em.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_siema_55_01"); //Czo�em. Widz�, �e� nowy. Te� kopacz?
	AI_Output (other, self,"DIA_NASZ_122_Daniel_siema_55_02"); //Mo�e.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_siema_55_03"); //Dobra, dobra. Sw�j swego pozna. Bardzo dobrze si� sk�ada, �e jeste� kopaczem.

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
	AI_Output (self, other,"DIA_NASZ_122_Daniel_why_55_01"); //Potrzebuj� kilofa. Masz mo�e jaki�?
	AI_Output (self, other,"DIA_NASZ_122_Daniel_why_55_02"); //M�j z�ama� si� kilka dni temu i zamiast wydobywa� surowce, czekam a� Jan �askawie wykuje dla mnie nowy.

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
 	description = "We� ten.";
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

	AI_Output (other,self ,"DIA_NASZ_122_Daniel_kilof_15_00"); //We� ten.
		B_giveinvitems (other, self, ItMw_2H_Axe_L_01, 1);
	AI_Output (self, other,"DIA_NASZ_122_Daniel_kilof_55_01"); //Wielkie dzi�ki. To narz�dzie to ca�e moje �ycie.
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
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_01"); //Jestem g�rnikiem. Ca�e �ycie kopa�em rud� i z�oto.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_02"); //�miem twierdzi�, �e jestem w tym do�� dobry.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_03"); //Tyle bandzior�w kopie rud� i co? Nie umiej� nic wykopa�! Wiesz dlaczego? Powiem ci: Ruda jest stosunkowo �atwa do wydobycia. Trudniej, je�li chodzi o z�oto.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatAreUDoing_55_04"); //Wal�c kilofem w bry�� magicznej rudy, zedrzemy j� w proch... Ale je�li m�wimy o prawdziwym g�rnictwie, to wykopanie porz�dnego samorodka rudy jest du�o trudniejsze.

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
	description = "Gdzie nauczy�e� si� wydobycia z�ota?";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhereDidYouLearn_15_00"); //Gdzie nauczy�e� si� wydobycia z�ota?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_01"); //Na wyspie Khorinis, za p�nocnymi g�rami w pot�nej dolinie znajduj� si� z�o�a z�ota.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_02"); //Nale�� do bandyt�w.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_03"); //Pracowa�em dla nich kiedy�. Zrezygnowa�em, bo praca tam nie by�a przyjemna, a w dodatku ci troglodyci odbierali mi znaczn� cz�� z�ota, kt�re wykopa�em.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhereDidYouLearn_01_04"); //Wyruszy�em na po�udnie w poszukiwaniu z�ota. Jest tu go du�o mniej, ale przynajmniej kopi� teraz wy��cznie na sw�j rachunek.

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
	description = "Jan przys�a� mnie po bry�ki z�ota.";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_JanWantGold_15_00"); //Jan przys�a� mnie po bry�ki z�ota.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_01"); //Powinien klepa� miecze z rudy, a nie ze z�ota...
	AI_Output (other, self, "DIA_NASZ_122_Daniel_JanWantGold_01_02"); //Mo�e to wymaga wi�kszych umiej�tno�ci?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_03"); //Nie wydaje mi si�. Po prostu Jan uwielbia �wiec�ce si� rzeczy.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_JanWantGold_01_04"); //Hej, a gdyby tak zrobi� mu psikusa?
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
	description = "Co masz na my�li?";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhatDoYouMean_15_00"); //Co masz na my�li?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_01"); //Umiej�tnie wykopiesz z�oto i wetkniesz do �rodka troch� gliny.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_02"); //Gdy Jan wykuje miecz z tego z�ota, nie b�dzie a� tak b�yszcza�.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_03"); //A co ja b�d� z tego mia�?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_04"); //Hmm, niech pomy�l�... B�d� uczy� ci� g�rnictwa za darmo.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_WhatDoYouMean_01_05"); //To jak b�dzie, zainteresowany?

	Info_ClearChoices (DIA_NASZ_122_Daniel_WhatDoYouMean);
		Info_AddChoice	  (DIA_NASZ_122_Daniel_WhatDoYouMean, "Ch�tnie si� tym zajm�.", DIA_NASZ_122_Daniel_WhatDoYouMean_yes);
		Info_AddChoice	  (DIA_NASZ_122_Daniel_WhatDoYouMean, "Niespecjalnie. Lepiej daj mi bry�ki.", DIA_NASZ_122_Daniel_WhatDoYouMean_no);

};

FUNC VOID DIA_NASZ_122_Daniel_WhatDoYouMean_yes()
{
	AI_Output (other,self ,"DIA_NASZ_122_Daniel_WhatDoYouMean_yes_15_00"); //Ch�tnie si� tym zajm�.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_yes_15_01"); //�wietnie! Nauk� mo�emy rozpocz�� w dowolnym momencie.

	MozeszKopacBrudneSamorodki = TRUE;
	DanielUczyZaDarmo = TRUE;
	B_LogEntry (TOPIC_Jan_zloto, "Wygl�da na to, �e Daniela te� irytuje Jan, kt�ry ma obsesj� na punkcie �adnych broni. Proponuje udzia� w �arcie i w zamian za pomoc, b�dzie mnie uczy� g�rnictwa za darmo. Musz� wykopa� troch� gliny ze z�otem i zanie�� to Janowi.");
	Info_ClearChoices (DIA_NASZ_122_Daniel_WhatDoYouMean);
};
	
FUNC VOID DIA_NASZ_122_Daniel_WhatDoYouMean_no()
{
	AI_Output (other, self,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_00"); //Niespecjalnie. Lepiej daj mi bry�ki.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_01"); //Szkoda... Oby orkowa stal nie okaza�a si� trwalsza od �wiec�cych mieczy.
	AI_Output (self, other,"DIA_NASZ_122_Daniel_WhatDoYouMean_no_55_02"); //Trzymaj, dziesi�� bry�ek.

	CreateInvItems (self, ItMi_GoldNugget_Addon, 10);
	B_giveinvitems (self, other, ItMi_GoldNugget_Addon, 10);
	
	B_LogEntry (TOPIC_Jan_zloto, "Daniel da� mi 10 z�otych samorodk�w. Teraz musz� zanie�� je do kowala.");
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
	description = "Jakie� problemy?";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_AnyProblems_15_00"); //Jakie� problemy?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_01"); //Mo�na tak powiedzie�.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_02"); //Zdo�a�em otworzy� krat� do kopalni pe�zaczy. Liczy�em, �e te bestie zdech�y z g�odu, a ja zajm� t� kopalni� i zaczn� eksploatacj�.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_03"); //Nic z tego... Te cholerne paj�czaki �yj� i maj� si� w najlepsze!
	AI_Output (self, other, "DIA_NASZ_122_Daniel_AnyProblems_01_04"); //Je�li ju� pytasz o problemy, to mo�e zechcesz si� ich pozby�? Szczerze m�wi�c, chcia�bym dobra� si� do z��, kt�re tam pozosta�y.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_AnyProblems_15_05"); //Zobacz�, co da si� zrobi�.

	Log_CreateTopic (TOPIC_Daniel_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Daniel_kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Daniel_kopalnia, "Daniel otworzy� krat� do kopalni, ale wewn�trz jest pe�no pe�zaczy. Musz� si� ich pozby�.");

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
	description = "Zaj��em si� pe�zaczami.";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_MineDone_15_00"); //Zaj��em si� pe�zaczami.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_01"); //Du�o ich tam by�o? Czym si� �ywi�y?
	AI_Output (other, self, "DIA_NASZ_122_Daniel_MineDone_15_02"); //Zabi�em ich samca. Zapewne ich przyw�dca dawa� im w jaki� spos�b dost�p do po�ywienia.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_03"); //Widocznie...
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_04"); //Niewa�ne, ruszam opr�ni� grot�!
	AI_Output (self, other, "DIA_NASZ_122_Daniel_MineDone_01_05"); //Prosz�, we� t� mikstur�.
	
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
	B_LogEntry (TOPIC_Daniel_kopalnia, "Daniel poszed� kopa� rud�.");

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
	description = "Nauczysz mnie g�rnictwa?";
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
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_00"); //Nauczysz mnie g�rnictwa?
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Gornictwo_01_01"); //Jasne, ale wtedy b�dziesz mie� wi�cej z�ota.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_02"); //W�a�nie o to chodzi.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Gornictwo_01_03"); //Dobra, ale powiniene� odda� mi jak�� jego cz��.
	AI_Output (other, self, "DIA_NASZ_122_Daniel_Gornictwo_15_04"); //C�...

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Daniel nauczy mnie g�rnictwa.");
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
	description = "Naucz mnie g�rnictwa.";
};

FUNC INT DIA_NASZ_122_Daniel_Training_Condition()
{	
	if (LevelMiner <= 80) && Npc_KnowsInfo (other, DIA_NASZ_122_Daniel_Gornictwo) && (DanielUczyZaDarmo == FALSE)
	{	
		return TRUE;
	};	
};

func void DanielSay_WhereIsGold() {
	AI_Output (self, other, "DanielSay_WhereIsGold_01_00"); //A gdzie z�oto?
};

func void DanielSay_NoExp() {
	AI_Output (self, other, "DanielSay_NoExp_01_00"); //Brak ci do�wiadczenia.
};

func void DanielSay_Train1() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train1_01_00"); //S�uchaj uwa�nie. Trzeba uderza� spokojnie i jednostajnie. Pracuj powoli, ale nie tak, �eby� mi tu mia� usn��.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train1_01_01"); //Nie wal ci�gle w jedno miejsce. Zamiast tego spr�buj wyci�� spory kawa�ek surowca.
};


func void DanielSay_Train2() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_00"); //Ju� wiesz, jak si� kopie. Ale co zrobi�, by wydobywa� wi�cej samorodk�w? To wymaga wi�kszej uwagi.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_01"); //Podczas wyci�gania kilofa z samorodka podkr�� go do g�ry.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train2_01_02"); //Nie b�dzie to proste, ale nauczysz si�.
};


func void DanielSay_Train3() {
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_00"); //Prawdziwi mistrzowie czerpi� wi�cej si�y do uderzenia z odpowiedniego zamachu. Spr�buj odchyli� si� bardziej do ty�u i w praw� stron�.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_01"); //Co wi�cej - bij obiema stronami kilofa. Po kilku uderzeniach jedna si� t�pi, a wtedy druga jest niezast�piona.
	AI_Output (self, other, "DIA_NASZ_122_Daniel_Train3_01_02"); //To wszystko, co mo�na wiedzie� o g�rnictwie. Prawdziw� wiedz� jest wiedza o miejscach do wykopywania.
};

FUNC VOID DIA_NASZ_122_Daniel_Training_Info()
{
	Info_ClearChoices (DIA_NASZ_122_Daniel_Training);
	Info_AddChoice (DIA_NASZ_122_Daniel_Training,DIALOG_BACK, DIA_NASZ_122_Daniel_Training_back);
	
	if(LevelMiner <= 80) && (LevelMiner > 55)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN, 300 szt. z�ota",DIA_NASZ_122_Daniel_Training_mistrz);
	}
	else if(LevelMiner <= 55) && (LevelMiner > 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN, 300 szt. z�ota",DIA_NASZ_122_Daniel_Training_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Zawodowiec (Wymagane 55% g�rnictwa) 10 PN, 200 szt. z�ota",DIA_NASZ_122_Daniel_Training_zawodowiec);
	}
	else if(LevelMiner <= 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN, 300 szt. z�ota",DIA_NASZ_122_Daniel_Training_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Zawodowiec (Wymagane 55% g�rnictwa) 10 PN, 200 szt. z�ota",DIA_NASZ_122_Daniel_Training_zawodowiec);
		Info_AddChoice (DIA_NASZ_122_Daniel_Training,"Kopacz     (Wymagane 30% g�rnictwa) 5  PN, 100 szt. z�ota",DIA_NASZ_122_Daniel_Training_kopacz);
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
			PrintScreen ("G�rnictwo: Mistrz", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(300);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 80% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
			PrintScreen ("G�rnictwo: Zawodowiec", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(200);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 55% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
			PrintScreen ("G�rnictwo: Kopacz", -1, -1, FONT_Screen, 2);
		}
		else
		{
			hero_brakuje_kasy(100);
			DanielSay_WhereIsGold();
		};
	}
	else
	{
		PrintScreen ("Wymagane 30% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
	description = "Naucz mnie g�rnictwa.";
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
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
	}
	else if(LevelMiner <= 55) && (LevelMiner > 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Zawodowiec (Wymagane 55% g�rnictwa) 10 PN",DIA_NASZ_122_Daniel_TrainingFree_zawodowiec);
	}
	else if(LevelMiner <= 30)
	{
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Mistrz      (Wymagane 80% g�rnictwa) 15 PN",DIA_NASZ_122_Daniel_TrainingFree_mistrz);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Zawodowiec (Wymagane 55% g�rnictwa) 10 PN",DIA_NASZ_122_Daniel_TrainingFree_zawodowiec);
		Info_AddChoice (DIA_NASZ_122_Daniel_TrainingFree,"Kopacz     (Wymagane 30% g�rnictwa) 5  PN",DIA_NASZ_122_Daniel_TrainingFree_kopacz);
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
		PrintScreen ("G�rnictwo: Mistrz", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 80% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
		PrintScreen ("G�rnictwo: Zawodowiec", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 55% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
		PrintScreen ("G�rnictwo: Kopacz", -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen ("Wymagane 30% g�rnictwa!", -1, -1, FONT_Screen, 2);
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
