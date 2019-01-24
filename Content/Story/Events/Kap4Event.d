//Misja jednak w Kap3

// --- DEMONY ---
var int Kap4Event_01;
var int Kap4Event_02;
var int Kap4Event_03;
var int Kap4Event_04;
var int Kap4Event_05;
var int Kap4Event_06;
var int Kap4Event_07;
var int Kap4Event_08;
var int Kap4Event_09;
var int Kap4Event_10;
var int Kap4Event_11;
var int Kap4Event_12;
var int Kap4Event_13;
var int Kap4Event_14;
var int Kap4Event_15;
var int Kap4Event_16;
var int Kap4Event_17;
var int Kap4Event_18;

// --- ZOMBIE ---
var int Kap4Event_31;
var int Kap4Event_32;
var int Kap4Event_33;
var int Kap4Event_34;
var int Kap4Event_35;
var int Kap4Event_36;
var int Kap4Event_37;
var int Kap4Event_38;
var int Kap4Event_39;
var int Kap4Event_40;
var int Kap4Event_41;
var int Kap4Event_42;
var int Kap4Event_43;
var int Kap4Event_44;
var int Kap4Event_45;
var int Kap4Event_46;

func void Kap4Event()
{
	if (KAPITEL >= 3) {
	
		// - - - - - DEMONY - - - - -

		if (Npc_GetDistToWP	(hero, "OW_PATH_105") <=1500) && (Kap4Event_01 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon01,"OW_PATH_105");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon01, Demon01, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon01, Demon01, 0, 0, 0, FALSE );
		Kap4Event_01 = TRUE;

		};
	
		if (Npc_GetDistToWP	(hero, "OW_HOSHPAK_01") <=1500) && (Kap4Event_02 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon02,"OW_HOSHPAK_01");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon02, Demon02, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon02, Demon02, 0, 0, 0, FALSE );
		Kap4Event_02 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OC_ORK_BACK_CAMP_13") <=1500) && (Kap4Event_03 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon03,"OC_ORK_BACK_CAMP_13");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon03, Demon03, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon03, Demon03, 0, 0, 0, FALSE );
		Kap4Event_03 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OC_ORK_MAIN_CAMP_03") <=1500) && (Kap4Event_04 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon04,"OC_ORK_MAIN_CAMP_03");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon04, Demon04, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon04, Demon04, 0, 0, 0, FALSE );
		Kap4Event_04 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "SPAWN_WALD_OC_BLOODFLY01") <=1500) && (Kap4Event_05 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon05,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon05, Demon05, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon05, Demon05, 0, 0, 0, FALSE );
		Kap4Event_05 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_ORCBARRIER_11") <=1500) && (Kap4Event_06 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon06,"OW_ORCBARRIER_11");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon06, Demon06, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon06, Demon06, 0, 0, 0, FALSE );
		Kap4Event_06 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "SPAWN_GOBBO_LOCATION_29_03") <=1500) && (Kap4Event_07 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon07,"SPAWN_GOBBO_LOCATION_29_03");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon07, Demon07, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon07, Demon07, 0, 0, 0, FALSE );
		Kap4Event_07 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "LOCATION_18_OUT") <=1500) && (Kap4Event_08 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon08,"LOCATION_18_OUT");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon08, Demon08, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon08, Demon08, 0, 0, 0, FALSE );
		Kap4Event_08 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "LOCATION_19_03_PATH_RUIN11") <=1500) && (Kap4Event_09 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon09,"LOCATION_19_03_PATH_RUIN11");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon09, Demon09, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon09, Demon09, 0, 0, 0, FALSE );
		Kap4Event_09 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_51") <=1500) && (Kap4Event_10 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon10,"OW_PATH_51");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon10, Demon10, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon10, Demon10, 0, 0, 0, FALSE );
		Kap4Event_10 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_STONEHENGE_6") <=1500) && (Kap4Event_11 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon11,"OW_PATH_STONEHENGE_6");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon11, Demon11, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon11, Demon11, 0, 0, 0, FALSE );
		Kap4Event_11 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_159") <=1500) && (Kap4Event_12 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon12,"OW_PATH_159");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon12, Demon12, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon12, Demon12, 0, 0, 0, FALSE );
		Kap4Event_12 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_155") <=1500) && (Kap4Event_13 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon13,"OW_PATH_155");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon13, Demon13, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon13, Demon13, 0, 0, 0, FALSE );
		Kap4Event_13 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_255") <=1500) && (Kap4Event_14 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon14,"OW_PATH_255");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon14, Demon14, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon14, Demon14, 0, 0, 0, FALSE );
		Kap4Event_14 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_1_5_11") <=1500) && (Kap4Event_15 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon15,"OW_PATH_1_5_11");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon15, Demon15, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon15, Demon15, 0, 0, 0, FALSE );
		Kap4Event_15 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6") <=1500) && (Kap4Event_16 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon16,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon16, Demon16, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon16, Demon16, 0, 0, 0, FALSE );
		Kap4Event_16 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_209") <=1500) && (Kap4Event_17 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon17,"OW_PATH_209");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon17, Demon17, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon17, Demon17, 0, 0, 0, FALSE );
		Kap4Event_17 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "CASTLE_8_1") <=1500) && (Kap4Event_18 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("MYSTERY_07");

		Wld_InsertNpc	(Demon18,"CASTLE_8_1");
		Wld_PlayEffect("SPELLFX_incovation_blue",  Demon18, Demon18, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Demon18, Demon18, 0, 0, 0, FALSE );
		Kap4Event_18 = TRUE;

		};
		
		// - - - - - ZOMBIE - - - - -

		if (Npc_GetDistToWP	(hero, "PATH_OC_NC_1") <=1500) && (Kap4Event_31 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie31,"PATH_OC_NC_1");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie31, Zombie31, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie31, Zombie31, 0, 0, 0, FALSE );
		Kap4Event_31 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "SPAWN_OW_BLOODFLY_OC_WOOD03") <=1500) && (Kap4Event_32 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie32,"SPAWN_OW_BLOODFLY_OC_WOOD03");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie32, Zombie32, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie32, Zombie32, 0, 0, 0, FALSE );
		Kap4Event_32 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_292") <=1500) && (Kap4Event_33 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie33,"OW_PATH_292");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie33, Zombie33, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie33, Zombie33, 0, 0, 0, FALSE );
		Kap4Event_33 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_ORCBARRIER_04") <=1500) && (Kap4Event_34 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie34,"OW_ORCBARRIER_04");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie34, Zombie34, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie34, Zombie34, 0, 0, 0, FALSE );
		Kap4Event_34 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "PATH_TO_PLATEAU02") <=1500) && (Kap4Event_35 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie35,"PATH_TO_PLATEAU02");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie35, Zombie35, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie35, Zombie35, 0, 0, 0, FALSE );
		Kap4Event_35 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OC_ROUND_13") <=1500) && (Kap4Event_36 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie36,"OC_ROUND_13");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie36, Zombie36, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie36, Zombie36, 0, 0, 0, FALSE );
		Kap4Event_36 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OC_ORK_BACK_CAMP_07_NAVIGATION") <=1500) && (Kap4Event_37 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie37,"OC_ORK_BACK_CAMP_07_NAVIGATION");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie37, Zombie37, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie37, Zombie37, 0, 0, 0, FALSE );
		Kap4Event_37 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_SAWHUT_MOLERAT_MOVEMENT4") <=1500) && (Kap4Event_38 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie38,"OW_SAWHUT_MOLERAT_MOVEMENT4");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie38, Zombie38, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie38, Zombie38, 0, 0, 0, FALSE );
		Kap4Event_38 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "NASZ_BANDYCI_LOWCY_03") <=1500) && (Kap4Event_39 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie39,"NASZ_BANDYCI_LOWCY_03");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie39, Zombie39, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie39, Zombie39, 0, 0, 0, FALSE );
		Kap4Event_39 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_276") <=1500) && (Kap4Event_40 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie40,"OW_PATH_276");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie40, Zombie40, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie40, Zombie40, 0, 0, 0, FALSE );
		Kap4Event_40 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_07_16") <=1500) && (Kap4Event_41 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie41,"OW_PATH_07_16");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie41, Zombie41, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie41, Zombie41, 0, 0, 0, FALSE );
		Kap4Event_41 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "SPAWN_OW_BLACKGOBBO_A2") <=1500) && (Kap4Event_42 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie42,"SPAWN_OW_BLACKGOBBO_A2");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie42, Zombie42, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie42, Zombie42, 0, 0, 0, FALSE );
		Kap4Event_42 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_184") <=1500) && (Kap4Event_43 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie43,"OW_PATH_184");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie43, Zombie43, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie43, Zombie43, 0, 0, 0, FALSE );
		Kap4Event_43 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_ORC_LOOKOUT_03") <=1500) && (Kap4Event_44 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie44,"OW_ORC_LOOKOUT_03");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie44, Zombie44, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie44, Zombie44, 0, 0, 0, FALSE );
		Kap4Event_44 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_06_03") <=1500) && (Kap4Event_45 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie45,"OW_PATH_06_03");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie45, Zombie45, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie45, Zombie45, 0, 0, 0, FALSE );
		Kap4Event_45 = TRUE;

		};
		
		if (Npc_GetDistToWP	(hero, "OW_PATH_134") <=1500) && (Kap4Event_46 == FALSE) {

		Snd_Play ("MYSTERY_05");
		Snd_Play ("ZOM_DIE01");

		Wld_InsertNpc	(Zombie46,"OW_PATH_134");
		Wld_PlayEffect("SPELLFX_incovation_green",  Zombie46, Zombie46, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_orange",  Zombie46, Zombie46, 0, 0, 0, FALSE );
		Kap4Event_46 = TRUE;

		};
		
		
	};
};