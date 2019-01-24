
instance NASZ_118_Ferros (Npc_Default)
{
	// ------ NSC ------
	name 		= "Feros"; 
	guild 		= GIL_DJG;
	id 			= 118;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 32);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Orik, BodyTex_B, ITNA_DJG_H);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_118;
};

FUNC VOID Rtn_Start_118 ()
{
   	TA_Roast_Scavenger		(18,20,01,40,"NASZ_LOWCY_ARENA_13");
  	TA_Sit_Bench			(01,40,06,15,"NASZ_LOWCY_ARENA_12");
	TA_Repair_Hut			(06,15,09,20,"NASZ_LOWCY_DOL_20");
	TA_SmallTalk			(09,20,13,40,"NASZ_LOWCY_DOL_19");
	TA_Repair_Hut			(13,40,18,20,"NASZ_LOWCY_DOL_20");

};

FUNC VOID Rtn_Arena_118 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NASZ_LOWCY_ARENA_01");
	TA_Stand_Guarding	(23,00,08,00,"NASZ_LOWCY_ARENA_01");		
};

FUNC VOID Rtn_FollowRenegaci_118 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_118 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_118 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_Kopalnia_118 ()
{
	TA_Stand_Guarding		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_Stand_Guarding		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};


FUNC VOID Rtn_Twierdza_118 ()
{
	TA_SmallTalk	(08,00,23,00,"NASZ_TWIERDZA_27");
	TA_SmallTalk	(23,00,08,00,"NASZ_TWIERDZA_27");		
};

FUNC VOID Rtn_Zamek_118 ()
{
	TA_Follow_Player	(08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Follow_Player	(23,00,08,00,"NASZ_ZAMEK_OBOZ_01");		
};

FUNC VOID Rtn_TwierdzaAtak_118 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NASZ_TWIERDZA_35");
	TA_Sit_Campfire	(23,00,08,00,"NASZ_TWIERDZA_35");		
};

FUNC VOID Rtn_Odpoczynek_118 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

FUNC VOID Rtn_InCastle_118 ()
{
	TA_Stand_Guarding	(08,00,23,00,"OC_GATE_GUARD_03");
	TA_Stand_Guarding	(23,00,08,00,"OC_GATE_GUARD_03");		
};

