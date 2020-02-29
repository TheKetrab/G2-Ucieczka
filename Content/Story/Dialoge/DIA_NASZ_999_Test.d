func void KillOrcsAround(var c_npc slf) {

	if (slf.guild == GIL_ORC) {
		B_KillNpc(slf);
	};
};


//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_EXIT   (C_INFO)
{
	npc         = NASZ_999_Test;
	nr          = 999;
	condition   = DIA_NASZ_999_Test_EXIT_Condition;
	information = DIA_NASZ_999_Test_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_999_Test_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	WalkaTarcza
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_Teach   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_Teach_Condition;
 	information = DIA_NASZ_999_Test_Teach_Info;
 	permanent   = TRUE;
 	description = "Naucz siê...";
};

FUNC INT DIA_NASZ_999_Test_Teach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_Teach_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, DIALOG_BACK, DIA_NASZ_999_Test_Teach_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Regeneracja poz. 3", DIA_NASZ_999_Test_Teach_Regeneracja3);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Regeneracja poz. 2", DIA_NASZ_999_Test_Teach_Regeneracja2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Regeneracja poz. 1", DIA_NASZ_999_Test_Teach_Regeneracja1);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Zielarstwo poz. 2", DIA_NASZ_999_Test_Teach_Zielarstwo2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Zielarstwo poz. 1", DIA_NASZ_999_Test_Teach_Zielarstwo1);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Szybka Nauka", DIA_NASZ_999_Test_Teach_QuickLearn);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Górnictwo +10", DIA_NASZ_999_Test_Teach_GornictwoAdd);
		Info_AddChoice	  (DIA_NASZ_999_Test_Teach, "Walka tarcz¹", DIA_NASZ_999_Test_Teach_Shield);

};

func void DIA_NASZ_999_Test_Teach_BACK() {
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_Shield() {
	PrintScreen ("Nauka: walka tarcz¹", -1, -1, FONT_Screen, 2);
	WalkaTarcza = TRUE;
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_QuickLearn() {
	SzybkaNaukaTaught = TRUE;
	PrintScreen ("Nauka: szybka nauka", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_D, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_Zielarstwo1() {
	PrintScreen ("Nauka: Zielarstwo", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_E, 1);
	level_zielarstwa = 1;
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_Zielarstwo2() {
	PrintScreen ("Nauka: Zielarstwo", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_E, 2);	
	level_zielarstwa = 2;
	PlantSkill_Factor = 2;
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_Regeneracja1() {
	
	FF_ApplyOnceExt (Regeneracja, 3000, -1);
	
	level_regeneracji = 1;
	PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_Regeneracja2() {
			
	FF_ApplyOnceExt (Regeneracja, 3000, -1);
	
	level_regeneracji = 2;
	PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};


func void DIA_NASZ_999_Test_Teach_Regeneracja3() {
	
	FF_ApplyOnceExt (Regeneracja, 3000, -1);
	
	level_regeneracji = 3;
	PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);
	Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};

func void DIA_NASZ_999_Test_Teach_GornictwoAdd() {
	LevelMiner += 10;
	Print(ConcatStrings("Gornictwo: ",ConcatStrings(IntToString(LevelMiner),"%")));
	Info_ClearChoices (DIA_NASZ_999_Test_Teach);
};



//*********************************************************************
//	Gold
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_Gold   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_Gold_Condition;
 	information = DIA_NASZ_999_Test_Gold_Info;
 	permanent   = TRUE;
 	description = "10 tys szt. z³ota.";
};

FUNC INT DIA_NASZ_999_Test_Gold_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_Gold_Info()
{

	Createinvitems (self, ItMi_Gold, 10000);
	B_giveinvitems (self, other, ItMi_Gold, 10000);
	
	Wld_PlayEffect("Spellfx_Paldestroyevil",  NASZ_999_Test, NASZ_999_Test, 0, 0, 0, FALSE );
	
};
INSTANCE DIA_NASZ_999_Test_Posag   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_Posag_Condition;
 	information = DIA_NASZ_999_Test_Posag_Info;
 	permanent   = TRUE;
 	description = "Pos¹g, rytua³";
};

FUNC INT DIA_NASZ_999_Test_Posag_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_Posag_Info()
{

	
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Kapliczka zosta³a zniszczona, a wraz z ni¹ zagro¿enie jakie depta³o nam po piêtach. Czym prêdzej wrócê do maga i opowiem mu o tym, co siê tutaj sta³o. Poza tym dziwiê siê, ¿e nie zaatakowa³ mnie ¿aden demon. Czy¿by mag siê myli³?");
	Migration_LowcyToZamek(); // migracja do zamku lowcow

	Wld_PlayEffect("spellFX_Fear",  hero, hero, 0, 0, 0, FALSE );
	Snd_Play ("LASTDOOREVENT");
	Wld_SendTrigger ("DEMONPOSAG_MOVER_SCRIPT");
	WillZniszczylDemonaOneTime = TRUE;
	WillIsGoingToKillDemonPosag = 2;
				//Print("dziala");
	if(FF_Active(KillDemonPosag))
	{
		ff_remove(KillDemonPosag);
	};
	
};

//*********************************************************************
//	LiftRdy
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_LiftRdy   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_LiftRdy_Condition;
 	information = DIA_NASZ_999_Test_LiftRdy_Info;
 	permanent   = TRUE;
 	description = "LiftReady";
};

FUNC INT DIA_NASZ_999_Test_LiftRdy_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_LiftRdy_Info()
{
	WillAndAyanLift = TRUE;
	ff_applyonceExt(LiftReady,1000,-1);
};

//*********************************************************************
//	WarWithOrc
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_WarWithOrc   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_WarWithOrc_Condition;
 	information = DIA_NASZ_999_Test_WarWithOrc_Info;
 	permanent   = TRUE;
 	description = "WarWithOrc";
};

FUNC INT DIA_NASZ_999_Test_WarWithOrc_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_WarWithOrc_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_WarWithOrc);
		Info_AddChoice	  (DIA_NASZ_999_Test_WarWithOrc, DIALOG_BACK, DIA_NASZ_999_Test_WarWithOrc_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_WarWithOrc, "WarWithOrc_End", DIA_NASZ_999_Test_WarWithOrc_End);
		Info_AddChoice	  (DIA_NASZ_999_Test_WarWithOrc, "WarWithOrc_Start", DIA_NASZ_999_Test_WarWithOrc_Start);
};

FUNC VOID DIA_NASZ_999_Test_WarWithOrc_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_WarWithOrc);
};

FUNC VOID DIA_NASZ_999_Test_WarWithOrc_End()
{	
	AI_StopProcessInfos	(self);
	WarWithOrc_End(self);
};

FUNC VOID DIA_NASZ_999_Test_WarWithOrc_Start()
{
	AI_StopProcessInfos	(self);
	//self.aivar[AIV_INVINCIBLE] = false;
	hero.aivar[AIV_INVINCIBLE] = false;
	WarWithOrc_Start(self);
};

//*********************************************************************
//	EffectTest
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_EffectTest   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_EffectTest_Condition;
 	information = DIA_NASZ_999_Test_EffectTest_Info;
 	permanent   = TRUE;
 	description = "Oducz zwierzyny.";
};

FUNC INT DIA_NASZ_999_Test_EffectTest_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_EffectTest_Info()
{
	//Wld_PlayEffect("SLEEP_BLEND",  self, self, 0, 0, 0, FALSE );
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = FALSE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = FALSE;
};

//*********************************************************************
//	IloscDruzyna
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_IloscDruzyna   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_IloscDruzyna_Condition;
 	information = DIA_NASZ_999_Test_IloscDruzyna_Info;
 	permanent   = TRUE;
 	description = "Ustaw stan dru¿yny";
};

FUNC INT DIA_NASZ_999_Test_IloscDruzyna_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_IloscDruzyna_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_IloscDruzyna);
		Info_AddChoice	  (DIA_NASZ_999_Test_IloscDruzyna, DIALOG_BACK, DIA_NASZ_999_Test_IloscDruzyna_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_IloscDruzyna, "3 (dwóch pomocników)", DIA_NASZ_999_Test_IloscDruzyna_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_IloscDruzyna, "2 (jeden pomocnik)", DIA_NASZ_999_Test_IloscDruzyna_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_IloscDruzyna, "1 (sam bohater)", DIA_NASZ_999_Test_IloscDruzyna_1);

};

FUNC VOID DIA_NASZ_999_Test_IloscDruzyna_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_IloscDruzyna);
};

FUNC VOID DIA_NASZ_999_Test_IloscDruzyna_3()
{	
	StanDruzyny = 3;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_IloscDruzyna_2()
{
	StanDruzyny = 2;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_IloscDruzyna_1()
{
	StanDruzyny = 1;
	AI_StopProcessInfos	( self );
};


//*********************************************************************
//	Kapitel
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_Kapitel   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 5;
 	condition   = DIA_NASZ_999_Test_Kapitel_Condition;
 	information = DIA_NASZ_999_Test_Kapitel_Info;
 	permanent   = TRUE;
 	description = "Zmieñ rozdzia³.";
};

FUNC INT DIA_NASZ_999_Test_Kapitel_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_Kapitel);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, DIALOG_BACK, DIA_NASZ_999_Test_Kapitel_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 5", DIA_NASZ_999_Test_Kapitel_5);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 4 Final", DIA_NASZ_999_Test_Kapitel_Final);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 4 Keroloth Funkcja", DIA_NASZ_999_Test_Kapitel_Keroloth);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 4 SkipToKap4", DIA_NASZ_999_Test_Kapitel_SkipToKap4);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 4 SkipToAyanQuest", DIA_NASZ_999_Test_Kapitel_SkipToAyanQuest);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 4", DIA_NASZ_999_Test_Kapitel_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 3 Twierdza Atak", DIA_NASZ_999_Test_Kapitel_TwierdzaAtak);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 3 Twierdza Ready", DIA_NASZ_999_Test_Kapitel_Twierdza);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 3", DIA_NASZ_999_Test_Kapitel_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 2 Nod Funkcja", DIA_NASZ_999_Test_Kapitel_Nod);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 2", DIA_NASZ_999_Test_Kapitel_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Kapitel, "Rozdzia³ 1", DIA_NASZ_999_Test_Kapitel_1);

};

FUNC VOID DIA_NASZ_999_Test_Kapitel_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_Kapitel);
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_5()
{
	B_Kapitelwechsel	( 5, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_Final()
{

	B_StartOtherRoutine (NASZ_010_Monastir,"Final");
	B_StartOtherRoutine (NASZ_402_Innos,"Final");
	B_StartOtherRoutine (NASZ_403_Adanos,"Final");
	B_StartOtherRoutine (NASZ_404_Beliar,"Final");
	Cheat_Final = TRUE;

	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_Keroloth()
{
	B_KillNPC (NASZ_012_Renegat);
	B_KillNPC (NASZ_213_Gestath);
	Wld_SendTrigger ("ZAMEK_BRAMA_1_SKRYPT");
	Wld_SendTrigger ("ZAMEK_BRAMA_2_SKRYPT");

	Wld_SendTrigger ("MOVER_GESTATH_GRAVE");
	B_StartOtherRoutine (NASZ_213_Gestath,"TOT");
	
	GateTwierdza_Close();
	
	Wld_InsertNpc	(NASZ_218_Ammann,"TWIERDZA"); 
	Wld_InsertNpc	(NASZ_221_Benito,"TWIERDZA"); 

	AI_StopProcessInfos	( self );
};


FUNC VOID DIA_NASZ_999_Test_Kapitel_SkipToKap4()
{
	Cheat_SkipToKap4 = TRUE;
	DoForSphere(KillOrcsAround);
	B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_SkipToAyanQuest()
{
	Cheat_SkipToAyanQuest= TRUE;
	B_StartOtherRoutine (NASZ_229_Ayan,"Start");
	AI_StopProcessInfos	( self );
};


FUNC VOID DIA_NASZ_999_Test_Kapitel_4()
{
	B_Kapitelwechsel	( 4, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_TwierdzaAtak()
{
	Cheat_Keroloth_TwierdzaAtak = TRUE;

	GateTwierdza_Close();
	WillGoToUrshackFinal = TRUE;
		
	Migration_InsertTwierdzaOrc();
	Migration_TwierdzaAtak();
		
	B_KillNpc(NASZ_213_Gestath);
	B_KillNpc(NASZ_123_Lowca);
	B_KillNpc(NASZ_108_Lowca);
		
	TwierdzaAtakSick = TRUE; // dziêki temu niektórzy maj¹ mniej HP
	
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_Twierdza()
{
	B_KillNPC (NASZ_012_Renegat);

	Migration_LowcyToTwierdza();
	Migration_ErakToTwierdza();
	Migration_TeleportMysliwiToTwierdza();
	Cheat_Keroloth_MainForces = TRUE;
	
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_Nod()
{
		B_StartOtherRoutine (NASZ_315_Bandzior,"Away");
		B_StartOtherRoutine (NASZ_316_Carry,"Away");

		B_KillNpc(NASZ_303_Nod);
		B_KillNpc(NASZ_304_Bam);
		B_KillNpc(NASZ_307_Monk);
		B_KillNpc(NASZ_308_Frut);
		B_KillNpc(NASZ_305_Rabon);
		B_KillNpc(NASZ_309_Straznik);
		B_KillNpc(NASZ_310_Bandzior);
		B_KillNpc(NASZ_311_Bandzior);
		B_KillNpc(NASZ_312_Bandzior);
		B_KillNpc(NASZ_313_Bandzior);
		B_KillNpc(NASZ_314_Bandzior);
		B_KillNpc(NASZ_405_VanGan);

		B_StartOtherRoutine (NASZ_319_Niewolnik,"After");
		B_StartOtherRoutine (NASZ_320_Niewolnik,"After");
		B_StartOtherRoutine (NASZ_321_Niewolnik,"After");
		B_StartOtherRoutine (NASZ_325_Grimes,"After");

		B_StartOtherRoutine (NASZ_213_Gestath,"Bandyci");
		B_StartOtherRoutine (NASZ_215_Kivo,"Bandyci");
		B_StartOtherRoutine (NASZ_201_Erak,"Bandyci");
		Wld_InsertNpc	(NASZ_221_Benito,"NASZ_BANDYCI_OBOZ_08");

		B_StartOtherRoutine (NASZ_306_Perrot,"Koniec");
		B_StartOtherRoutine (NASZ_315_Bandzior,"Koniec");
		B_StartOtherRoutine (NASZ_316_Carry,"Koniec");
		B_StartOtherRoutine (NASZ_317_Bandzior,"Koniec");
		B_StartOtherRoutine (NASZ_318_Gobby,"Koniec");
		B_StartOtherRoutine (NASZ_326_Domenic,"Koniec");
		B_StartOtherRoutine (NASZ_327_Danny,"Koniec");

		NASZ_306_Perrot.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_306_Perrot, GIL_BDT);
		NASZ_315_Bandzior.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_315_Bandzior, GIL_BDT);
		NASZ_316_Carry.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_316_Carry, GIL_BDT);
		NASZ_317_Bandzior.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_317_Bandzior, GIL_BDT);
		NASZ_318_Gobby.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_318_Gobby, GIL_BDT);
		NASZ_326_Domenic.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_326_Domenic, GIL_BDT);
		NASZ_327_Danny.guild = GIL_BDT;
		Npc_SetTrueGuild (NASZ_327_Danny, GIL_BDT);
	
		Gestath_Stopowanie = TRUE;
	
		AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_3()
{
	B_Kapitelwechsel	( 3, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_2()
{
	B_Kapitelwechsel	( 2, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_Kapitel_1()
{
	B_Kapitelwechsel	( 1, NEWWORLD_ZEN );
	AI_StopProcessInfos	( self );
};



//*********************************************************************
//	Reputation
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_Reputation   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 5;
 	condition   = DIA_NASZ_999_Test_Reputation_Condition;
 	information = DIA_NASZ_999_Test_Reputation_Info;
 	permanent   = TRUE;
 	description = "Zmieñ reputacjê.";
};

FUNC INT DIA_NASZ_999_Test_Reputation_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_Reputation_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, DIALOG_BACK, DIA_NASZ_999_Test_Reputation_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi +100", DIA_NASZ_999_Test_RepMysliwi_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi +50", DIA_NASZ_999_Test_RepMysliwi_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi +25", DIA_NASZ_999_Test_RepMysliwi_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi +10", DIA_NASZ_999_Test_RepMysliwi_1);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi +1", DIA_NASZ_999_Test_RepMysliwi_0);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Myœliwi =0", DIA_NASZ_999_Test_RepMysliwi_SetZero);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy +100", DIA_NASZ_999_Test_RepLowcy_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy +50", DIA_NASZ_999_Test_RepLowcy_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy +25", DIA_NASZ_999_Test_RepLowcy_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy +10", DIA_NASZ_999_Test_RepLowcy_1);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy +1", DIA_NASZ_999_Test_RepLowcy_0);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "£owcy =0", DIA_NASZ_999_Test_RepLowcy_SetZero);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci +100", DIA_NASZ_999_Test_RepBandyci_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci +50", DIA_NASZ_999_Test_RepBandyci_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci +25", DIA_NASZ_999_Test_RepBandyci_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci +10", DIA_NASZ_999_Test_RepBandyci_1);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci +1", DIA_NASZ_999_Test_RepBandyci_0);
		Info_AddChoice	  (DIA_NASZ_999_Test_Reputation, "Bandyci =0", DIA_NASZ_999_Test_RepBandyci_SetZero);

};

FUNC VOID DIA_NASZ_999_Test_Reputation_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_4()
{
	DodajReputacje(100, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_3()
{
	DodajReputacje(50, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};


FUNC VOID DIA_NASZ_999_Test_RepMysliwi_2()
{
	DodajReputacje(25, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_1()
{
	DodajReputacje(10, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_0()
{
	DodajReputacje(1, 2);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_SetZero()
{
	rep_mysliwi_s = 0;
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_4()
{
	DodajReputacje(100, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_3()
{
	DodajReputacje(50, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_2()
{
	DodajReputacje(25, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_1()
{
	DodajReputacje(10, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_0()
{
	DodajReputacje(1, 1);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_SetZero()
{
	rep_lowcy_s = 0;
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_4()
{
	DodajReputacje(100, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_3()
{
	DodajReputacje(50, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};


FUNC VOID DIA_NASZ_999_Test_RepBandyci_2()
{
	DodajReputacje(25, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_1()
{
	DodajReputacje(10, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};


FUNC VOID DIA_NASZ_999_Test_RepBandyci_0()
{
	DodajReputacje(1, 3);
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_SetZero()
{
	rep_bandyci_s = 0;
	Info_ClearChoices (DIA_NASZ_999_Test_Reputation);
};

//*********************************************************************
//	OpenGate
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_OpenGate   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 8;
 	condition   = DIA_NASZ_999_Test_OpenGate_Condition;
 	information = DIA_NASZ_999_Test_OpenGate_Info;
 	permanent   = TRUE;
 	description = "Otwórz bramê.";
};

FUNC INT DIA_NASZ_999_Test_OpenGate_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_Info()
{

	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, DIALOG_BACK, DIA_NASZ_999_Test_OpenGate_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Palisada", DIA_NASZ_999_Test_OpenGate_ZaPalisada);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Kopalnia Silvestro", DIA_NASZ_999_Test_OpenGate_SilvestroMiner);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "OrcCity - wiêzienie", DIA_NASZ_999_Test_OpenGate_OrcCityPrison);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Twierdza", DIA_NASZ_999_Test_OpenGate_Twierdza);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Mysliwi", DIA_NASZ_999_Test_OpenGate_Mysliwi);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "XardasOld", DIA_NASZ_999_Test_OpenGate_XardasOld);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Monastir - OrcTown", DIA_NASZ_999_Test_OpenGate_MonastirOrcTown);
		Info_AddChoice	  (DIA_NASZ_999_Test_OpenGate, "Zamek", DIA_NASZ_999_Test_OpenGate_Castle);

};

FUNC VOID DIA_NASZ_999_Test_OpenGate_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_ZaPalisada()
{
	Wld_SendTrigger ("ORCGATE1_SCRIPT");
	Wld_SendTrigger ("ORCGATE2_SCRIPT");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_SilvestroMiner()
{
	Wld_SendTrigger ("TRIGGER_PELZACZE_KRATA");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_OrcCityPrison()
{
	Wld_SendTrigger ("MOVER_ORCCITY_06");
	Wld_SendTrigger ("MOVER_ORCCITY_07");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_Twierdza()
{
	Wld_SendTrigger ("BRAMA_TWIERDZA_SKRYPT");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_Mysliwi()
{
	Wld_SendTrigger ("BRAMA_MYSLIWI");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_XardasOld()
{
	Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_1_SCRIPT");
	Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_2_SCRIPT");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_MonastirOrcTown()
{
	B_OpenGateOrcTown();
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

FUNC VOID DIA_NASZ_999_Test_OpenGate_Castle()
{
	Wld_SendTrigger ("ZAMEK_BRAMA_1_SKRYPT");
	Wld_SendTrigger ("ZAMEK_BRAMA_2_SKRYPT");
	Info_ClearChoices (DIA_NASZ_999_Test_OpenGate);
};

//*********************************************************************
//	LevelMiner
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_LevelMiner   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 9;
 	condition   = DIA_NASZ_999_Test_LevelMiner_Condition;
 	information = DIA_NASZ_999_Test_LevelMiner_Info;
 	permanent   = TRUE;
 	description = "LevelMiner";
};

FUNC INT DIA_NASZ_999_Test_LevelMiner_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_LevelMiner);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, DIALOG_BACK, DIA_NASZ_999_Test_LevelMiner_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "100", DIA_NASZ_999_Test_LevelMiner_8);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "90", DIA_NASZ_999_Test_LevelMiner_7);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "80", DIA_NASZ_999_Test_LevelMiner_6);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "65", DIA_NASZ_999_Test_LevelMiner_5);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "55", DIA_NASZ_999_Test_LevelMiner_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "40", DIA_NASZ_999_Test_LevelMiner_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "30", DIA_NASZ_999_Test_LevelMiner_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_LevelMiner, "20", DIA_NASZ_999_Test_LevelMiner_1);	

};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_LevelMiner);
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_8()
{
	LevelMiner = 100;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_7()
{
	LevelMiner = 90;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_6()
{
	LevelMiner = 80;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_5()
{
	LevelMiner = 65;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_4()
{
	LevelMiner = 55;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_3()
{
	LevelMiner = 40;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_2()
{
	LevelMiner = 30;
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_LevelMiner_1()
{
	LevelMiner = 20;
	AI_StopProcessInfos	( self );
};


