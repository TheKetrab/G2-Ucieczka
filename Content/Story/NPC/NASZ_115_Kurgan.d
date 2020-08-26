
instance NASZ_115_Kurgan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kurgan";
	guild 		= GIL_DJG;
	id 			= 115;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_H);
	EquipItem	(self, ItNa_DJG_CrossbowH);
	Createinvitems (self, ItRw_Bolt, 22);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ImportantGrey, BodyTex_N, ITNA_DJG_S);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 90); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_115;
};

FUNC VOID Rtn_PreStart_115()
{
	TA_Stand_Guarding	 	(08,00,23,00,"NASZ_LOWCY_ARENA_06");
	TA_Stand_Guarding		(23,00,08,00,"NASZ_LOWCY_ARENA_06");
};

FUNC VOID Rtn_Start_115()
{
	TA_Sit_Chair	 		(07,30,12,20,"NASZ_LOWCY_ARENA_09");
	TA_Stand_Eating			(12,20,15,10,"NASZ_LOWCY_ARENA_06");
	TA_Smalltalk			(15,10,18,10,"NASZ_LOWCY_ARENA_17");
	TA_Sit_Chair	 		(18,10,01,00,"NASZ_LOWCY_ARENA_09");	
	TA_Practice_Sword		(01,00,07,30,"NASZ_LOWCY_ARENA_01");

};

FUNC VOID Rtn_BeforeRethonKurganFight_115()
{
	TA_Smalltalk	 	(08,00,23,00,"NASZ_LOWCY_ARENA_06");
	TA_Smalltalk		(23,00,08,00,"NASZ_LOWCY_ARENA_06");
};

FUNC VOID Rtn_Arena_115()
{
	TA_RunToWP	 	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_RunToWP		(23,00,08,00,"NASZ_LOWCY_ARENA_01");
};

FUNC VOID Rtn_KurganRethonArena_115()
{
	TA_RunToWP	 	(08,00,23,00,"NASZ_LOWCY_ARENA_01_A");
	TA_RunToWP		(23,00,08,00,"NASZ_LOWCY_ARENA_01_A");
};


FUNC VOID Rtn_Twierdza_115()
{
	TA_Stand_Guarding	 	(08,00,23,00,"OW_PATH_190");
	TA_Stand_Guarding		(23,00,08,00,"OW_PATH_190");
};

FUNC VOID Rtn_Zamek_115 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");
};

FUNC VOID Rtn_TwierdzaAtak_115()
{
	TA_Stand_Guarding	 	(08,00,23,00,"NASZ_TWIERDZA_1");
	TA_Stand_Guarding		(23,00,08,00,"NASZ_TWIERDZA_1");
};

FUNC VOID Rtn_FollowZamek_115()
{	
	TA_RunToWp 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWp			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_115()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_115()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_115()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};




FUNC VOID Rtn_Odpoczynek_115 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};



FUNC VOID Rtn_InCastle_115()
{	
	TA_Stand_Eating		(08,00,23,00,"OC_STAND_TANDOR_01");
	TA_Stand_Eating		(23,00,08,00,"OC_STAND_TANDOR_01");
};

FUNC VOID Rtn_ArenaZamek_115 ()
{
	TA_RunToWP		(08,00,23,00,"OC_SMITH_01");
	TA_RunToWP		(23,00,08,00,"OC_SMITH_01");
};




FUNC VOID Rtn_UltraFinal_115 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_07");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_07");
};


FUNC VOID Rtn_Scena2_115 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_07");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_07");
};

FUNC VOID Rtn_Scena2Goal_115 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_115 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};
