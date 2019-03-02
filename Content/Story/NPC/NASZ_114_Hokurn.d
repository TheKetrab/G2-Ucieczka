
instance NASZ_114_Hokurn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hokurn"; 
	guild 		= GIL_DJG;
	id 			= 114;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 17);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B, ITNA_DJG_S);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_114;
};

FUNC VOID Rtn_Start_114 ()
{
	TA_Practice_Sword		(05,10,09,30,"NASZ_LOWCY_ARENA_19");
	TA_Saw					(09,30,11,40,"NASZ_LOWCY_DOL_14");
	TA_Smalltalk			(11,40,15,20,"NASZ_LOWCY_DOL_15");	
	TA_Saw					(15,20,17,30,"NASZ_LOWCY_DOL_14");
	TA_Smalltalk			(17,30,18,45,"NASZ_LOWCY_DOL_15");	
	TA_Stand_ArmsCrossed	(18,45,01,00,"NASZ_LOWCY_ARENA_08");
	TA_Sleep				(01,00,05,00,"NASZ_LOWCY_ARENA_11");		
};

FUNC VOID Rtn_Arena_114 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_LOWCY_ARENA_01");		
};

FUNC VOID Rtn_Twierdza_114 ()
{
	TA_Practice_Sword	(08,00,23,00,"NASZ_TWIERDZA_31");
	TA_Practice_Sword	(23,00,08,00,"NASZ_TWIERDZA_31");		
};

FUNC VOID Rtn_Zamek_114 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");		
};

FUNC VOID Rtn_TwierdzaAtak_114 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NASZ_TWIERDZA_40");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_TWIERDZA_40");		
};

FUNC VOID Rtn_FollowZamek_114()
{	
	TA_RunToWp 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWp			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_Odpoczynek_114 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

// TODO
FUNC VOID Rtn_InCastle_114 ()
{
	TA_Stand_WP		(08,00,23,00,"NASZ_ZAMEK_10");
	TA_Stand_WP		(23,00,08,00,"NASZ_ZAMEK_10");		
};

FUNC VOID Rtn_ArenaZamek_114 ()
{
	TA_RunToWP		(08,00,23,00,"OC_SMITH_01");
	TA_RunToWP		(23,00,08,00,"OC_SMITH_01");
};


FUNC VOID Rtn_Scena5_114 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_114 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};

