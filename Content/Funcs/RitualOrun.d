
// Ritual Orun

var int RitualOrun_Vob1;
var int RitualOrun_Vob2;
var int RitualOrun_Vob3;
var int RitualOrun_Vob4;

func void RitualOrun_InitVobs() {

	RitualOrun_Vob1 = MEM_SearchVobByName("RITUAL_ORUN_VOB1");
	RitualOrun_Vob2 = MEM_SearchVobByName("RITUAL_ORUN_VOB2");
	RitualOrun_Vob3 = MEM_SearchVobByName("RITUAL_ORUN_VOB3");
	RitualOrun_Vob4 = MEM_SearchVobByName("RITUAL_ORUN_VOB4");

};

func void RitualOrun_Start() {
	
	RitualOrun_InitVobs();

	FF_ApplyOnceExt(RitualOrun_Loop,250,-1); // 0.25 s
	// TODO od teraz nie mozna zagadywac oruna
};


func void RitualOrun_End() {

	OrunRitual_Finished = TRUE;
	FF_Remove(RitualOrun_Loop);

	// TODO od teraz mozna zagadywac oruna
};



var int RitualOrun_Iterator;
func void RitualOrun_Loop() {

	RitualOrun_Iterator += 1;

	// ----- ----- ----- ----- -----
	// ----- LOOP -----

	if (RitualOrun_Iterator == 4) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob1);
		Wld_VobEffect_Vob("spellFX_RingRitual1", RitualOrun_Vob3);
	}
	
	else if (RitualOrun_Iterator == 5) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}
	
	
	else if (RitualOrun_Iterator == 12) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
	}

	else if (RitualOrun_Iterator == 14) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob4);
		Wld_VobEffect_Vob("SPELLFX_LIGHTSTAR_WHITE", RitualOrun_Vob4);
	}


	else if (RitualOrun_Iterator == 15) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_WJITE", RitualOrun_Vob4);
		Wld_VobEffect_Vob("spellFX_LIGHTSTAR_RingRitual", RitualOrun_Vob4);
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
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob3);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualOrun_Vob3);
	}

	else if (RitualOrun_Iterator == 45) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualOrun_Vob1);
		Wld_VobEffect_Vob("SPELLFX_lightstar_blue", RitualOrun_Vob1);
	}
	
	else if (RitualOrun_Iterator == 49) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob3);
		Wld_VobEffect_Vob("SPELLFX_LIGHTSTAR_WHITE", RitualOrun_Vob3);
	}
	
	else if (RitualOrun_Iterator == 55) {
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_INCOVATION_GREEN", RitualOrun_Vob2);
	}


	else if (RitualOrun_Iterator == 65) {
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
		Wld_VobEffect_Vob("spellFX_RingRitual1", RitualOrun_Vob2);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualOrun_Vob3);
	}

	else if (RitualOrun_Iterator == 101) {
		Wld_VobEffect_Vob("SPELLFX_incovation_green", RitualOrun_Vob3);
		Wld_VobEffect_Vob("spellFX_LIGHTSTAR_RingRitual", RitualOrun_Vob4);
	}
	
	else if (RitualOrun_Iterator == 110) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}
	
	// ----- END -----
	// ----- ----- ----- ----- -----

	else if (RitualOrun_Iterator == 15) {
		B_StartOtherRoutine (NASZ_024_BaalOrun, "Rytual"); // TODO bogu, wydaje mi sie, ze ta zmiana rutyny nie dziala, tak samo jak w RitualMonastir
	}
	
	// 20s
	else if (RitualOrun_Iterator >= 120) {
		RitualOrun_End();
		RitualOrun_Iterator = 0;
	};
	
};