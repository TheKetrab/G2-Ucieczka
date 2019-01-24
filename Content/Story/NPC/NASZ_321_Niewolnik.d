
instance NASZ_321_Niewolnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niewolnik";
	guild 		= GIL_SLD;
	id 			= 321;
	voice 		= 7;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_ToughBald01, BodyTex_L, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_321;
};

FUNC VOID Rtn_Start_321 ()
{	
	TA_Pick_Ore		(08,00,22,00,"NASZ_BANDYCI_GROTA_02");
    TA_Sit_Campfire		(22,00,08,00,"NASZ_BANDYCI_OBOZ_02");
};

FUNC VOID Rtn_After_321 ()
{
	TA_Sit_Campfire		(08,00,22,00,"NASZ_BANDYCI_OBOZ_20");
   TA_Sit_Campfire		(22,00,08,00,"NASZ_BANDYCI_OBOZ_20");
};

FUNC VOID Rtn_Twierdza_321 ()
{
	TA_Repair_Hut		(08,00,22,00,"OW_PATH_187");
   TA_Repair_Hut		(22,00,08,00,"OW_PATH_187");
};

FUNC VOID Rtn_TwierdzaAtak_321 ()
{
	TA_Sit_Campfire		(08,00,22,00,"NASZ_TWIERDZA_39");
   TA_Sit_Campfire		(22,00,08,00,"NASZ_TWIERDZA_39");
};
