
instance NASZ_109_Rethon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rethon";
	guild 		= GIL_DJG;
	id 			= 109;
	voice 		= 12;
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
	Createinvitems (self, ItRw_Bolt, 16);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_CoolPock, BodyTex_N, ITNA_DJG_S);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_109;
};

FUNC VOID Rtn_PreStart_109 ()
{
	TA_Stand_Guarding		(08,00,20,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(20,00,08,00,"NASZ_LOWCY_TRENING_01");
};


FUNC VOID Rtn_Start_109 ()
{
	TA_Stand_Guarding		(08,00,10,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(10,30,11,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(11,00,12,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(12,30,13,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(13,00,14,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(14,30,15,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(15,00,16,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(16,30,17,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(17,00,18,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(18,30,19,00,"NASZ_LOWCY_TRENING_01");
	TA_Stand_Guarding		(19,00,20,30,"NASZ_LOWCY_TRENING_01");
	TA_Practice_Sword		(20,30,21,00,"NASZ_LOWCY_TRENING_01");

	TA_Stand_Drinking		(21,00,00,35,"NASZ_LOWCY_KARCZMA_02");
	TA_Sit_Campfire			(00,35,03,50,"NASZ_LOWCY_DOL_01");
	TA_Sleep			(03,50,08,00,"NASZ_LOWCY_DOL_04");

};

FUNC VOID Rtn_Arena_109 ()
{
	TA_RunToWP		(08,00,22,00,"NASZ_LOWCY_ARENA_01");
	TA_RunToWP		(22,00,08,00,"NASZ_LOWCY_ARENA_01");

};

FUNC VOID Rtn_BeforeRethonKurganFight_109 ()
{
	// TODO smalltalk with kurgan
	TA_Stand_Guarding		(08,00,22,00,"NASZ_LOWCY_ARENA_06");
	TA_Stand_Guarding		(22,00,08,00,"NASZ_LOWCY_ARENA_06");

};

FUNC VOID Rtn_Twierdza_109 ()
{
	TA_Sit_Chair		(07,30,21,10,"NASZ_TWIERDZA_5");
	TA_Stand_Guarding	(21,10,07,30,"NASZ_TWIERDZA_44");

};

FUNC VOID Rtn_TwierdzaAtak_109 ()
{
	TA_Stand_WP		(08,00,22,00,"NASZ_TWIERDZA_40");
	TA_Stand_WP		(22,00,08,00,"NASZ_TWIERDZA_40");

};

FUNC VOID Rtn_FollowZamek_109()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_109()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_109()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_109()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};


FUNC VOID Rtn_Zamek_109()
{	
	TA_Sit_Campfire 			(08,00,23,00,"OC_CAMPFIRE_OUT_01");
	TA_Sit_Campfire			(23,00,08,00,"OC_CAMPFIRE_OUT_01");
};

FUNC VOID Rtn_Odpoczynek_109 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

FUNC VOID Rtn_UltraFinal_109 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_05");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_05");
};


FUNC VOID Rtn_Scena2_109 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_06");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_06");
};

FUNC VOID Rtn_Scena2Goal_109 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_109 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};
