
instance NASZ_113_Godar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Godar"; 
	guild 		= GIL_DJG;
	id 			= 113;
	voice 		= 13;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Djg_Weapon_M);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal14, BodyTex_N, ITNA_DJG_S);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_113;
};

FUNC VOID Rtn_Start_113 ()
{
	TA_Practice_Sword	(18,45,23,15,"NASZ_LOWCY_ARENA_18");
	TA_Sit_Campfire	(23,15,02,10,"NASZ_LOWCY_ARENA_14");
	TA_Sleep		(02,10,08,20,"NASZ_LOWCY_ARENA_09");
	TA_Repair_Hut	(08,20,11,40,"NASZ_LOWCY_DOL_26");
	TA_SmallTalk	(11,40,15,20,"NASZ_LOWCY_DOL_16");
	TA_Repair_Hut	(15,20,17,30,"NASZ_LOWCY_DOL_26");	
	TA_SmallTalk	(17,30,18,45,"NASZ_LOWCY_DOL_16");
};

FUNC VOID Rtn_Arena_113 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_LOWCY_ARENA_01");		
};

FUNC VOID Rtn_Twierdza_113 ()
{
	TA_Practice_Sword	(08,00,23,00,"NASZ_TWIERDZA_29");
	TA_Practice_Sword	(23,00,08,00,"NASZ_TWIERDZA_29");		
};

FUNC VOID Rtn_Zamek_113 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");		
};

FUNC VOID Rtn_TwierdzaAtak_113 ()
{
	TA_Stand_WP	(08,00,23,00,"NASZ_TWIERDZA_42");
	TA_Stand_WP	(23,00,08,00,"NASZ_TWIERDZA_42");		
};

FUNC VOID Rtn_FollowZamek_113()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_Odpoczynek_113 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};


FUNC VOID Rtn_Kap4_113()
{	
	TA_Stand_Drinking			(08,00,23,00,"NASZ_LOWCY_KARCZMA_06");
	TA_Stand_Drinking			(23,00,08,00,"NASZ_LOWCY_KARCZMA_06");
};


FUNC VOID Rtn_InCastle_113()
{	
	TA_Practice_Sword			(08,00,23,00,"OC_TRAIN_04");
	TA_Practice_Sword			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_ArenaZamek_113 ()
{
	TA_RunToWP		(08,00,23,00,"OC_SMITH_01");
	TA_RunToWP		(23,00,08,00,"OC_SMITH_01");
};

