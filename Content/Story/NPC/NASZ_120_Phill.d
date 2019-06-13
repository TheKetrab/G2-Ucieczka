
instance NASZ_120_Phill (Npc_Default)
{
	// ------ NSC ------
	name 		= "Phill"; 
	guild 		= GIL_DJG;
	id 		= 120;
	voice 		= 4;
	flags   	= 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	
	self.protection [PROT_EDGE]  = 80;
	self.protection [PROT_BLUNT] = 80;

	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Djg_Weapon_L);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Dexter, BodyTex_N, ITNA_DJG_M);			
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_120;
};

FUNC VOID Rtn_Start_120 ()
{
	TA_Saw		(07,30,09,20,"NASZ_LOWCY_GORA_21");
	TA_SmallTalk (09,20,13,40,"NASZ_LOWCY_DOL_18");
	TA_Saw		(13,40,20,10,"NASZ_LOWCY_GORA_21");	
	TA_Dance	(20,10,02,45,"NASZ_LOWCY_KARCZMA_02");
	TA_Sleep	(02,45,07,30,"NASZ_LOWCY_KARCZMA_32");
};

FUNC VOID Rtn_Guide_120 ()
{	
	TA_Guide_Player		(08,00,23,00,"OW_NC_ABYSS3");
	TA_Guide_Player		(23,00,08,00,"OW_NC_ABYSS3");
};

FUNC VOID Rtn_Goblins_120 ()
{	
	TA_Guide_Player		(08,00,23,00,"OW_DJG_VORPOSTEN_01");
	TA_Guide_Player		(23,00,08,00,"OW_DJG_VORPOSTEN_01");
};

FUNC VOID Rtn_Kap4_120 ()
{	
	Ta_Stand_ArmsCrossed		(07,30,20,10,"NASZ_LOWCY_DOL_22");
	TA_Dance					(20,10,02,45,"NASZ_LOWCY_KARCZMA_02");
	TA_Smoke_Waterpipe			(02,45,07,30,"NASZ_LOWCY_KARCZMA_22");
};