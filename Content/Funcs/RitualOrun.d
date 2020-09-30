
// Ritual Orun

var int RitualOrun_Vob1;
var int RitualOrun_Vob2;
var int RitualOrun_Vob3;
var int RitualOrun_Vob4;

var int OrunRitualRunning;

func void RitualOrun_InitVobs() {

	RitualOrun_Vob1 = MEM_SearchVobByName("RITUAL_ORUN_VOB1");
	RitualOrun_Vob2 = MEM_SearchVobByName("RITUAL_ORUN_VOB2");
	RitualOrun_Vob3 = MEM_SearchVobByName("RITUAL_ORUN_VOB3");
	RitualOrun_Vob4 = MEM_SearchVobByName("RITUAL_ORUN_VOB4");

};

var int RitualOrun_Running;
func void RitualOrun_Start() {
	
	RitualOrun_InitVobs();
	RitualOrun_Running = TRUE;

	FF_ApplyOnceExt(RitualOrun_Loop,250,-1); // 0.25 s
	OrunRitualRunning = TRUE;
};


func void RitualOrun_End() {

	OrunRitual_Finished = TRUE;
	RitualOrun_Running = FALSE;
	FF_Remove(RitualOrun_Loop);

	OrunRitualRunning = FALSE;
};


var int RitualOrun_Iterator;
func void RitualOrun_Loop() {

	RitualOrun_Iterator += 1;

	var c_npc orun; orun = Hlp_GetNpc(NASZ_024_BaalOrun);
	// ----- ----- ----- ----- -----
	// ----- LOOP -----

	if (RitualOrun_Iterator == 4) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob1);
		Wld_VobEffect_Vob("spellFX_RingRitual1", RitualOrun_Vob3);
	}
	
	else if (RitualOrun_Iterator == 5) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}
	
	else if (RitualOrun_Iterator == 7) {
		var c_npc cain; cain = Hlp_GetNpc(NASZ_021_Nieznajomy);
		cain.guild = GIL_SKELETON;
		Npc_SetTrueGuild (NASZ_021_Nieznajomy, GIL_SKELETON);

		Wld_InsertNpc(Demon,"NASZ_ZAPALISADA_RITUAL_02");
		Wld_InsertNpc(Demon,"NASZ_ZAPALISADA_RITUAL_03");
	}
	
	else if (RitualOrun_Iterator == 8) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC4");

		B_StartOtherRoutine(NASZ_021_Nieznajomy,"FightRitual");
		AI_Teleport(NASZ_021_Nieznajomy,"NASZ_ZAPALISADA_RITUAL_01");
		B_Attack (NASZ_021_Nieznajomy, hero, AR_KILL, 1);
	}
	
	else if (RitualOrun_Iterator == 12) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
	}
	
	else if (RitualOrun_Iterator == 13) {

		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_01");
		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_02");
		Wld_InsertNpc(Skeleton_Lord,"FP_NASZ_ZAPALISADA_RITUAL_03");
		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_04");
		Wld_InsertNpc(Skeleton_Lord,"FP_NASZ_ZAPALISADA_RITUAL_05");
		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_06");
		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_07");
		Wld_InsertNpc(Skeleton_Lord,"FP_NASZ_ZAPALISADA_RITUAL_08");
		Wld_InsertNpc(SkeletonPro,"FP_NASZ_ZAPALISADA_RITUAL_09");
		Wld_InsertNpc(Skeleton_Lord,"FP_NASZ_ZAPALISADA_RITUAL_10");
	}

	else if (RitualOrun_Iterator == 14) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC3");
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob4);
		Wld_VobEffect_Vob("SPELLFX_LIGHTSTAR_WHITE", RitualOrun_Vob4);
	}


	else if (RitualOrun_Iterator == 15) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_WJITE", RitualOrun_Vob4);
		Wld_VobEffect_Vob("spellFX_LIGHTSTAR_RingRitual", RitualOrun_Vob4);
	}

	else if (RitualOrun_Iterator == 25) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC2");
	}

	
	else if (RitualOrun_Iterator == 30) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob1);
		Wld_VobEffect_Vob("SPELLFX_lightstar_green", RitualOrun_Vob1);
	}
	
	else if (RitualOrun_Iterator == 31) {
		Wld_VobEffect_Vob("spellFX_RingRitual1", RitualOrun_Vob2);
		Wld_VobEffect_Vob("spellFX_LIGHTSTAR_RingRitual", RitualOrun_Vob2);
	}


	else if (RitualOrun_Iterator == 32) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC");
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob3);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualOrun_Vob3);
	}

	else if (RitualOrun_Iterator == 45) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob1);
		Wld_VobEffect_Vob("SPELLFX_lightstar_blue", RitualOrun_Vob1);
	}
	
	else if (RitualOrun_Iterator == 49) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC3");
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob3);
		Wld_VobEffect_Vob("SPELLFX_LIGHTSTAR_WHITE", RitualOrun_Vob3);
	}
	
	else if (RitualOrun_Iterator == 55) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
	}


	else if (RitualOrun_Iterator == 65) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC4");
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualOrun_Vob2);
	}

	else if (RitualOrun_Iterator == 67) {
		Wld_VobEffect_Vob("SPELLFX_incovation_green", RitualOrun_Vob4);
		Wld_VobEffect_Vob("SPELLFX_lightstar_green", RitualOrun_Vob4);
	}
	
	else if (RitualOrun_Iterator == 95) {
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob1);
		Wld_VobEffect_Vob("SPELLFX_lightstar_green", RitualOrun_Vob2);
	}

	else if (RitualOrun_Iterator == 100) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC");
		Wld_VobEffect_Vob("spellFX_RingRitual1", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualOrun_Vob3);
	}

	else if (RitualOrun_Iterator == 101) {
		Wld_VobEffect_Vob("SPELLFX_incovation_green", RitualOrun_Vob3);
		Wld_VobEffect_Vob("spellFX_LIGHTSTAR_RingRitual", RitualOrun_Vob4);
	}
	
	else if (RitualOrun_Iterator == 110) {
		AI_PlayAni (orun,"T_PRACTICEMAGIC2");
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}
	
	// ----- END -----
	// ----- ----- ----- ----- -----

	else if (RitualOrun_Iterator == 15) {
		B_StartOtherRoutine (NASZ_024_BaalOrun, "Rytual"); // TODO, wydaje mi sie, ze ta zmiana rutyny nie dziala, tak samo jak w RitualMonastir
	}
	
	// 20s
	else if (RitualOrun_Iterator >= 120) {
		RitualOrun_End();
		RitualOrun_Iterator = 0;
	};
	
};