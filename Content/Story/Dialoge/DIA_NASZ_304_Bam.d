
var int Bam_Stopowanie;
var int BamNieReagujeNaBrakZbroji;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_EXIT   (C_INFO)
{
	npc         = NASZ_304_Bam;
	nr          = 999;
	condition   = DIA_NASZ_304_Bam_EXIT_Condition;
	information = DIA_NASZ_304_Bam_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_304_Bam_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_304_Bam_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_304_Bam_Obcy		(C_INFO)
{
	npc		 = 	NASZ_304_Bam;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_304_Bam_Obcy_Condition;
	information	 = 	DIA_NASZ_304_Bam_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_304_Bam_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_304_Bam_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_304_Bam_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_304_Bam_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_siema   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 1;
 	condition   = DIA_NASZ_304_Bam_siema_Condition;
 	information = DIA_NASZ_304_Bam_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_304_Bam_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)) && (Bam_Stopowanie == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_304_Bam_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_304_Bam_siema_15_00"); //Tak?
		
};

//*********************************************************************
//	Info Who
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_who   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 2;
 	condition   = DIA_NASZ_304_Bam_who_Condition;
 	information = DIA_NASZ_304_Bam_who_Info;
 	permanent   = FALSE;
 	description = "Kim jeste�?";
};

FUNC INT DIA_NASZ_304_Bam_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_304_Bam_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_304_Bam_who_55_01"); //Nazywam si� Bam i jestem praw� r�k� Noda. To ci powinno wystarczy�.

};

//*********************************************************************
//	Info Quest
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_quest   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_quest_Condition;
 	information = DIA_NASZ_304_Bam_quest_Info;
 	permanent   = FALSE;
 	description = "Mog� ci w czym� pom�c?";
};

FUNC INT DIA_NASZ_304_Bam_quest_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_304_Bam_quest_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_quest_15_00"); //Mog� ci w czym� pom�c?
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_01"); //Je�li chcesz si� na co� przyda�, to mo�esz sprawdzi� co z paladynami i ich rud�.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_02"); //Od pewnego czasu nie docieraj� od nich �adne wie�ci i ani krzty towaru, kt�ry nam obiecali.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_03"); //Co prawda za rud� odpowiedzialni s� Frut, Gobby i Rabon, a ja sam nigdy nie widzia�em Marcosa, czyli szefa paladyn�w, ale zaczynam si� niecierpliwi�.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_04"); //Mo�esz si� zaj�� t� spraw�. Chce wiedzie�, czy praca wre i czemu si� tak oci�gaj� z dostaw�.
	AI_Output (other, self,"DIA_NASZ_304_Bam_quest_55_05"); //Zajm� si� tym w takim razie.

	Log_CreateTopic (TOPIC_Bam_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_RUNNING);
	
	var string entry_kop;
	entry_kop = "Bandycie Bamowi nie podoba si� brak informacji z kopalni Marcosa. No tak, problem w tym, �e pozabija�em wszystkich paladyn�w. I co tu robi�? Bandyci nie mog� si� dowiedzie�, �e kopalnia pad�a, bo staliby si� bardziej ostro�ni i niebezpieczni.";
	
	if (hero.guild == GIL_DJG) { B_LogEntry (TOPIC_Bam_kopalnia, ConcatStrings(entry_kop, " Najlepiej zapytam Kerolotha, co o tym my�li i co z tym zrobi�.")); };
	if (hero.guild == GIL_OUT) { B_LogEntry (TOPIC_Bam_kopalnia, ConcatStrings(entry_kop, " Najlepiej zapytam Gestatha, co o tym my�li i co z tym zrobi�.")); };
	
};

//*********************************************************************
//	Info QuestDoneNugget
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_QuestDoneNugget   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_QuestDoneNugget_Condition;
 	information = DIA_NASZ_304_Bam_QuestDoneNugget_Info;
 	permanent   = FALSE;
 	description = "Przynosz� zaleg�� dostaw�. (20 bry�ek rudy)";
};

FUNC INT DIA_NASZ_304_Bam_QuestDoneNugget_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_BamInfo)
	 || npc_knowsinfo (other, DIA_NASZ_110_Keroloth_InfoBam))
	&& (npc_hasitems (other, ItMi_Nugget) >= 20)
	&& !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_BamLieStart))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_304_Bam_QuestDoneNugget_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_QuestDoneNugget_15_00"); //Przynosz� zaleg�� dostaw�.
	
	B_GiveInvItems(other,self,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ItMi_Nugget,20);
	
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_01"); //Dwadzie�cia bry�ek? My�la�em, �e b�dzie tego wi�cej, ale dobre i to!
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_02"); //Przynajmniej wiem, �e prace nie stoj�, a w razie czego b�dzie mo�na ich bardziej przycisn��.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_03"); //Dobra robota. Patrzysz na mnie, jakby� liczy� na to, �e co� dostaniesz, mam racj�?
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestDoneNugget_55_04"); //Przynios�em ci bry�ki, kt�re mog�em zostawi� dla siebie i powiedzie�, �e paladyni nic mi nie dali. Chyba nale�y mi si� co� za lojalno��.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_05"); //Dostanie ci si� co�, je�li dop�acisz jeszcze troch�. Za twoj� fatyg� mog� sprzeda� ci lepsz� zbroj� za wyj�tkow� cen�.
	
	B_GivePlayerXP(400);
	DodajReputacje(10,REP_BANDYCI);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Bam_kopalnia, "Do�� dobrze mi idzie k�amanie. Bam uwierzy�, �e bry�ki s� od paladyn�w i w dodatku mo�e sprzeda� mi lepsz� zbroj� bandyty po ni�szej cenie.");
	
};


//*********************************************************************
//	Info QuestGoWithMe
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_QuestGoWithMe   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_QuestGoWithMe_Condition;
 	information = DIA_NASZ_304_Bam_QuestGoWithMe_Info;
 	permanent   = FALSE;
 	description = "Chyba najlepiej b�dzie, je�li p�jdziesz ze mn�.";
};

FUNC INT DIA_NASZ_304_Bam_QuestGoWithMe_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_BamLieStart))
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_304_Bam_QuestGoWithMe_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_QuestGoWithMe_15_00"); //Chyba najlepiej b�dzie, je�li p�jdziesz ze mn�.
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestGoWithMe_55_01"); //Rozmawia�em z Marcosem i powiedzia�, �e je�li nie wierzysz, �e prace nadal trwaj�, to mo�esz przyj�� i zobaczy� to na w�asne oczy. A rud� do�le w odpowiednim czasie.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestGoWithMe_55_02"); //Dobra. Ch�tnie zamieni� z nim dwa s�owa. Prowad�.

	Npc_ExchangeRoutine(self,"Follow");
	Druzyna(NASZ_304_Bam,1);
	
	B_LogEntry (TOPIC_Bam_kopalnia, "Bam zgodzi� si� p�j�� ze mn�. Mam nadziej�, �e da si� nabra�.");
	WillIdzieZBamem = TRUE;
	FF_APPLYONCEEXT(QuestZBamem,1000,-1);
};

//*********************************************************************
//	Info QuestTRIA
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_QuestTRIA   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_QuestTRIA_Condition;
 	information = DIA_NASZ_304_Bam_QuestTRIA_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_304_Bam_QuestTRIA_Condition()
{
	if (Npc_GetDistToNPC(self,NASZ_116_Kjorn) < 250)
	&& (WillIdzieZBamem == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_304_Bam_QuestTRIA_Info()
{
	var C_NPC Kjorn; Kjorn = Hlp_GetNpc (NASZ_116_Kjorn);
	var C_NPC Bam; Bam = Hlp_GetNpc (NASZ_304_Bam);
	TRIA_Invite(Kjorn);
	TRIA_Invite(Bam);
    TRIA_Start();
 
	TRIA_Next(Kjorn);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_15_00"); //W ko�cu jeste�cie! Dwa bandyckie niedowiarki.
	
	TRIA_Next(Bam);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_01"); //Zbyt d�ugo nie dawali�cie znaku �ycia. O ile pami�tam, umawiali�my si� na dziesi�� bry�ek dziennie.
	AI_ReadyMeleeWeapon(Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_02"); //Za takie op�nienia, zaczniemy wam nalicza� prowizj�. My�lisz, �e komu bardziej zale�y na naszym uk�adzie? Nam czy wam?
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_03"); //Mamy jeszcze inne mniejsze kopalni�, wi�c mo�emy prowadzi� wydobycie nawet bez waszego udzia�u, a wy nie dostaniecie nic.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_04"); //To ma si� wi�cej nie powtarza�, zrozumiano?
	AI_RemoveWeapon(Bam);
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestTRIA_55_05"); //A ja osobi�cie przyjd� odebra� ustalon� ilo�� magicznej rudy.

	TRIA_Next(Kjorn);
	AI_TurnToNpc(self,other);
    AI_TurnToNpc(other,self);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_06"); //Nie my�licie chyba, �e ta przerwa w dostawie jest bez przyczyny? Ostatnio jedenemu z nas, zachcia�o si� troch� mocniej ni� zwykle przywali� pewnemu kopaczowi.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_07"); //Reszta za� zacz�a strajkowa� i buntowa� si�. A my nie mogli�my ich przecie� torturowa� i kara�, bo ich wydajno�� by�aby zerowa.

	TRIA_Next(Bam);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_08"); //I co, teraz sami we�miecie kilofy w swe �apska, by wyrobi� normy?

	TRIA_Next(Kjorn);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_10"); //Spokojnie, przyjacielu. Sytuacja ju� jest w normie a kopacze zn�w zacz�li pracowa�.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_11"); //Chod�cie za mn�, poka�� wam.

	Npc_ExchangeRoutine(NASZ_116_Kjorn,"KopalniaInside");
	Npc_ExchangeRoutine(self,"Follow2");
	
	TRIA_Next(Bam);
	TRIA_Finish();
};

//*********************************************************************
//	Info QuestFinishMine
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_QuestFinishMine   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_QuestFinishMine_Condition;
 	information = DIA_NASZ_304_Bam_QuestFinishMine_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_304_Bam_QuestFinishMine_Condition()
{
	if (Npc_GetDistToWP(self,"OW_MINE2_04") < 500)
	&& (WillIdzieZBamem == TRUE)
	&& (npc_knowsinfo(other,DIA_NASZ_304_Bam_QuestTRIA))
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_304_Bam_QuestFinishMine_Info()
{
	WillIdzieZBamem = FALSE;
	WillSkonczylQuestaZBamem = TRUE;

	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_00"); //Faktycznie, kopacze robi�, co do nich nale�y.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_01"); //Wracam do obozu. A ty, Willu, pami�taj, �eby za jaki� czas przyj�� do mnie z dostaw� od Marcosa i reszty renegat�w.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_02"); //A poza tym, gdyby� chcia� kupi� lepsz� zbroj�, to zajrzyj do mnie.

	Npc_ExchangeRoutine(self,"Start");
	Druzyna(NASZ_304_Bam,0);
	Npc_ExchangeRoutine(NASZ_116_Kjorn,"Kopalnia");
	
	B_GivePlayerXP(400);
	DodajReputacje(10,REP_BANDYCI);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Bam_kopalnia, "Uda�o si�! Bam uwierzy� w to, co rozegrali�my i w dodatku od teraz mo�e sprzeda� mi lepsz� zbroj� bandyty! Co prawda mam za jaki� czas przynie�� dostaw�, ale jestem pewien, �e Bam sam o tym zapomni.");
	
};


var int CiezkiPancerzBandytyKupiony;
//*********************************************************************
//	Info CiezkiPancerz
//*********************************************************************
INSTANCE DIA_NASZ_304_Bam_CiezkiPancerz   (C_INFO)
{
	npc         = NASZ_304_Bam;
 	nr          = 4;
 	condition   = DIA_NASZ_304_Bam_CiezkiPancerz_Condition;
 	information = DIA_NASZ_304_Bam_CiezkiPancerz_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi zbroj�. (Ci�ki pancerz bandyty: 1000 szt. z�ota)";
};

FUNC INT DIA_NASZ_304_Bam_CiezkiPancerz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_304_Bam_QuestFinishMine))
	&& (CiezkiPancerzBandytyKupiony == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_304_Bam_CiezkiPancerz_Info()
{
	AI_Output (other, self,"DIA_NASZ_304_Bam_CiezkiPancerz_15_00"); //Sprzedaj mi zbroj�.
	if (npc_hasitems (other, ItMi_Gold) >= 1000) {
		if (RepEnough(80,REP_BANDYCI)) {
			Createinvitems (self, ITNA_BAN_H, 1);
			AI_EquipBestArmor (self);
			B_GiveInvItems (other, self, ItMi_Gold, 1000);
			Npc_RemoveInvItems   (self, ItMi_Gold, 1000);
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_01"); //Prosz� bardzo!
			
			Createinvitems (self, ITNA_BAN_H, 1);
			B_Giveinvitems (self, other, ITNA_BAN_H, 1);
			AI_EquipBestArmor (other);
			
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_02"); //Tylko jej nie zbrud�. Gdyby� przypadkiem umar�, b�dzie s�u�y� nast�pnym.
			CiezkiPancerzBandytyKupiony = TRUE;
		}
		else {
			PrintMissingRep(80,REP_BANDYCI);
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_03"); //Jeszcze nie zas�ugujesz na ten pancerz.
		};
	}
	else {		
		AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_04"); //Nie masz do�� z�ota.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_304_Bam_PICKPOCKET (C_INFO)
{
	npc			= NASZ_304_Bam;
	nr			= 900;
	condition	= DIA_NASZ_304_Bam_PICKPOCKET_Condition;
	information	= DIA_NASZ_304_Bam_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_304_Bam_PICKPOCKET_Condition()
{
	C_Beklauen (61);
};
 
FUNC VOID DIA_NASZ_304_Bam_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_304_Bam_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_304_Bam_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_304_Bam_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_304_Bam_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_304_Bam_PICKPOCKET_DoIt);
};

func void DIA_NASZ_304_Bam_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Health_02,3);
	
	Info_ClearChoices (DIA_NASZ_304_Bam_PICKPOCKET);
};
	
func void DIA_NASZ_304_Bam_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_304_Bam_PICKPOCKET);
};