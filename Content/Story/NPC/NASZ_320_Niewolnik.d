
instance NASZ_320_Niewolnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niewolnik";
	guild 		= GIL_SLD;
	id 			= 320;
	voice 		= 12;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_IGNORE_Sheepkiller]	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Fingers, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_320;
};

FUNC VOID Rtn_Start_320 ()
{	
	TA_Saw				(08,00,22,00,"NASZ_BANDYCI_OBOZ_18");
    TA_Sit_Campfire		(22,00,08,00,"NASZ_BANDYCI_OBOZ_01");
};

FUNC VOID Rtn_After_320 ()
{
	TA_Saw  			(09,00,20,00,"NASZ_BANDYCI_OBOZ_18");
   TA_Sit_Bench			(20,00,09,00,"NASZ_BANDYCI_OBOZ_18");
};

FUNC VOID Rtn_Twierdza_320 ()
{
	TA_Repair_Hut		(08,00,22,00,"NASZ_TWIERDZA_17");
   TA_Repair_Hut		(22,00,08,00,"NASZ_TWIERDZA_17");
};

FUNC VOID Rtn_TwierdzaAtak_320 ()
{
	TA_Sit_Campfire		(08,00,22,00,"NASZ_TWIERDZA_39");
   TA_Sit_Campfire		(22,00,08,00,"NASZ_TWIERDZA_39");
};