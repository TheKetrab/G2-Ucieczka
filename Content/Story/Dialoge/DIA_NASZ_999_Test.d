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
INSTANCE DIA_NASZ_999_Test_WalkaTarcza   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 4;
 	condition   = DIA_NASZ_999_Test_WalkaTarcza_Condition;
 	information = DIA_NASZ_999_Test_WalkaTarcza_Info;
 	permanent   = TRUE;
 	description = "Naucz siê walki tarcz¹.";
};

FUNC INT DIA_NASZ_999_Test_WalkaTarcza_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_WalkaTarcza_Info()
{
	WalkaTarcza = TRUE;
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
//	RepMysliwi
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_RepMysliwi   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 5;
 	condition   = DIA_NASZ_999_Test_RepMysliwi_Condition;
 	information = DIA_NASZ_999_Test_RepMysliwi_Info;
 	permanent   = TRUE;
 	description = "Reputacja u myœliwych.";
};

FUNC INT DIA_NASZ_999_Test_RepMysliwi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepMysliwi);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepMysliwi, DIALOG_BACK, DIA_NASZ_999_Test_RepMysliwi_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepMysliwi, "100", DIA_NASZ_999_Test_RepMysliwi_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepMysliwi, "50", DIA_NASZ_999_Test_RepMysliwi_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepMysliwi, "25", DIA_NASZ_999_Test_RepMysliwi_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepMysliwi, "10", DIA_NASZ_999_Test_RepMysliwi_1);

};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepMysliwi);
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_4()
{
	DodajReputacje(100, 2);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_3()
{
	DodajReputacje(50, 2);
	AI_StopProcessInfos	( self );
};


FUNC VOID DIA_NASZ_999_Test_RepMysliwi_2()
{
	DodajReputacje(25, 2);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepMysliwi_1()
{
	DodajReputacje(10, 2);
	AI_StopProcessInfos	( self );
};

//*********************************************************************
//	RepLowcy
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_RepLowcy   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 6;
 	condition   = DIA_NASZ_999_Test_RepLowcy_Condition;
 	information = DIA_NASZ_999_Test_RepLowcy_Info;
 	permanent   = TRUE;
 	description = "Reputacja u ³owców orków.";
};

FUNC INT DIA_NASZ_999_Test_RepLowcy_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepLowcy);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepLowcy, DIALOG_BACK, DIA_NASZ_999_Test_RepLowcy_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepLowcy, "100", DIA_NASZ_999_Test_RepLowcy_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepLowcy, "50", DIA_NASZ_999_Test_RepLowcy_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepLowcy, "25", DIA_NASZ_999_Test_RepLowcy_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepLowcy, "10", DIA_NASZ_999_Test_RepLowcy_1);

};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepLowcy);
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_4()
{
	DodajReputacje(100, 1);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_3()
{
	DodajReputacje(50, 1);
	AI_StopProcessInfos	( self );
};


FUNC VOID DIA_NASZ_999_Test_RepLowcy_2()
{
	DodajReputacje(25, 1);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepLowcy_1()
{
	DodajReputacje(10, 1);
	AI_StopProcessInfos	( self );
};

//*********************************************************************
//	RepBandcyi
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_RepBandyci   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 7;
 	condition   = DIA_NASZ_999_Test_RepBandyci_Condition;
 	information = DIA_NASZ_999_Test_RepBandyci_Info;
 	permanent   = TRUE;
 	description = "Reputacja u bandytów.";
};

FUNC INT DIA_NASZ_999_Test_RepBandyci_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_Info()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepBandyci);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepBandyci, DIALOG_BACK, DIA_NASZ_999_Test_RepBandyci_BACK);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepBandyci, "100", DIA_NASZ_999_Test_RepBandyci_4);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepBandyci, "50", DIA_NASZ_999_Test_RepBandyci_3);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepBandyci, "25", DIA_NASZ_999_Test_RepBandyci_2);
		Info_AddChoice	  (DIA_NASZ_999_Test_RepBandyci, "10", DIA_NASZ_999_Test_RepBandyci_1);

};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_BACK()
{
	Info_ClearChoices (DIA_NASZ_999_Test_RepBandyci);
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_4()
{
	DodajReputacje(100, 3);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_3()
{
	DodajReputacje(50, 3);
	AI_StopProcessInfos	( self );
};


FUNC VOID DIA_NASZ_999_Test_RepBandyci_2()
{
	DodajReputacje(25, 3);
	AI_StopProcessInfos	( self );
};

FUNC VOID DIA_NASZ_999_Test_RepBandyci_1()
{
	DodajReputacje(10, 3);
	AI_StopProcessInfos	( self );
};

//*********************************************************************
//	OpenOrcGate
//*********************************************************************
INSTANCE DIA_NASZ_999_Test_OpenOrcGate   (C_INFO)
{
	npc         = NASZ_999_Test;
 	nr          = 8;
 	condition   = DIA_NASZ_999_Test_OpenOrcGate_Condition;
 	information = DIA_NASZ_999_Test_OpenOrcGate_Info;
 	permanent   = TRUE;
 	description = "Otwórz bramê.";
};

FUNC INT DIA_NASZ_999_Test_OpenOrcGate_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_999_Test_OpenOrcGate_Info()
{
	Wld_SendTrigger ("ORCGATE1_SCRIPT");
	Wld_SendTrigger ("ORCGATE2_SCRIPT");
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


