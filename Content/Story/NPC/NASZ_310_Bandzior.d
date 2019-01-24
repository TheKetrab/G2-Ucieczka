
instance NASZ_310_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior"; 
	guild 		= GIL_SLD;
	id 			= 310;
	voice 		= 6;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Ban_Weapon_H);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart22, BodyTex_N, ITNA_BAN_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_310;
};

FUNC VOID Rtn_Start_310 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"NASZ_BANDYCI_TRON_02");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_TRON_02");
};


FUNC VOID Rtn_Artefakt_310 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"NASZ_BANDYCI_POZA_6");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_POZA_6");
};
