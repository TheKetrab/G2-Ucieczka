// **************
// Kapitelwechsel
// **************

var int Kap1OneTime;
var int Kap2OneTime;
var int Kap3OneTime;
var int Kap4OneTime;

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel, VAR INT aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	
	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if (neues_Kapitel == 1)
	{
		// ------ Tagebucheintrag ------

		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_1,KapWechsel_1_Text,"U_KAP1.tga","chapter_01.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		if (Kap2OneTime == FALSE) {
		
		// NPC

		Wld_InsertNpc	(NASZ_409_Nieznany,"NASZ_BANDYCI_ARTEFAT_2");
		Wld_InsertNpc	(NASZ_350_Knecht,"NASZ_ARTEFAKT_MOC_1");
		Wld_InsertNpc	(NASZ_351_Knecht,"NASZ_ARTEFAKT_MOC_2");


		// Funkcje
		//CreateInvItems(NASZ_Kurg_Kan,ItMw_2H_OrcAxe_02),1);
		EquipItem (self, ItMw_2H_OrcAxe_02);
		B_KillNpc(NASZ_350_Knecht);
		B_KillNpc(NASZ_351_Knecht);
		B_StartOtherRoutine (NASZ_111_Gerold, "Cmentarz");
		
		if (MIS_GEROLD_READY == TRUE)
		{
			Log_SetTopicStatus (TOPIC_Gerold_Keroloth, LOG_OBSOLETE);
			MIS_GEROLD_READY = FALSE;
		};
		
		if (MIS_Wilki_Ready == TRUE)
		{
			Log_SetTopicStatus (TOPIC_Gestath_wilki, LOG_OBSOLETE);
			MIS_Wilki_Ready = FALSE;
		};
		
		
		B_StartOtherRoutine (NASZ_231_Ted, "Kap2");
		B_StartOtherRoutine (NASZ_101_Korth, "Start");
		TedIsSick = TRUE;
		
		// ------ Itemy -----
		Wld_InsertItem (ItNa_SummonStraznik,"FP_TAJEMNICZY_ZWOJ_1");
		Wld_InsertItem (ItNa_SummonStraznik,"FP_TAJEMNICZY_ZWOJ_2");
		

		
		// Respawn
		
		//LAS OC
		Wld_InsertNpc	(Scavenger,"FP_ROAM_OW_SCAVENGER_BANDIT_02_2");	
		Wld_InsertNpc	(Gobbo_Black,"SPAWN_OW_MOLERATS_WOOD_OM");	
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_SCAVENGER_BANDIT_02_2");
		Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SCAVENGER_BANDIT_02");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_OW_SCAVENGER_OCWOOD5");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_OW_SCAVENGER_OCWOOD3");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SCAVENGER_WOOD10_03");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SCAVENGER_WOOD10_01");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SCAVENGER_WOOD10_04");
		Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_OW_MOLERATS_WOOD_OM");
		Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_OW_MOLERATS_WOOD_OM3");
		Wld_InsertNpc	(Gobbo_Black,"FP_ROAM_OW_MOLERATS_WOOD_OM5");
		Wld_InsertNpc	(DragonSnapper,"FP_SMALLTALK_A_START_PATH_1_5_1");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_STARTSCAVNGERBO_01_01");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_STARTSCAVNGERBO_01_02");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_STARTSCAVENGER_02_01");
		Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOODFLY_E_1");
		Wld_InsertNpc	(Lurker,"OW_RIVERBED_07");
		Wld_InsertNpc	(Lurker,"FP_SLEEP_OW_BLOODFLY_01_02");
		Wld_InsertNpc	(Lurker,"FP_ROAM_OW_BLOODFLY_01_02");
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_OW_STARTSCAVENGER_02_03");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SCAVENGER_01_05");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_GOBBO_07_04");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_GOBBO_07_02");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_GOBBO_07_05");
		Wld_InsertNpc	(Snapper,"FP_SMALLTALK_A_START_PATH_1_5_1");
		Wld_InsertNpc	(Snapper,"FP_SMALLTALK_A_START_PATH_1_5_2");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_STARTSCAVNGERBO_01_02");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_MAETBUG_01_01");
		Wld_InsertNpc	(Snapper,"FP_STAND_GUARDING_JERGAN_01");
	

		//LAS ZAMEK
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_LURKER_RIVER");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_LURKER_RIVER2");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_04");
		Wld_InsertNpc	(Snapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_03");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_SCAVENGER_03_03");
		Wld_InsertNpc	(GroznyScierwojad,"FP_SLEEP_OW_SCAVENGER_03_01");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_OW_SCAVENGER_03_02");
		Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF2_WALD_OC8");
		Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF2_WALD_OC6");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_MOLERAT2_WALD_OC3");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_MOLERAT2_WALD_OC2");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_MOLERAT2_WALD_OC4");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ORK_OC_11_2");
		Wld_InsertNpc	(GroznyScierwojad,"FP_ROAM_ORK_OC_12_2");
		Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_ORK_OC_12");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_OW_MOLERAT_01_02");
		Wld_InsertNpc	(Lurker,"FP_PALISADE_LURKER_05");

		//PALISADA
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_ORCBARRIER_04_04");
		Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_10");
		Wld_InsertNpc	(Scavenger,"FP_PALISADE_SCAVENGER_11");
		Wld_InsertNpc	(Scavenger_Demon,"FP_PALISADE_SCAVENGER_12");
		Wld_InsertNpc	(Scavenger_Demon,"FP_PALISADE_SCAVENGER_09");
		Wld_InsertNpc	(Scavenger_Demon,"FP_PALISADE_SCAVENGER_08");
		Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_EBENE_02_05");

		//OKOLICE LOWCOW
		Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_SCAVENGER_AL_ORC4");
		Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_SCAVENGER_AL_ORC3");
		Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_SCAVENGER_AL_ORC2");
		Wld_InsertNpc	(Wolf,"FP_SIT_OW2");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_ORK_OC_25");
		Wld_InsertNpc	(GroznyScierwojad,"FP_SLEEP_OW_SCAVENGER_AL_NL_02");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_OW_GREEGOBBO_SAWHUT_3");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_ROAM_OW_GREEGOBBO_SAWHUT");
		Wld_InsertNpc	(GroznyKretoszczur,"FP_CAMPFIRE_CAVALORN_01");
		Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MEATBUG_OLDWOOD_2");
		Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MEATBUG_OLDWOOD_3");
		Wld_InsertNpc	(Molerat,"FP_ROAM_OW_MEATBUG_OLDWOOD");
		Wld_InsertNpc	(Scavenger_Demon,"FP_SLEEP_OW_SCAVENGER_TREE2");
		Wld_InsertNpc	(Wolf,"FP_ROAM_DEADWOOD_WOLF_04");
		Wld_InsertNpc	(ShadowBeast,"FP_ROAM_OW_SHADOWBEAST_10_06_02");
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_SCAVENGER_13_06");
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_SCAVENGER_13_05");
		Wld_InsertNpc	(IceWolf,"FP_SLEEP_OW_SCAVENGER_13_01");
		Wld_InsertNpc	(GroznyTopielec,"FP_SMALLTALK_OW_DJG_VORPOSTEN_01");
		Wld_InsertNpc	(GroznyTopielec,"FP_STAND_OW_DJG_VORPOSTEN_01");

		//LAS KOPALNIA
		Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_OW_WARAN_EBENE_02_01");
		Wld_InsertNpc	(GroznyJaszczur,"FP_ROAM_OW_WARAN_EBENE_02_05");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_PATH_333_01");
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_OW_PATH_333_02");
		Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_02");
		Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_03");
		Wld_InsertNpc	(Bloodfly,"FP_LASKOPALNIA_10");
		Wld_InsertNpc	(GroznyWilk,"FP_LASKOPALNIA_11");
		



		// ------ Tagebucheintrag ------

			Kap2OneTime = TRUE;
		};
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_2,KapWechsel_2_Text,"U_KAP2.tga","chapter_01.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{	
		if (Kap3OneTime == FALSE) {

		// ta funkcja jednak juz od w rozdzialu!
		FF_ApplyOnceExt (Kap4Event, 3000, -1); //raz na 3s
		
		if (KurgKanTanczy) {
			KurgKanKap3();
		};
		
		if (DraalUratowany) {
			CreateInvItems(NASZ_007_Draal,ItNa_OUT_L,1);
			CreateInvItems(NASZ_007_Draal,ItMw_1H_Sword_L_03,1);
			CreateInvItems(NASZ_007_Draal,ItRw_Sld_Bow,1);
			
			AI_EquipBestRangedWeapon(NASZ_007_Draal);
			AI_EquipBestMeleeWeapon(NASZ_007_Draal);
			AI_EquipBestArmor (NASZ_007_Draal);
		};
		// Funkcje
		
		 // usuwa paczki z bronia, bo je niewolnicy wykorzystali,  TODO bogu - to NIE DZIALA
		Mob_CreateItems ("BAN_NIEWOLNICY_CHEST", ItNa_PaczkaZBronia, (-1) * Mob_HasItems("BAN_NIEWOLNICY_CHEST", ItNa_PaczkaZBronia));
		
		Wld_SendTrigger ("TRIGGER_PELZACZE_KRATA");
		B_StartOtherRoutine (NASZ_205_Mysliwy, "Kap3");
		B_StartOtherRoutine (NASZ_232_Jehen, "Ukryty");
		Wld_InsertNpc(NASZ_021_Nieznajomy,"TOT");
		Npc_RemoveInvItems (NASZ_327_Danny,ItFo_SmellyFish,30);
		Npc_RemoveInvItems (NASZ_327_Danny,ItFo_Fish,20);
		Npc_RemoveInvItems (NASZ_327_Danny,ItNa_Losos,15);
		Npc_RemoveInvItems (NASZ_327_Danny,ItFo_FishSoup,15);
		Npc_RemoveInvItems (NASZ_327_Danny,ItFo_Addon_SchnellerHering,5);
		FF_ApplyOnceExt(UrShakFinal,1000,-1);
		
		GateTwierdza_Open();
		
		
		B_RemoveNpc (NASZ_305_Rabon);
		B_RemoveNpc (NASZ_006_Renegat);
		B_RemoveNpc (NASZ_011_Renegat);
		B_RemoveNpc (NASZ_012_Renegat);
	
		
		if (MIS_Erak_zwiad == TRUE)
		{
			Log_SetTopicStatus (TOPIC_Erak_zwiad, LOG_OBSOLETE);
			MIS_Erak_zwiad = FALSE;
		};		
		
		
		
		
		// ------ Respawn ------
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_01"); 
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_02"); 
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_03"); 
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_04"); 
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_05"); 
		Wld_InsertNpc	(Topielec_Wsciekly_A,"NASZ_BANDYCI_WODOSPAD_06"); 

		// blotne weze
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_ENTRANCE_03");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_ENTRANCE_02");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_01");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_02");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_3_02");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_17_01");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_7_02");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_3_01");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_8_03");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_1");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_2");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_3");
		Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_4");

		
		//LAS OC
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_OW_MOLERAT_OCWOOD_OC4"); 
		Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_C2"); 
		Wld_InsertNpc	(WildBloodfly01,"FP_ROAM_OW_BLOODFLY_C5"); 
		Wld_InsertNpc	(Bloodfly,"FP_ROAM_OW_BLOODFLY_C4"); 
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_OW_BLOODFLY_WOOD05_04"); 
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_OW_BLOODFLY_WOOD05_03"); 

		// Kopalnia Fajetha
		Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_01");
		Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_02");
		Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_03");
		Wld_InsertNpc	(Keiler,"FP_ROAM_OW_WARAN_ORC_04");
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_WULKAN_06");
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_WULKAN_07");
		Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_08");
		Wld_InsertNpc	(Snapper,"FP_ROAM_WULKAN_09");


		
		//LAS ZAMEK
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_WOLF2_WALD_OC6"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_WOLF2_WALD_OC4"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_BLOODFLY_WALD_OC5"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_BLOODFLY_WALD_OC2"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_ORK_OC_11_2"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_ORK_OC_12"); 
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_04"); 
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_OW_SNAPPER_OCWOOD1_05_01"); 
		Wld_InsertNpc	(DragonSnapper,"FP_LASZAMEK_MOLERAT_04"); 
		Wld_InsertNpc	(DragonSnapper,"FP_ROAM_OW_WARAN_OC_PSI2"); 
		Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_10");
		Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_11");
		Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_12");
		Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_13");

		//PALISADA
		Wld_InsertNpc	(DragonSnapper,"NASZ_FP_VICK_C"); 
		Wld_InsertNpc	(DragonSnapper,"NASZ_FP_VICK_B"); 
		Wld_InsertNpc	(DragonSnapper,"NASZ_FP_VICK_A"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_ORCBARRIER_08_03"); 
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_ORCBARRIER_08_02"); 
		Wld_InsertNpc	(GroznyWilk,"FP_PALISADE_SCAVENGER_11"); 
		Wld_InsertNpc	(GroznyWilk,"FP_PALISADE_SCAVENGER_10"); 
		Wld_InsertNpc	(GroznyWilk,"FP_PALISADE_SCAVENGER_12"); 

		Wld_InsertNpc	(WaranWsciekly01,"FP_ROAM_OW_WARAN_EBENE_02_04");
		Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_EBENE_02_02");
		Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_EBENE_02_03");
		Wld_InsertNpc	(WaranWsciekly01,"FP_ROAM_OW_WARAN_EBENE_02_08");
		Wld_InsertNpc	(Waran,"FP_ROAM_OW_WARAN_EBENE_02_09");
		Wld_InsertNpc	(WaranWsciekly01,"FP_ROAM_OW_WARAN_EBENE_02_07");
		Wld_InsertNpc	(Waran,"FP_ROAM_ROCKCAMP_02");
	
		//WULKAN
		Wld_InsertNpc	(Razor,"FP_ROAM_CASTLE_4_01"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_ORC_14_3"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_ORC_18"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_ORC_14"); 		
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_WULKAN_09"); 		
		Wld_InsertNpc	(ShadowBeast,"FP_ROAM_OW_SNAPPER_02_04"); 		
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_CASTLE_8_3"); 		
		Wld_InsertNpc	(Shadowbeast,"FP_ROAM_OW_PATH_333_02");
		Wld_InsertNpc	(Shadowbeast,"FP_ROAM_OW_PATH_333_03");
		
		//OKOLICE BANDYTOW
		Wld_InsertNpc	(Warg,"FP_ROAM_ORC_2_1_8"); 		
		Wld_InsertNpc	(Warg,"FP_ROAM_ORC_2_1_6"); 		
		Wld_InsertNpc	(Bloodhound,"FP_ROAM_OW_PATH_092_02"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_WARAN_06_02"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_WARAN_06_05"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_WARAN_06_04"); 		
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_DEADWOOD_WOLF_05"); 		
		Wld_InsertNpc	(GroznyWilk,"FP_ROAM_DEADWOOD_WOLF_03"); 		
		Wld_InsertNpc	(GroznyWilk,"FP_SLEEP_DEADWOOD_WOLF_05"); 		
		Wld_InsertNpc	(GroznyDzik,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHAADOW");
		Wld_InsertNpc	(GroznyDzik,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHADOW2");
		Wld_InsertNpc	(GroznyDzik,"FP_ROAM_OW_SHADOWBEAST_NEAR_SHADOW4");
		Wld_InsertNpc	(Shadowbeast,"FP_ROAM_OW_WOLF_NEAR_SHADOW3");
		Wld_InsertNpc	(Scavenger_Demon,"FP_SLEEP_OW_SCAVENGER_10_01");
		Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SHADOWBEAST_10_02");
		Wld_InsertNpc	(Scavenger_Demon,"FP_ROAM_OW_SHADOWBEAST_10_10_05");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORC_05");
		Wld_InsertNpc	(WscieklyWilk1,"FP_ROAM_ORC_06");
	
		//OKOLICE LOWCOW
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_SCAVENGER_13_02"); 		
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_SCAVENGER_13_04"); 		
		Wld_InsertNpc	(IceWolf,"FP_SLEEP_OW_SCAVENGER_13_02"); 		
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_ENTRANCE_ICEGOLEM_02"); 		
		Wld_InsertNpc	(IceWolf,"FP_ROAM_OW_ICEREGION_ENTRANCE_ICEGOLEM_01"); 		
		Wld_InsertNpc	(IceWolf,"FP_ROAM_RYBAK_12"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_SNAPPER_CANYONCAVE3"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_SNAPPER_CANYONCAVE2"); 		
		Wld_InsertNpc	(Razor,"FP_ROAM_OW_SNAPPER_CANYONCAVE4"); 		
		
		
		//TOPIELCE
		Wld_InsertNpc	(Topielec_Wsciekly_A,"FP_ROAM_RYBAK_08"); 		
		Wld_InsertNpc	(Topielec_Wsciekly_A,"FP_ROAM_OW_SCAVENGER_BANDIT_02"); 		
		Wld_InsertNpc	(Topielec_Wsciekly,"FP_ROAM_OW_BLOODFLY_E_3"); 		
		Wld_InsertNpc	(Topielec_Wsciekly_A,"FP_ROAM_OW_BLOODFLY_E_1"); 		
		Wld_InsertNpc	(Topielec_Wsciekly_A,"FP_ROAM_OW_BLOODFLY_E_2"); 		
		Wld_InsertNpc	(Topielec_Wsciekly_A,"OW_RIVERBED_07"); 		
		Wld_InsertNpc	(Topielec_Wsciekly,"FP_ROAM_OW_BLOODFLY_01_04"); 		
		Wld_InsertNpc	(Topielec_Wsciekly,"FP_ROAM_OW_LURKER_RIVER2_BEACH5"); 		
		Wld_InsertNpc	(Topielec_Wsciekly_A,"FP_LASKOPALNIA_29"); 		
	
		//ZAMEK
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_27_4");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_27_5");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_05");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_TUNING_15");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_TUNING_08");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_TUNING_07");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_24");
		Wld_InsertNpc	(Warg,"FP_ROAM_ORK_OC_23");		

		// ------ Missionsvariablen ----
		
		
		// ------ MissionItems -----
		
		Kap3OneTime = TRUE;
		};
		
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_3,KapWechsel_3_Text,"U_KAP3.tga","chapter_01.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		if (Kap4OneTime == FALSE) {

		
		
		
		// Funkcje
		Migration_Kap4();
		
		if (MIS_PodleGadyRunning == TRUE) {
			Log_SetTopicStatus(TOPIC_Mysliwy_warta,LOG_OBSOLETE);
		};

		Wld_SendTrigger ("MOVER_GESTATH_GRAVE");
		B_StartOtherRoutine (NASZ_213_Gestath,"TOT");
		AI_Teleport(NASZ_213_Gestath,"TOT");
		
		Wld_SendTrigger ("ORCGATE1_SCRIPT");
		Wld_SendTrigger ("ORCGATE2_SCRIPT");
	
		Wld_SendTrigger ("MOVER_GRAVE5_GROB");
		Wld_SendTrigger ("MOVER_GRAVE5_BECZKA");
	
		GateMysliwi_Close(); // zamknij brame do mysliwych
		
		// ------ Respawn ------

		//Plaskowyz
		Wld_InsertNpc	(Troll_Black_Plaskowyz,"FP_BLACK_TROLL_PLASKOWYZ");
		Wld_InsertNpc	(BlackGobboGigant1,"FP_GOBBO1_PLASKOWYZ");
		Wld_InsertNpc	(BlackGobboGigant2,"FP_GOBBO2_PLASKOWYZ");
		Wld_InsertNpc	(BlackGobboGigant3,"FP_GOBBO3_PLASKOWYZ");
		Wld_InsertNpc	(Harpy_Gigant,"FP_HARPY_PLASKOWYZ");
		Wld_InsertNpc	(OrcBiterGigant1,"FP_KASACZ1_PLASKOWYZ");
		Wld_InsertNpc	(OrcBiterGigant2,"FP_KASACZ2_PLASKOWYZ");
		
		// ------ Missionsvariablen ----
		
		
		// ------ MissionItems -----
		
		Kap4OneTime = TRUE;
		};
		
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_4,KapWechsel_4_Text,"U_KAP4.tga","chapter_01.wav", 6000);
	}

	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] 	= TRUE;	//Joly: zur Sicherheit.
		// ------ Tagebucheintrag ------
		
		if (!FF_Active (Function15s))
		{
			FF_ApplyOnceExt (Function15s, 15000, -1); //raz na 15s
		};
		
		// ------ Bild einblenden ------
		IntroduceChapter (KapWechsel_5,KapWechsel_5_Text,"U_KAP5.tga","chapter_01.wav", 6000);
		
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] 	= TRUE;	//Joly: zur Sicherheit.
	
		// ------ Tagebucheintrag ------
		
		// ------ Bild einblenden ------
		//Joly: IntroduceChapter JETZT IM TRIGGERFELD (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);   
	};

};
