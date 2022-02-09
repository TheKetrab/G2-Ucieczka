
instance NASZ_313_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_SLD;
	id 			= 313;
	voice 		= 14;
	flags       = 1;		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak04, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60i

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_313;
};

FUNC VOID Rtn_Start_313 ()
{
	TA_Sit_Bench			(09,00,21,00,"NASZ_BANDYCI_OBOZ_18");
    TA_Sit_Bench				(21,00,09,00,"NASZ_BANDYCI_OBOZ_18");		
};

FUNC VOID Rtn_Artefakt_313 ()
{
	TA_Stand_ArmsCrossed			(09,00,21,00,"NASZ_BANDYCI_POZA_7");
    TA_Stand_ArmsCrossed				(21,00,09,00,"NASZ_BANDYCI_POZA_7");		
};

