
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
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_304_Bam_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_304_Bam_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_304_Bam_who_55_01"); //Nazywam siê Bam i jestem praw¹ rêk¹ Noda. To ci powinno wystarczyæ.

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
 	description = "Mogê ci w czymœ pomóc?";
};

FUNC INT DIA_NASZ_304_Bam_quest_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_304_Bam_quest_Info()
{
	AI_Output (other,self ,"DIA_NASZ_304_Bam_quest_15_00"); //Mogê ci w czymœ pomóc?
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_01"); //Jeœli chcesz siê na coœ przydaæ, to mo¿esz sprawdziæ co z paladynami i ich rud¹.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_02"); //Od pewnego czasu nie docieraj¹ od nich ¿adne wieœci i ani krzty towaru, który nam obiecali.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_03"); //Co prawda za rudê odpowiedzialni s¹ Frut, Gobby i Rabon, a ja sam nigdy nie widzia³em Marcosa, czyli szefa paladynów, ale zaczynam siê niecierpliwiæ.
	AI_Output (self, other,"DIA_NASZ_304_Bam_quest_55_04"); //Mo¿esz siê zaj¹æ t¹ spraw¹. Chce wiedzieæ, czy praca wre i czemu siê tak oci¹gaj¹ z dostaw¹.
	AI_Output (other, self,"DIA_NASZ_304_Bam_quest_55_05"); //Zajmê siê tym w takim razie.

	Log_CreateTopic (TOPIC_Bam_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_RUNNING);
	
	var string entry_kop;
	entry_kop = "Bandycie Bamowi nie podoba siê brak informacji z kopalni Marcosa. No tak, problem w tym, ¿e pozabija³em wszystkich paladynów. I co tu robiæ? Bandyci nie mog¹ siê dowiedzieæ, ¿e kopalnia pad³a, bo staliby siê bardziej ostro¿ni i niebezpieczni.";
	
	if (hero.guild == GIL_DJG) { B_LogEntry (TOPIC_Bam_kopalnia, ConcatStrings(entry_kop, " Najlepiej zapytam Kerolotha, co o tym myœli i co z tym zrobiæ.")); };
	if (hero.guild == GIL_OUT) { B_LogEntry (TOPIC_Bam_kopalnia, ConcatStrings(entry_kop, " Najlepiej zapytam Gestatha, co o tym myœli i co z tym zrobiæ.")); };
	
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
 	description = "Przynoszê zaleg³¹ dostawê. (20 bry³ek rudy)";
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
	AI_Output (other,self ,"DIA_NASZ_304_Bam_QuestDoneNugget_15_00"); //Przynoszê zaleg³¹ dostawê.
	
	B_GiveInvItems(other,self,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ItMi_Nugget,20);
	
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_01"); //Dwadzieœcia bry³ek? Myœla³em, ¿e bêdzie tego wiêcej, ale dobre i to!
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_02"); //Przynajmniej wiem, ¿e prace nie stoj¹, a w razie czego bêdzie mo¿na ich bardziej przycisn¹æ.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_03"); //Dobra robota. Patrzysz na mnie, jakbyœ liczy³ na to, ¿e coœ dostaniesz, mam racjê?
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestDoneNugget_55_04"); //Przynios³em ci bry³ki, które mog³em zostawiæ dla siebie i powiedzieæ, ¿e paladyni nic mi nie dali. Chyba nale¿y mi siê coœ za lojalnoœæ.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestDoneNugget_55_05"); //Dostanie ci siê coœ, jeœli dop³acisz jeszcze trochê. Za twoj¹ fatygê mogê sprzedaæ ci lepsz¹ zbrojê za wyj¹tkow¹ cenê.
	
	B_GivePlayerXP(400);
	DodajReputacje(10,REP_BANDYCI);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Bam_kopalnia, "Doœæ dobrze mi idzie k³amanie. Bam uwierzy³, ¿e bry³ki s¹ od paladynów i w dodatku mo¿e sprzedaæ mi lepsz¹ zbrojê bandyty po ni¿szej cenie.");
	
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
 	description = "Chyba najlepiej bêdzie, jeœli pójdziesz ze mn¹.";
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
	AI_Output (other,self ,"DIA_NASZ_304_Bam_QuestGoWithMe_15_00"); //Chyba najlepiej bêdzie, jeœli pójdziesz ze mn¹.
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestGoWithMe_55_01"); //Rozmawia³em z Marcosem i powiedzia³, ¿e jeœli nie wierzysz, ¿e prace nadal trwaj¹, to mo¿esz przyjœæ i zobaczyæ to na w³asne oczy. A rudê doœle w odpowiednim czasie.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestGoWithMe_55_02"); //Dobra. Chêtnie zamieniê z nim dwa s³owa. ProwadŸ.

	Npc_ExchangeRoutine(self,"Follow");
	Druzyna(NASZ_304_Bam,1);
	
	B_LogEntry (TOPIC_Bam_kopalnia, "Bam zgodzi³ siê pójœæ ze mn¹. Mam nadziejê, ¿e da siê nabraæ.");
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
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_15_00"); //W koñcu jesteœcie! Dwa bandyckie niedowiarki.
	
	TRIA_Next(Bam);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_01"); //Zbyt d³ugo nie dawaliœcie znaku ¿ycia. O ile pamiêtam, umawialiœmy siê na dziesiêæ bry³ek dziennie.
	AI_ReadyMeleeWeapon(Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_02"); //Za takie opóŸnienia, zaczniemy wam naliczaæ prowizjê. Myœlisz, ¿e komu bardziej zale¿y na naszym uk³adzie? Nam czy wam?
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_03"); //Mamy jeszcze inne mniejsze kopalniê, wiêc mo¿emy prowadziæ wydobycie nawet bez waszego udzia³u, a wy nie dostaniecie nic.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_04"); //To ma siê wiêcej nie powtarzaæ, zrozumiano?
	AI_RemoveWeapon(Bam);
	AI_Output (other, self,"DIA_NASZ_304_Bam_QuestTRIA_55_05"); //A ja osobiœcie przyjdê odebraæ ustalon¹ iloœæ magicznej rudy.

	TRIA_Next(Kjorn);
	AI_TurnToNpc(self,other);
    AI_TurnToNpc(other,self);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_06"); //Nie myœlicie chyba, ¿e ta przerwa w dostawie jest bez przyczyny? Ostatnio jedenemu z nas, zachcia³o siê trochê mocniej ni¿ zwykle przywaliæ pewnemu kopaczowi.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_07"); //Reszta zaœ zaczê³a strajkowaæ i buntowaæ siê. A my nie mogliœmy ich przecie¿ torturowaæ i karaæ, bo ich wydajnoœæ by³aby zerowa.

	TRIA_Next(Bam);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_08"); //I co, teraz sami weŸmiecie kilofy w swe ³apska, by wyrobiæ normy?

	TRIA_Next(Kjorn);
	AI_TurnToNpc(Bam,Kjorn);
    AI_TurnToNpc(Kjorn,Bam);
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_10"); //Spokojnie, przyjacielu. Sytuacja ju¿ jest w normie a kopacze znów zaczêli pracowaæ.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestTRIA_55_11"); //ChodŸcie za mn¹, poka¿ê wam.

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

	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_00"); //Faktycznie, kopacze robi¹, co do nich nale¿y.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_01"); //Wracam do obozu. A ty, Willu, pamiêtaj, ¿eby za jakiœ czas przyjœæ do mnie z dostaw¹ od Marcosa i reszty renegatów.
	AI_Output (self, other,"DIA_NASZ_304_Bam_QuestFinishMine_55_02"); //A poza tym, gdybyœ chcia³ kupiæ lepsz¹ zbrojê, to zajrzyj do mnie.

	Npc_ExchangeRoutine(self,"Start");
	Druzyna(NASZ_304_Bam,0);
	Npc_ExchangeRoutine(NASZ_116_Kjorn,"Kopalnia");
	
	B_GivePlayerXP(400);
	DodajReputacje(10,REP_BANDYCI);
	Log_SetTopicStatus (TOPIC_Bam_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Bam_kopalnia, "Uda³o siê! Bam uwierzy³ w to, co rozegraliœmy i w dodatku od teraz mo¿e sprzedaæ mi lepsz¹ zbrojê bandyty! Co prawda mam za jakiœ czas przynieœæ dostawê, ale jestem pewien, ¿e Bam sam o tym zapomni.");
	
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
	description = "Sprzedaj mi zbrojê. (Ciê¿ki pancerz bandyty: 1000 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_304_Bam_CiezkiPancerz_15_00"); //Sprzedaj mi zbrojê.
	if (npc_hasitems (other, ItMi_Gold) >= 1000) {
		if (RepEnough(80,REP_BANDYCI)) {
			Createinvitems (self, ITNA_BAN_H, 1);
			AI_EquipBestArmor (self);
			B_GiveInvItems (other, self, ItMi_Gold, 1000);
			Npc_RemoveInvItems   (self, ItMi_Gold, 1000);
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_01"); //Proszê bardzo!
			
			Createinvitems (self, ITNA_BAN_H, 1);
			B_Giveinvitems (self, other, ITNA_BAN_H, 1);
			AI_EquipBestArmor (other);
			
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_02"); //Tylko jej nie zbrudŸ. Gdybyœ przypadkiem umar³, bêdzie s³u¿yæ nastêpnym.
			CiezkiPancerzBandytyKupiony = TRUE;
		}
		else {
			PrintMissingRep(80,REP_BANDYCI);
			AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_03"); //Jeszcze nie zas³ugujesz na ten pancerz.
		};
	}
	else {		
		AI_Output (self, other,"DIA_NASZ_304_Bam_CiezkiPancerz_55_04"); //Nie masz doœæ z³ota.
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