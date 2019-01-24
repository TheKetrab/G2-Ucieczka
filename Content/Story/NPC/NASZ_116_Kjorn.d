
instance NASZ_116_Kjorn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kjorn"; 
	guild 		= GIL_DJG;
	id 			= 116;
	voice 		= 6;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Djg_Weapon_L);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal02, BodyTex_N, ITNA_DJG_H);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_116;
};

FUNC VOID Rtn_Start_116 ()
{
	TA_Sit_Campfire 	(22,10,07,40,"NASZ_LOWCY_ARENA_15");
	TA_SmallTalk 		(06,15,08,40,"NASZ_LOWCY_ARENA_12");
	TA_SmallTalk 		(08,40,11,40,"NASZ_LOWCY_DOL_17");
	TA_SmallTalk 		(11,40,15,10,"NASZ_LOWCY_DOL_06");
	TA_SmallTalk 		(15,10,18,10,"NASZ_LOWCY_ARENA_12");
	TA_Practice_Sword	(18,10,22,10,"NASZ_LOWCY_ARENA_19");
};

FUNC VOID Rtn_Arena_116 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_LOWCY_ARENA_01");		
};

FUNC VOID Rtn_FollowRenegaci_116 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_116 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_116 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_Kopalnia_116 ()
{
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_KopalniaInside_116 ()
{
	TA_Guide_Player		(08,00,23,00,"OW_MINE2_04");
	TA_Guide_Player		(23,00,08,00,"OW_MINE2_04");		
};


FUNC VOID Rtn_Twierdza_116 ()
{
	TA_Practice_Sword	(08,00,23,00,"NASZ_TWIERDZA_30");
	TA_Practice_Sword	(23,00,08,00,"NASZ_TWIERDZA_30");		
};

FUNC VOID Rtn_Zamek_116 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");		
};

FUNC VOID Rtn_TwierdzaAfter_116 ()
{
	TA_Sit_Chair	(08,00,23,00,"NASZ_TWIERDZA_5");
	TA_Sit_Chair	(23,00,08,00,"NASZ_TWIERDZA_5");		
};

FUNC VOID Rtn_FollowZamek_116()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_Odpoczynek_116 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

FUNC VOID Rtn_InCastle_116 ()
{
	TA_Stand_WP	(08,00,23,00,"OC_STAND_TANDOR_02");
	TA_Stand_WP	(23,00,08,00,"OC_STAND_TANDOR_02");		
};

