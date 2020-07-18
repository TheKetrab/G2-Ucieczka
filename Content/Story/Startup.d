// *******************************************************************
// Startup und Init Funktionen der Level-zen-files
// -----------------------------------------------
// Die STARTUP-Funktionen werden NUR beim ersten Betreten eines Levels 
// (nach NewGame) aufgerufen, die INIT-Funktionen jedesmal
// Die Funktionen müssen so heissen wie die zen-files
// *******************************************************************

// *********
// GLOBAL
// *********
func void STARTUP_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor STARTUP_<LevelName>)
	Game_InitGerman();	
}; 



func void INIT_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor INIT_<LevelName>)
	Game_InitGerman();
	//reinit kursora
	Cursor_Hndl = 0;
	LeGo_Init (LeGo_All | LeGo_PrintS | LeGo_Buffs | LeGo_HookEngine | LeGo_AI_Function | LeGo_Trialoge | LeGo_FrameFunctions | LeGo_Cursor | LeGo_Random | LeGo_Saves  | LeGo_Anim8 | LeGo_View | LeGo_Interface | LeGo_Timer | GFA_LEGO_FLAGS);
	rainThroughVobs(false);
	GFA_Init(GFA_ALL & ~GFA_REUSE_PROJECTILES);
	//GFA_Init(GFA_ALL); 
	
	
	FF_ApplyOnceExt (DistanceMeasurement, 250, -1); //raz na 250ms
	FF_ApplyOnceExt (TickTock_1s, 1000, -1); //raz na 1s
	FF_ApplyOnceExt (TickTock_5s, 5000, -1); //raz na 5s
	FF_ApplyOnceExt (Function30s, 30000, -1); //raz na 30s
	//ff_applyonce(loop);
	// random combination
	if (STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice"))) {
		List_ForFS(MEM_World.voblist, SetRandomCombination);
	};
	Hooks_Global();
	
	CheckDx11();
	QuickSlot_Init();
	B_AddFightSkill(hero,0,0);
};

// *********
// Testlevel
// *********


func void STARTUP_Testlevel ()
{

};

	func void INIT_SUB_Testlevel ()
	{
	};

func void INIT_Testlevel ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_Testlevel();
};


// *************
// Alte Oberwelt
// *************

func void STARTUP_OLDCAMP ()
{

	//FUNKCJE
	StanDruzyny=1;
	LevelMiner = 20;
	PlantSkill_Factor=1;
	QuickSlot_OnLoadFirstWorld();
	//Wld_SendTrigger("");
	
	//ITEMS
	
	// wszystkie uroborosy od poczatku w swiecie
	Wld_InsertItem (ItNa_Uroboros1,"FP_NASZ_UROBOROS1");
	Wld_InsertItem (ItNa_Uroboros2,"FP_NASZ_UROBOROS2");
	Wld_InsertItem (ItNa_TeleportAlchemicy,"FP_NASZ_ALCHEMICY_TP");	
	Wld_InsertItem (ItNa_Uroboros3,"FP_NASZ_UROBOROS3");
	Wld_InsertItem (ItNa_Uroboros4,"FP_NASZ_UROBOROS4");
	Wld_InsertItem (ItNa_Uroboros5,"FP_NASZ_UROBOROS5");
	Mob_CreateItems("SKRZYNIA_KALOMA", ItNa_Uroboros6, 1);
	
	
	Wld_InsertItem (ItNa_KoscBrata,"NASZ_ITEM_BRACIA_1");
	Wld_InsertItem (ItNa_KoscBrata,"NASZ_ITEM_BRACIA_2");
	Wld_InsertItem (ItNa_KoscBrata,"NASZ_ITEM_BRACIA_3");


	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_1");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_2"); // TODO: nie dziala wstawienie tutaj menzutrki
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_3");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_4");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_5");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_6");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_7");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_8");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_9");
	Wld_InsertItem (ItMi_Flask,"NASZ_FP_KIRGO_10");	
	
	//NASZE

	
	Wld_InsertNpc	(NASZ_001_Kopacz,"OW_MINE2_GRIMES"); 
	Wld_InsertNpc	(NASZ_002_Daryl,"OW_MINE2_05");
	// kopacz 003 pojawia sie dopiero jak idziesz na zamek z kurganem
	Wld_InsertNpc	(NASZ_004_Bryson,"OW_MINE2_08");
	Wld_InsertNpc	(NASZ_005_Ben,"OW_MINE2_STRF");
	Wld_InsertNpc	(NASZ_006_Renegat,"OW_PATH_2_04");
	// draal pojawia sie w zadaniu z korthem
	
	Wld_InsertNpc	(NASZ_008_Miecz,"NASZ_MIECZ_4");
	Wld_InsertNpc	(NASZ_009_Marcos,"NASZ_KOPALNIA_NOWY_02");
	Wld_InsertNpc	(NASZ_011_Renegat,"NASZ_KOPALNIA_NOWY_03");
	Wld_InsertNpc	(NASZ_012_Renegat,"OW_PATH_186");
	Wld_InsertNpc	(NASZ_013_Renegat,"OW_PATH_148_A");
	Wld_InsertNpc	(NASZ_014_Renegat,"OW_PATH_264");
	Wld_InsertNpc	(NASZ_020_Sattar,"NASZ_NUGGETMOB_18");

	// inne
	Wld_InsertNpc	(NASZ_015_Rudolf,"NASZ_ZAPALISADA_LAS_17");
	Wld_InsertNpc	(NASZ_016_Netbek,"NASZ_ZAPALISADA_LAS_48");
	Wld_InsertNpc	(NASZ_018_Kannah,"NASZ_ZAPALISADA_KLASZTOR_01");
	B_KillNpc(NASZ_018_Kannah);
	Wld_InsertNpc	(NASZ_019_Teshinoo,"NASZ_ORCCITY_PRISON_02");

	// bractwo
	Wld_InsertNpc	(NASZ_017_Joru,"NASZ_ZAPALISADA_OB_09");	
	Wld_InsertNpc	(NASZ_023_DuchSekciarza,"NASZ_ZAPALISADA_OB_05");
	Wld_InsertNpc	(NASZ_024_BaalOrun,"NASZ_ZAPALISADA_OB_21");
	Wld_InsertNpc	(NASZ_025_Shrat,"NASZ_ZAPALISADA_BAGNO_27");
	Wld_InsertNpc	(NASZ_027_Ghorim,"NASZ_ZAPALISADA_OB_29");
	Wld_InsertNpc	(NASZ_028_Kazmin,"NASZ_ZAPALISADA_OB_37");
	Wld_InsertNpc	(NASZ_029_Lukor,"NASZ_OZYWIENIEC_15"); B_KillNpc(NASZ_029_Lukor);
	Wld_InsertNpc	(NASZ_030_Dusty,"NASZ_ZAPALISADA_OB_44");
	
	
	// lowcy
	Wld_InsertNpc	(NASZ_101_Korth,"OW_PATH_1_1_WASH");
	Wld_InsertNpc	(NASZ_102_Lens,"LOCATION_16_IN");
	Wld_InsertNpc	(NASZ_103_Johny,"NASZ_LOWCY_KUZNIA_01");
	Wld_InsertNpc	(NASZ_104_Engor,"NASZ_LOWCY_DOM_01");
	Wld_InsertNpc	(NASZ_105_Straznik,"PATH_OC_NC_11");
	Wld_InsertNpc	(NASZ_106_Jan,"NASZ_LOWCY_KUZNIA_OGIEN");
	Wld_InsertNpc	(NASZ_107_Brutus,"NASZ_LOWCY_DOM_04");
	Wld_InsertNpc	(NASZ_108_Lowca,"NASZ_LOWCY_TRENING_06");
	Wld_InsertNpc	(NASZ_109_Rethon,"NASZ_LOWCY_TRENING_01");
	Wld_InsertNpc	(NASZ_110_Keroloth,"NASZ_LOWCY_DOM_05");
	Wld_InsertNpc	(NASZ_111_Gerold,"NASZ_LOWCY_DOL_02");
	Wld_InsertNpc	(NASZ_112_Peter,"NASZ_LOWCY_TRENING_04");
	Wld_InsertNpc	(NASZ_113_Godar,"NASZ_LOWCY_ARENA_18");
	Wld_InsertNpc	(NASZ_114_Hokurn,"NASZ_LOWCY_ARENA_19");
	Wld_InsertNpc	(NASZ_115_Kurgan,"NASZ_LOWCY_ARENA_06");
	Wld_InsertNpc	(NASZ_116_Kjorn,"NASZ_LOWCY_ARENA_15");
	Wld_InsertNpc	(NASZ_117_Fed,"NASZ_LOWCY_ARENA_16");
	Wld_InsertNpc	(NASZ_118_Ferros,"NASZ_LOWCY_ARENA_13");
	Wld_InsertNpc	(NASZ_119_Udar,"OW_WOODRUIN_WOLF_SPAWN");
	Wld_InsertNpc	(NASZ_120_Phill,"NASZ_LOWCY_GORA_07");
	Wld_InsertNpc	(NASZ_121_Straznik,"PATH_OC_NC_18");
	Wld_InsertNpc	(NASZ_122_Daniel,"NASZ_LOWCY_DOL_09");
	Wld_InsertNpc	(NASZ_123_Lowca,"NASZ_LOWCY_TRENING_02");
	Wld_InsertNpc	(NASZ_124_Bron,"NASZ_LOWCY_ZAPASY");
	Wld_InsertNpc	(NASZ_125_Silas,"NASZ_LOWCY_KARCZMA_02");
	Wld_InsertNpc	(NASZ_126_Robotnik,"NASZ_LOWCY_KARCZMA_10");
	Wld_InsertNpc	(NASZ_127_Jeremiasz,"NASZ_LOWCY_KARCZMA_13");
	Wld_InsertNpc	(NASZ_128_Straznik,"NASZ_LOWCY_DOL_21");

	Wld_InsertNpc	(NASZ_201_Erak,"NASZ_MYSLIWI_GRUPA_01");
	// Wld_InsertNpc	(NASZ_202_Tival,"NASZ_MYSLIWI_GRUPA_02"); usuniêty
	Wld_InsertNpc	(NASZ_203_Tabuk,"NASZ_MYSLIWI_GRUPA_04");
	Wld_InsertNpc	(NASZ_204_Vick,"NASZ_MYSLIWI_GRUPA_03");
	Wld_InsertNpc	(NASZ_205_Mysliwy,"OW_DJG_ROCKCAMP_02");
	Wld_InsertNpc	(NASZ_206_Mysliwy,"NASZ_MYSLIWI_GRUPA_06");
	//Wld_InsertNpc	(NASZ_207_Mysliwy,"NASZ_MYSLIWI_GRUPA_04"); usuniêty
	//Wld_InsertNpc	(NASZ_208_Mysliwy,"ROCKCAMP");				usuniêty
	Wld_InsertNpc	(NASZ_209_Mysliwy,"NASZ_MYSLIWI_DOL_11");
	Wld_InsertNpc	(NASZ_210_Mysliwy,"NASZ_MYSLIWI_GRUPA_07");
	Wld_InsertNpc	(NASZ_211_Hunt,"LOCATION_02_08");
	Wld_InsertNpc	(NASZ_212_Drax,"NASZ_MYSLIWI_GORA_13");
	Wld_InsertNpc	(NASZ_213_Gestath,"LOCATION_02_07");
	Wld_InsertNpc	(NASZ_214_Goth,"LOCATION_02_03");
	Wld_InsertNpc	(NASZ_215_Kivo,"NASZ_MYSLIWI_CMENTARZ_02");

	Wld_InsertNpc	(NASZ_216_Aran,"LOCATION_01_06");	
	Wld_InsertNpc	(NASZ_217_Louis,"NASZ_MYSLIWI_CMENTARZ_05");	
	Wld_InsertNpc	(NASZ_219_Dick,"NASZ_MYSLIWI_GORA_03");
	Wld_InsertNpc	(NASZ_220_Kirgo,"NASZ_MYSLIWI_DOL_02");
	Wld_InsertNpc	(NASZ_222_Cappel,"NASZ_MYSLIWI_DOL_06");
	Wld_InsertNpc	(NASZ_223_Ratford,"NASZ_MYSLIWI_GORA_01");
	Wld_InsertNpc	(NASZ_224_Dobar,"NASZ_MYSLIWI_DOL_07");
	Wld_InsertNpc	(NASZ_225_Wrzod,"NASZ_MYSLIWI_GORA_04");
	Wld_InsertNpc	(NASZ_226_Snaf,"NASZ_MYSLIWI_BALKON_03");
	Wld_InsertNpc	(NASZ_227_Vachut,"SPAWN_TALL_PATH_BANDITOS2_03");
	Wld_InsertNpc	(NASZ_228_Chris,"NASZ_MYSIWI_BALKON_02");
	Wld_InsertNpc	(NASZ_229_Ayan,"NASZ_OZYWIENIEC_A");
	Wld_InsertNpc	(NASZ_230_Dymoondo,"NASZ_MYSLIWI_POZA_2");
	Wld_InsertNpc	(NASZ_231_Ted,"NASZ_TED_START");
	Wld_InsertNpc	(NASZ_232_Jehen,"TOT");
	
	Wld_InsertNpc	(NASZ_303_Nod,"NASZ_BANDYCI_TRON_01");
	Wld_InsertNpc	(NASZ_304_Bam,"OW_PATH_033_TO_CAVE5");
	Wld_InsertNpc	(NASZ_305_Rabon,"NASZ_BANDYCI_OBOZ_04");
	Wld_InsertNpc	(NASZ_306_Perrot,"NASZ_BANDYCI_OBOZ_14");
	Wld_InsertNpc	(NASZ_307_Monk,"OW_PATH_033_TO_CAVE");
	Wld_InsertNpc	(NASZ_308_Frut,"NASZ_BANDYCI_OBOZ_09");
	Wld_InsertNpc	(NASZ_309_Straznik,"NASZ_BANDYCI_GROTA_04");
	Wld_InsertNpc	(NASZ_310_Bandzior,"NASZ_BANDYCI_TRON_02");
	Wld_InsertNpc	(NASZ_311_Bandzior,"NASZ_BANDYCI_OBOZ_11");
	Wld_InsertNpc	(NASZ_312_Bandzior,"NASZ_BANDYCI_OBOZ_13");
	Wld_InsertNpc	(NASZ_313_Bandzior,"NASZ_BANDYCI_OBOZ_18");
	Wld_InsertNpc	(NASZ_314_Bandzior,"NASZ_BANDYCI_OBOZ_23");
	Wld_InsertNpc	(NASZ_315_Bandzior,"NASZ_BANDYCI_POZA_1");
	Wld_InsertNpc	(NASZ_316_Carry,"OW_DJG_WATCH_STONEHENGE_01");
	Wld_InsertNpc	(NASZ_317_Bandzior,"NASZ_BANDYCI_WODOSPAD_02");
	Wld_InsertNpc	(NASZ_318_Gobby,"NASZ_BANDYCI_WODOSPAD_01");
	Wld_InsertNpc	(NASZ_319_Niewolnik,"NASZ_BANDYCI_GROTA_03");
	Wld_InsertNpc	(NASZ_320_Niewolnik,"NASZ_BANDYCI_GROTA_01");
	Wld_InsertNpc	(NASZ_321_Niewolnik,"NASZ_BANDYCI_GROTA_02");
	Wld_InsertNpc	(NASZ_322_Niewolnik,"NASZ_BANDYCI_WODOSPAD_03");
	Wld_InsertNpc	(NASZ_323_Niewolnik,"NASZ_BANDYCI_WODOSPAD_05");
	Wld_InsertNpc	(NASZ_324_Niewolnik,"NASZ_BANDYCI_WODOSPAD_06");
	Wld_InsertNpc	(NASZ_325_Grimes,"NASZ_BANDYCI_WODOSPAD_04");
	Wld_InsertNpc	(NASZ_326_Domenic,"OW_PATH_3_09");

	Wld_InsertItem (ItMi_AmbossEffekt_Addon,"FP_CEREMONIA_FINAL"); //do rytua³u bogów

	Wld_InsertNpc	(Sheep,"NASZ_BANDYCI_OBOZ_16");
	Wld_InsertNpc	(Follow_Sheep,"NASZ_BANDYCI_OBOZ_16");
	Wld_InsertNpc	(Sheep,"NASZ_BANDYCI_OBOZ_15");

	Wld_InsertNpc	(NASZ_405_VanGan,"NASZ_BANDYCI_OBOZ_19");
	Wld_InsertNpc	(NASZ_411_CzlonekBractwa,"NASZ_PALISADA_TRUP");
	B_KillNpc(NASZ_411_CzlonekBractwa);
	Wld_InsertNpc	(NASZ_412_CatSan,"LOCATION_19_03_SECOND_ETAGE4");
	Wld_InsertNpc	(NASZ_414_Zombie,"NASZ_BANDYCI_SECRET_3");

	Wld_InsertNpc	(NASZ_431_ZombieXardasOld01,"NASZ_XARDAS_OLD_POKOJ_2_05"); 
	Wld_InsertNpc	(NASZ_432_ZombieXardasOld02,"NASZ_XARDAS_OLD_POKOJ_2_06"); 
	Wld_InsertNpc	(NASZ_433_ZombieXardasOld03,"NASZ_XARDAS_OLD_POKOJ_2_07"); 
	Wld_InsertNpc	(NASZ_434_ZombieXardasOld04,"NASZ_XARDAS_OLD_POKOJ_2_08"); 
	Wld_InsertNpc	(NASZ_435_ZombieXardasOld05,"NASZ_XARDAS_OLD_POKOJ_2_09"); 
	Wld_InsertNpc	(NASZ_436_ZombieXardasOld06,"NASZ_XARDAS_OLD_POKOJ_2_10"); 
	Wld_InsertNpc	(NASZ_437_ZombieXardasOld07,"NASZ_XARDAS_OLD_POKOJ_2_11"); 
	Wld_InsertNpc	(NASZ_438_ZombieXardasOld08,"NASZ_XARDAS_OLD_POKOJ_2_12"); 
	Wld_InsertNpc	(NASZ_439_ZombieXardasOld09,"NASZ_XARDAS_OLD_POKOJ_2_13"); 
	Wld_InsertNpc	(NASZ_440_ZombieXardasOld10,"NASZ_XARDAS_OLD_POKOJ_2_14"); 
	Wld_InsertNpc	(NASZ_441_ZombieXardasOld11,"NASZ_XARDAS_OLD_POKOJ_2_15"); 
	Wld_InsertNpc	(NASZ_442_ZombieXardasOld12,"NASZ_XARDAS_OLD_POKOJ_2_16"); 
	Wld_InsertNpc	(NASZ_443_ZombieXardasOld13,"NASZ_XARDAS_OLD_POKOJ_2_17"); 
	Wld_InsertNpc	(NASZ_444_ZombieXardasOld14,"NASZ_XARDAS_OLD_POKOJ_2_18"); 
	Wld_InsertNpc	(NASZ_445_ZombieXardasOld15,"NASZ_XARDAS_OLD_POKOJ_2_19"); 
	Wld_InsertNpc	(NASZ_446_ZombieXardasOld16,"NASZ_XARDAS_OLD_POKOJ_2_20"); 
	Wld_InsertNpc	(NASZ_447_ZombieXardasOld17,"NASZ_XARDAS_OLD_POKOJ_2_21"); 
	Wld_InsertNpc	(NASZ_448_ZombieXardasOld18,"NASZ_XARDAS_OLD_POKOJ_2_22"); 
	Wld_InsertNpc	(NASZ_449_ZombieXardasOld19,"NASZ_XARDAS_OLD_POKOJ_2_23"); 
	Wld_InsertNpc	(NASZ_450_ZombieXardasOld20,"NASZ_XARDAS_OLD_POKOJ_2_24"); 

	Wld_InsertNpc	(NASZ_550_Straznik,"NASZ_ORCCITY_PORTAL_17"); 




	Wld_InsertNpc	(NASZ_429_WojownikCienia,"NASZ_XARDAS_OLD_POKOJ_2_04"); 



	Wld_InsertNpc	(Wisp_Boss,"FP_ROAM_OW_LURKER_NC_LAKE_03");
	Wld_InsertNpc	(MinecrawlerWarrior_Boss,"OW_MINE3_10");
	Wld_InsertNpc	(Giant_Bug_Boss,"FP_ROAM_OW_MOLERAT_06_CAVE_GUARD2");

	
	
	
	Wld_InsertNpc	(Ozywieniec,"NASZ_OZYWIENIEC_40");

	//Polowanie z Chrisem

	Wld_InsertNpc	(Wolf,"FP_ROAM_ORC_2_1_3");
	Wld_InsertNpc	(Wolf,"FP_ROAM_ORC_2_1_2");
	Wld_InsertNpc	(Keiler,"FP_NASZ_POLOWANIE_A");
	Wld_InsertNpc	(Keiler,"FP_NASZ_POLOWANIE_B");
	Wld_InsertNpc	(Keiler,"FP_NASZ_POLOWANIE_C");
	Wld_InsertNpc	(Wolf,"FP_NASZ_POLOWANIE_D");
	Wld_InsertNpc	(Wolf,"FP_NASZ_POLOWANIE_E");
	Wld_InsertNpc	(wolf,"OW_PATH_336");

	//Zwiad z Erakiem
	Wld_InsertNpc				(Orc_Erak_A,"FP_ROAM_OW_GOBBO_CAVE03_03");
	Wld_InsertNpc				(Orc_Erak_B,"FP_ROAM_OW_GOBBO_CAVE03_01");
	Wld_InsertNpc				(Orc_Erak_C,"FP_ROAM_OW_GOBBO_CAVE03_04");
	Wld_InsertNpc				(Orc_Erak_D,"FP_ROAM_OW_GOBBO_CAVE03_02");
	Wld_InsertNpc				(Orc_Erak_E,"FP_ROAM_OW_GOBBO_CAVE03_05");

	//********** Zamek **********

	//Oboz
	Wld_InsertNpc	(OrcElite_Roam,"OC_PATH_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORK_OC_03");	
	Wld_InsertNpc	(OrcScout,"FP_ROAM_ORK_OC_04");	
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORK_OC_02");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_TUNING_10");
	Wld_InsertNpc	(Warg,"FP_ROAM_A_OW_OC_NC_AMBIENTNSC3");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORK_OC_31");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORK_OC_02");	
	Wld_InsertNpc	(OrcElite_Roam,"FP_ZAMEK_OBOZ_01");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORK_OC_02X");


	//Oboz Tyl
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_05");	
	Wld_InsertNpc	(OrcElite_Roam,"FP_ZAMEK_ORC_02");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_09");	
	Wld_InsertNpc	(OrcElite_Roam,"FP_ZAMEK_ORC_01");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_08");	
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ZAMEK_ORC_03");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_06");	
	Wld_InsertNpc	(OrcScout,"FP_ZAMEK_ORC_07");	
	Wld_InsertNpc	(OrcScout,"FP_ZAMEK_ORC_04");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_10");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_12");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_14");	
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ZAMEK_ORC_15");	
	Wld_InsertNpc	(OrcScout,"FP_ZAMEK_ORC_11");	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ZAMEK_ORC_13");	
	


	Wld_InsertNpc	(OrcElite_ZamekA,"FP_STAND_OC_TO_GUARD");
	Wld_InsertNpc	(OrcWarrior_ZamekA,"FP_ZAMEK_1");
	Wld_InsertNpc	(OrcWarrior_ZamekB,"FP_SMALLTALK_OC_CENTER_01");
	Wld_InsertNpc	(OrcScout_ZamekA,"FP_SMALLTALK_OC_CENTER_02");
	Wld_InsertNpc	(OrcScout_ZamekB,"FP_REST_OC_SHEEP_03");

	
	Wld_InsertNpc	(Sheep,"FP_REST_OC_SHEEP_01");
	Wld_InsertNpc	(Sheep,"FP_REST_OC_SHEEP_02");
	
	
	

	Wld_InsertNpc	(OrcScout,"FP_GUARD_OC_GUARDSROOM_01");
	Wld_InsertNpc	(OrcScout,"FP_SMALLTALK_OC_TO_MAGE_02");
	Wld_InsertNpc	(OrcElite_Roam,"FP_SMALLTALK_OC_CENTER_03");
	Wld_InsertNpc	(OrcHerszt_Sit,"FP_ROAM_ORK_OC_01_2");

	Wld_InsertNpc	(OrcShaman_Sit,"OC_MAGE_LAB_ALCHEMY");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_SMALLTALK_OC_MAGE_01");
	Wld_InsertNpc	(OrcShaman_Sit,"OC_MAGE_UP_02");
	Wld_InsertNpc	(OrcShaman_Sit,"OC_MAGE_UP_03");
	Wld_InsertNpc	(OrcShaman_Sit,"OC_MAGE_UP_04");
	Wld_InsertNpc	(OrcShaman_Sit,"OC_MAGE_STUDY");

	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ZAMEK_01");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_02");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_04");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_05");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_06");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ZAMEK_07");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_08");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_09");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_10");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAMEK_11");
	Wld_InsertNpc	(OrcScout,"FP_REST_ZAMEK_01");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ZAMEK_02");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ZAMEK_03");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAMEK_04");
	Wld_InsertNpc	(OrcScout,"FP_REST_ZAMEK_05");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAMEK_06");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAMEK_07");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAMEK_08");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAMEK_09");



	Wld_InsertNpc	(OrcShamanHerszt,"NASZ_ZAMEK_FP_01");
	Wld_InsertNpc	(OrcScoutHerszt,"OC_KNECHTCAMP_02");
	Wld_InsertNpc	(OrcEliteHerszt,"OC_EBR_HALL_CENTER");

	// chrzaszcze u brutusa
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_01");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_02");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_03");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_04");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_05");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_06");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_BRU_ZAMEK_07");
	
	


	// GOBLINS
	
	Wld_InsertNpc	(Troll_Black,"FP_ROAM_GOBLINS_01");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_02");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_03");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_04");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_05");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_06");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_07");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_08");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_09");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_10");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_11");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_12");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_13");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_14");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_15");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_16");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_17");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_18");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_19");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_20");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_21");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_22");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_23");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_24");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_25");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_26");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_27");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_28");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_29");
	Wld_InsertNpc	(Gobbo_Warrior,"FP_ROAM_GOBLINS_30");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_31");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_32");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_33");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_34");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_35");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_36");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_GOBLINS_37");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_38");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_39");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_GOBLINS_40");
	
	
	
	//Phill Gobbos
	Wld_InsertNpc	(goblin0,"FP_NASZ_PHILL_GOBBO_1");
	Wld_InsertNpc	(goblin1,"FP_NASZ_PHILL_GOBBO_2");
	Wld_InsertNpc	(goblin2,"FP_NASZ_PHILL_GOBBO_3");
	Wld_InsertNpc	(goblin3,"FP_NASZ_PHILL_GOBBO_4");
	Wld_InsertNpc	(goblin4,"FP_NASZ_PHILL_GOBBO_5");
	Wld_InsertNpc	(goblin5,"OW_DJG_VORPOSTEN_01");

	//Keroloth Gobbos
	Wld_InsertNpc	(goblin6,"FP_ROAM_OW_WARAN_G2");
	Wld_InsertNpc	(goblin7,"FP_SLEEP_OW_WARAN_G");
	Wld_InsertNpc	(goblin8,"FP_ROAM_OW_WARAN_G");
	Wld_InsertNpc	(goblin13,"FP_NASZ_KEROLOTH_GOBBO_5");
	//9-12 usuniete z misji z kerolothem
	
	
	// ROCKCAMP
	Wld_InsertNpc	(Waran,"FP_ROAM_ROCKCAMP_01");
	Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_ROCKCAMP_03");
	Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_ROCKCAMP_04");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ROCKCAMP_05");
	Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_OW_WARAN_EBENE_02_01");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ROCKCAMP_06");

	//Las OC
	Wld_InsertNpc	(Gobbo_Warrior,"FP_ROAM_OW_WOLF_08_01");
	Wld_InsertNpc	(Gobbo_Warrior,"FP_SLEEP_OW_WOLF_08_01");
	Wld_InsertNpc	(Gobbo_Warrior,"FP_SLEEP_OW_WOLF_08_03");
	Wld_InsertNpc	(YWolf,"OW_ADD_09");
	Wld_InsertNpc	(YWolf,"OW_ADD_09");
	Wld_InsertNpc	(Bloodfly,"OW_ADD_01");
	Wld_InsertNpc	(Molerat,"SPAWN_OW_SCAVENRGER_OLDWORLD_C3");
	Wld_InsertNpc	(Molerat,"SPAWN_OW_SCAVENRGER_OLDWORLD_C3");
	Wld_InsertNpc	(Molerat,"SPAWN_OW_SCAVENRGER_OLDWORLD_C3");
	Wld_InsertNpc	(Wolf,"MOVMENT_MOLERATS_OCWOOD");
	Wld_InsertNpc	(YWolf,"SPAWN_OW_MOLERAT_OCWOOD_OC2");	
	Wld_InsertNpc	(YWolf,"SPAWN_OW_MOLERAT_OCWOOD_OC2");	
	Wld_InsertNpc	(Scavenger,"SPAWN_OW_SCAVENRGER_OCWOOD1");
	Wld_InsertNpc	(Scavenger,"SPAWN_OW_SCAVENRGER_OCWOOD1");
	Wld_InsertNpc	(BloodflyWsciekly01,"SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc	(Wolf,"MOVEMENT_OW_PATH_SCAVENGER_01_SPAWN01");
	Wld_InsertNpc	(Wolf,"MOVEMENT_OW_PATH_SCAVENGER_01_SPAWN01");
	Wld_InsertNpc	(Wolf,"MOVEMENT_OW_PATH_SCAVENGER_01_SPAWN01");
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc	(Molerat,"SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF_WOOD05_01");
	Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF_WOOD05_02");
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc	(BloodflyWsciekly01,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc	(BloodflyWsciekly01,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc	(Wolf,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(Wolf,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(YWolf,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(YWolf,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc	(Scavenger,"OW_ADD_05");
	Wld_InsertNpc	(Scavenger,"OW_ADD_05");
	Wld_InsertNpc	(Gobbo_Green,"NASZ_BANDYCI_WODOSPAD_07");	
		
	//Okolice ³owców
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_1");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_2");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_3");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_4");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_5");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_6");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_7");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_CAVALORN_8");	

	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_07_01");	
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_BLOODFLY_07_02");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_TREE");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_TREE2");	
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_OLDWOOD");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_GREEGOBBO_SAWHUT");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_GREEGOBBO_SAWHUT_3");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_GREEGOBBO_SAWHUT_2");
	Wld_InsertNpc	(Gobbo_Green,"OW_PATH_05");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_AL_NL_01");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_AL_NL_02");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_AL_NL_03");	
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_SCAVENGER_AL_ORC4");	
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_SCAVENGER_AL_ORC2");	
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_SCAVENGER_AL_ORC3");	
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_SCAVENGER_AL_ORC");	
	Wld_InsertNpc	(Molerat,"OW_SAWHUT_MOLERAT_MOVEMENT5");
	Wld_InsertNpc	(Scavenger,"FP_LOWCY_SCAVENGER_MIECZ");
	Wld_InsertNpc	(Scavenger,"FP_LOWCY_SCAVENGER_MIECZ2");
	Wld_InsertNpc	(YScavenger,"FP_LOWCY_SCAVENGER_MIECZ3");
	Wld_InsertNpc	(Scavenger,"FP_LOWCY_SCAVENGER_MIECZ4");
	Wld_InsertNpc	(Molerat,"FP_LOWCY_SCAVENGER_MIECZ5");
	Wld_InsertNpc	(Wolf,"FP_ROAM_DEADWOOD_WOLF_02");
	Wld_InsertNpc	(Wolf,"FP_ROAM_DEADWOOD_WOLF_04");
	Wld_InsertNpc	(YWolf,"FP_ROAM_DEADWOOD_WOLF_01");
	Wld_InsertNpc	(YWolf,"FP_SLEEP_DEADWOOD_WOLF_02");
	Wld_InsertNpc	(YWolf,"FP_SLEEP_DEADWOOD_WOLF_04");
	Wld_InsertNpc	(Wolf,"FP_SLEEP_DEADWOOD_WOLF_05");
	Wld_InsertNpc	(Wolf,"FP_ROAM_DEADWOOD_WOLF_05");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_13_05");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_13_04");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_13_03");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_13_02");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_13_01");	
	Wld_InsertNpc	(YGiant_Rat,"FP_ROAM_GB_01");	
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_GB_02");
	
	//ORCCITY
	Wld_InsertNpc	(OrcShaman_ORCCITY_MAGICCOIN,"FP_ORC_REST_ORCCITY_01");
	

	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_03");

	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_07");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_08");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_15");

	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_19");
	Wld_InsertNpc	(KuroK,"FP_ROAM_ORCCITY_21");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_22");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_23");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_24");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_25");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCCITY_30");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_ORCCITY_31");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_ORCCITY_32");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_ORCCITY_33");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_ORCCITY_34");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_ORCCITY_35");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_36");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_37");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCCITY_38");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_ROAM_ORCCITY_39");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCCITY_40");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_41");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_42");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_ROAM_ORCCITY_43");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_ROAM_ORCCITY_44");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_45");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_46");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCCITY_47");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_48");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_51");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_52");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_53");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_54");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_55");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_56");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_57");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_58");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_59");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_60");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_61");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORCCITY_62");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCCITY_63");

	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_01");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_02");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_03");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_04");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_05");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_06");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_07");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_08");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_09");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_10");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_11");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_12");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_13");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_14");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_15");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_16");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_17");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_18");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_19");
	Wld_InsertNpc	(MinecrawlerWarrior,"FP_ROAM_ORCCITY_ENTRANCE_20");




	
	//Opuszczona Kopalnia
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_01");
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_02");
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_05");
	Wld_InsertNpc	(MinecrawlerWarriorWsciekly1,"FP_ROAM_MC_03");
	Wld_InsertNpc	(MinecrawlerWarriorWsciekly1,"FP_ROAM_MC_12");
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_10");
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_07");
	Wld_InsertNpc	(Minecrawler,"FP_ROAM_MC_09");
	Wld_InsertNpc	(MinecrawlerWarriorWsciekly1,"FP_ROAM_MC_08");
	Wld_InsertNpc	(MinecrawlerWarriorWsciekly1,"FP_ROAM_MC_11");

	//Wulkan
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_WULKAN_01");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_WULKAN_02");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_WULKAN_03");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ORC_14_2");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ORC_14_1");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ORC_18");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ORC_14");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_ORC_14_3");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_CASTLE_4_03");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_CASTLE_8_04");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_CASTLE_8_05");
	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_CASTLE_8_2");
	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_CASTLE_8_1");
	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_CASTLE_8_4");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_CASTLE_8_3");
	Wld_InsertNpc	(FireGolem,"FP_ROAM_BLOODHOUND_PLATEAU_NEARCASTLERUIN6_03");
	Wld_InsertNpc	(FireGolem,"FP_ROAM_BLOODHOUND_PLATEAU_NEARCASTLERUIN4");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_CASTLE_8_02");
	Wld_InsertNpc	(DragonSnapper,"CASTLE_12");
	Wld_InsertNpc	(DragonSnapper,"CASTLE_17");
	Wld_InsertNpc	(Demon,"CASTLE_26");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_OW_SCAVENGER_07_01");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_OW_SCAVENGER_07_02");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_OW_SCAVENGER_07_03");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_OW_SCAVENGER_07_06");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_OW_SCAVENGER_07_08");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_ORC_2_5");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_ORC_2_1");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_ORC_2_3");
	Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_04");
	Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_05");
	Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_06");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_WULKAN_10");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_WULKAN_11");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_WULKAN_12");
	Wld_InsertNpc	(FireGolem,"FP_ROAM_WULKAN_13");
	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_WULKAN_14");
	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_WULKAN_15");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_WULKAN_16");
	Wld_InsertNpc	(OrcBiterWsciekly01,"FP_ROAM_MT09_01");
	Wld_InsertNpc	(OrcBiter,"FP_ROAM_MT09_02");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT08_02");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT08_01");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT16_01");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT16_03");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT16_02");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT15_03");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT15_02");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_MT15_01");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_WULKAN_17");
	Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_18");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_BLACKWOLF_01");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_BLACKWOLF_02");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_BLACKWOLF_03");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_BLACKWOLF_04");
	Wld_InsertNpc	(Warg,"FP_ROAM_BLACKWOLF_05");
	Wld_InsertNpc	(BlackWolf,"FP_ROAM_BLACKWOLF_06");

	
	
	
	//Innos
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_STARAKOPALNIA_A");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_STARAKOPALNIA_B");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_STARAKOPALNIA_E");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_STARAKOPALNIA_D");
	Wld_InsertNpc	(Giant_Rat,"FP_ROAM_STARAKOPALNIA_C");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_F");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_G");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_H");
	Wld_InsertNpc	(Giant_Rat,"FP_ROAM_STARAKOPALNIA_I");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_J");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_K");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_STARAKOPALNIA_L");


	//Nowy Oboz

	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_11_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_11_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_11_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_17_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_21_03");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_16_02");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_16_03");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_79");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_78");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_57");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_46");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_25_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_25_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_24_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_24_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_23_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_23_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_25_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_22_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_22_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_22_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_28_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_28_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_28_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_27_01");
	Wld_InsertNpc	(IceGolem,"OW_ICEDRAGON_25");
	Wld_InsertNpc	(IceGolem,"OW_ICEDRAGON_17");
	Wld_InsertNpc	(IceGolem,"OW_ICEDRAGON_15");
	
	
	
	
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_29_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_2_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_2_03");
	Wld_InsertNpc	(Draconian,"OW_ICEREGION_40");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_10_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_10_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_10_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_13_03");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_13_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_13_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_31_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_31_02");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_18_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_1_01");
	Wld_InsertNpc	(Draconian,"FP_ROAM_OW_ICEREGION_18_03");
	Wld_InsertNpc	(Draconian,"ICEDRAGON");
	Wld_InsertNpc	(Draconian,"OW_ICEREGION_47");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_18_02");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_16_01");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_15_02");
	Wld_InsertNpc	(IceWolf,"OW_ICEREGION_98");
	Wld_InsertNpc	(IceWolf,"OW_DJG_ICEREGION_WAIT2_01");
	Wld_InsertNpc	(IceWolf,"OW_DJG_ICEREGION_WAIT2_02");
	Wld_InsertNpc	(IceWolf,"OW_ICEREGION_46");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_05_04");
	Wld_InsertNpc	(IceWolf,"FP_SLEEP_OW_BLOODFLY_05_03");
	Wld_InsertNpc	(IceWolf,"FP_SLEEP_OW_BLOODFLY_05_01");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_05_05");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_05_05");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_05_03");
	Wld_InsertNpc	(IceWolf,"OW_ICEREGION_22");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_22");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_82");
	Wld_InsertNpc	(IceGolem,"OW_ICEREGION_17");
	Wld_InsertNpc	(IceGolem,"FP_ROAM_OW_ICEREGION_33_01");
	Wld_InsertNpc	(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");
	
	

	//Palisada
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_E_1");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_BLOODFLY_E_2");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_E_3");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_BLOODFLY_E_4");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_E_5");
	Wld_InsertNpc	(WaranWsciekly01,"OW_PATH_WARAN05_SPAWN02_03");
	Wld_InsertNpc	(Waran,"OW_PATH_WARAN05_SPAWN02_02");
	Wld_InsertNpc	(WaranWsciekly01,"FP_ROAM_OW_WARAN_05_01");
	Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_05_05");
	Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_05_03");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_01_03");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_BLOODFLY_01_02");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_01_01");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_OW_BLOODFLY_01_04");
	Wld_InsertNpc	(Bloodfly,"OW_RIVERBED_06");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH2");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH4");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH5");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_RIVER2_BEACH6");
	Wld_InsertNpc	(Lurker,"OW_RIVERBED_08");
	Wld_InsertNpc	(Lurker,"MOVEMENT_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_01");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_03");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_04");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_03_01");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_03_02");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_03_03");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_03_04");	
	Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_03_05");	
	Wld_InsertNpc	(WaranWsciekly01,"OW_ORCBARRIER_19");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_01");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_02");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_03");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_04");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_05");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_06");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_07");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_08");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_09");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_10");
	Wld_InsertNpc	(YScavenger,"FP_PALISADE_SCAVENGER_11");
	Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_12");
	Wld_InsertNpc	(YScavenger,"FP_PALISADE_SCAVENGER_13");
	Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_01");
	Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_02");
	Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_03");
	Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_04");
	Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_05");
	Wld_InsertNpc	(Lurker,"OW_ORCBARRIER_14");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_ORCBARRIER_08_04");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_ORCBARRIER_08_03");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_ORCBARRIER_08_02");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_ORCBARRIER_08_01");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_01");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_02");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_03");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_04");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_05");
	Wld_InsertNpc	(Waran,"FP_PALISADE_WARAN_01");
	Wld_InsertNpc	(WaranWsciekly01,"FP_PALISADE_WARAN_02");
	Wld_InsertNpc	(Waran,"FP_PALISADE_WARAN_03");
	Wld_InsertNpc	(Gobbo_Green,"FP_NASZ_GOBBO_PALISADA_1");
	Wld_InsertNpc	(Gobbo_Green,"FP_NASZ_GOBBO_PALISADA_2");
	Wld_InsertNpc	(Gobbo_Green,"FP_NASZ_GOBBO_PALISADA_3");

	Wld_InsertNpc	(StoneGolem,"FP_ROAM_ORKERAK_1");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_ORKERAK_2");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_ORKERAK_3");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_ORKERAK_4");
	Wld_InsertNpc	(StoneGolem,"FP_ROAM_ORKERAK_5");
















	//ZaPalisada
	
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_01");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_02");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_03");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_04");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_05");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_06");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_07");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_08");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_09");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_NASZ_ZAPALISADA_BLOODFLY_10");
	
	Wld_InsertNpc	(FireWaran,"FP_ROAM_NASZ_ZAPALISADA_FIREWARAN_01");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_NASZ_ZAPALISADA_FIREWARAN_02");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_NASZ_ZAPALISADA_FIREWARAN_03");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_NASZ_ZAPALISADA_FIREWARAN_04");
	
	
	
	
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_01");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_02");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_03");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_04");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_05");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_06");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_07");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_08");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ZAPALISADA_ORCULTRA_09");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ZAPALISADA_ORCULTRA_01");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ZAPALISADA_ORCULTRA_02");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ZAPALISADA_ORCULTRA_03");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAPALISADA_ORCWARRIOR_01");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAPALISADA_ORCWARRIOR_02");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAPALISADA_ORCWARRIOR_03");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAPALISADA_ORCWARRIOR_04");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_ORCWARRIOR_01");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_ORCWARRIOR_02");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_ORCWARRIOR_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_ORCWARRIOR_04");
	
	
	
	
	
	
	
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ZAPALISADA_WEJSCIE_01");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_01");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_02");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_03");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_04");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_05");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_06");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_07");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_WEJSCIE_08");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_WEJSCIE_09");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_WEJSCIE_10");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_WEJSCIE_11");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_12");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_13");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_WEJSCIE_14");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_WEJSCIE_15");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_WEJSCIE_16");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_WEJSCIE_17");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_WEJSCIE_18");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_WEJSCIE_19");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_20");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_21");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_22");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_23");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_WEJSCIE_24");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_WEJSCIE_25");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_WEJSCIE_26");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_WEJSCIE_27");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_WEJSCIE_28");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_WEJSCIE_29");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_WEJSCIE_30");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_WEJSCIE_31");

	
	
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_01");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_02");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_03");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_04");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_05");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_06");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_07");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_08");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_09");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_10");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_11");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_LAS_12");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ZAPALISADA_LAS_13");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_14");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_15");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_16");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_17");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_18");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_19");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_20");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_21");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_22");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_23");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_24");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_25");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_26");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_27");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_LAS_28");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_29");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_LAS_30");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_31");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_32");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_33");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_34");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_LAS_35");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_LAS_36");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_37");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_38");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_39");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ZAPALISADA_LAS_40");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ZAPALISADA_LAS_41");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_42");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_43");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_44");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_45");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_46");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_47");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_48");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_49");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_50");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_51");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_52");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_53");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_54");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_55");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_56");
	Wld_InsertNpc	(Shadowbeast,"FP_ROAM_ZAPALISADA_LAS_57");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_58");
	Wld_InsertNpc	(Warg,"FP_ROAM_ZAPALISADA_LAS_59");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_60");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_61");
	Wld_InsertNpc	(Scavenger_Demon_Grozny,"FP_ROAM_ZAPALISADA_LAS_62");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ZAPALISADA_LAS_63");
	Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_ZAPALISADA_LAS_64");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_ZAPALISADA_LAS_65");
	Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_ZAPALISADA_LAS_66");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_ZAPALISADA_LAS_67");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_ZAPALISADA_LAS_68");
	Wld_InsertNpc	(Bloodhound,"FP_ROAM_ZAPALISADA_LAS_69");
	Wld_InsertNpc	(Bloodhound,"FP_ROAM_ZAPALISADA_LAS_70");
	Wld_InsertNpc	(Shadowbeast,"FP_ROAM_ZAPALISADA_LAS_71");
	Wld_InsertNpc	(PanCieniostworow,"FP_ROAM_ZAPALISADA_LAS_72");
	Wld_InsertNpc	(Shadowbeast,"FP_ROAM_ZAPALISADA_LAS_73");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_74");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_ZAPALISADA_LAS_75");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_ZAPALISADA_LAS_76");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_ZAPALISADA_LAS_77");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_ZAPALISADA_LAS_78");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_ZAPALISADA_LAS_79");
	Wld_InsertNpc	(GroznyTopielec,"FP_ROAM_ZAPALISADA_LAS_80");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_80");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_81");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_82");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_83");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_84");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ZAPALISADA_LAS_85");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_86");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_87");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_88");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_89");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ZAPALISADA_LAS_90");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_91");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_92");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_93");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_94");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_95");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_96");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_97");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_98");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZAPALISADA_LAS_99");

	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_01");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_02");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_03");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_04");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_05");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_06");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_07");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_08");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_09");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_10");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_11");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_12");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_13");
	Wld_InsertNpc	(GroznyJaszczurWsciekly01,"FP_ROAM_BAGNO_WARAN_14");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_15");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_16");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_17");
	Wld_InsertNpc	(Waran,"FP_ROAM_BAGNO_WARAN_18");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_01");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_02");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_03");
	Wld_InsertNpc	(SwampDroneWsciekly01,"FP_ROAM_BAGNO_BLOODFLY_04");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_05");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_06");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_07");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_08");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_09");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_10");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_11");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_12");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_13");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_14");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_15");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_16");
	Wld_InsertNpc	(SwampDroneWsciekly01,"FP_ROAM_BAGNO_BLOODFLY_17");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_18");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_19");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_20");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_21");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_22");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_23");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_24");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_25");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_26");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_BAGNO_BLOODFLY_27");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_BAGNO_BLOODFLY_28");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_01");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_02");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_03");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_04");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_05");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_06");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_07");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_08");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_09");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_10");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_11");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_12");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_13");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_14");
	Wld_InsertNpc	(Swampshark,"FP_ROAM_WAZBLOTNY_15");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_01");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_02");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_03");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_04");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_05");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_06");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_07");
	Wld_InsertNpc	(SwampratWsciekly01,"FP_ROAM_BAGNO_SWAMPRAT_08");
	Wld_InsertNpc	(SwampratWsciekly11,"FP_ROAM_BAGNO_SWAMPRAT_09");
	Wld_InsertNpc	(SwampratWsciekly12,"FP_ROAM_BAGNO_SWAMPRAT_10");
	Wld_InsertNpc	(SwampratWsciekly13,"FP_ROAM_BAGNO_SWAMPRAT_11");
	Wld_InsertNpc	(SwampratWsciekly14,"FP_ROAM_BAGNO_SWAMPRAT_12");
	Wld_InsertNpc	(SwampratWsciekly15,"FP_ROAM_BAGNO_SWAMPRAT_13");
	Wld_InsertNpc	(SwampratWsciekly16,"FP_ROAM_BAGNO_SWAMPRAT_14");
	Wld_InsertNpc	(SwampratWsciekly17,"FP_ROAM_BAGNO_SWAMPRAT_15");

	
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_TROLL1");
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_TROLL2");
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_TROLL3");
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_TROLL4");
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_TROLL5");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_TROLLS_01");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_TROLLS_02");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_TROLLS_03");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_TROLLS_04");
	Wld_InsertNpc	(FireWaran,"FP_ROAM_ZAPALISADA_TROLLS_05");
	

	
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_01");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_02");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_03");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_04");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_05");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_06");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_07");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_08");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_09");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_10");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_11");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_12");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_13");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_14");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_15");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_16");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_17");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_18");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_19");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_20");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_21");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_22");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_23");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_24");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_25");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_26");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_27");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_28");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_29");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_30");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_31");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_32");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_33");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_34");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_35");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_36");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_37");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_38");
	Wld_InsertNpc	(SkeletonShield,"FP_ROAM_SKELETON_OB_39");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_40");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_41");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_42");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_SKELETON_OB_43");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_44");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_SKELETON_OB_45");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_01");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_02");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_03");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_04");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_05");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_06");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_07");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_08");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_09");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_10");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_11");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_12");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_13");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_14");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_15");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_16");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_17");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_18");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_19");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_20");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_21");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_22");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_23");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_24");
	Wld_InsertNpc	(Zombie01,"FP_ROAM_ZOMBIE_OB_25");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_01");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_02");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_03");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_04");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_05");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_06");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_07");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_08");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_09");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_10");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_11");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_12");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_13");
	Wld_InsertNpc	(SwampGolem,"FP_ROAM_GOLEM_OB_14");
	
	

	
	
	

	
	//Orkowe Obozy
	Wld_InsertNpc	(OrcShaman_Sit_ObozPalisade,"FP_PALISADE_ORC_01");
	Wld_InsertNpc	(OrcWarrior_Rest_ObozPalisade,"FP_PALISADE_ORC_02");
	Wld_InsertNpc	(OrcWarrior_Roam_ObozPalisade,"FP_PALISADE_ORC_03");
	Wld_InsertNpc	(OrcShaman_Sit_ObozZamek,"FP_LASZAMEK_ORC_01");
	Wld_InsertNpc	(OrcWarrior_Rest_ObozZamek,"FP_LASZAMEK_ORC_02");
	Wld_InsertNpc	(OrcWarrior_Roam_ObozZamek,"FP_LASZAMEK_ORC_03");
	Wld_InsertNpc	(OrcShaman_Sit_ObozLasOC,"FP_NASZ_LASKOPALNIA_ORC_1");	
	Wld_InsertNpc	(OrcWarrior_Rest_ObozLasOC,"FP_NASZ_LASKOPALNIA_ORC_2");	
	Wld_InsertNpc	(OrcWarrior_Roam_ObozLasOC,"FP_NASZ_LASKOPALNIA_ORC_3");	
	Wld_InsertNpc	(OrcShaman_Sit_ObozKopalnia,"FP_KOPALNIA_ORC_1");	
	Wld_InsertNpc	(OrcWarrior_Rest_ObozKopalnia,"FP_KOPALNIA_ORC_2");	
	Wld_InsertNpc	(OrcWarrior_Roam_ObozKopalnia,"FP_KOPALNIA_ORC_3");	
	Wld_InsertNpc	(OrcShaman_Sit_ObozKlif,"FP_KLIF_ORC_1");	
	Wld_InsertNpc	(OrcWarrior_Rest_ObozKlif,"FP_KLIF_ORC_2");	
	Wld_InsertNpc	(OrcWarrior_Roam_ObozKlif,"FP_KLIF_ORC_3");	
	
	//Las Zamek
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_01");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_02");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_SCAVENGER_03");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_SCAVENGER_04");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_SCAVENGER_05");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_06");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_07");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_08");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_09");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_SCAVENGER_10");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SCAVENGER_INWALD_OC1");
	Wld_InsertNpc	(YWolf,"FP_ROAM_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SCAVENGER_INWALD_OC7");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC1");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC2");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
	Wld_InsertNpc	(YWolf,"FP_ROAM_OW_WOLF2_WALD_OC1");
	Wld_InsertNpc	(YWolf,"FP_ROAM_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc	(YWolf,"FP_ROAM_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc	(YWolf,"FP_ROAM_OW_WOLF2_WALD_OC4");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC5");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC6");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC7");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC8");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_ORK_OC_26");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORK_OC_26_2");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORK_OC_27");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_ORK_OC_27_2");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORK_OC_27_3");
	Wld_InsertNpc	(Molerat,"FP_ROAM_ORK_OC_10");
	Wld_InsertNpc	(Molerat,"FP_ROAM_ORK_OC_09");
	Wld_InsertNpc	(Molerat,"FP_ROAM_ORK_OC_08");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT2_WALD_OC2");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT2_WALD_OC3");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT2_WALD_OC4");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_ORK_OC_12");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_ORK_OC_11");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_ORK_OC_11_2");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_ORK_OC_12_2");
	Wld_InsertNpc	(Molerat,"FP_LASZAMEK_MOLERAT_01");
	Wld_InsertNpc	(Molerat,"FP_LASZAMEK_MOLERAT_02");
	Wld_InsertNpc	(Molerat,"FP_LASZAMEK_MOLERAT_03");
	Wld_InsertNpc	(Molerat,"FP_LASZAMEK_MOLERAT_04");
	Wld_InsertNpc	(YMolerat,"FP_LASZAMEK_MOLERAT_05");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_BLOODFLY_OC_WOOD01");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_BLOODFLY_OC_WOOD02");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_BLOODFLY_OC_WOOD04");
	Wld_InsertNpc	(Snapper,"FP_ROAM_ORK_OC_05");
	Wld_InsertNpc	(Snapper,"FP_ROAM_ORK_OC_05_2");
	Wld_InsertNpc	(Snapper,"FP_ROAM_ORK_OC_05_3");

	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_POS1");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_POS2");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_POS3");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_POS4");	

	//Las Kopalnia
	Wld_InsertNpc	(GroznyZebacz,"FP_ROAM_OW_SNAPPER_INCAVE_DM2");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_INCAVE_DM3");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_INCAVE_DM1");
	Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_INCAVE_DM4");
	Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_01");
	Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_02");
	Wld_InsertNpc	(Wolf,"FP_LASKOPALNIA_01");
	Wld_InsertNpc	(WscieklyWilk1,"FP_LASKOPALNIA_02");
	Wld_InsertNpc	(Wolf,"FP_LASKOPALNIA_03");
	Wld_InsertNpc	(Wolf,"FP_LASKOPALNIA_04");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM2");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM8");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM5");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM1");
	Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM7");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_SCAVENGER_ORC_02");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_SCAVENGER_ORC_04");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_SCAVENGER_ORC_03");
	Wld_InsertNpc	(Scavenger,"FP_SLEEP_OW_SNAPPER_02_01");
	Wld_InsertNpc	(Scavenger,"FP_SLEEP_OW_SNAPPER_02_04");
	Wld_InsertNpc	(Scavenger,"FP_SLEEP_OW_SNAPPER_02_03");
	Wld_InsertNpc	(Scavenger,"FP_SLEEP_OW_SNAPPER_02_05");
	Wld_InsertNpc	(GroznyScierwojad,"FP_SLEEP_OW_SNAPPER_02_06");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SNAPPER_02_10");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SNAPPER_02_08");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SNAPPER_02_02");
	Wld_InsertNpc	(Wolf,"FP_LASKOPALNIA_05");
	Wld_InsertNpc	(WscieklyWilk1,"FP_LASKOPALNIA_06");
	Wld_InsertNpc	(Wolf,"FP_LASKOPALNIA_07");
	Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_08");
	Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_09");
	Wld_InsertNpc	(Bloodfly,"FP_LASKOPALNIA_10");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_LASKOPALNIA_11");
	Wld_InsertNpc	(Lurker,"FP_LASKOPALNIA_12");
	Wld_InsertNpc	(Lurker,"FP_LASKOPALNIA_13");
	Wld_InsertNpc	(Lurker,"FP_LASKOPALNIA_14");
	Wld_InsertNpc	(GroznyTopielec,"FP_LASKOPALNIA_15");
	Wld_InsertNpc	(Scavenger_Demon,"FP_LASKOPALNIA_16");
	Wld_InsertNpc	(Scavenger_Demon,"FP_LASKOPALNIA_17");
	Wld_InsertNpc	(Scavenger_Demon,"FP_LASKOPALNIA_18");
	Wld_InsertNpc	(Bloodfly,"FP_LASKOPALNIA_19");
	Wld_InsertNpc	(Keiler,"FP_LASKOPALNIA_20");
	Wld_InsertNpc	(Keiler,"FP_LASKOPALNIA_21");
	Wld_InsertNpc	(Keiler,"FP_LASKOPALNIA_22");
	Wld_InsertNpc	(Keiler,"FP_LASKOPALNIA_23");
	Wld_InsertNpc	(GroznyDzik,"FP_LASKOPALNIA_24");
	Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_25");
	Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_26");
	Wld_InsertNpc	(TrollWsciekly01,"FP_LASKOPALNIA_27");
	Wld_InsertNpc	(GroznyTopielec,"FP_LASKOPALNIA_28");
	Wld_InsertNpc	(GroznyTopielec,"FP_LASKOPALNIA_29");
	Wld_InsertNpc	(WaranWsciekly01,"FP_LASKOPALNIA_30");
	Wld_InsertNpc	(Scavenger_Demon,"FP_LASKOPALNIA_31");
	Wld_InsertNpc	(Scavenger_Demon,"FP_LASKOPALNIA_32");
	Wld_InsertNpc	(GroznyJaszczur,"FP_LASKOPALNIA_33");
	Wld_InsertNpc	(GroznyJaszczur,"FP_LASKOPALNIA_34");
	Wld_InsertNpc	(GroznyJaszczur,"FP_LASKOPALNIA_35");
	Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_DEMON_02_03");
	Wld_InsertNpc	(WaranWsciekly01,"FP_ROAM_OW_WARAN_DEMON_02_02");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_WARAN_DEMON_01");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_WARAN_DEMON_02");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_WARAN_DEMON_03");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_WARAN_DEMON_04");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_WARAN_DEMON_05");
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_OW_DT_BLOODFLY_02");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_DT_BLOODFLY_04");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_DT_BLOODFLY_01");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_DT_BLOODFLY_03");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_DT_BLOODFLY_04");
	
	//Bandyci

	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_ANGAR_1");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_MEATBUG_ANGAR_2");
	
	
	Wld_InsertNpc	(Lurker,"FP_SLEEP_OW_BLOODFLY_04_02");
	Wld_InsertNpc	(Lurker,"FP_OW_BLOODFLY04_SPAWN01");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOODFLY_04_02");
	Wld_InsertNpc	(Lurker,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
	Wld_InsertNpc	(Lurker,"FP_ROAM_OW_LURKER_NC_LAKE_01");
	Wld_InsertNpc	(Shadowbeast,"FP_ROAM_OW_WOLF_NEAR_SHADOW_01");
	Wld_InsertNpc	(Keiler,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHADOW3");
	Wld_InsertNpc	(Keiler,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHADOW5");
	Wld_InsertNpc	(Keiler,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHADOW6");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_BANDYCI_01");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_BANDYCI_02");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_BANDYCI_03");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_BANDYCI_04");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_BANDYCI_05");
	Wld_InsertNpc	(Molerat,"FP_ROAM_BANDYCI_06");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_BANDYCI_07");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SHADOWBEAST_10_06_02");
	Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SHADOWBEAST_10_06_01");
	Wld_InsertNpc	(Scavenger_Demon,"OW_PATH_274_RIGHT2");
	Wld_InsertNpc	(Scavenger_Demon,"OW_PATH_274_RIGHT");

	// Rybak
	
	Wld_InsertNpc	(TrollWsciekly01,"FP_ROAM_OW_WARAN_NC_04");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_BLOODFLY_04_02_02");
	Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_BLOODFLY_04_02_01");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_01");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_02");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_03");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_04");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_05");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_06");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_07");
	Wld_InsertNpc	(Bloodhound,"FP_SLEEP_OW_MOLERAT_03_01");
	Wld_InsertNpc	(Bloodhound,"FP_SLEEP_OW_MOLERAT_03_02");
	Wld_InsertNpc	(Molerat,"FP_CAMPFIRE_LOCATION_23_CAVE_02");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_CAMPFIRE_LOCATION_23_CAVE_01");
	Wld_InsertNpc	(GroznyKretoszczur,"FP_CAMPFIRE_LOCATION_23_CAVE_03");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT_03_02");
	Wld_InsertNpc	(Molerat,"FP_CAMPFIRE_LOCATION_23_CAVE_02");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_08");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_09");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_10");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_RYBAK_11");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_RYBAK_12");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_RYBAK_13");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_RYBAK_14");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_RYBAK_15");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_RYBAK_16");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_RYBAK_17");
	Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_RYBAK_18");

	//INNOS CYTADELA
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_01");
	Wld_InsertNpc	(SkeletonMage,"FP_SKELETON_INNOS_02");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_03");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_04");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_05");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_06");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_07");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_08");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_09");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_10");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_11");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_12");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_13");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_14");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_15");
	Wld_InsertNpc	(SkeletonMage,"FP_SKELETON_INNOS_16");
	Wld_InsertNpc	(SkeletonMage,"FP_SKELETON_INNOS_17");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_18");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_19");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_20");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_21");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_22");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_23");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_24");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_25");
	Wld_InsertNpc	(SkeletonShield,"FP_SKELETON_INNOS_26");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_27");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_28");
	Wld_InsertNpc	(SkeletonMage,"FP_SKELETON_INNOS_29");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_30");
	Wld_InsertNpc	(SkeletonPro,"FP_SKELETON_INNOS_31");
	Wld_InsertNpc	(Skeleton,"FP_SKELETON_INNOS_32");


	
	
	//Pocz¹tek Gry

	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_KOPALNIA_1");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_KOPALNIA_2");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_KOPALNIA_3");
	Wld_InsertNpc	(Meatbug,"FP_ROAM_OW_MEATBUG_KOPALNIA_4");
	Wld_InsertNpc	(TrollWsciekly01,"FP_TROLL_KOPALNIA_1");

	//Przed zakmiem
	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_01");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_TUNING_09");	
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_03");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_30");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_TUNING_11");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_TUNING_01");	
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_A_OW_OC_NC_AMBIENTNSC");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_TUNING_12");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_06");	
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_05");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_TUNING_13");	
	Wld_InsertNpc	(Snapper,"FP_ROAM_ORK_OC_04_3");	
	Wld_InsertNpc	(Snapper,"FP_ROAM_ORK_OC_04_2");	
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_07");	
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_09");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_08");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_10");
	Wld_InsertNpc	(Wolf,"FP_ROAM_WARG_OC_14");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_WARG_OC_15");
	Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_WARG_OC_13");
	Wld_InsertNpc	(Wolf,"FP_ROAM_ORK_OC_07_2");
	Wld_InsertNpc	(Wolf,"FP_ROAM_ORK_OC_07");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_SCAVENGER_AL_NL_02_2");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_SCAVENGER_AL_NL_02_1");
	Wld_InsertNpc	(Molerat,"FP_SLEEP_OW_SCAVENGER_AL_NL_02_1");
	Wld_InsertNpc	(Molerat,"FP_ROAM_ORK_OC_25");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_ORK_OC_23");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORK_OC_24");
	Wld_InsertNpc	(Wolf,"FP_ROAM_WARG_OC_01");
	Wld_InsertNpc	(Wolf,"FP_ROAM_WARG_OC_02");
	Wld_InsertNpc	(YWolf,"FP_SIT_OW2");
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_17");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_15");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_14");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_16");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_ORK_OC_10");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_ORK_OC_13");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_11");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_12");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_14");
	Wld_InsertNpc	(Gobbo_Green,"FP_ROAM_ORK_OC_19");
	Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_ORK_OC_11");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_ORK_OC_20_2");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_ORK_OC_20");
	Wld_InsertNpc	(Molerat,"FP_ZAMEK_MOLERAT_1");
	Wld_InsertNpc	(Molerat,"FP_ZAMEK_MOLERAT_2");
	Wld_InsertNpc	(Molerat,"FP_ZAMEK_MOLERAT_3");
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_18");
	Wld_InsertNpc	(Gobbo_Green,"FP_CAMPFIRE_ORK_OC_19");
	Wld_InsertNpc	(Scavenger,"FP_ROAM_ORK_OC_15_2");
	Wld_InsertNpc	(YScavenger,"FP_ROAM_ORK_OC_16");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT_01_02");
	Wld_InsertNpc	(YMolerat,"FP_ROAM_OW_MOLERAT_01_03");
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MOLERAT_01_04");
	Wld_InsertNpc	(Giant_Rat,"FP_OW_GORNS_VERSTECK");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_SLEEP_OW_MOLERAT_01_02");
	Wld_InsertNpc	(Giant_Rat_Huge01,"FP_ROAM_ITEM_SPECIAL_02");

	
	// Hoshpak
	
	Wld_InsertNpc   (Molerat,"FP_HOSHPACK_MOLERAT_01");	
	Wld_InsertNpc   (Molerat,"FP_HOSHPACK_MOLERAT_02");	
	Wld_InsertNpc   (Molerat,"FP_HOSHPACK_MOLERAT_03");	
	Wld_InsertNpc   (Molerat,"FP_HOSHPACK_MOLERAT_04");	
	Wld_InsertNpc   (Molerat,"FP_HOSHPACK_MOLERAT_05");	
	Wld_InsertNpc   (Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC6");	
	Wld_InsertNpc   (Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC_01");	
	Wld_InsertNpc   (WscieklyWilk1,"FP_ROAM_OW_SNAPPER_OW_ORC8");	
	Wld_InsertNpc   (WscieklyWilk1,"FP_ROAM_OW_SNAPPER_OW_ORC4");	
	Wld_InsertNpc   (Wolf,"FP_ROAM_ORC_04");	
	Wld_InsertNpc   (Wolf,"FP_ROAM_ORC_02");	
	
	// Przed Mysliwymi
	
	Wld_InsertNpc   (Wolf,"FOP_ROAM_ORC_GATE_05");	
	Wld_InsertNpc   (YMolerat,"FP_ROAM_OW_BLACKWOLF_02_02");	
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_WOLF_02_06");	
	Wld_InsertNpc   (Molerat,"FP_ROAM_ORC_10");	
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_WOLF_02_05");	
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_MOLERAT_ORC_03");
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_MOLERAT_ORC_01");
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_BLACKWOLF_02_20");
	Wld_InsertNpc   (Molerat,"FP_ROAM_OW_SCAVENGER_07_11");
	Wld_InsertNpc   (YMolerat,"FP_ROAM_OW_SCAVENGER_07_07");
	Wld_InsertNpc   (Wolf,"FP_ROAM_OW_WOLF_02_12");	
	Wld_InsertNpc   (WscieklyWilk1,"FP_ROAM_OW_WOLF_02_12");	
	Wld_InsertNpc   (Wolf,"FP_ROAM_OW_WOLF_02_11");	
	Wld_InsertNpc	(Wolf,"FP_ROAM_ORC_13");
	Wld_InsertNpc	(YWolf,"FP_ROAM_ORC_12");
	Wld_InsertNpc	(Wolf,"FP_ROAM_ORC_11");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_ORC_08");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORC_2_1_6");
	Wld_InsertNpc	(BloodflyWsciekly01,"FP_ROAM_ORC_2_1_8");
	Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_SCAVENGER_10_08");
	// Warge 
	Wld_InsertNpc	(Warg,"OC_PATH_04");
	Wld_InsertNpc	(Warg,"OC_PATH_02");
	Wld_InsertNpc	(Warg,"OC_PATH_02");
	Wld_InsertNpc	(Warg,"OC_PATH_02");


	// Wilki
	Wld_InsertNpc	(BlackWolf,"NASZ_FP_BLACKWOLF_A_1");
	Wld_InsertNpc	(BlackWolf,"NASZ_FP_BLACKWOLF_A_2");
	Wld_InsertNpc	(BlackWolf,"NASZ_FP_BLACKWOLF_A_3");
	Wld_InsertNpc	(BlackWolf,"NASZ_FP_BLACKWOLF_A_4");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_1");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_2");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_3");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_4");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_5");
	Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_BLOODFLY_A_6");
	
	
	
	
	
	
	Wld_InsertNpc	(Demon,"FP_REST_DEMON_XARDAS_1");
	
	Wld_InsertNpc	(StoneGolem,"FP_REST_KALOM_1");
	Wld_InsertNpc	(StoneGolem,"FP_REST_KALOM_2");
	Wld_InsertNpc	(StoneGolem,"FP_REST_KALOM_3");
	Wld_InsertNpc	(StoneGolem,"FP_REST_KALOM_4");
	
	//ORCPORT
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_01");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_02");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCPORT_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_04");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_05");
	Wld_InsertNpc	(OrcScout,"FP_ROAM_ORCPORT_06");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_07");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_08");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCPORT_09");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_10");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_11");
	Wld_InsertNpc	(OrcScout,"FP_ROAM_ORCPORT_12");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_13");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCPORT_14");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_15");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_16");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCPORT_17");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_18");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_19");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCPORT_20");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCPORT_21");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_22");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_23");
	Wld_InsertNpc	(OrcScout,"FP_ROAM_ORCPORT_24");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_25");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_26");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCPORT_27");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCPORT_28");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCPORT_29");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCPORT_30");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCPORT_31");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCPORT_32");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCPORT_33");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCPORT_34");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_35");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_36");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_37");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_38");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCPORT_39");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_ORCPORT_40");
	Wld_InsertNpc	(OrcScout,"FP_ROAM_ORCPORT_41");
	Wld_InsertNpc	(OrkElite_AntiPaladinOrkOberst_DI,"FP_REST_ORCPORT_42");
	Wld_InsertNpc	(OrcScout,"FP_REST_ORCPORT_43");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG1");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG2");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG3");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG4");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG5");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG6");
	Wld_InsertNpc	(Warg,"FP_ROAM_ORCPORT_WARG7");
	
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCPORT_44");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCPORT_45");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCPORT_46");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCPORT_47");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCPORT_48");
	
	




	
	// GRAVEYARD
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_01");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_02");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_GRAVEYARD_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_04");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_05");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_06");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_GRAVEYARD_07");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_GRAVEYARD_08");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_GRAVEYARD_09");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_10");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_11");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_12");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_13");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_GRAVEYARD_14");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_GRAVEYARD_15");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_16");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_17");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_18");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_19");
	Wld_InsertNpc	(OrcScout,"FP_ROAM_GRAVEYARD_20");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_21");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_22");
	Wld_InsertNpc	(OrcElite_Roam,"FP_ROAM_GRAVEYARD_23");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_GRAVEYARD_24");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_25");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_26");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_27");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_28");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_29");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_30");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_31");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_32");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_33");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_34");
	Wld_InsertNpc	(UndeadOrcWarrior,"FP_ROAM_GRAVEYARD_35");


	Wld_InsertNpc	(NASZ_700_Invisible1,"NASZ_OZYWIENIEC_30");
	Wld_InsertNpc	(NASZ_701_Invisible2,"NASZ_OZYWIENIEC_42");
	Wld_InsertNpc	(NASZ_702_Invisible3,"NASZ_OZYWIENIEC_41");
	Wld_InsertNpc	(NASZ_703_Invisible4,"NASZ_OZYWIENIEC_31");


	
	// FOGTOWER
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_01");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_02");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_03");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_04");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_05");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_06");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_07");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_08");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_09");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_10");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_11");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_12");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_13");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_14");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_15");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_16");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_17");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_18");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_19");
	Wld_InsertNpc	(Skeleton_Lord,"FP_ROAM_FOGTOWER_20");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_21");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_22");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_23");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_24");
	Wld_InsertNpc	(SkeletonMage,"FP_ROAM_FOGTOWER_25");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_26");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_27");
	Wld_InsertNpc	(Skeleton,"FP_ROAM_FOGTOWER_28");
	Wld_InsertNpc	(SkeletonPro,"FP_ROAM_FOGTOWER_29");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_30");
	Wld_InsertNpc	(SkeletonGood,"FP_ROAM_FOGTOWER_31");

};

	func void INIT_SUB_OLDCAMP()
	{
		
		// ------ LIGHTS ------
		
		//Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
		//Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
		//Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
			
		// ------ PORTAL-RÄUME ------		//Groß- und Kleinschreibung beachten!
	
		//Wld_AssignRoomToGuild("hütte77",GIL_VLK);
		
		//Kirche im alten Lager
		Wld_AssignRoomToGuild("ki1", GIL_NONE); //Hauptraum
		Wld_AssignRoomToGuild("ki2", GIL_NONE); //rechter Raum
		Wld_AssignRoomToGuild("ki3", GIL_NONE); //linker raum
		
		//Brutus
		Wld_AssignRoomToGuild("tu1", GIL_NONE); //wegen Mission besser gil_none (läuft raus)
		
		//Wehrgänge
		Wld_AssignRoomToGuild("he3", GIL_NONE); //einzelner Raum über Knast
		Wld_AssignRoomToGuild("he1", GIL_NONE); //Schalterraum
		Wld_AssignRoomToGuild("he2", GIL_NONE); //raum mit verbindung zu gardistenhaus
		
		//Gardistenhaus
		Wld_AssignRoomToGuild("eg1",	-1); //Eingangsbereich
		//unten
		Wld_AssignRoomToGuild("eg4",	-1); //Engor
		Wld_AssignRoomToGuild("eg2",	GIL_PUBLIC); //linker Schlafraum
		Wld_AssignRoomToGuild("sthaus",	GIL_PUBLIC); //gang hinter engor
		Wld_AssignRoomToGuild("st",		GIL_PUBLIC); //lagerraum
		Wld_AssignRoomToGuild("klo",	GIL_PUBLIC); //kleiner raum hinterm lager
		//oben
		Wld_AssignRoomToGuild("eg3",	GIL_MIL); //Schlafraum oben
		Wld_AssignRoomToGuild("eg5",	GIL_MIL); //Schlafraum oben - (verbindung zu he2)
		
		//Erzbaronhaus - alle Flure (auch oben)
		Wld_AssignRoomToGuild("hh1",	-1); //Eingangsbereich = DRAUSSEN (wegen B_AssessEnterRoom)
		//EBr unten
		Wld_AssignRoomToGuild("hh2",	GIL_PUBLIC); //Waffenkammer
		Wld_AssignRoomToGuild("hh3",	GIL_PUBLIC); //Küche
		Wld_AssignRoomToGuild("hhmh1",	GIL_PUBLIC); //Thronsaal
		//EBr oben
		Wld_AssignRoomToGuild("hh8",	GIL_MIL); //Schlafraum vorne links
		Wld_AssignRoomToGuild("hh7",	GIL_MIL); //Schlafraum vorne rechts
		Wld_AssignRoomToGuild("hh5",	GIL_MIL); //Gomez grosser raum hinten
		Wld_AssignRoomToGuild("hh4",	GIL_MIL); //Raum rechts hinten (mit gang zum turm)
		Wld_AssignRoomToGuild("wg3",	GIL_MIL); //gang zum turm
		Wld_AssignRoomToGuild("tu2",	GIL_MIL); //turmzimmer
	};

func void INIT_OLDCAMP ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_OLDCAMP();
};

func void STARTUP_DEMONTOWER ()
{
	

};

	func void INIT_SUB_DEMONTOWER ()
	{
	};

func void INIT_DEMONTOWER ()
{
	INIT_SUB_DEMONTOWER();
};


func void STARTUP_SURFACE ()
{


//*******************************************************
//		NSCs
//*******************************************************
	
	//ITEMS

	Wld_InsertItem (ItPl_Dex_Herb_01   ,"OW_ITEM_ROCKHORT_02");
	Wld_InsertItem (ItPl_Dex_Herb_01   ,"FP_ROAM_OW_LURKER_NC_LAKE_03");
	 		

//*******************************************************
//		MONSTER
//*******************************************************


	//-------------SwampDragongebiet------------------
	

	Wld_InsertNpc		(SwampDroneWsciekly01,"FP_ROAM_SWAMP_ENTRANCE_01");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(BloodflyWsciekly01,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(BloodflyWsciekly01,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_3_01");
	Wld_InsertNpc		(BloodflyWsciekly01,"FP_ROAM_SWAMP_4_02");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_5_01");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_6_01");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_6_02");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_7_01");

	Wld_InsertNpc		(Swampdrone,"OW_DRAGONSWAMP_023");
	Wld_InsertNpc		(SwampDroneWsciekly01,"OW_DRAGONSWAMP_023");
	Wld_InsertNpc		(SwampratWsciekly01,"OW_DRAGONSWAMP_026");

	Wld_InsertNpc		(Swamprat,"FP_ROAM_SWAMP_10_01");

	Wld_InsertNpc		(SwampratWsciekly01,"FP_ROAM_SWAMP_11_01");
	Wld_InsertNpc		(SwampDroneWsciekly01,"FP_ROAM_SWAMP_17_01");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_12_02");

	Wld_InsertNpc		(Zombie01,"OW_DRAGONSWAMP_003");
	Wld_InsertNpc		(Zombie01,"OW_DRAGONSWAMP_003");
	Wld_InsertNpc		(Skeleton,"OW_DRAGONSWAMP_019");
	Wld_InsertNpc		(Skeleton,"OW_DRAGONSWAMP_019");
	Wld_InsertNpc		(Skeleton,"OW_DRAGONSWAMP_019");
	Wld_InsertNpc		(Zombie01,"OW_DRAGONSWAMP_007");
	Wld_InsertNpc		(Zombie01,"OW_DRAGONSWAMP_007");
	Wld_InsertNpc		(Pal_Zombie01,"OW_DRAGONSWAMP_008");
	Wld_InsertNpc		(Pal_Zombie01,"OW_DRAGONSWAMP_013");
	Wld_InsertNpc		(Pal_Zombie01,"OW_DRAGONSWAMP_015");



	

	// Ammann
	Wld_InsertNpc		(Troll_Ammann,"PLATEAU_ROUND04");
	Wld_InsertNpc		(DragonSnapper_Ammann_A,"FP_ROAM_OW_ROCK_DRACONIAN_09_2");
	Wld_InsertNpc		(DragonSnapper_Ammann_B,"FP_ROAM_OW_ROCK_DRACONIAN_09");
	Wld_InsertNpc		(DragonSnapper_Ammann_C,"FP_ROAM_OW_ROCK_DRACONIAN_08");

	Wld_InsertNpc		(DragonSnapper,"NASZ_FP_DRAGONSNAPPER_01");
	Wld_InsertNpc		(DragonSnapper,"NASZ_FP_DRAGONSNAPPER_02");
	
	

 //-------------------------FELSENFESTUNG: RockDragon------------------------
 	// Berggebiet vor Brücke (ehemaliges Bloodhound-gebiet)

	Wld_InsertNpc		(Snapper,"PLATEAU_ROUND02");
	Wld_InsertNpc		(Snapper,"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc		(Snapper,"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc		(Snapper,"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc		(Snapper,"PATH_TO_PLATEAU04_SMALLPATH");	

	//Serpentinenwge nach oben
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03");    
	Wld_InsertNpc		(OrcWarrior_Rest,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(OrcWarrior_Rest,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(OrcWarrior_Rest,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_02_1");

	//Platz vor Fokusplattform & Eingang
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_PATH_RUIN5");    

	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_PATH_RUIN7"); 
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_PATH_RUIN7"); 
		
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_PATH_RUIN8"); 
	Wld_InsertNpc		(OrcShaman_Sit,"LOCATION_19_03_PATH_RUIN9");  
	Wld_InsertNpc		(OrcElite_Rest,"LOCATION_19_03_PATH_RUIN10");      
	
		//EG: Biblothek
	Wld_InsertNpc		(OrcShaman_Sit,"LOCATION_19_03_ROOM6");    
	Wld_InsertNpc		(OrcShaman_Sit,"LOCATION_19_03_ROOM6_BARRELCHAMBER");    
	
		//EG: Geheimkammer
	Wld_InsertNpc		(Demon,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
		
		//EG: Linker Raum
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_ROOM3");
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_ROOM3");
	
		//1.OG: Raum links vorne
	Wld_InsertNpc		(OrcElite_Rest,"LOCATION_19_03_SECOND_HARPYE1");
	Wld_InsertNpc		(OrcElite_Rest,"LOCATION_19_03_SECOND_HARPYE2");
		
		//1.OG: Raum links hinten
	Wld_InsertNpc		(OrcElite_Rest,"LOCATION_19_03_SECOND_HARPYE3");
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_SECOND_HARPYE4");
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_SECOND_HARPYE4");
	Wld_InsertNpc		(OrcWarrior_Rest,"LOCATION_19_03_SECOND_ETAGE7");		

		//Burg zinnen
	Wld_InsertNpc		(OrcWarrior_Rest,"OW_ROCKDRAGON_13");

		// beim Drachen
	Wld_InsertNpc		(OrcWarrior_FortA,"OW_ROCKDRAGON_03");
	Wld_InsertNpc		(OrcWarrior_FortB,"OW_ROCKDRAGON_03");
	Wld_InsertNpc		(OrcShaman_FortA,"OW_ROCKDRAGON_04");
	Wld_InsertNpc		(OrcWarrior_FortC,"OW_ROCKDRAGON_05");
	Wld_InsertNpc		(OrcWarrior_FortD,"OW_ROCKDRAGON_05");
	Wld_InsertNpc		(OrcWarrior_FortE,"OW_ROCKDRAGON_05");
	Wld_InsertNpc		(OrcElite_FortA,"OW_ROCKDRAGON_06");
	Wld_InsertNpc		(OrcShaman_FortB,"OW_ROCKDRAGON_07");
	Wld_InsertNpc		(OrcElite_FortB,"OW_ROCKDRAGON_08");
	Wld_InsertNpc		(OrcWarrior_FortF,"OW_ROCKDRAGON_08");
	Wld_InsertNpc		(OrcWarrior_FortG,"OW_ROCKDRAGON_08");
	Wld_InsertNpc		(OrcShaman_FortC,"OW_ROCKDRAGON_09");
	Wld_InsertNpc		(NASZ_453_UrShak,"OW_ROCKDRAGON_11");
	

	//-------------------------PLAC WYMIAN------------------------

	Wld_InsertNpc		(OrcWarrior_Rest,"OW_PATH_1_5_8");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_PATH_1_5_3A");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_PATH_1_5_3A");
	Wld_InsertNpc		(OrcElite_Rest,"OW_DJG_STARTCAMP_01");
	Wld_InsertNpc		(OrcShaman_Sit,"SPAWN_TOTURIAL_CHICKEN_2_2");
	Wld_InsertNpc		(OrcShaman_Sit,"OW_SPAWN_BRUDER");
	Wld_InsertNpc		(OrcWarrior_Rest,"OW_PATH_1_12");
	Wld_InsertNpc		(OrcElite_Rest,"OW_PATH_1_15");
	Wld_InsertNpc		(OrcElite_Rest,"OW_PATH_1_15");
	Wld_InsertNpc		(OrcWarrior_Rest,"OW_PATH_1_16");
	Wld_InsertNpc		(OrcWarrior_Roam,"START");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_PATH_1_17_1");
	Wld_InsertNpc		(OrcScout,"SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc		(OrcElite_Rest,"OW_PATH_1_16_4");
	Wld_InsertNpc		(OrcScout,"OW_PATH_1_16_B");
	Wld_InsertNpc		(OrcScout,"OW_PATH_1_16_B");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_PATH_1_16_7");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_PATH_1_16_7");

	Wld_InsertNpc		(TrollWsciekly01,"FP_CAMPFIRE_OW_FALL");
	
	
	
	
};

	FUNC VOID INIT_SUB_SURFACE()
	{
		// ------ Xardas Turm ------- 
		Wld_AssignRoomToGuild("DT1", GIL_DMT);
		Wld_AssignRoomToGuild("DT2", GIL_DMT); //wichtig, damit Diego nicht folgt
	};

FUNC VOID INIT_SURFACE ()
{
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();    
	
	INIT_SUB_SURFACE();
};



// ------  OldWorld.zen ------
FUNC VOID INIT_OldWorld ()
{
	INIT_SUB_Oldcamp();
	INIT_SUB_Demontower();
	INIT_SUB_Surface();

    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();    
	
	//if (MIS_ReadyForChapter4  == TRUE )	//Joly: muß hier in der INIT ganz zum schluss stehen, nachdem alle NSCs fürs Kapitel insertet wurden!!!
	//&& (B_Chapter4_OneTime == FALSE)
	//{
	//	B_Kapitelwechsel (4, OLDWORLD_ZEN);
	//	B_Chapter4_OneTime = TRUE;
	//};
};

FUNC VOID STARTUP_OldWorld ()
{
	Startup_Oldcamp();
	Startup_Demontower();
	Startup_Surface();
	
	Kapitel = 1; //Joly: Kann hier stehen bleiben!
	PlayVideo ("G2UCIECZKAINTRO.BIK");
	
	Wld_SetTime	(04,00);//Joly:nachtstart wegen video
};

