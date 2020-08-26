const int oCNpc__CloseDeadNpc = 7744320;
const int oCNpc__OpenDeadNpc = 7743856;
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
var int SkeletonJenkinsOneTime;
var int WillUderzylBestieSwiatynnaTeleportOneTime;
var int BestiaSwiatynnaSec;
var int NieznajomySiePojawiaMattOneTime;
var int WillWodospadTimerNiebezpiecznie;
//var int StylWalki;
//var int UbranaTrojka;
var int _LevelMiner;
var int TPMolyFirstTime;
var int secCameraEvent;
var int lukorOneTime;
var int IsOpenedDeadNpc;

func void CloseDeadNpc()
{
	if(ECX != MEM_ReadInt(_hero)) {return;};
	
	if(!lukorOneTime)
	{
		if(Npc_HasItems(hero, ItNa_KsiegaLukora))
		{
			if (!Npc_KnowsInfo(hero,DIA_NASZ_027_Ghorim_Lojalnosc))
			{
				Print("Hmm.. Ta ksi¹¿ka mo¿e mi siê przydaæ.");
			}
			else
			{
				B_LogEntry (TOPIC_Ghorim_ksiega, "Mam ksiêgê z zapiskami Baala Lukora! Jest tak strasznie zabrudzona, ¿e nie wiem, czy duch coœ odczyta. Zobaczymy, to jego problem.");
			};
			ff_applyoncedata(BlackScreen2,1000);
			lukorOneTime = 1;
			NASZ_029_Lukor.attribute[0] = NASZ_029_Lukor.attribute[1];
			Npc_ClearAIQueue	(NASZ_029_Lukor);
			//Wld_InsertNpc				(NASZ_029_Lukor, hero.wp);
			//Wld_SpawnNpcRange	(hero,	NASZ_029_Lukor,			1,	1);
			AI_StandUp(NASZ_029_Lukor);
			Npc_SetTrueGuild (NASZ_029_Lukor, GIL_BDT);
			//Npc_SetTempAttitude(NASZ_029_Lukor, ATT_HOSTILE);
			//AI_StandUpQuick(NASZ_029_Lukor);
			AI_DODGE(NASZ_029_Lukor);
			B_Attack (NASZ_029_Lukor, hero, AR_KILL, 0);	
			Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		};
	};
	IsOpenedDeadNpc = 0;

};
func void OpenDeadNpc()
{
	if(ECX != MEM_ReadInt(_hero)) {return;};
	
	IsOpenedDeadNpc = 1;
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
	var c_npc slf; slf = _^(ECX);
	
	//Uratuj ³owców podczas szturmu
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
			B_LogEntry (TOPIC_Jehen_zagubiony, "Dziwne, po wyjœciu z kopalni nie spotka³em Jehena. Czy¿by gdzieœ siê uda³? Z zakrwawion¹ rêk¹ nie mo¿e byæ daleko. Chyba ¿e porwa³ go pr¹d rzeki albo wodospadu? Muszê go jak najszybciej odszukaæ.");
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
		B_StartOtherRoutine (NASZ_213_Gestath,"TOT");
		AI_Teleport		(NASZ_213_Gestath, "TOT");
		B_KillNpc(NASZ_123_Lowca);
		B_KillNpc(NASZ_108_Lowca);
		AI_Teleport		(NASZ_123_Lowca, "TOT");
		AI_Teleport		(NASZ_108_Lowca, "TOT");
		
		TwierdzaAtakSick = TRUE; // dziêki temu niektórzy maj¹ mniej HP
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
			ff_remove(SecRitualXardasOld);
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
				PrintScreen	("Wróæ na stanowisko!", -1,-1, FONT_ScreenSmall,2);
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
			PrintScreen	("Opuœci³eœ miejsce warty.", -1,-1, FONT_ScreenSmall,2);
			//Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_FAILED);
			//B_LogEntry (TOPIC_Mysliwy_Warta, "Mimo przyjêtego zadania, poniecha³em patrolowanie terenu obozu wypadowego.");
			FailQuest(TOPIC_Mysliwy_Warta,"");

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
		B_LogEntry (TOPIC_Gestath_psikus, "Paczki pod³o¿one.");
		MIS_Psikusy_Paczki_Skrzynia_OneTime = TRUE;
		MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
	};
	
	if(MIS_Psikusy_Ready >= 4) {

		Log_SetTopicStatus (TOPIC_Gestath_psikus, LOG_SUCCESS);
		B_LogEntry (TOPIC_Gestath_psikus, "Wszystko, o co prosi³ mnie Gestath, ju¿ za³atwione.");
		B_GivePlayerXP(500);
		
		DodajReputacje(3,REP_MYSLIWI);
		
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
			B_LogEntry (TOPIC_Bron_woda, "Nikogo tu nie ma. Muszê przyjœæ jutro w nocy.");
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
			B_LogEntry (TOPIC_Bron_woda, "Znowu na nikogo siê nie natkn¹³em. Mo¿e Bron siê pomyli³? A mo¿e sam zgubi³ wodê œwiêcon¹ i nie chce siê przyznaæ? Zapytam go rano.");
			secBronQuest = 0;
			DrugaNocStop = TRUE;
		};


	};
	
	
	if (Mob_HasItems ("SKRZYNIA_BRONA", ItNa_ZupaGrzybowa) >= 1) && (TrzeciaNocStop == FALSE)
	{
		B_LogEntry (TOPIC_Bron_woda, "Zupa w³o¿ona do skrzyni. Teraz wystarczy zaczaiæ siê w nocy i z³apaæ z³odzieja!");
	
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
	
		if (secStr >= 120) {
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
	
		if (secDex >= 120) {
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
			
			if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKPOCKET) == FALSE)
			{ 
				BDTPotion_PickPocket = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKPOCKET, 1);
			};
			if (Npc_GetTalentSkill (hero, NPC_TALENT_ACROBAT) == FALSE)
			{ 
				BDTPotion_Acrobat = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_ACROBAT, 1);
			};
			if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
			{ 
				BDTPotion_Sneak = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 1);
			};
			if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
			{ 
				BDTPotion_PickLock = TRUE;
				Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKLOCK, 1);
			};
			
			
		};

		secBDT = secBDT + 1;
	
		if (secBDT >= 120) {
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
	
		if (secCheat >= 120) {
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
		PrintScreen	("Za 5 minut pierœcieñ straci moc", -1,-1, "font_old_20_white.tga",2);
		};

		if (secSpeedRing == 60) {
		PrintScreen	("Za minutê pierœcieñ straci moc", -1,-1, "font_old_20_white.tga",2);
		};
	
		if (secSpeedRing == 0) {
		PrintScreen	("Pierœcieñ straci³ moc", -1,-1, "font_old_20_white.tga",2);
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
		if(!secSkaluj) { hero.aivar[AIV_MM_ShrinkState] = 0; };
		
		if 		(hero.aivar[AIV_MM_ShrinkState] == 0)	{	Mdl_SetModelScale(hero,	1.05,	1.05, 	1.05);	hero.aivar[AIV_MM_ShrinkState] = 1;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 1)	{	Mdl_SetModelScale(hero,	1.10,	1.10, 	1.10);	hero.aivar[AIV_MM_ShrinkState] = 2;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 2)	{	Mdl_SetModelScale(hero,	1.15,	1.15, 	1.15);	hero.aivar[AIV_MM_ShrinkState] = 3;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 3)	{	Mdl_SetModelScale(hero,	1.20,	1.20, 	1.20);	hero.aivar[AIV_MM_ShrinkState] = 4;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 4)	{	Mdl_SetModelScale(hero,	1.25,	1.25, 	1.25);	hero.aivar[AIV_MM_ShrinkState] = 5;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 5)	{	Mdl_SetModelScale(hero,	1.30,	1.30, 	1.30);	hero.aivar[AIV_MM_ShrinkState] = 6;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 6)	{	Mdl_SetModelScale(hero,	1.35,	1.35, 	1.35);	hero.aivar[AIV_MM_ShrinkState] = 7;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 7)	{	Mdl_SetModelScale(hero,	1.40,	1.40, 	1.40);	hero.aivar[AIV_MM_ShrinkState] = 8;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 8)	{	Mdl_SetModelScale(hero,	1.45,	1.45, 	1.45);	hero.aivar[AIV_MM_ShrinkState] = 9;		}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 9)	{	Mdl_SetModelScale(hero,	1.50,	1.50, 	1.50);	hero.aivar[AIV_MM_ShrinkState] = 10;	}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 10)	{	Mdl_SetModelScale(hero,	1.55,	1.55, 	1.55);	hero.aivar[AIV_MM_ShrinkState] = 11;	}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 11)	{	Mdl_SetModelScale(hero,	1.60,	1.60, 	1.60);	hero.aivar[AIV_MM_ShrinkState] = 12;	}
		else if	(hero.aivar[AIV_MM_ShrinkState] == 12)	{	Mdl_SetModelScale(hero,	1.65,	1.65, 	1.65);	hero.aivar[AIV_MM_ShrinkState] = 13;	};
		
		secSkaluj = secSkaluj + 1;

		if (secSkaluj == 120)
		{
			WillPowiekszony = FALSE;
			Mdl_SetModelScale(hero,	1.00,	1.00, 	1.00);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("DEM_AMBIENT01"); 
			secSkaluj = 0;
			ff_Remove(secPrzywrocenieWielkosci);
			return;
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
			ff_Remove(secCameraEventFunc);
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
		
		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU1");
			secFilm = 0;
			FilmIdzie = 0;
		};
		
		

	};
	
	if (FilmIdzie == 2) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU2");
			B_StartOtherRoutine(NASZ_110_Keroloth,"Zamek");
			B_StartOtherRoutine(NASZ_115_Kurgan,"InCastle");
			B_StartOtherRoutine(NASZ_109_Rethon,"Zamek");
			B_StartOtherRoutine(NASZ_118_Ferros,"InCastle");

		};
		
		if (secFilm == 18) {
			B_StartOtherRoutine(NASZ_110_Keroloth,"Zamek");
			B_StartOtherRoutine(NASZ_115_Kurgan,"InCastle");
			B_StartOtherRoutine(NASZ_109_Rethon,"Zamek");
			B_StartOtherRoutine(NASZ_118_Ferros,"InCastle");
			secFilm = 0;
			FilmIdzie = 0;
		};

	};
	
	if (FilmIdzie == 9) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU2");
		};
		
		if (secFilm == 18) {
			secFilm = 0;
			FilmIdzie = 0;
		};

	};

	
	if (FilmIdzie == 3) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU3");
			secFilm = 0;
			FilmIdzie = 0;
		};
	};
	
	
	if (FilmIdzie == 4) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU4");
			secFilm = 0;
			FilmIdzie = 0;
		};

	};		
		
	if (FilmIdzie == 5) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU5");
			secFilm = 0;
			FilmIdzie = 0;
		};


	};

	if (FilmIdzie == 6) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU6");
			secFilm = 0;
			FilmIdzie = 0;
		};

	};
	
	if (FilmIdzie == 7) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU7");
			secFilm = 0;
			FilmIdzie = 0;
		};

	};
	
	if (FilmIdzie == 8) {
	
		secFilm = secFilm + 1;

		if (secFilm == 3) {
			Wld_SendTrigger ("CAMU8");
			secFilm = 0;
			FilmIdzie = 0;
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
	
		//UWAGA: jeœli zebra³eœ potwora, ale nie doprowadzi³eœ go do WP, to i tak siê pojawi potwór i bêdzie zaliczone zadanie.
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

var int ObozOrkowoInfoOneTime;

// TODO wywalic!!
var int HeroKilofy;
var int HeroBrylkiZlota;

func void _TickTock_1s()
{
	if (npc_hasitems(hero,ItMi_GoldNugget_Addon) > HeroBrylkiZlota) { HeroBrylkiZlota = npc_hasitems(hero,ItMi_GoldNugget_Addon); };
	if (npc_hasitems(hero,ItMi_GoldNugget_Addon) < HeroBrylkiZlota) { Print("UWAGA!!! Bry³ki z³ota zniknê³y."); HeroBrylkiZlota = npc_hasitems(hero,ItMi_GoldNugget_Addon); };
	if (npc_hasitems(hero,ItMw_2H_Axe_L_01) > HeroKilofy) { HeroKilofy = npc_hasitems(hero,ItMw_2H_Axe_L_01); };
	if (npc_hasitems(hero,ItMw_2H_Axe_L_01) < HeroKilofy) { Print("UWAGA!!! Kilof znikn¹³."); HeroKilofy = npc_hasitems(hero,ItMw_2H_Axe_L_01); };
	

	//Print(IntToString(C_IsInMysliwiTerritory()));
	//Print(IntToString(Npc_GetBodyState(hero)));
	//Print(IntToString(WillUsedWheelTwierdza));
	//Print(IntToString(bAllTwierdzaOrcsAreDead()));

	
	// ticktocki w innych plikach
	
	if (C_BodyStateContains(hero, BS_DIVE)) { DivingTime += 1; Print(ConcatStrings("Diving time = ",IntToString(DivingTime))); };
	
	ARENA();
	Check_OSIAGNIECIA();
	
	if (!SavingDisabled) { 
		TryToTakeHelmetFromKnight();
	};


	if (PhillGraPlaying==FALSE && ((Wld_IsTime(20,20,00,00) || Wld_IsTime(00,00,02,45)) && (Npc_IsInState(NASZ_104_Engor, ZS_Talk)==FALSE))) {
		B_PhillGraStartMusic();
	}
	
	if (PhillGraPlaying==TRUE && (!(Wld_IsTime(20,20,00,00) || Wld_IsTime(00,00,02,45)) || (Npc_IsInState(NASZ_104_Engor, ZS_Talk)))) {
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
		&& (Hlp_GetInstanceID(renegat6weapon) != Hlp_GetInstanceID(ItMw_2H_Axe_L_01)) // jesli bron ktora masz zalozona to nie kilof
		&& (Renegat06BiegnieOneTime == FALSE)
		&& (UcieklesZKopalni == FALSE)
		&& (Npc_GetDistToNpc(NASZ_006_Renegat, hero) < 1500)
		{
			AI_RunToNPC(NASZ_006_Renegat, hero);
			Renegat06BiegnieOneTime = TRUE;
		};
	};	
	
	
	if (BramaDoOrka == FALSE && BramaDoOrkaTickTockOneTime == FALSE && !npc_isdead (OrcScoutHerszt) && !npc_isdead (OrcShamanHerszt) && Npc_GetDistToWP	(hero, "OC_EBR_ENTRANCE") <=1000) 
	{
		B_LogEntry (TOPIC_Keroloth_Wojna, "Dowódca zamku zamkn¹³ siê... Jak wybijemy wszystkich orków, to z pewnoœci¹ stanie sam do walki!");
		Wld_SendTrigger ("MOVER_GATE_SZEF_ZAMEK");
		BramaDoOrka = TRUE;
		BramaDoOrkaTickTockOneTime = TRUE;

	};
	
	if (BramaDoOrka == TRUE && (BramaDoOrkaTickTock2OneTime == FALSE) && (npc_isdead (OrcScoutHerszt)) && (npc_isdead (OrcShamanHerszt)))
	{
		Wld_SendTrigger ("MOVER_GATE_SZEF_ZAMEK");
		BramaDoOrka = FALSE;
		BramaDoOrkaTickTock2OneTime = TRUE;	
	
	};
	
	
	if (WillKnowAboutWayToOrc == FALSE && Npc_GetDistToWP	(hero,"NASZ_DYMOONDO_D") < 1500)  {
		WillKnowAboutWayToOrc = TRUE;
		HeroSay_Dymoondo();

	};
	
	if ((UdarQuestPatrolNaDoleOneTime == FALSE) && (UdarQuestPatrolStart == TRUE) && Npc_GetDistToWP (hero,"LOCATION_15_IN_2") < 1000) {
		UdarQuestPatrolNaDoleOneTime = TRUE;
		B_LogEntry(TOPIC_Udar_patrol,"Jaskinia jest pusta, brakuje te¿ œladów walki tak wiêc na pewno nie zostali zaatakowani. Mo¿e kryj¹ siê na p³askowy¿u nad t¹ jaskini¹?");
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
	
	
	if (WillKnowAboutTwierdza == FALSE && Npc_GetDistToWP	(hero, "OW_PATH_186") <=3000) {
		WillKnowAboutTwierdza = TRUE;
		HeroSay_Twierdza();
	};
	
	if ((WillKnowAboutDemonPosag == FALSE) && (WillSayDemonOneTime == FALSE) && Npc_GetDistToWP	(hero, "NASZ_ZAZAMKIEM_3") <=1750)  {
		WillKnowAboutDemonPosag = TRUE;
		WillSayDemonOneTime = TRUE;
		HeroSay_DemonPosag();
	};
	
	if (KAPITEL == 1)
	 && (Npc_GetDistToWP (hero, "NASZ_BANDYCI_WODOSPAD_01") <= 750
	  || Npc_GetDistToWP (hero, "NASZ_BANDYCI_WODOSPAD_02") <= 750
	  || Npc_GetDistToWP (hero, "NASZ_BANDYCI_WODOSPAD_09") <= 750
	  || Npc_GetDistToWP (hero, "NASZ_BANDYCI_WODOSPAD_10") <= 750)
	{
		
		if (WillWodospadTimerNiebezpiecznie == 6) { 
			WillWodospadTimerNiebezpiecznie = 0; 
		};

		if (WillWodospadTimerNiebezpiecznie == 0) {
			HeroSay_Wodospad();
		};
		
		WillWodospadTimerNiebezpiecznie += 1;
		
	};

	if ((KAPITEL == 4) && Npc_GetDistToWP(hero, "NASZ_ZAPALISADA_SCIEZKA_5") <= 800) {
		if (WillIdzieZaPalisade == FALSE) {
			HeroSay_BeforeZapalisada();
			AI_TurnAway (hero, hero);
			AI_GotoWP (hero, "OW_ORCBARRIER_17");
		} else if (WillBylZapalisada == FALSE) {
			Will_Zapalisada();
			WillBylZapalisada = TRUE;
		};
	};
	
	

	

	/* juz nieaktualne bo CatSan otwiera brame
	if (Npc_GetDistToWP	(hero, "NASZ_FORTECA_BLOKADA") <=200) && (WillGoToUrShack == FALSE) {
		AI_Output (hero ,hero,"DIA_Will_Forteca_15_00"); //Nie mam ochoty siê tam wybieraæ.
		AI_TurnAway (hero,hero);
		AI_GotoWP (hero, "LOCATION_19_03_PATH_RUIN17");
	};
	*/
	
	if (WillUciekaZKopalniOneTime == FALSE && Hlp_StrCmp(Npc_GetNearestWP(hero),"NASZ_KOPALNIA_NOWY_08")) {
		HeroSay_NaSkaly();
		WillUciekaZKopalniOneTime = TRUE;
	};
	
	if ((NieznajomySiePojawiaMattOneTime == FALSE) && (npc_hasitems(hero,ItNa_RytualneOstrze)>=1) && (npc_hasitems(hero,ItNa_Matt_Kartka)>=1)) {
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

	
	if (Kurgan_walka==5) && (NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (RemoveKurganOneTime == FALSE) && (KAPITEL < 4) // skoro w kap4 jest walka bez ducha, to nie powinno tego byc
	{	
		AI_Teleport (NASZ_401_Kurgan, "TOT"); 
		B_StartOtherRoutine (NASZ_401_Kurgan,"End");

		Snd_Play ("MFX_GhostVoice"); 
		Snd_Play ("MFX_Firestorm_Cast"); 
		RemoveKurganOneTime = TRUE;

	};
	
	if (npc_hasitems (hero, ItNa_AmuletZRudy) >=1) && (BraciaMissionReady == TRUE) && (BraciaFunctionOneTime == FALSE) {
		Wld_InsertNpc (SkeletonPro, "FP_NASZ_ZOMBIE_BRAT_1");
		Wld_InsertNpc (SkeletonPro, "FP_NASZ_ZOMBIE_BRAT_2");
		Wld_InsertNpc (Skeleton, "FP_NASZ_ZOMBIE_BRAT_3");
		Wld_InsertNpc (SkeletonShield, "FP_NASZ_ZOMBIE_BRAT_4");
		Wld_InsertNpc (SkeletonShield, "FP_NASZ_ZOMBIE_BRAT_5");
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
	

	if (Npc_GetDistToWP(hero, "OW_ICEREGION_02") <= 750) && (WillGoToIceregion == FALSE) {
		HeroSay_IceRegion();
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

	if(KAPITEL >= 4 && !ObozOrkowoInfoOneTime)
	{
		if( Npc_GetDistToWP	(hero, "NASZ_ZAPALISADA_SCIEZKA_7") <=1000)
		{
			WillBylZapalisada = true;
			ObozOrkowoInfoOneTime = true;
		};
	};
	
	//*******************
	//	Jaszczuroludzie
	//*******************
	if(MIS_Benito_jaszczuroludzie == LOG_RUNNING)
	{
		if (Jaszczuroludzie_1 == FALSE) && (Npc_GetDistToWP	(hero, "OW_ICEREGION_37") <=500)  {
			Jaszczuroludzie_1 = TRUE;
			HeroSay_DraconianClosed();
			B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Natrafi³em na zamkniêt¹ bramê. Muszê jakoœ j¹ obejœæ.");
		};

		if ((Jaszczuroludzie_2 == FALSE) && ((Npc_GetDistToWP	(hero, "OW_ICEREGION_96") <=800) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_97") <=800) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_98") <=500))) {
			Jaszczuroludzie_2 = TRUE;
			HeroSay_DraconianInside();
			B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Jestem w œrodku. Teraz pozostaj¹ poszukiwania. Benito radzi³ mi iœæ wzd³u¿ gór.");
		};
			
		if ((Jaszczuroludzie_3 == FALSE) && ((Npc_GetDistToWP	(hero, "OW_ICEREGION_53") <=1200) || (Npc_GetDistToWP	(hero, "OW_ICEREGION_61") <=1200))) {
			Jaszczuroludzie_3 = TRUE;
			HeroSay_DraconianCave();
			B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Dostrzeg³em jak¹œ jaskiniê na górze wodospadu. Muszê spróbowaæ siê tam dostaæ.");
		};
		
		if ((Jaszczuroludzie_4 == FALSE) && (Npc_GetDistToWP	(hero, "NASZ_PROOF_ORC") <=1200)) {
			Jaszczuroludzie_4 = TRUE;
			HeroSay_CrossedWeapons();
			B_LogEntry (TOPIC_Benito_jaszczuroludzie, "Znalaz³em skrzy¿owane miecze jaszczuroludzi i orków. To chyba wystarczaj¹cy dowód na to, ¿e zawarli sojusz... Pora powiedzieæ o tym Benito.");
			WillFoundSwordsOrcAndDraconian = TRUE;
			B_GivePlayerXP(300);
		};
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
	/*if(!_LevelMiner)
	{
		if(LevelMiner==20) 		{ Npc_SetTalentSkill 	(hero, NPC_TALENT_C, 1); }
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
	};*/

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

func void OrcCityFog() {

	if (Npc_GetDistToWP(hero,"NASZ_ORCCITY_SECOND_CENTER") < 700)
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 15;
		Wld_PlayEffect("spellFX_BreathOfDeath_Target",  hero, hero, 0, 0, 0, FALSE );
		
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
*/	if(MEM_Game.pause_screen || !MEM_Game.timeStep)
	{
		return;
	};
	//Regeneracja
   if (hero.attribute[ATR_HITPOINTS] > 0 && !HasHeroPoison())
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


var int MonastirGateFirst;
var int LastRitualCounter;
var int Jeremiasz_AlmostDead_OneTime;
 	//********** **********
	// Function30s
	//********** **********


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
	
	if ((Jeremiasz_AlmostDead_OneTime == FALSE)
	 && (npc_knowsinfo(hero,DIA_NASZ_127_Jeremiasz_AfterQuest))
	 && (TimeIsUp(-1,3,JeremiaszAlmostDeadDay,JeremiaszAlmostDeadHour))) // 3h
	{
		//Print("TimeIsUp -> Jeremiasz_AlmostDead = TRUE");
		B_StartOtherRoutine(NASZ_127_Jeremiasz,"AlmostDead");
		
		ff_applyonceext(JeremiahAlmostDead_TickTock1s,1000,-1);

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
	if (!npc_isdead(NASZ_550_Straznik))
	&& (Npc_GetDistToNpc (hero, NASZ_550_Straznik) < 750)
	&& (Npc_GetDistToWP (hero, "NASZ_ORCCITY_PORTAL_17") < 2000)
	&& (FinalBattleStarted == TRUE)
	&& (WojownicyCieniaPrzyzwani <= 2) // jak jest 3 to nie przyzywaj kolejnych
	{
		AI_PlayAni(NASZ_550_Straznik, "T_WARN");
		Wld_InsertNpc	(Skeleton_Lord,"FP_PORTAL_WARRIOR");
	 	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Skeleton_Lord  , Skeleton_Lord	, 0, 0, 0, FALSE );
		Wld_InsertNpc	(Skeleton_Lord,"FP_PORTAL_WARRIOR2");
	 	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Skeleton_Lord  , Skeleton_Lord	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_DESTROYUNDEAD_CAST");
		
		WojownicyCieniaPrzyzwani+=2;

	}; 
	

};