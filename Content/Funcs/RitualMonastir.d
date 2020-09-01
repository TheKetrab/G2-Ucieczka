
// Ritual Monastir

var int RitualMonastir_Vob1;
var int RitualMonastir_Vob2;
var int RitualMonastir_Vob3;
var int RitualMonastir_Vob4;
var int RitualMonastir_Vob5;
var int RitualMonastir_Vob6;

var int MonastirRitualRunning;

func void RitualMonastir_InitVobs() {

	RitualMonastir_Vob1 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB1");
	RitualMonastir_Vob2 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB2");
	RitualMonastir_Vob3 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB3");
	RitualMonastir_Vob4 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB4");
	RitualMonastir_Vob5 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB5");
	RitualMonastir_Vob6 = MEM_SearchVobByName("RITUAL_MONASTIR_GATE_VOB6");

};

func void RitualMonastir_Start() {
	
	RitualMonastir_InitVobs();

	FF_ApplyOnceExt(RitualMonastir_Loop,250,-1); // 0.25 s
	MonastirRitualRunning = TRUE;
};


func void RitualMonastir_InsertOrcs() {
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
};

func void RitualMonastir_OpenGateOrcTown ()
{
	Wld_SendTrigger ("ORCTOWN_MOVER_01_SCRIPT");
	Wld_SendTrigger ("ORCTOWN_MOVER_02_SCRIPT");
	Wld_SendTrigger ("ORCTOWN_MOVER_03_SCRIPT");
	//Wld_SendTrigger ("ORCTOWN_MOVER_04_SCRIPT"); to wywala gre
	Wld_SendTrigger ("ORCTOWN_MOVER_05_SCRIPT");
	Wld_SendTrigger ("ORCTOWN_MOVER_06_SCRIPT");
	Wld_SendTrigger ("ORCTOWN_MOVER_07_SCRIPT");
};



func void RitualMonastir_End() {

	FF_Remove(RitualMonastir_Loop);
	RitualMonastir_OpenGateOrcTown();
	RitualMonastir_InsertOrcs();
	
	WillMozePrzejscPrzezBariere = TRUE; // dzieki temu nie zabije nas trigger
	MonastirOpenGateOneTime = TRUE; // dzieki temu kontynuujemy dialog z monastirem po rytuale
	
	Wld_VobEffect_Vob("SPELLFX_incovation_blue",RitualMonastir_Vob1);
	Wld_VobEffect_Vob("SPELLFX_lightstar_white",RitualMonastir_Vob1);

	MonastirRitualRunning = FALSE;
};



var int RitualMonastir_Iterator;
func void RitualMonastir_Loop() {

	RitualMonastir_Iterator += 1;

	// ----- ----- ----- ----- -----
	// ----- LOOP -----

	if (RitualMonastir_Iterator == 4) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob1);
	}
	
	else if (RitualMonastir_Iterator == 5) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}
	
	else if (RitualMonastir_Iterator == 12) {
		Wld_VobEffect_Vob("SPELLFX_incovation_blue", RitualMonastir_Vob4);
	}

	else if (RitualMonastir_Iterator == 13) {
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualMonastir_Vob5);
	}


	else if (RitualMonastir_Iterator == 15) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob2);
	}

	else if (RitualMonastir_Iterator == 17) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob3);
	}
	
	else if (RitualMonastir_Iterator == 25) {
		Wld_VobEffect_Vob("SPELLFX_incovation_blue", RitualMonastir_Vob4);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualMonastir_Vob4);
	}
	
	else if (RitualMonastir_Iterator == 29) {
		Wld_VobEffect_Vob("SPELLFX_incovation_blue", RitualMonastir_Vob5);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualMonastir_Vob5);
	}

	
	else if (RitualMonastir_Iterator == 30) {
		Wld_VobEffect_Vob("SPELLFX_incovation_blue", RitualMonastir_Vob6);
		Wld_VobEffect_Vob("SPELLFX_lightstar_white", RitualMonastir_Vob6);
	}

	else if (RitualMonastir_Iterator == 35) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob3);
	}

	else if (RitualMonastir_Iterator == 36) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob6);
	}

	else if (RitualMonastir_Iterator == 37) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob2);
	}

	else if (RitualMonastir_Iterator == 38) {
		Wld_PlayEffect("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE );
	}

	else if (RitualMonastir_Iterator == 45) {
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualMonastir_Vob4);
		Wld_VobEffect_Vob("SPELLFX_lightstar_blue", RitualMonastir_Vob4);
	}
	
	else if (RitualMonastir_Iterator == 49) {
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualMonastir_Vob5);
		Wld_VobEffect_Vob("SPELLFX_lightstar_blue", RitualMonastir_Vob5);
	}

	else if (RitualMonastir_Iterator == 50) {
		Wld_VobEffect_Vob("SPELLFX_incovation_white", RitualMonastir_Vob6);
		Wld_VobEffect_Vob("SPELLFX_lightstar_blue", RitualMonastir_Vob6);
	}

	else if (RitualMonastir_Iterator == 65) {
		Wld_VobEffect_Vob("spellFX_BELIARSRAGE", RitualMonastir_Vob1);
	}
	
	
	// ----- END -----
	// ----- ----- ----- ----- -----

	else if (RitualMonastir_Iterator == 78) {
		B_StartOtherRoutine (NASZ_010_Monastir, "Gate"); // TODO ta zmiana rutyny nie działa! czemu? :(
	}
	
	// 20s
	else if (RitualMonastir_Iterator >= 80) {
		RitualMonastir_End();
		RitualMonastir_Iterator = 0;
	};
	
};