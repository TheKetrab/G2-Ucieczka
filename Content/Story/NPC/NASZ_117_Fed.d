
instance NASZ_117_Fed (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fed";
	guild 		= GIL_DJG;
	id 			= 117;
	voice 		= 8;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;

	level = 10;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
			
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItNa_Djg_Weapon_L);
	EquipItem (self, ItNa_DrewnianaTarcza1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ Visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Gilbert, BodyTex_N, ITNA_DJG_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_117;
};

FUNC VOID Rtn_Start_117 ()
{	
	TA_Sit_Campfire	(18,50,06,15,"NASZ_LOWCY_ARENA_16");
	TA_SmallTalk	(06,15,08,40,"NASZ_LOWCY_ARENA_17");
	TA_Repair_Hut	(08,40,11,40,"NASZ_LOWCY_DOL_27");
	TA_SmallTalk 	(11,40,15,10,"NASZ_LOWCY_DOL_06");
	TA_Sit_Campfire	(15,10,18,50,"NASZ_LOWCY_DOL_09");

};

FUNC VOID Rtn_Arena_117 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_LOWCY_ARENA_01");		
};

FUNC VOID Rtn_FollowRenegaci_117 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_117 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_117 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_Kopalnia_117 ()
{
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_Twierdza_117 ()
{
	TA_SmallTalk	(08,00,23,00,"NASZ_TWIERDZA_28");
	TA_SmallTalk	(23,00,08,00,"NASZ_TWIERDZA_28");		
};

FUNC VOID Rtn_Zamek_117 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");		
};

FUNC VOID Rtn_TwierdzaAtak_117 ()
{
	TA_Pray_Innos_FP	(08,00,23,00,"NASZ_TWIERDZA_43");
	TA_Pray_Innos_FP	(23,00,08,00,"NASZ_TWIERDZA_43");		
};

FUNC VOID Rtn_Odpoczynek_117 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

// TODO: ma isc do zamku
FUNC VOID Rtn_InCastle_117 ()
{
	TA_Stand_WP	(08,00,23,00,"OC_GUARD_PALISADE_06");
	TA_Stand_WP	(23,00,08,00,"OC_GUARD_PALISADE_06");		
};

FUNC VOID Rtn_Scena5_117 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_117 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};