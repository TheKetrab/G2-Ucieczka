
// ***** ***** *****
// MIGRATIONS
// ***** ***** *****

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

	Npc_ExchangeRoutine (NASZ_110_Keroloth, "FollowZamek");
	Druzyna (NASZ_110_Keroloth,1);

	Npc_ExchangeRoutine (NASZ_115_Kurgan, "FollowZamek");
	Druzyna (NASZ_115_Kurgan,1);

	Npc_ExchangeRoutine (NASZ_215_Kivo, "FollowZamek");
	Druzyna (NASZ_215_Kivo,1);

	Npc_ExchangeRoutine (NASZ_218_Ammann, "FollowZamek");
	Druzyna (NASZ_218_Ammann,1);

	Npc_ExchangeRoutine (NASZ_227_Vachut, "FollowZamek");
	Druzyna (NASZ_227_Vachut,1);

	Npc_ExchangeRoutine (NASZ_229_Ayan, "FollowZamek");
	Druzyna (NASZ_229_Ayan,1);

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
	
	B_StartOtherRoutine (NASZ_120_Phill, "Kap4");
	B_StartOtherRoutine (NASZ_225_Wrzod, "Kap4");
	B_StartOtherRoutine (NASZ_231_Ted, "Kap4");
	B_StartOtherRoutine (NASZ_119_Udar,"Kap4");
	
	// TODO niewolnicy do obozu mysliwych
	B_StartOtherRoutine (NASZ_319_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_320_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_321_Niewolnik,"Twierdza");
	B_StartOtherRoutine (NASZ_325_Grimes,"Twierdza");

	B_StartOtherRoutine (NASZ_201_Erak,"Kap4");
	B_StartOtherRoutine (NASZ_215_Kivo,"Kap4");
	B_StartOtherRoutine (NASZ_216_Aran,"Kap4");
	B_StartOtherRoutine (NASZ_218_Ammann,"InCastle");
	B_StartOtherRoutine (NASZ_221_Benito,"Kap4");
	B_StartOtherRoutine (NASZ_227_Vachut,"Start");
	B_StartOtherRoutine (NASZ_229_Ayan,"InCastle");

	
	B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
	B_StartOtherRoutine (NASZ_113_Godar,"Start");
	B_StartOtherRoutine (NASZ_114_Hokurn,"Start");
	B_StartOtherRoutine (NASZ_115_Kurgan,"InCastle");
	B_StartOtherRoutine (NASZ_116_Kjorn,"Start");
	B_StartOtherRoutine (NASZ_117_Fed,"Start");
	B_StartOtherRoutine (NASZ_118_Ferros,"Start");
	B_StartOtherRoutine (NASZ_109_Rethon,"Zamek");
	B_StartOtherRoutine (NASZ_112_Peter,"Start");
	B_StartOtherRoutine (NASZ_101_Korth,"Kap4");
	B_StartOtherRoutine (NASZ_103_Johny,"Start");

	B_StartOtherRoutine (NASZ_203_Tabuk,"Kap4");
	B_StartOtherRoutine (NASZ_204_Vick,"Start");
	B_StartOtherRoutine (NASZ_205_Mysliwy,"Kap4");
	B_StartOtherRoutine (NASZ_206_Mysliwy,"Kap4");
	B_StartOtherRoutine (NASZ_209_Mysliwy,"Kap4");
	B_StartOtherRoutine (NASZ_210_Mysliwy,"Kap4");
	B_StartOtherRoutine (NASZ_214_Goth,"Kap4");

};


func void Migration_LowcyToZamek() {

	B_StartOtherRoutine (NASZ_101_Korth,"InCastle");
	B_StartOtherRoutine (NASZ_103_Johny,"InCastle");
	B_StartOtherRoutine (NASZ_112_Peter,"InCastle");
	B_StartOtherRoutine (NASZ_113_Godar,"InCastle");
	B_StartOtherRoutine (NASZ_114_Hokurn,"InCastle");
	B_StartOtherRoutine (NASZ_116_Kjorn,"InCastle");
	B_StartOtherRoutine (NASZ_117_Fed,"InCastle");
	B_StartOtherRoutine (NASZ_118_Ferros,"InCastle");
	// TODO: lowcy z oboziku zwiadowczego powinni tu sie pojawic

};