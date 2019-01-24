
instance NASZ_112_Peter (Npc_Default)
{
	// ------ NPC ------
	name 	= "Peter";
	guild 	= GIL_DJG;
	id 	= 112;
	voice 	= 9;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_L);
	EquipItem	(self, ItNa_DrewnianaTarcza1);	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_Weak12, BodyTex_N, ITNA_DJG_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_112;
};

FUNC VOID Rtn_Start_112 ()
{
	TA_Practice_Sword	(08,20,20,40,"NASZ_LOWCY_TRENING_04");
	TA_Stand_Drinking		(20,40,23,50,"NASZ_LOWCY_KARCZMA_04");
	TA_Sleep		(23,50,08,20,"NASZ_LOWCY_GORA_20");
};

FUNC VOID Rtn_Prowadzenie_112 ()
{
	TA_Guide_Player  (08,00,20,00,"OW_MOLERAT_CAVE_SPAWN");
	TA_Guide_Player	 (20,00,08,00,"OW_MOLERAT_CAVE_SPAWN");
};

FUNC VOID Rtn_Twierdza_112 ()
{
	TA_Sit_Campfire  (07,35,21,10,"OW_PATH_189");
	TA_Sleep		 (20,00,08,00,"NASZ_TWIERDZA_46");
};

FUNC VOID Rtn_TwierdzaAtak_112 ()
{
	TA_Sit_Campfire  (08,00,20,00,"NASZ_TWIERDZA_11");
	TA_Sit_Campfire	 (20,00,08,00,"NASZ_TWIERDZA_11");
};

FUNC VOID Rtn_Zamek_112 ()
{
	TA_Roast_Scavenger  (08,00,20,00,"OC_CAMPFIRE_BARBQ");
	TA_Roast_Scavenger	 (20,00,08,00,"OC_CAMPFIRE_BARBQ");
};

FUNC VOID Rtn_InCastle_112 ()
{
	TA_Stand_WP  (08,00,20,00,"OC_CENTER_GUARD_04");
	TA_Stand_WP	 (20,00,08,00,"OC_CENTER_GUARD_04");
};

