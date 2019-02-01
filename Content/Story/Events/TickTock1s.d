const int oCNpc__CloseDeadNpc = 7744320;
var int Zamek_OneTime;
var int Jaszczuroludzie_1;
var int Jaszczuroludzie_2;
var int Jaszczuroludzie_3;
var int Jaszczuroludzie_4;
var int OrcMieczTeleportedDayOnce;
var int OrcMieczTeleportedNightOnce;
var int STRAZNIK3OneTime;
var int Kap4FunctionRoutineOneTime;
var int KurganDuchOneTime;
var int BraciaFunctionOneTime;
var int RemoveKurganOneTime;
var int WillUciekaZKopalniOneTime;
var int BeliarUderzyl;
var int WartaCz1CreateOneTime;
var int WartaCz1AtakOneTime;
var int WartaCz2CreateOneTime;
var int WartaCz2AtakOneTime;
var int GraveyardLiftOneTime;
var int BramaDoOrkaTickTockOneTime;
var int BramaDoOrkaTickTock2OneTime;
var int BramaDoOrka;
var int WillSayDemonOneTime;
var int WillIdzieZBamemZmienioneOneTime;
var int WillSkonczylQuestaZBamemZmienioneOneTime;
var int BamPancerzeOneTime;
var int BamPancerzeKjornOneTime;
var int BamPancerzeFedOneTime;
var int BamPancerzeFerrosOneTime;
var int ZadanieJehenRozpoczeteOneTime;
var int UdarQuestPatrolNaDoleOneTime;
var int MarcosBiegnieOneTime;
var int Renegat13BiegnieOneTime;
var int Renegat14BiegnieOneTime;
var int Jeremiasz_AlmostDead_NextTo_OneTime;
var int SkeletonJenkinsOneTime;
var int WillUderzylBestieSwiatynnaTeleportOneTime;
var int BestiaSwiatynnaSec;
var int NieznajomySiePojawiaMattOneTime;

//var int StylWalki;
//var int UbranaTrojka;
var int _LevelMiner;
var int TPMolyFirstTime;
var int secCameraEvent;

/*const int GIL_SKELETON					= 31	;
const int GIL_SUMMONED_SKELETON			= 32	;
const int GIL_SKELETON_MAGE				= 33	;*/

func void LukorBook()
{
	if(Npc_HasItems(hero, ItNa_KsiegaLukora))
	{
		if (!Npc_KnowsInfo(hero,DIA_NASZ_027_Ghorim_Lojalnosc))
		{
			RemoveHookF(oCNpc__CloseDeadNpc,5,LukorBook);
			Print("Hmm.. Ta książka może mi się przydać.");
		}
		else
		{
			B_LogEntry (TOPIC_Ghorim_ksiega, "Mam księgę z zapiskami Baala Lukora! Jest tak strasznie zabrudzona, że nie wiem, czy duch coś odczyta. Zobaczymy, to jego problem.");
			RemoveHookF(oCNpc__CloseDeadNpc,5,LukorBook);
		};
	};

};

func void InsertSkeletonJenkins()
{
	if (npc_knowsinfo(hero,DIA_NASZ_130_Jenkins_hello)) && (SkeletonJenkinsOneTime == FALSE) && (!Npc_IsInState(NASZ_130_Jenkins, ZS_TALK)) 
	{
		B_InsertSkeletonsJenkins();
		SkeletonJenkinsOneTime = TRUE;
		ff_remove(InsertSkeletonJenkins);
	};

};

func void SneakHuntingBoost()
{
	if(!ECX) {return;};
	
	var c_npc slf; slf = _^(ECX);
		
	if (slf.guild == GIL_TROLL)
	|| (slf.guild == GIL_SHADOWBEAST)
	|| (slf.guild == GIL_SWAMPSHARK){
	
		if (C_BodyStateContains(hero,BS_STAND)) || (C_BodyStateContains(hero,BS_SNEAK))
		{
			slf.senses = SENSE_HEAR | SENSE_SEE;
		}
		else
		{
			slf.senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
		};	
	};
};
/*func void DisableSave()
{
		
	if (STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice"))) {
	
		if(NpcIsFighting(hero) && CountNpcsInFightMode(hero,slf) >= 1)
		{
			if (PlayerCanSaveGame == TRUE) {
				PlayerCanSaveGame = FALSE;
				EnforceSavingPolicy();
			};		
		}
		
		else 
		{
			if (PlayerCanSaveGame == FALSE) {
				PlayerCanSaveGame = TRUE;
				EnforceSavingPolicy();
			};	
		};
	};

};*/
func void UratujFunc() 
{
	if(!ECX) {return;};
	
	var c_npc slf; slf = _^(ECX);
	
	//Uratuj łowców podczas szturmu
	if (WillIdziePierwszyRazNaZamek  || WillGoToCastle) { ///WarWithOrc_Enabled == TRUE
			if (slf.aivar[aiv_partymember] == true) {
			   if (slf.attribute[0] <= 50) {
					Npc_ClearAIQueue(self);
					AI_StandUp(self);	       
					WarWithOrc_Start(slf);
					// TODO : chyba nie trzeba zmieniac tej rutyny...?
					B_StartOtherRoutine (slf,"Odpoczynek");
				};
			};
		};

};


//*******************
//	GRAVEYARD
//*******************

func void LiftReady()
{
	
	if((WillAndAyanLift == TRUE) && (GraveyardLiftOneTime == FALSE))
	{
		if (Npc_GetDistToWP	(hero, "NASZ_OZYWIENIEC_08") <= 150) && (Npc_GetDistToWP	(NASZ_229_Ayan, "NASZ_OZYWIENIEC_08") <= 200) 
		{
			Npc_ExchangeRoutine (NASZ_229_Ayan, "FollowLift");
			Wld_SendTrigger ("MOVER_LIFT_ORC");
			GraveyardLiftOneTime = TRUE;
			ff_remove(LiftReady);
		};
	};

};

func void TabukStrzelanie()
{
	// ***** ***** ***** ***** *****
	// 		TABUK STRZELANIE
	// ***** ***** ***** ***** *****
	
	if (Tabuk_Tarcza1 == TRUE) 
	&& (Tabuk_Tarcza1_Wystrzelono <= 3)	
	{
		if (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_GRUPA_TARCZA1") < 300) {
			
			PrintScreen ("Stoisz w dobrym miejscu, strzelaj!", 75, 75, FONT_ScreenSmall, 1);
			
			if (GetMunitionAmmount(hero) < Tabuk_HeroMunition) { // tzn, ze wystrzeliles strzale
				Tabuk_HeroMunition = GetMunitionAmmount(hero);
				Tabuk_Tarcza1_Wystrzelono += 1;
			};

		};
	};
	
	if (Tabuk_Tarcza2 == TRUE)
	&& (Tabuk_Tarcza2_Wystrzelono <= 3)
	{		
		if (Npc_GetDistToWP(hero,"ROCKCAMP") < 300) {
			
			PrintScreen ("Stoisz w dobrym miejscu, strzelaj!", 75, 75, FONT_ScreenSmall, 1);
			
			if (GetMunitionAmmount(hero) < Tabuk_HeroMunition) { // tzn, ze wystrzeliles strzale
				Tabuk_HeroMunition = GetMunitionAmmount(hero);
				Tabuk_Tarcza2_Wystrzelono += 1;
			};

		};
	};

};

func void ZadanieJehen()
{
		if (Npc_GetDistToWP (hero, "NASZ_JEHEN_QUEST_06") < 1000) && (ZadanieJehenRozpoczeteOneTime == FALSE) 
		{
			ZadanieJehenRozpoczeteOneTime = TRUE;

			Log_SetTopicStatus (TOPIC_Jehen_poscig, LOG_SUCCESS);
			B_GivePlayerXP(400);
	
			Log_CreateTopic (TOPIC_Jehen_zagubiony, LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Jehen_zagubiony, LOG_RUNNING);
			B_LogEntry (TOPIC_Jehen_zagubiony, "Dziwne, po wyjściu z kopalni nie spotkałem Jehena. Czyżby gdzieś się udał? Z zakrwawioną ręką nie może być daleko. Chyba że porwał go prąd rzeki albo wodospadu? Muszę go jak najszybciej odszukać.");
			ff_remove(ZadanieJehen);

		};

	

};

func void UrShakFinal()
{
	if (/*KAPITEL ==3 &&*/ WillGoToUrshackFinal == FALSE && Npc_GetDistToWP	(hero, "OW_ROCKDRAGON_11") <=2000)  {
		Wld_SendTrigger ("KRATA_URSHACK_SKRYPT");
		GateTwierdza_Close();
		WillGoToUrshackFinal = TRUE;
		
		Migration_InsertTwierdzaOrc();
		Migration_TwierdzaAtak();
		
		B_KillNpc(NASZ_213_Gestath);
		B_KillNpc(NASZ_123_Lowca);
		B_KillNpc(NASZ_108_Lowca);
		
		TwierdzaAtakSick = TRUE; // dzięki temu niektórzy mają mniej HP
		ff_remove(UrShakFinal);
	};

};
//********** **********
	// Uratuj przy zyciu
//********** **********
/*
func void WillIdzieNaZamekFirstTime()
{
	if(FerrosUcieka == true && FedUcieka == true && KurganUcieka == true && HokurnUcieka == true && GodarUcieka == true && KjornUcieka == true) 
	{
		ff_remove(WillIdzieNaZamekFirstTime);
	};
	
	
	if (WillIdziePierwszyRazNaZamek == TRUE) && (NASZ_118_Ferros.attribute[ATR_HITPOINTS] <  150) && (NASZ_118_Ferros.aivar[AIV_PARTYMEMBER]==TRUE) && (FerrosUcieka == FALSE)
	{
		//NASZ_118_Ferros.flags = 2;
		//NASZ_118_Ferros.attribute[ATR_STRENGTH] = 10;
		//AI_StartState 		(NASZ_118_Ferros, ZS_Flee, 0, "");
		//AI_SetNpcsToState (NASZ_118_Ferros, ZS_Uciekanie, 1000);
		//B_StartOtherRoutine (NASZ_118_Ferros,"Odpoczynek");
		
		FerrosUcieka = TRUE;
	};
	

	if (WillIdziePierwszyRazNaZamek == TRUE) && (NASZ_117_Fed.attribute[ATR_HITPOINTS] <  150) && (NASZ_117_Fed.aivar[AIV_PARTYMEMBER]==TRUE) && (FedUcieka == FALSE)
	{
		NASZ_117_Fed.flags = 2;
		NASZ_117_Fed.attribute[ATR_STRENGTH] = 10;
		//AI_StartState 		(NASZ_117_Fed, ZS_Flee, 0, "");
		//AI_SetNpcsToState (NASZ_117_Fed, ZS_Uciekanie, 1000);
		B_StartOtherRoutine (NASZ_117_Fed,"Odpoczynek");
		FedUcieka = TRUE;
	};
	

	if (WillIdziePierwszyRazNaZamek== TRUE) && (NASZ_115_Kurgan.attribute[ATR_HITPOINTS] <  150) && (NASZ_115_Kurgan.aivar[AIV_PARTYMEMBER]==TRUE) && (KurganUcieka == FALSE)
	{
		NASZ_115_Kurgan.flags = 2;
		NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 10;
		//AI_StartState 		(NASZ_115_Kurgan, ZS_Flee, 0, "");
		//AI_SetNpcsToState (NASZ_115_Kurgan, ZS_Uciekanie, 1000);
		B_StartOtherRoutine (NASZ_115_Kurgan,"Odpoczynek");
		KurganUcieka = TRUE;
	};
	

	if (WillIdziePierwszyRazNaZamek == TRUE) && (NASZ_114_Hokurn.attribute[ATR_HITPOINTS] <  150) && (NASZ_114_Hokurn.aivar[AIV_PARTYMEMBER]==TRUE) && (HokurnUcieka == FALSE)
	{
		NASZ_114_Hokurn.flags = 2;
		NASZ_114_Hokurn.attribute[ATR_STRENGTH] = 10;
		//AI_StartState 		(NASZ_114_Hokurn, ZS_Flee, 0, "");
		B_StartOtherRoutine (NASZ_114_Hokurn,"Odpoczynek");
		//AI_SetNpcsToState (NASZ_114_Hokurn, ZS_Uciekanie, 1000);
		HokurnUcieka = TRUE;
	};
	
	if (WillIdziePierwszyRazNaZamek == TRUE) && (NASZ_113_Godar.attribute[ATR_HITPOINTS] <  150) && (NASZ_113_Godar.aivar[AIV_PARTYMEMBER]==TRUE) && (GodarUcieka == FALSE)
	{
		NASZ_113_Godar.flags = 2;
		NASZ_113_Godar.attribute[ATR_STRENGTH] = 10;
		//AI_StartState 		(NASZ_113_Godar, ZS_Flee, 0, "");
		//AI_SetNpcsToState (NASZ_113_Godar, ZS_Uciekanie, 1000);
		B_StartOtherRoutine (NASZ_113_Godar,"Odpoczynek");
		GodarUcieka = TRUE;
	};
	
	if (WillIdziePierwszyRazNaZamek == TRUE) && (NASZ_116_Kjorn.attribute[ATR_HITPOINTS] <  150) && (NASZ_116_Kjorn.aivar[AIV_PARTYMEMBER]==TRUE) && (KjornUcieka == FALSE)
	{
		NASZ_116_Kjorn.flags = 2;
		NASZ_116_Kjorn.attribute[ATR_STRENGTH] = 10;
		
		//AI_StartState 		(NASZ_116_Kjorn, ZS_Flee, 0, "");
		//AI_SetNpcsToState (NASZ_116_Kjorn, ZS_Uciekanie, 1000);
		B_StartOtherRoutine (NASZ_116_Kjorn,"Odpoczynek");
		KjornUcieka = TRUE;
	};
	

};*/

//*******************
//	Zamek Function
//*******************

func void ZamekFunc()
{

	if (WillGoToCastle == TRUE) && (Zamek_OneTime == FALSE) && (WillHasEquippedKostur == TRUE) && (Npc_GetDistToWP	(hero, "NASZ_ZAMEK_PASSAGE") <=500) {


		Wld_SendTrigger ("ZAMEK_BRAMA_1_SKRYPT");
		Wld_SendTrigger ("ZAMEK_BRAMA_2_SKRYPT");
		Zamek_OneTime = TRUE;

		OrcScout_ZamekA.guild = GIL_ORC;
		OrcScout_ZamekB.guild = GIL_ORC;
		OrcWarrior_ZamekA.guild = GIL_ORC;
		OrcWarrior_ZamekB.guild = GIL_ORC;
		OrcElite_ZamekA.guild = GIL_ORC;

		Npc_SetTrueGuild (OrcScout_ZamekA, GIL_ORC);
		Npc_SetTrueGuild (OrcScout_ZamekB, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_ZamekA, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_ZamekB, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_ZamekA, GIL_ORC);

		Migration_GoToScoutHerszt();
		
	};

};

//************************
//	BeforeUrShack Function
//************************

func void BeforeUrShack()
{

	if (WillGoToUrShack == TRUE) && (Npc_GetDistToWP	(hero, "OW_ROCKDRAGON_14") <=200)   {
		OrcShaman_FortA.guild = GIL_ORC;
		OrcShaman_FortB.guild = GIL_ORC;
		OrcShaman_FortC.guild = GIL_ORC;
		OrcWarrior_FortA.guild = GIL_ORC;
		OrcWarrior_FortB.guild = GIL_ORC;
		OrcWarrior_FortC.guild = GIL_ORC;
		OrcWarrior_FortD.guild = GIL_ORC;	
		OrcWarrior_FortE.guild = GIL_ORC;
		OrcWarrior_FortF.guild = GIL_ORC;
		OrcWarrior_FortG.guild = GIL_ORC;
		OrcElite_FortA.guild = GIL_ORC;
		OrcElite_FortB.guild = GIL_ORC;
		
		Npc_SetTrueGuild (OrcShaman_FortA, GIL_ORC);
		Npc_SetTrueGuild (OrcShaman_FortB, GIL_ORC);
		Npc_SetTrueGuild (OrcShaman_FortC, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortA, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortB, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortC, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortD, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortE, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortF, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_FortG, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_FortA, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_FortB, GIL_ORC);
		
		ff_remove(BeforeUrShack);
		
	};

};


func void QuestZBamem()
{
	if(Hlp_IsValidNpc(NASZ_118_Ferros) && WillSkonczylQuestaZBamemZmienioneOneTime == TRUE) && (BamPancerzeFerrosOneTime == FALSE) && (Npc_GetDistToNpc(hero,NASZ_118_Ferros) < 2000) {
		BamPancerzeFerrosOneTime = TRUE;
		Npc_EquipArmor(NASZ_118_Ferros, ITNA_DJG_H);
	};
	

	if(Hlp_IsValidNpc(NASZ_117_Fed) && WillSkonczylQuestaZBamemZmienioneOneTime == TRUE) && (BamPancerzeFedOneTime == FALSE) && (Npc_GetDistToNpc(hero,NASZ_117_Fed) < 2000) {
		BamPancerzeFedOneTime = TRUE;
		Npc_EquipArmor(NASZ_117_Fed, ITNA_DJG_L);
	};
	
	if(Hlp_IsValidNpc(NASZ_116_Kjorn) && WillSkonczylQuestaZBamemZmienioneOneTime == TRUE) && (BamPancerzeKjornOneTime == FALSE) && (Npc_GetDistToNpc(hero,NASZ_116_Kjorn) < 2000) {
		BamPancerzeKjornOneTime = TRUE;
		Npc_EquipArmor(NASZ_116_Kjorn, ITNA_DJG_H);
	};
	if (WillSkonczylQuestaZBamem == TRUE) && (WillSkonczylQuestaZBamemZmienioneOneTime == FALSE) && (C_IsInLowcyTerritory()) {
		WillSkonczylQuestaZBamemZmienioneOneTime = TRUE;
		Bam_Mine_Finish();
	};
	
	if(WillIdzieZBamemZmienioneOneTime == TRUE) && (BamPancerzeOneTime == FALSE) {
		BamPancerzeOneTime = TRUE;
		Bam_Mine_Pancerze();
	};
	
	if (WillIdzieZBamem == TRUE) && (WillIdzieZBamemZmienioneOneTime == FALSE) && (C_IsInKopalniaTerritory()) {
		WillIdzieZBamemZmienioneOneTime = TRUE;
		Bam_Mine_Start();
	};
	
	if (WillSkonczylQuestaZBamem == TRUE) && (WillSkonczylQuestaZBamemZmienioneOneTime == FALSE) && (C_IsInLowcyTerritory()) {
		WillSkonczylQuestaZBamemZmienioneOneTime = TRUE;
		Bam_Mine_Finish();
		ff_remove(QuestZBamem);
	};

};

/*
func void DrugiAtak()
{

	if(VachutUcieka && AyanUcieka && RethonUcieka && KurganUcieka2 && AmmannUcieka)
	{
		ff_remove(DrugiAtak);
	};
	
	if (WillGoToCastle == TRUE) && (NASZ_227_Vachut.attribute[ATR_HITPOINTS] <  150) && (NASZ_227_Vachut.aivar[AIV_PARTYMEMBER]==TRUE) && (VachutUcieka == FALSE)
	{
		NASZ_227_Vachut.flags = 2;
		NASZ_227_Vachut.attribute[ATR_STRENGTH] = 10;
		B_StartOtherRoutine (NASZ_227_Vachut,"Odpoczynek");
		VachutUcieka = TRUE;
	};
	
	if (WillGoToCastle == TRUE) && (NASZ_229_Ayan.attribute[ATR_HITPOINTS] <  150) && (NASZ_229_Ayan.aivar[AIV_PARTYMEMBER]==TRUE) && (AyanUcieka == FALSE)
	{
		NASZ_229_Ayan.flags = 2;
		NASZ_229_Ayan.attribute[ATR_STRENGTH] = 10;
		B_StartOtherRoutine (NASZ_229_Ayan,"Odpoczynek");
		AyanUcieka = TRUE;
	};
	
	if (WillGoToCastle == TRUE) && (NASZ_109_Rethon.attribute[ATR_HITPOINTS] <  150) && (NASZ_109_Rethon.aivar[AIV_PARTYMEMBER]==TRUE) && (RethonUcieka == FALSE)
	{
		NASZ_109_Rethon.flags = 2;
		NASZ_109_Rethon.attribute[ATR_STRENGTH] = 10;
		B_StartOtherRoutine (NASZ_109_Rethon,"Odpoczynek");
		RethonUcieka = TRUE;
	};
	
	if (WillGoToCastle == TRUE) && (NASZ_115_Kurgan.attribute[ATR_HITPOINTS] <  150) && (NASZ_115_Kurgan.aivar[AIV_PARTYMEMBER]==TRUE) && (KurganUcieka2 == FALSE)
	{
		NASZ_115_Kurgan.flags = 2;
		NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 10;
		B_StartOtherRoutine (NASZ_115_Kurgan,"Odpoczynek");
		KurganUcieka2 = TRUE;
	};
	
	if (WillGoToCastle == TRUE) && (NASZ_218_Ammann.attribute[ATR_HITPOINTS] <  150) && (NASZ_218_Ammann.aivar[AIV_PARTYMEMBER]==TRUE) && (AmmannUcieka == FALSE)
	{
		NASZ_218_Ammann.flags = 2;
		NASZ_218_Ammann.attribute[ATR_STRENGTH] = 10;
		B_StartOtherRoutine (NASZ_218_Ammann,"Odpoczynek");
		AmmannUcieka = TRUE;
	};
	
};*/

var int secFilm;

var int secStr;
var int HeroDrankStrPotionOneTime;

var int secDex;
var int HeroDrankDexPotionOneTime;


var int secBDT;
var int HeroDrankBDTPotionOneTime;
var int BDTPotion_PickPocket;
var int BDTPotion_Acrobat;
var int BDTPotion_Sneak;
var int BDTPotion_PickLock;

var int secCheat;
var int HeroDrankCheatPotionOneTime;

var int secOdglosWLesie;
var int secAyanThrow;

var int secXardasOld;


var int MIS_Psikusy_Paczki_Skrzynia_OneTime;

var c_item meleeweap;
var c_item rangedweap;


var int secBronQuest;

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// TP Moly
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
func void TPMoly()
{
	if ((Npc_GetDistToNpc(Follow_Sheep,hero) > 5000) && (MolyMozeSieTepnac == TRUE) && (TPMolyFirstTime == FALSE))
	{
		TPMolyFirstTime = TRUE;
		AI_Teleport(Follow_Sheep,"TOT");
		ff_remove(TPMOLY);
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// Sec Ritual XardasOld
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
func void SecRitualXardasOld()
{


	if (WojownikCieniaPrzyzywa == TRUE) {

		secXardasOld = secXardasOld + 1;

		if (secXardasOld == 4) && (WojownikCieniaPrzyzywaNumer == 0) {
		Wld_InsertNpc	(Shadowbeast_Skeleton_XardasOld,"NASZ_XARDAS_OLD_POKOJ_2_02");
	
		//Wld_PlayEffect("spellFX_DESTROYUNDEAD",  Shadowbeast_Skeleton_XardasOld, Shadowbeast_Skeleton_XardasOld, 0, 0, 0, FALSE );
		secXardasOld = 0;
		WojownikCieniaPrzyzywa = FALSE;
		WojownikCieniaPrzyzywaNumer = 1;
		};

		if (secXardasOld == 4) && (WojownikCieniaPrzyzywaNumer == 1) {
		Wld_InsertNpc	(Draconian_XardasOld,"NASZ_XARDAS_OLD_POKOJ_2_02");
		//Wld_PlayEffect("spellFX_DESTROYUNDEAD",  Shadowbeast_Skeleton_XardasOld, Shadowbeast_Skeleton_XardasOld, 0, 0, 0, FALSE );
		secXardasOld = 0;
		WojownikCieniaPrzyzywa = FALSE;
		WojownikCieniaPrzyzywaNumer = 2;
		};
		
		if (secXardasOld == 4) && (WojownikCieniaPrzyzywaNumer == 2) {
		Wld_InsertNpc	(Dragon_Swamp_XardasOld,"NASZ_XARDAS_OLD_POKOJ_2_02");
		//Wld_PlayEffect("spellFX_DESTROYUNDEAD",  Shadowbeast_Skeleton_XardasOld, Shadowbeast_Skeleton_XardasOld, 0, 0, 0, FALSE );
		secXardasOld = 0;
		WojownikCieniaPrzyzywa = FALSE;
		WojownikCieniaPrzyzywaNumer = 3;
		};
	};
};





//*******************
//	Warta
//*******************
var int WartaKomunikatTimer;

func void Warta()
{
	if (WillStajeNaWarcie == TRUE)
	{
	
		if (WartaCz1CreateOneTime == TRUE) && (WartaCz1AtakOneTime == FALSE)
		{
			WartaCz1AtakOneTime = TRUE;
			WartaCz1Atak();
		};
		
		if (Wld_IsTime (22,50,23,20)) && (WartaCz1CreateOneTime == FALSE)
		{
			WartaCz1CreateOneTime = TRUE;
			WartaCz1Create();
		};
		
		if (WartaCz2CreateOneTime == TRUE) && (WartaCz2AtakOneTime == FALSE)
		{
			WartaCz2AtakOneTime = TRUE;
			WartaCz2Atak();
		};
		
		if (Wld_IsTime (01,20,01,50)) && (WartaCz2CreateOneTime == FALSE)
		{
			WartaCz2CreateOneTime = TRUE;
			WartaCz2Create();
		};

		if (Npc_GetDistToWP	(hero, "OW_DJG_ROCKCAMP_02") > 800) {
			if (WartaKomunikatTimer == 1) {
				PrintScreen	("Wroc na stanowisko!", -1,-1, FONT_ScreenSmall,2);
				WartaKomunikatTimer = WartaKomunikatTimer + 1;
			}
			else if (WartaKomunikatTimer == 6) {
				WartaKomunikatTimer = 0;
			}
			else {
				WartaKomunikatTimer = WartaKomunikatTimer + 1;
			};

		};	
		
		if (Npc_GetDistToWP	(hero, "OW_DJG_ROCKCAMP_02") > 1500) {
			PrintScreen	("Opusciles miejsce warty.", -1,-1, FONT_ScreenSmall,2);
			Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_FAILED);
			B_LogEntry (TOPIC_Mysliwy_Warta, "Mimo przyjętego zadania, poniechałem patrolowanie terenu obozu wypadowego.");
			WillStajeNaWarcie = FALSE;
			ff_remove(WartaScaleTime);
			ff_remove(Warta);
		};	
		
	};
};
// ***** ***** ***** ***** *****
// 			PSIKUSY
// ***** ***** ***** ***** *****
func void Psikusy()
{

	if(MIS_Psikusy_Ready > 0) && (Mob_HasItems("BAN_NIEWOLNICY_CHEST", ItNa_PaczkaZBronia) >= 3)
	
	&&(MIS_Psikusy_Paczki_Skrzynia_OneTime == FALSE) {
		B_LogEntry (TOPIC_Gestath_psikus, "Paczki podłożone.");
		MIS_Psikusy_Paczki_Skrzynia_OneTime = TRUE;
		MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
	};
	
	if(MIS_Psikusy_Ready >= 4) {

		Log_SetTopicStatus (TOPIC_Gestath_psikus, LOG_SUCCESS);
		B_LogEntry (TOPIC_Gestath_psikus, "Wszystko, o co prosił mnie Gestath, już załatwione.");
		B_GivePlayerXP(500);
		
		DodajReputacje(4,REP_MYSLIWI);
		
		MIS_Psikusy_Ready = FALSE;
		MIS_Psikusy_Done = TRUE;
		ff_Remove(Psikusy);
	};

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// BronQuest
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
func void BronQuest()
{

	//pierwsza noc
	if (MIS_BRON_READY == TRUE)
	  && (Wld_IsTime(00,00,02,00))
	  && (PierwszaNocStop == FALSE)
	  && (Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_12")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_13")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_14")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_15"))
	{

		secBronQuest = secBronQuest + 1;

		if (secBronQuest == 6) {
			B_LogEntry (TOPIC_Bron_woda, "Nikogo tu nie ma. Muszę przyjść jutro w nocy.");
			secBronQuest = 0;
			PierwszaNocStop = TRUE;
			BronQuestNoc1Day = Wld_GetDay ();
		};


	};

	//druga noc
	if (MIS_BRON_READY == TRUE)
	  && (Wld_GetDay () > BronQuestNoc1Day)
	  && (Wld_IsTime(00,00,02,00))
	  && (PierwszaNocStop == TRUE)
	  && (DrugaNocStop == FALSE)
	  && (Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_12")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_13")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_14")
	   || Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_LOWCY_TRENING_15"))
	{

		secBronQuest = secBronQuest + 1;

		if (secBronQuest == 6) {
			B_LogEntry (TOPIC_Bron_woda, "Znowu na nikogo się nie natknąłem. Może Bron się pomylił? A może sam zgubił wodę święconą i nie chce się przyznać? Zapytam go rano.");
			secBronQuest = 0;
			DrugaNocStop = TRUE;
		};


	};
	
	
	if (Mob_HasItems ("SKRZYNIA_BRONA", ItNa_ZupaGrzybowa) >= 1) && (TrzeciaNocStop == FALSE)
	{
		B_LogEntry (TOPIC_Bron_woda, "Zupa włożona do skrzyni. Teraz wystarczy zaczaić się w nocy i złapać złodzieja!");
	
		TrzeciaNocStop = TRUE;
		LOWCA_STOP_GADANIE = TRUE;
		B_StartOtherRoutine (NASZ_123_Lowca,"Thief");
		ff_remove(BronQuest);
	};

};

func void StrPotion()
{
	if (HeroDrankStrPotion == TRUE) {
	
		if (HeroDrankStrPotionOneTime == FALSE) {
			hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 50;
			HeroDrankStrPotionOneTime = TRUE;
		};

		secStr = secStr + 1;
	
		if (secStr == 30) {
			hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 50;
			HeroDrankStrPotionOneTime = FALSE;
			HeroDrankStrPotion = FALSE;
			secStr = 0;
			ff_remove(StrPotion);
		};
		
		if (Npc_HasReadiedMeleeWeapon(hero)) {
			meleeweap = Npc_GetReadiedWeapon(hero);	
		}
		else {
			meleeweap = Npc_GetEquippedMeleeWeapon(hero);	
		};
		
		if (meleeweap.cond_value[2] > hero.attribute[ATR_STRENGTH]) {
			B_UnequipMeleeWeapon(hero);
		};
	
	};

};
func void DexPotion()
{
		if (HeroDrankDexPotion == TRUE) {
	
		if (HeroDrankDexPotionOneTime == FALSE) {
			hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] + 50;
			HeroDrankDexPotionOneTime = TRUE;
		};

		secDex = secDex + 1;
	
		if (secDex == 30) {
			hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 50;
			HeroDrankDexPotionOneTime = FALSE;
			HeroDrankDexPotion = FALSE;
			secDex = 0;
			ff_remove(DexPotion);
		};
		
		if (Npc_HasReadiedRangedWeapon(hero)) {
			rangedweap = Npc_GetReadiedWeapon(hero);	
		}
		else {
			rangedweap = Npc_GetEquippedRangedWeapon(hero);	
		};
		
		if (rangedweap.cond_value[2] > hero.attribute[ATR_DEXTERITY]) {
			B_UnequipRangedWeapon(hero);
		};
	
	};

};

func void BDTPotion()
{
	if (HeroDrankBDTPotion == TRUE) {
	
		if (HeroDrankBDTPotionOneTime == FALSE) {
			HeroDrankBDTPotionOneTime = TRUE;
			
			if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
			{ 
				BDTPotion_PickPocket = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKPOCKET, 1);
			};
			if (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == FALSE)
			{ 
				BDTPotion_Acrobat = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_ACROBAT, 1);
			};
			if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
			{ 
				BDTPotion_Sneak = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 1);
			};
			if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == FALSE)
			{ 
				BDTPotion_PickLock = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKLOCK, 1);
			};
			
			
		};

		secBDT = secBDT + 1;
	
		if (secBDT == 30) {
			HeroDrankBDTPotionOneTime = FALSE;
			HeroDrankBDTPotion = FALSE;
			secBDT = 0;
			
			if (BDTPotion_PickPocket == TRUE)
			{ 
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKPOCKET, 0);
				BDTPotion_PickPocket = FALSE;
			};
			
			if (BDTPotion_Acrobat == TRUE)
			{ 
				Npc_SetTalentSkill 	(hero, NPC_TALENT_ACROBAT, 0);
				BDTPotion_Acrobat = FALSE;
			};			
			
			if (BDTPotion_Sneak == TRUE)
			{ 
				Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 0);
				BDTPotion_Sneak = FALSE;
			};
			
			if (BDTPotion_PickLock == TRUE)
			{ 
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKLOCK, 0);
				BDTPotion_PickLock = FALSE;
			};
			ff_remove(BDTPotion);
		};
		

	
	};

};

func void CheatPotion()
{
	if (HeroDrankCheatPotion == TRUE) {
	
		if (HeroDrankCheatPotionOneTime == FALSE) {
			hero.flags = 2;
			HeroDrankCheatPotionOneTime = TRUE;
		};

		secCheat = secCheat + 1;
	
		if (secCheat == 30) {
			hero.flags = 0;
			HeroDrankCheatPotionOneTime = FALSE;
			HeroDrankCheatPotion = FALSE;
			secCheat = 0;
			ff_remove(CheatPotion);
		};

	};

};

func void SpeedRing()
{
	if (WillMaUbranySpeedRing == 1) && (secSpeedRing > 0) {

		secSpeedRing = secSpeedRing - 1;


		if (secSpeedRing == 300) {
		PrintScreen	("Za 5 minut pierścień straci moc", -1,-1, "font_old_20_white.tga",2);
		};

		if (secSpeedRing == 60) {
		PrintScreen	("Za minutę pierścień straci moc", -1,-1, "font_old_20_white.tga",2);
		};
	
		if (secSpeedRing == 0) {
		PrintScreen	("Pierścień stracił moc", -1,-1, "font_old_20_white.tga",2);
		Mdl_RemoveOverlayMDS   (hero,"HUMANS_SPRINT.MDS");
		ff_remove(SpeedRing);
		};
	};


};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// secAyanThrow
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
func void AyanThrow()
{
	if (AyanThrowReady == TRUE) && (Npc_GetDistToWP	(NASZ_229_Ayan, "NASZ_OZYWIENIEC_B") < 1000)
	{

		secAyanThrow = secAyanThrow + 1;

		if (secAyanThrow == 1)
		{
			AI_GotoWP(NASZ_229_Ayan, "NASZ_OZYWIENIEC_ZERO");
		};
		
		if (secAyanThrow == 3)
		{
			AI_PlayAni(NASZ_229_Ayan, "T_THROW");
		};
		
		if (secAyanThrow == 4)
		{
			Wld_InsertItem (ItNa_TeleportOzywieniec, "FP_SPAWN_RUNA_OZYWIENIEC");
		};
		
		if (secAyanThrow == 5)
		{
			AI_GotoWP(NASZ_229_Ayan, "NASZ_OZYWIENIEC_B");
			AyanThrowReady = FALSE;
			ff_remove(AyanThrow);
		};
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// secPrzywrocenieWielkosci
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
func void secPrzywrocenieWielkosci()
{
	if (WillPowiekszony == TRUE)
	{
		secSkaluj = secSkaluj + 1;

		if (secSkaluj == 120)
		{
			WillPowiekszony = FALSE;
			Mdl_SetModelScale(hero,	1.00,	1.00, 	1.00);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("DEM_AMBIENT01"); 
			secSkaluj = 0;
			ff_Remove(secPrzywrocenieWielkosci);
		};

	};	

};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// secCameraEvent
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
var int OrcCity_KamienDoSecondOdsuniety;
func void secCameraEventFunc()
{

	if ((CameraOrcCity_01_Redi == TRUE) && (OrcCity_KamienDoSecondOdsuniety == FALSE))
	{
		secCameraEvent = secCameraEvent + 1;

		if (secCameraEvent == 1)
		{
			Wld_SendTrigger ("CAMERA_ORCCITY_01");
		};
		
		if (secCameraEvent == 3)
		{
			Wld_SendTrigger ("MOVER_ORCCITY_16");
		};
		
		if (secCameraEvent == 4)
		{
			secCameraEvent = 0;
			CameraOrcCity_01_Redi = FALSE;
			OrcCity_KamienDoSecondOdsuniety = TRUE;
		};
		

	};	
};
var int WhichNumberOfPortalSwitch;
func void CameraGoesToPortal()
{	
	if (CameraToPortalGoes == TRUE)
	{
		secCameraEvent = secCameraEvent + 1;

		if (secCameraEvent == 1)
		{
			Wld_SendTrigger ("CAMERA_ORCCITY_PORTAL");
		};
		
		if (secCameraEvent == 6)
		{
			if (WhichNumberOfPortalSwitch == 0) {
				Wld_SendTrigger ("MOVER_ORCCITY_30");
				Wld_SendTrigger ("MOVER_ORCCITY_31");
			};
			
			if (WhichNumberOfPortalSwitch == 1) {
				Wld_SendTrigger ("MOVER_ORCCITY_32");
				Wld_SendTrigger ("MOVER_ORCCITY_33");
			};

			if (WhichNumberOfPortalSwitch == 2) {
				Wld_SendTrigger ("MOVER_ORCCITY_34");
				Wld_SendTrigger ("MOVER_ORCCITY_35");
			};			
		};
		
		if (secCameraEvent == 10)
		{
			WhichNumberOfPortalSwitch = WhichNumberOfPortalSwitch + 1;
			secCameraEvent = 0;
			CameraToPortalGoes = FALSE;
			ff_Remove(CameraGoesToPortal);
		};
		

	};	
	
};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// FILM
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****	
	
func void Film()
{


	if (FilmIdzie == 1) {

		secFilm = secFilm + 1;

		if (secFilm == 1) {
		Npc_ExchangeRoutine (NASZ_110_Keroloth, "Zamek");
		};
		
		
		if (secFilm == 5) {
		Wld_SendTrigger ("KAM_FILM");
		secFilm = 0;
		FilmIdzie = 0;
		};
		
		

	};
	
	if (FilmIdzie == 2) {
	
		secFilm = secFilm + 1;

		if (secFilm == 10) {
			Wld_SendTrigger ("KAM2_FILM");
			secFilm = 0;
			FilmIdzie = 0;
		};
	};
	
	if (FilmIdzie == 3) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("KAM3_FILM");
			secFilm = 0;
			FilmIdzie = 0;
		};
	};
	
	
	if (FilmIdzie == 4) {
	
		secFilm = secFilm + 1;

		if (secFilm == 10) {
			Wld_SendTrigger ("CAMERA_SCENA3");
		};
		
		if (secFilm == 11) {
			OneTimeFunctionNodKlif = TRUE;
			Nod_Stopowanie = TRUE;

			Npc_ExchangeRoutine (NASZ_303_Nod, "Przelacznik");
			Wld_InsertNpc	(DemonLordNASZ,"FP_ROAM_OW_PATH_092_02"); 

			Wld_PlayEffect("SPELLFX_massdeath",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );
			Wld_PlayEffect("SPELLFX_incovation_blue",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );
			Wld_PlayEffect("SPELLFX_lightstar_white",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );

			Wld_SendTrigger ("KAMIEN");

			Wld_InsertNpc	(Skeleton,"FP_ARTEFAKT_SKE_A"); 
			Wld_InsertNpc	(Skeleton,"FP_ARTEFAKT_SKE_B"); 
			Wld_InsertNpc	(Skeleton,"FP_ROAM_OW_PATH_092_01"); 
		};	

	};		
		
	if (FilmIdzie == 5) {
	
		secFilm = secFilm + 1;

		if (secFilm == 18) {
			Wld_SendTrigger ("CAMERA_SCENA4");
			secFilm = 0;
		};
		
		if (secFilm == 1) {
			Npc_ExchangeRoutine (NASZ_221_Benito, "Film2");
			
		};


	};

	if (FilmIdzie == 6) {
	
		secFilm = secFilm + 1;

		if (secFilm == 4) {
			Wld_SendTrigger ("CAMERA_SCENA5");
			secFilm = 0;
			ff_remove(Film);
		};
		


	};
	
};
//*******************
//	WrzodQuestInserting
//*******************
var int WrzodQuestScierwojadOneTime;
var int WrzodQuestKretoszczurOneTime;
var int WrzodQuestKrwiopijcaOneTime;

func void WrzodQuestInserting()
{


	if (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_TARTAK_10") > 5000)
	{
	
		//UWAGA: jeśli zebrałeś potwora, ale nie doprowadziłeś go do WP, to i tak się pojawi potwór i będzie zaliczone zadanie.
		if (QuestWrzodDoprowadzilesScierwojada == TRUE) && (WrzodQuestZabralesScierwojada == 1) && (WrzodQuestScierwojadOneTime == FALSE)
		{
			Wld_InsertNpc	(QuestWrzodScavenger,"NASZ_ZAPALISADA_TARTAK_10");
			WrzodQuestScierwojadOneTime = TRUE;
			ff_Remove(WrzodQuestInserting);
		};
		
		if (QuestWrzodDoprowadzilesScierwojada == TRUE) && (WrzodQuestZabralesScierwojada == 2) && (WrzodQuestScierwojadOneTime == FALSE)
		{
			Wld_InsertNpc	(QuestWrzodScavengerDemon,"NASZ_ZAPALISADA_TARTAK_10");
			WrzodQuestScierwojadOneTime = TRUE;
		};
		
		if (QuestWrzodDoprowadzilesKretoszczura == TRUE) && (WrzodQuestZabralesKretoszczura == TRUE) && (WrzodQuestKretoszczurOneTime == FALSE)
		{
			Wld_InsertNpc	(QuestWrzodMolerat,"NASZ_ZAPALISADA_TARTAK_10");
			WrzodQuestKretoszczurOneTime = TRUE;
		};		
		
		if (QuestWrzodDoprowadzilesKrwiopijce == TRUE) && (WrzodQuestZabralesKrwiopijce == TRUE) && (WrzodQuestKrwiopijcaOneTime == FALSE)
		{
			Wld_InsertNpc	(QuestWrzodBloodfly,"NASZ_ZAPALISADA_TARTAK_10");
			WrzodQuestKrwiopijcaOneTime = TRUE;
		};


	};

};



 
func void _TickTock_1s()
{
	//Print(IntToString(C_IsInMysliwiTerritory()));
	//Print(IntToString(Npc_GetBodyState(hero)));
	//Print(IntToString(WillUsedWheelTwierdza));
	//Print(IntToString(bAllTwierdzaOrcsAreDead()));

	
	// ticktocki w innych plikach
	
	
	ARENA();
	Check_OSIAGNIECIA();
	
	if (!SavingDisabled) { 
		TryToTakeHelmetFromKnight();
	};
	// ----- ----- -----
	/*if !((NpcIsFighting(hero)) && (CountNpcsInFightMode(hero) > 1)) { 
		TryToTakeHelmetFromKnight();
	};
	
	
	if (STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice"))) {
		JusticeModeTickTock();
	};*/
	
	
	// ***** ***** ***** ***** *****
	
	//TODO: dokonczyc zadanie z jeremiaszem  i spaniem
	if (Jeremiasz_AlmostDead == TRUE)
	&& (Jeremiasz_AlmostDead_NextTo_OneTime == FALSE)
	&& (Npc_GetDistToNpc (hero, NASZ_127_Jeremiasz) < 300)
	&& !(Wld_IsTime(00,00,06,00)) // nie jest noc - czyli spi przez dzien
	{
		Jeremiasz_AlmostDead_NextTo_OneTime = TRUE;
		B_LogEntry (TOPIC_Jeremiasz_lek, "Cholera, Jeremiasz leży w łóżku i nie wygląda zbyt dobrze. Może coś mu się stało? Lepiej pogadam o tym z Silasem. Niech wie, że z Jeremiaszem coś się stało.");
	};
	

	if ((Wld_IsTime(20,20,00,00) || Wld_IsTime(00,00,02,45)) && (PhillGraPlaying==FALSE) && (Npc_IsInState(NASZ_104_Engor, ZS_Talk)==FALSE)) {
		B_PhillGraStartMusic();
	}
	
	if ((!(Wld_IsTime(20,20,00,00) || Wld_IsTime(00,00,02,45)) || (Npc_IsInState(NASZ_104_Engor, ZS_Talk))) && (PhillGraPlaying==TRUE)) {
		B_PhillGraStopMusic();
	}
	
	
	if (WillWantToKillRenegats == FALSE)
	{
		if (!C_BodyStateContains(NASZ_009_Marcos, BS_LIE)) && (MarcosBiegnieOneTime == FALSE) && (Npc_GetDistToNpc(NASZ_009_Marcos, hero) < 1100)
		{
			B_Say_Overlay (NASZ_009_Marcos, hero, "$ALARM");	//ALARM!
			Npc_ExchangeRoutine (NASZ_009_Marcos, "Follow");
			MarcosBiegnieOneTime = TRUE;

		};
		
		if (!C_BodyStateContains(NASZ_013_Renegat, BS_LIE)) && (Renegat13BiegnieOneTime == FALSE) && (Npc_GetDistToNpc(NASZ_013_Renegat, hero) < 1100)
		{
			B_Say_Overlay (NASZ_013_Renegat, hero, "$ALARM");	//ALARM!
			Npc_ExchangeRoutine (NASZ_013_Renegat, "Follow");
			Renegat13BiegnieOneTime = TRUE;

		};
		
		if (!C_BodyStateContains(NASZ_014_Renegat, BS_LIE)) && (Renegat14BiegnieOneTime == FALSE) && (Npc_GetDistToNpc(NASZ_014_Renegat, hero) < 1100)
		{
			B_Say_Overlay (NASZ_014_Renegat, hero, "$ALARM");	//ALARM!
			Npc_ExchangeRoutine (NASZ_014_Renegat, "Follow");
			Renegat14BiegnieOneTime = TRUE;

		};
		
		
		var c_item renegat6weapon; renegat6weapon = Npc_GetEquippedMeleeWeapon(hero);
		if (Npc_HasEquippedMeleeWeapon(hero))
		&& (Hlp_GetInstanceID(renegat6weapon) != ItMw_2H_Axe_L_01) // jesli bron ktora masz zalozona to nie kilof
		&& (Renegat06BiegnieOneTime == FALSE)
		&& (Npc_GetDistToNpc(NASZ_006_Renegat, hero) < 1500)
		{
			AI_RunToNPC(NASZ_006_Renegat, hero);
			Renegat06BiegnieOneTime = TRUE;
		};
	};	
	
	
	if (!npc_isdead (OrcScoutHerszt) && !npc_isdead (OrcShamanHerszt) && BramaDoOrka == FALSE && BramaDoOrkaTickTockOneTime == FALSE && Npc_GetDistToWP	(hero, "OC_EBR_ENTRANCE") <=300) 
	{
		B_LogEntry (TOPIC_Keroloth_Wojna, "Dowódca zamku zamknął się... Jak wybijemy wszystkich orków, to z pewnością stanie sam do walki!");
		Wld_SendTrigger ("MOVER_GATE_SZEF_ZAMEK");
		BramaDoOrka = TRUE;
		BramaDoOrkaTickTockOneTime = TRUE;

	};
	
	if (BramaDoOrka == TRUE) && (BramaDoOrkaTickTock2OneTime == FALSE) && (npc_isdead (OrcScoutHerszt)) && (npc_isdead (OrcShamanHerszt))
	{
		Wld_SendTrigger ("MOVER_GATE_SZEF_ZAMEK");
		BramaDoOrka = FALSE;
		BramaDoOrkaTickTock2OneTime = TRUE;	
	
	};
	
	
	if (Npc_GetDistToWP	(hero,"NASZ_DYMOONDO_D") < 1500) && (WillKnowAboutWayToOrc == FALSE) {
		WillKnowAboutWayToOrc = TRUE;
		AI_Output (hero ,hero,"DIA_Will_Dymoondo_15_00"); //A więc da się tutaj dostać...

	};
	
	if (Npc_GetDistToWP (hero,"LOCATION_15_IN_2") < 1000) && (UdarQuestPatrolNaDoleOneTime == FALSE) && (UdarQuestPatrolStart == TRUE) {
		UdarQuestPatrolNaDoleOneTime = TRUE;
		B_LogEntry(TOPIC_Udar_patrol,"Jaskinia jest pusta, brakuje też śladów walki tak więc na pewno nie zostali zaatakowani. Może kryją się na płaskowyżu nad tą jaskinią?");
		Wld_InsertNpc(NASZ_129_Matt,"OW_HOSHPAK_03");
	};
	
	
	if (WillUderzylBestieSwiatynna == TRUE) && (WillUderzylBestieSwiatynnaTeleportOneTime == FALSE) {
		BestiaSwiatynnaSec += 1;
		
		if (BestiaSwiatynnaSec >= 3) {
			WillUderzylBestieSwiatynnaTeleportOneTime = TRUE;
			
			AI_Teleport(NASZ_129_Matt,"NASZ_WP_MATT_MOUNT_1");
			Wld_PlayEffect("spellFX_Teleport_RING",NASZ_129_Matt,NASZ_129_Matt,0,0,0,FALSE);
			Snd_Play ("MFX_TELEPORT_CAST");
			
			B_StartOtherRoutine(NASZ_129_Matt,"Mountain");
			Npc_ClearAIQueue(NASZ_129_Matt);
		};
	
	};
	
	
	if (Npc_GetDistToWP	(hero, "OW_PATH_186") <=3000) && (WillKnowAboutTwierdza == FALSE) {
	WillKnowAboutTwierdza = TRUE;
	AI_Output (hero ,hero,"DIA_Will_Twierdza_15_00"); //A cóż to za twierdza? Potężna budowla...
	};
	
	if (Npc_GetDistToWP	(hero, "NASZ_ZAZAMKIEM_3") <=1750) && (WillKnowAboutTwierdza == FALSE) && (WillSayDemonOneTime == FALSE) {
	WillKnowAboutDemonPosag = TRUE;
	WillSayDemonOneTime = TRUE;
	AI_Output (hero ,hero,"DIA_Will_DemonPosag_15_00"); //Tamten posąg jakiegoś demona wydaje się być przepełniony czarną magią.
	};
	
	if (Npc_GetDistToWP	(hero, "NASZ_BANDYCI_WODOSPAD_09") <=150) && (KAPITEL == 1) {
	AI_Output (hero ,hero,"DIA_Will_Wodospad_15_00"); //To zły pomysł. Tam może być niebezpiecznie.
	AI_TurnAway (hero, hero);
	AI_GotoWP (hero, "NASZ_BANDYCI_WODOSPAD_10");
	};

	if (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_SCIEZKA_5") <=800) && (KAPITEL == 4) && (WillIdzieZaPalisade == FALSE) {
		AI_Output (hero ,hero,"DIA_Will_Zapalsada_15_00"); //Lepiej załatwię jeszcze kilka spraw, zanim udam się za palisadę.
		AI_TurnAway (hero, hero);
		AI_GotoWP (hero, "OW_ORCBARRIER_17");
	};

	
	if (Npc_GetDistToWP	(hero, "NASZ_FORTECA_BLOKADA") <=200) && (WillGoToUrShack == FALSE) {
	AI_Output (hero ,hero,"DIA_Will_Forteca_15_00"); //Nie mam ochoty się tam wybierać.
	AI_TurnAway (hero,hero);
	AI_GotoWP (hero, "LOCATION_19_03_PATH_RUIN17");
	};
	
	if (Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_KOPALNIA_NOWY_08")) && (WillUciekaZKopalniOneTime == FALSE) {
	AI_Output (hero ,hero,"DIA_Will_KopalniaUcieka_15_00"); //Rzeczywiscie, udało się wspiąć na skały. Teraz na dół!
	WillUciekaZKopalniOneTime = TRUE;
	};
	
	if (npc_hasitems(hero,ItNa_RytualneOstrze)>=1) && (npc_hasitems(hero,ItNa_Matt_Kartka)>=1) && (NieznajomySiePojawiaMattOneTime == FALSE) {
		NieznajomySiePojawiaMattOneTime = TRUE;
		AI_Teleport(NASZ_021_Nieznajomy,"NASZ_MATT_DEAD_2");
		B_StartOtherRoutine(NASZ_021_Nieznajomy,"Matt");
	};
	
	
	
	if (KAPITEL >= 2) && (TedIsSick == TRUE) {
	NASZ_231_Ted.attribute	[ATR_HITPOINTS]	= 40;
	};	

	if (STRAZNIK3 == TRUE) && (STRAZNIK3OneTime == FALSE) {
	Wld_PlayEffect ("spellFX_RingRitual1", hero, hero, 0, 0, 0, FALSE);
	B_KillNPC (hero);
	STRAZNIK3OneTime = TRUE;
	};	

	
	if (Kurgan_walka==5) && (NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (RemoveKurganOneTime == FALSE)
	{	
		AI_Teleport (NASZ_401_Kurgan, "TOT"); 
		B_StartOtherRoutine (NASZ_401_Kurgan,"End");

		Snd_Play ("MFX_GhostVoice"); 
		Snd_Play ("MFX_Firestorm_Cast"); 
		RemoveKurganOneTime = TRUE;

	};
	
	if (npc_hasitems (hero, ItNa_AmuletZRudy) >=1) && (BraciaMissionReady == TRUE) && (BraciaFunctionOneTime == FALSE) {
		Wld_InsertNpc (Zombie01, "FP_NASZ_ZOMBIE_BRAT_1");
		Wld_InsertNpc (Zombie01, "FP_NASZ_ZOMBIE_BRAT_2");
		Wld_InsertNpc (Zombie01, "FP_NASZ_ZOMBIE_BRAT_3");
		Wld_InsertNpc (Zombie01, "FP_NASZ_ZOMBIE_BRAT_4");
		Wld_InsertNpc (Zombie01, "FP_NASZ_ZOMBIE_BRAT_5");
		BraciaFunctionOneTime = TRUE;
	};

	//*******************
	//	XardasOldZombieKill
	//*******************

	if (ZombieKillCounter > 0)
	{	
		if (ZombieKillCounter == 5) { KillZombiesXardasOld5(); }
		else if (ZombieKillCounter == 4) { KillZombiesXardasOld4(); }
		else if (ZombieKillCounter == 3) { KillZombiesXardasOld3(); }
		else if (ZombieKillCounter == 2) { KillZombiesXardasOld2(); }
		else if (ZombieKillCounter == 1) { KillZombiesXardasOld1(); };

	};
	

	if (Npc_GetDistToWP	(hero, "OW_ICEREGION_05") <=200) && (WillGoToIceregion == FALSE) {
		AI_Output (hero ,hero,"DIA_Will_Iceregion_15_00"); //Na tym terenie jest zbyt niebezpiecznie.
		AI_TurnAway (hero,hero);
		AI_GotoWP (hero, "OW_ICEREGION_ENTRANCE");
	};
	
	
	
	if (KAPITEL < 4) && (TwierdzaAtakSick == TRUE) {
	NASZ_118_Ferros.attribute	[ATR_HITPOINTS]	= 40;
	NASZ_216_Aran.attribute		[ATR_HITPOINTS]	= 60;
	NASZ_101_Korth.attribute	[ATR_HITPOINTS]	= 80;
	NASZ_117_Fed.attribute		[ATR_HITPOINTS]	= 70;
	NASZ_215_Kivo.attribute		[ATR_HITPOINTS]	= 50;
	NASZ_112_Peter.attribute	[ATR_HITPOINTS]	= 30;

	};	

	
	//*******************
	//	Jaszczuroludzie
	//*******************

	if (Npc_GetDistToWP	(hero, "OW_ICEREGION_37") <=500) && (Jaszczuroludzie_1 == FALSE) && (Jaszczuroludzie_1 == FALSE) {
	Jaszczuroludzie_1 = TRUE;
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_00"); //Cholera, zamknięte. Będę musiał jakoś obejść tę bramę.
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Natrafiłem na zamkniętą bramę. Muszę jakoś ją obejść.");
	};

	if ((Npc_GetDistToWP	(hero, "OW_ICEREGION_96") <=800) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_97") <=800) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_98") <=500)) && (Jaszczuroludzie_2 == FALSE) {
	Jaszczuroludzie_2 = TRUE;
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_01"); //Przedostałem się do środka. Co dalej?
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Jestem w środku. Teraz pozostają poszukiwania. Benito radził mi iść wzdłuż gór.");
	};
		
	if ((Npc_GetDistToWP	(hero, "OW_ICEREGION_53") <=1200) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_61") <=1200)) && (Jaszczuroludzie_3 == FALSE) {
	Jaszczuroludzie_3 = TRUE;
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_02"); //Tam, u źródła wodospadu jest jakaś jaskinia. Ciekawe...
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Dostrzegłem jakąś jaskinię na górze wodospadu. Muszę spróbować się tam dostać.");
	};
	
	if ((Npc_GetDistToWP	(hero, "NASZ_PROOF_ORC") <=1200) && (Jaszczuroludzie_4 == FALSE)) {
	Jaszczuroludzie_4 = TRUE;
	AI_Output (hero ,hero,"DIA_Will_Jaszczuroludzie_15_03"); //Skrzyżowane miecze!
	B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Znalazłem skrzyżowane miecze jaszczuroludzi i orków. To chyba wystarczający dowód na to, że zawarli sojusz... Pora powiedzieć o tym Benito.");
	WillFoundSwordsOrcAndDraconian = TRUE;
	B_GivePlayerXP(300);
	};
	
	
	
	//*******************
	//	XARDAS OLD ARENA
	//*******************
	if (BeliarUderzyl == FALSE) && (HeroMozeWchodzicXardasOld == FALSE) && (Npc_GetDistToWP	(hero, "NASZ_XARDAS_OLD_POKOJ_2_02") <=3000)
		&& ((Npc_GetDistToPlayer (NASZ_431_ZombieXardasOld01) < 100) || (Npc_GetDistToPlayer (NASZ_432_ZombieXardasOld02) < 100)
		|| (Npc_GetDistToPlayer (NASZ_433_ZombieXardasOld03) < 100) || (Npc_GetDistToPlayer (NASZ_434_ZombieXardasOld04) < 100)
		|| (Npc_GetDistToPlayer (NASZ_435_ZombieXardasOld05) < 100) || (Npc_GetDistToPlayer (NASZ_436_ZombieXardasOld06) < 100)
		|| (Npc_GetDistToPlayer (NASZ_437_ZombieXardasOld07) < 100) || (Npc_GetDistToPlayer (NASZ_438_ZombieXardasOld08) < 100)
		|| (Npc_GetDistToPlayer (NASZ_439_ZombieXardasOld09) < 100) || (Npc_GetDistToPlayer (NASZ_440_ZombieXardasOld10) < 100)
		|| (Npc_GetDistToPlayer (NASZ_441_ZombieXardasOld11) < 100) || (Npc_GetDistToPlayer (NASZ_442_ZombieXardasOld12) < 100)
		|| (Npc_GetDistToPlayer (NASZ_443_ZombieXardasOld13) < 100) || (Npc_GetDistToPlayer (NASZ_444_ZombieXardasOld14) < 100)
		|| (Npc_GetDistToPlayer (NASZ_445_ZombieXardasOld15) < 100) || (Npc_GetDistToPlayer (NASZ_446_ZombieXardasOld16) < 100)
		|| (Npc_GetDistToPlayer (NASZ_447_ZombieXardasOld17) < 100) || (Npc_GetDistToPlayer (NASZ_448_ZombieXardasOld18) < 100)
		|| (Npc_GetDistToPlayer (NASZ_449_ZombieXardasOld19) < 100) || (Npc_GetDistToPlayer (NASZ_450_ZombieXardasOld20) < 100)
		|| (Npc_GetDistToPlayer (NASZ_429_WojownikCienia) < 100) || (Npc_GetDistToWP	(hero, "NASZ_XARDAS_OLD_POKOJ_2_04") <=500))  {

		B_KillNpc(hero);
		BeliarUderzyl = TRUE;
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		
	};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// secOglosy
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
	var int RandomOdglosy;
	if (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_23") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_37") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_40") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_14") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_10") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_03") <=10000)
	|| (Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_LAS_21") <=10000)

	{

		secOdglosWLesie = secOdglosWLesie + 1;

		if (secOdglosWLesie == 30) {
		
			RandomOdglosy = Hlp_Random (5);
			
			if (RandomOdglosy == 4)
			{
				Snd_Play ("SVM_1_BERZERK");
				secOdglosWLesie = 0;
			}
			
			else if (RandomOdglosy == 3)
			{
				Snd_Play ("SVM_2_BERZERK");
				secOdglosWLesie = 0;
			}
			
			else if (RandomOdglosy == 2)
			{
				Snd_Play ("SVM_3_BERZERK");
				secOdglosWLesie = 0;
			}
			
			else if (RandomOdglosy == 1)
			{
				Snd_Play ("ZOMBIE_01");
				secOdglosWLesie = 0;
			}
			
			else
			{
				secOdglosWLesie = 0;
			};
		
		};
	};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// LevelMiner
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****	
	if(!_LevelMiner)
	{
		if(LevelMiner==20) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 1); }
		else if(LevelMiner==25) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 2); }
		else if(LevelMiner==30) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 3); }
		else if(LevelMiner==40) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 4); }
		else if(LevelMiner==45) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 5); }
		else if(LevelMiner==50) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 6); }
		else if(LevelMiner==55) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 7); }
		else if(LevelMiner==65) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 8); }
		else if(LevelMiner==70) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 9); }
		else if(LevelMiner==75) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 10); }
		else if(LevelMiner==80) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 11); }
		else if(LevelMiner==90) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 12); }
		else if(LevelMiner==95) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 13); }
		else if(LevelMiner==100) { Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 14); _LevelMiner = true; };
	};

};
 
 
func void TickTock_1s()
{
	_TickTock_1s();

};

//********** **********
// Sludzy Beliara / ORCCITY FOG
//********** **********

func void SludzyBeliara()
{	
	if (((Npc_GetDistToPlayer (NASZ_415_SlugaBeliara) < 2000) || (Npc_GetDistToPlayer (NASZ_416_SlugaBeliara) < 2000) || (Npc_GetDistToPlayer (NASZ_417_SlugaBeliara) < 2000)
		&& ((!npc_isdead (NASZ_415_SlugaBeliara)) || (!npc_isdead (NASZ_416_SlugaBeliara)) || (!npc_isdead (NASZ_417_SlugaBeliara)))) || (Npc_GetDistToWP (hero, "NASZ_ORCCITY_SECOND_06") < 3000))
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 15;
		Wld_PlayEffect("spellFX_BreathOfDeath_Target",  hero, hero, 0, 0, 0, FALSE );
		
	};
	
	if(npc_isdead (NASZ_415_SlugaBeliara) && npc_isdead (NASZ_416_SlugaBeliara) && npc_isdead (NASZ_417_SlugaBeliara))
	{
	ff_remove(SludzyBeliara);
	};

};



func void Regeneracja()
{
/*	if (OrcMieczRunning == TRUE) {
		if (Wld_IsTime (04,10,00,20)) {
			if (OrcMieczTeleportedNightOnce == FALSE) && (Npc_GetDistToNpc (hero, NASZ_451_OrkMiecz) > 1500) {
				AI_Teleport (NASZ_451_OrkMiecz, "TOT");
				OrcMieczTeleportedNightOnce = TRUE;
				OrcMieczTeleportedDayOnce = FALSE;
				//PrintScreen	("ORK W TOT", -1,-1, "font_old_20_white.tga",2);

			};
		}

		else {
			if (OrcMieczTeleportedDayOnce == FALSE) && (Npc_GetDistToNpc (hero, NASZ_451_OrkMiecz) > 1500) {
				AI_Teleport (NASZ_451_OrkMiecz, "NASZ_MIECZ_6");
				OrcMieczTeleportedDayOnce = TRUE;
				OrcMieczTeleportedNightOnce = FALSE;
				//PrintScreen	("ORK W MIECZ", -1,-1, "font_old_20_white.tga",2);
			};
		};
	};
*/	if(MEM_Game.pause_screen)
	{
		return;
	};
	//Regeneracja
   if (hero.attribute[ATR_HITPOINTS] > 0 && !HasHeroPosion())
   {
	
	  if (level_regeneracji == 1)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 1;
	  };
	  if (level_regeneracji == 2)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 2;
		  hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 1;
	  };
	  if (level_regeneracji == 3)
	  {
		  hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 3;
		  hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 2;
		  hero.exp = hero.exp + 1;
	  };
	  if (hero.attribute[ATR_HITPOINTS]>hero.attribute[ATR_HITPOINTS_max])
	  {
			hero.attribute[ATR_HITPOINTS]=hero.attribute[ATR_HITPOINTS_max];
	  };
	  if (hero.attribute[ATR_MANA]>hero.attribute[ATR_MANA_max])
	  {
			hero.attribute[ATR_MANA]=hero.attribute[ATR_MANA_max];
	  };
   };
    
	
};


var int MonastirOpenGateOneTime;
var int MonastirGateFirst;
var int LastRitualCounter;
var int Jeremiasz_AlmostDead_OneTime;
 	//********** **********
	// Function30s
	//********** **********

func void MonsairOpenGate()
{
	
	if (MonastirIsGoingToOpenGate == TRUE) && (MonastirOpenGateOneTime == FALSE) 
	{

		if (MonastirGateFirst == 0) {
		
		MonastirGateFirst = 1;
		
		}
		
		else {
		
		WillMozePrzejscPrzezBariere = TRUE;
		
		Wld_SendTrigger ("ORCTOWN_MOVER_01_SCRIPT");
		Wld_SendTrigger ("ORCTOWN_MOVER_02_SCRIPT");
		Wld_SendTrigger ("ORCTOWN_MOVER_03_SCRIPT");
		//Wld_SendTrigger ("ORCTOWN_MOVER_04_SCRIPT"); // tu jest jakiś błąd...
		Wld_SendTrigger ("ORCTOWN_MOVER_05_SCRIPT");
		Wld_SendTrigger ("ORCTOWN_MOVER_06_SCRIPT");
		Wld_SendTrigger ("ORCTOWN_MOVER_07_SCRIPT");

		Wld_InsertNpc	(NASZ_418_Duch,"FP_ORCTOWN_01");
		Wld_InsertNpc	(NASZ_419_Duch,"FP_ORCTOWN_02");
		Wld_InsertNpc	(NASZ_420_Duch,"FP_ORCTOWN_03");
		Wld_InsertNpc	(NASZ_421_Duch,"FP_ORCTOWN_04");
		Wld_InsertNpc	(NASZ_422_Duch,"FP_ORCTOWN_05");
		Wld_InsertNpc	(NASZ_423_Duch,"FP_ORCTOWN_06");
		Wld_InsertNpc	(NASZ_424_Duch,"FP_ORCTOWN_07");
		Wld_InsertNpc	(NASZ_425_Duch,"FP_ORCTOWN_08");
		Wld_InsertNpc	(NASZ_426_Duch,"FP_ORCTOWN_09");
		Wld_InsertNpc	(NASZ_427_Duch,"FP_ORCTOWN_10");

		MonastirOpenGateOneTime = TRUE;
		ff_remove(MonsairOpenGate);
		MonastirIsGoingToOpenGate = FALSE;
		Npc_ExchangeRoutine (NASZ_010_Monastir, "Gate");
	
		Wld_PlayEffect("SPELLFX_massdeath",  NASZ_010_Monastir, NASZ_010_Monastir, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  NASZ_010_Monastir, NASZ_010_Monastir, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  NASZ_010_Monastir, NASZ_010_Monastir, 0, 0, 0, FALSE );
	
		};
	};
};

func void LastRitualFunc()
{
	if (LastRitual == TRUE) {

		LastRitualCounter = LastRitualCounter + 1;

		if (LastRitualCounter > 2) {
			LastRitual = FALSE;
			LastRitualCounter = 0;

			//Wld_PlayEffect("SPELLFX_massdeath",  NASZ_402_Innos, NASZ_402_Innos, 0, 0, 0, FALSE );
			//Wld_PlayEffect("SPELLFX_incovation_blue",  NASZ_402_Innos, NASZ_402_Innos, 0, 0, 0, FALSE );
			//Wld_PlayEffect("SPELLFX_lightstar_white",  NASZ_402_Innos, NASZ_402_Innos, 0, 0, 0, FALSE );
		
			Wld_PlayEffect("Spellfx_Lightningflash_Heavensrage",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
			//Wld_PlayEffect("Spellfx_Lightstar_Orange",  "FP_CEREMONIA_FINAL", "FP_CEREMONIA_FINAL", 0, 0, 0, FALSE );
			
			Npc_ExchangeRoutine (NASZ_010_Monastir, "Kap5GoTo");
			PoRytualeMonastirBiegnie = TRUE;

			AI_Teleport(NASZ_402_Innos,"TOT");
			AI_Teleport(NASZ_403_Adanos,"TOT");
			AI_Teleport(NASZ_404_Beliar,"TOT");

			B_StartOtherRoutine (NASZ_402_Innos, "Teleported");
			B_StartOtherRoutine (NASZ_403_Adanos, "Teleported");
			B_StartOtherRoutine (NASZ_404_Beliar, "Teleported");
			
			Wld_SendTrigger ("MOVER_ORCCITY_ENTRANCE");
			KoniecGryOk = TRUE;
			ff_remove(LastRitualFunc);
		};
	};

};
	
func void Function30s()
{	
	if (!npc_isdead (Wisp_Boss) && Npc_GetDistToNpc (hero, Wisp_Boss) < 500)  {
		Wld_InsertNpc	(Gobbo_Skeleton,"FP_ROAM_OW_LURKER_NC_LAKE_03");
	};
	//TODO: Ogarnąć to z Jeremiaszem
	if (TimeIsUp(-1,3,JeremiaszAlmostDeadDay,JeremiaszAlmostDeadHour)) // 3h
	&& (Jeremiasz_AlmostDead_OneTime == FALSE)
	{
		B_StartOtherRoutine(NASZ_127_Jeremiasz,"AlmostDead");
		Jeremiasz_AlmostDead_OneTime = TRUE;
		Jeremiasz_AlmostDead = TRUE;
	};
};

//********** **********
// Function15s
//********** **********
func void summon()
{
	if (!(npc_isdead (Ozywieniec)) && Npc_GetDistToNpc (hero, Ozywieniec) < 750) && (Npc_GetDistToWP (hero, "NASZ_OZYWIENIEC_40") < 2000) {
		Wld_InsertNpc	(Zombie0exp,"FP_NASZ_OZYWIENIEC_ZOMBIE1");
	 	Wld_PlayEffect("spellFX_Teleport_RING",  Zombie0exp  , Zombie0exp	, 0, 0, 0, FALSE );
		Wld_InsertNpc	(Zombie0exp,"FP_NASZ_OZYWIENIEC_ZOMBIE2");
	 	Wld_PlayEffect("spellFX_Teleport_RING",  Zombie0exp  , Zombie0exp	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		//ff_remove w DIA_NASZ_010_Monastir_summoned 
	}; 
};
	

func void Function15s()
{
	if (!(npc_isdead (NASZ_550_Straznik)) && Npc_GetDistToNpc (hero, NASZ_550_Straznik) < 750) && (Npc_GetDistToWP (hero, "NASZ_ORCCITY_PORTAL_17") < 2000) && (FinalBattleStarted == TRUE) {
		AI_PlayAni(NASZ_550_Straznik, "T_WARN");
		Wld_InsertNpc	(Skeleton_Lord,"FP_PORTAL_WARRIOR");
	 	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Skeleton_Lord  , Skeleton_Lord	, 0, 0, 0, FALSE );
		Wld_InsertNpc	(Skeleton_Lord,"FP_PORTAL_WARRIOR2");
	 	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Skeleton_Lord  , Skeleton_Lord	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");

	}; 
	

};