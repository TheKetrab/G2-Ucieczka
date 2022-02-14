
// ***** ***** *****
// MIGRATIONS
// ***** ***** *****

var int OrcAttack;
func void Migration_OrcAttack() {

	OrcAttack = TRUE;
	Wld_SendTrigger ("ZAMEK_BRAMA_1_SKRYPT");
	Wld_SendTrigger ("ZAMEK_BRAMA_2_SKRYPT");

	// Migracja -> orkowy atak po rozwi¹zaniu spraw na bagnie
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_01");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_02");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_03");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_04");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_05");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_06");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCATTACK_07");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_08");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCATTACK_09");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_10");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_11");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_12");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_13");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_14");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_15");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_16");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCATTACK_17");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_18");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_19");
	Wld_InsertNpc	(OrcUltra_Rest,"FP_REST_ORCATTACK_20");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_21");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_22");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_23");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_24");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_25");
	Wld_InsertNpc	(OrcWarrior_Rest,"FP_REST_ORCATTACK_26");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_27");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_28");
	Wld_InsertNpc	(OrcElite_Rest,"FP_REST_ORCATTACK_29");
	Wld_InsertNpc	(OrcShaman_Sit,"FP_REST_ORCATTACK_30");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_31");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_32");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_33");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_34");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_35");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_36");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_37");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_38");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_39");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_40");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_41");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_42");
	Wld_InsertNpc	(OrcUltra_Roam,"FP_ROAM_ORCATTACK_43");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCATTACK_44");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORCATTACK_45");
	
	
	


};

func void Migration_LowcyToTwierdza() {

	// Migracja ³owców do twierdzy
	B_StartOtherRoutine (NASZ_110_Keroloth,"TwierdzaIn");
	B_StartOtherRoutine (NASZ_113_Godar,"Twierdza");
	B_StartOtherRoutine (NASZ_114_Hokurn,"Twierdza");
	B_StartOtherRoutine (NASZ_115_Kurgan,"Twierdza");
	B_StartOtherRoutine (NASZ_116_Kjorn,"Twierdza");
	B_StartOtherRoutine (NASZ_117_Fed,"Twierdza");
	B_StartOtherRoutine (NASZ_118_Ferros,"Twierdza");
	B_StartOtherRoutine (NASZ_123_Lowca,"Twierdza");
	B_StartOtherRoutine (NASZ_108_Lowca,"Twierdza");
	B_StartOtherRoutine (NASZ_109_Rethon,"Twierdza");
	B_StartOtherRoutine (NASZ_112_Peter,"Twierdza");
	B_StartOtherRoutine (NASZ_101_Korth,"Twierdza");
	B_StartOtherRoutine (NASZ_103_Johny,"Twierdza");
	
	B_StartOtherRoutine (NASZ_119_Udar,"UdarBoss");
	
};

func void Migration_ErakToTwierdza() {

	// Erak zabiera ze sob¹ kopaczy
	B_StartOtherRoutine (NASZ_201_Erak, "Twierdza");
	B_StartOtherRoutine (NASZ_319_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_320_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_321_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_325_Grimes,"Twierdza");
};

func void Migration_TeleportMysliwiToTwierdza() {

	// niewykorzystane w grze - tylko dla NASZ_999_Test
	Wld_InsertNpc(NASZ_221_Benito,"TWIERDZA");
	Wld_InsertNpc(NASZ_218_Ammann,"TWIERDZA");
	
	B_StartOtherRoutine (NASZ_213_Gestath,"Twierdza");
	B_StartOtherRoutine (NASZ_201_Erak,"Twierdza");
	B_StartOtherRoutine (NASZ_215_Kivo,"Twierdza");
	B_StartOtherRoutine (NASZ_216_Aran,"Twierdza");
	B_StartOtherRoutine (NASZ_218_Ammann,"Twierdza");
	B_StartOtherRoutine (NASZ_221_Benito,"Twierdza");
	B_StartOtherRoutine (NASZ_227_Vachut,"Twierdza");
	B_StartOtherRoutine (NASZ_229_Ayan,"Twierdza");

};

func void Migration_TwierdzaAtak() {
			
	B_StartOtherRoutine (NASZ_319_Niewolnik,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_320_Niewolnik,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_321_Niewolnik,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_325_Grimes,"TwierdzaAtak");
		
	B_StartOtherRoutine (NASZ_213_Gestath,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_201_Erak,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_215_Kivo,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_216_Aran,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_221_Benito,"TwierdzaAtak");

	B_StartOtherRoutine (NASZ_113_Godar,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_114_Hokurn,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_115_Kurgan,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_116_Kjorn,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_117_Fed,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_118_Ferros,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_123_Lowca,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_108_Lowca,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_109_Rethon,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_112_Peter,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_101_Korth,"TwierdzaAtak");
	B_StartOtherRoutine (NASZ_103_Johny,"TwierdzaAtak");

};

func void Migration_InsertTwierdzaOrc() {

	Wld_InsertNpc	(OrcScout_TwierdzaA,"FP_ROAM_DRAGONSNAPPER_OW_PATH_190_03");
	Wld_InsertNpc	(OrcScout_TwierdzaB,"FP_ROAM_DRAGONSNAPPER_OW_PATH_189_01");
	Wld_InsertNpc	(OrcWarrior_TwierdzaA ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_187_03");
	Wld_InsertNpc	(OrcWarrior_TwierdzaB ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_187_01");
	Wld_InsertNpc	(OrcWarrior_TwierdzaC ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_185_03");
	Wld_InsertNpc	(OrcWarrior_TwierdzaD ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_189_03");
	Wld_InsertNpc	(OrcWarrior_TwierdzaE ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_185_01");
	Wld_InsertNpc	(OrcWarrior_TwierdzaF ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_189_02");
	Wld_InsertNpc	(OrcWarrior_TwierdzaG ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_190_04");
	Wld_InsertNpc	(OrcWarrior_TwierdzaH ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_190_01");
	Wld_InsertNpc	(OrcWarrior_TwierdzaI ,"FP_ROAM_DRAGONSNAPPER_OW_PATH_190_02");
	Wld_InsertNpc	(OrcElite_TwierdzaA,"FP_ROAM_TWIERDZA_ELITE_1");
	Wld_InsertNpc	(OrcElite_TwierdzaB,"FP_ROAM_TWIERDZA_ELITE_2");
	Wld_InsertNpc	(OrcElite_TwierdzaC,"FP_ROAM_TWIERDZA_ELITE_3");	

};

func void Migration_FollowZamek() {

	Npc_ExchangeRoutine (NASZ_109_Rethon, "FollowZamek");
	Druzyna (NASZ_109_Rethon,1);
	NASZ_109_Rethon.flags = 2;

	Npc_ExchangeRoutine (NASZ_110_Keroloth, "FollowZamek");
	Druzyna (NASZ_110_Keroloth,1);
	NASZ_110_Keroloth.flags = 2;

	Npc_ExchangeRoutine (NASZ_115_Kurgan, "FollowZamek");
	Druzyna (NASZ_115_Kurgan,1);
	NASZ_115_Kurgan.flags = 2;

	Npc_ExchangeRoutine (NASZ_215_Kivo, "FollowZamek");
	Druzyna (NASZ_215_Kivo,1);
	NASZ_215_Kivo.flags = 2;

	Npc_ExchangeRoutine (NASZ_218_Ammann, "FollowZamek");
	Druzyna (NASZ_218_Ammann,1);
	NASZ_218_Ammann.flags = 2;

	Npc_ExchangeRoutine (NASZ_227_Vachut, "FollowZamek");
	Druzyna (NASZ_227_Vachut,1);
	NASZ_227_Vachut.flags = 2;

	Npc_ExchangeRoutine (NASZ_229_Ayan, "FollowZamek");
	Druzyna (NASZ_229_Ayan,1);
	NASZ_229_Ayan.flags = 2;

};

func void Migration_GoToScoutHerszt() {

	Npc_ExchangeRoutine (NASZ_109_Rethon, "GoToScout");
	Npc_ExchangeRoutine (NASZ_110_Keroloth, "GoToScout");
	Npc_ExchangeRoutine (NASZ_115_Kurgan, "GoToScout");
	Npc_ExchangeRoutine (NASZ_215_Kivo, "GoToScout");
	Npc_ExchangeRoutine (NASZ_218_Ammann, "GoToScout");
	Npc_ExchangeRoutine (NASZ_227_Vachut, "GoToScout");
	Npc_ExchangeRoutine (NASZ_229_Ayan, "GoToScout");

};

func void Migration_GoToShamanHerszt() {

	Npc_ExchangeRoutine (NASZ_109_Rethon, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_110_Keroloth, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_115_Kurgan, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_215_Kivo, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_218_Ammann, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_227_Vachut, "GoToShaman");
	Npc_ExchangeRoutine (NASZ_229_Ayan, "GoToShaman");

};


func void Migration_GoToDowodca() {

	Npc_ExchangeRoutine (NASZ_109_Rethon, "GoToDowodca");
	Druzyna (NASZ_109_Rethon,0);

	Npc_ExchangeRoutine (NASZ_110_Keroloth, "GoToDowodca");
	// Keroloth ma byc dalej w druzynie
	
	Npc_ExchangeRoutine (NASZ_115_Kurgan, "GoToDowodca");
	Druzyna (NASZ_115_Kurgan,0);

	Npc_ExchangeRoutine (NASZ_215_Kivo, "GoToDowodca");
	Druzyna (NASZ_215_Kivo,0);

	Npc_ExchangeRoutine (NASZ_218_Ammann, "GoToDowodca");
	Druzyna (NASZ_218_Ammann,0);

	Npc_ExchangeRoutine (NASZ_227_Vachut, "GoToDowodca");
	Druzyna (NASZ_227_Vachut,0);

	Npc_ExchangeRoutine (NASZ_229_Ayan, "GoToDowodca");
	Druzyna (NASZ_229_Ayan,0);

};



func void Migration_Kap4() {

	Wld_InsertNpc	(NASZ_010_Monastir,"NASZ_LOWCY_GORA_09"); 
	
	B_StartOtherRoutine (NASZ_120_Phill, "Kap4");  // quest z drzewem
	B_StartOtherRoutine (NASZ_225_Wrzod, "Kap4");  // krzyczy
	B_StartOtherRoutine (NASZ_231_Ted, "Kap4");    // za palisade do klasztoru
	B_StartOtherRoutine (NASZ_119_Udar,"Kap4");    // zostaje szefem

	B_StartOtherRoutine (NASZ_003_Kopacz,"Kap4"); // torturowany niewolnik siada przy ognisku u lowcow
	
	B_StartOtherRoutine (NASZ_319_Niewolnik,"Kap4"); //
	B_StartOtherRoutine (NASZ_320_Niewolnik,"Kap4"); // niewolnicy pracuja w obozie lowcow
	B_StartOtherRoutine (NASZ_321_Niewolnik,"Kap4"); //
	B_StartOtherRoutine (NASZ_325_Grimes,"Kap4");    //

	B_StartOtherRoutine (NASZ_201_Erak,"Kap4");         // zostaje szefem
	B_StartOtherRoutine (NASZ_215_Kivo,"Kap4");         // zamek -> stoi na murze
	B_StartOtherRoutine (NASZ_216_Aran,"Kap4");         // oboz mysliwych -> patroluje przy bramie
	B_StartOtherRoutine (NASZ_218_Ammann,"InCastle");   // zamek -> siedzi na krzesle
	B_StartOtherRoutine (NASZ_221_Benito,"Kap4");       // oboz mysliwych -> patroluje przy bramie
	B_StartOtherRoutine (NASZ_227_Vachut,"Kap4");       // zamek -> kreci roast scavenger
	B_StartOtherRoutine (NASZ_229_Ayan,"InCastle");     // zamek -> stoi z zalozonymmi rekami pod domem magow

	//B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");    // zamek -> siedzi przy krzesle z ammannem
	B_StartOtherRoutine (NASZ_113_Godar,"Kap4");        // -----> oboz (pije w karczmie)
	B_StartOtherRoutine (NASZ_114_Hokurn,"Kap4");       // -----> oboz (pije w karczmie)
	B_StartOtherRoutine (NASZ_115_Kurgan,"InCastle");   // zamek -> stoi tam gdzie Tandor w G2
	B_StartOtherRoutine (NASZ_116_Kjorn,"Kap4");        // -----> oboz (siedzi na lawce Gerolda)
	B_StartOtherRoutine (NASZ_117_Fed,"Kap4");          // -----> oboz (siedzi tam gdzie Daniel w Kap1)
	B_StartOtherRoutine (NASZ_118_Ferros,"Kap4");       // -----> oboz (stoi tam gdzie na poczatku Udar)
	B_StartOtherRoutine (NASZ_109_Rethon,"Zamek");      // zamek
	B_StartOtherRoutine (NASZ_112_Peter,"Kap4");        // -----> oboz (siedzi na krzesle w karczmie)
	B_StartOtherRoutine (NASZ_101_Korth,"Kap4");        // -----> oboz
	B_StartOtherRoutine (NASZ_103_Johny,"Start");       // -----> oboz
	

	B_StartOtherRoutine (NASZ_203_Tabuk,"Kap4");        // oboz
	B_StartOtherRoutine (NASZ_204_Vick,"Start");        // oboz mysliwych (TODO niech umrze)
	B_StartOtherRoutine (NASZ_205_Mysliwy,"Kap4");      // oboz 
	B_StartOtherRoutine (NASZ_206_Mysliwy,"Kap4");      // oboz 
	B_StartOtherRoutine (NASZ_209_Mysliwy,"Kap4");      // oboz 
	B_StartOtherRoutine (NASZ_210_Mysliwy,"Kap4");      // oboz 
	B_StartOtherRoutine (NASZ_214_Goth,"Kap4");         // stoi przed brama z dwoma mysliwymi

	B_StartOtherRoutine (NASZ_230_Dymoondo,"Kap4Mysliwi"); // jest u mysliwych

	
};


func void Migration_LowcyToZamek() {

	B_StartOtherRoutine (NASZ_101_Korth,"InCastle");   // stoi przed brama
	B_StartOtherRoutine (NASZ_103_Johny,"InCastle");   // siedzi przy ognisku
	B_StartOtherRoutine (NASZ_113_Godar,"InCastle");   // trenuje mieczem w zamku
	B_StartOtherRoutine (NASZ_114_Hokurn,"InCastle");  // trenuje mieczem w zamku
	B_StartOtherRoutine (NASZ_117_Fed,"InCastle");     // siedzi przy ognisku
	B_StartOtherRoutine (NASZ_118_Ferros,"InCastle");  // stoi i je tam gdzie w g2
	
	if (hero.guild == GIL_DJG) {
		// ci ludzie sie pojawiaja tylko jesli jestes lowca
		B_StartOtherRoutine (NASZ_130_Jenkins,"Kap4"); // -
		B_StartOtherRoutine (NASZ_131_Lowca,"Kap4");   // | -> ci trzej sobie stoj¹ przy bramie g³ównej
		B_StartOtherRoutine (NASZ_132_Lowca,"Kap4");   // -
	};

	
};