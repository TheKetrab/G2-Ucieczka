

instance NASZ_029_Lukor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Baal Lukor";
	guild 		= GIL_MEATBUG;
	id 			= 29;
	voice 		= 5;
	flags       = 6;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Spicker);
	
	// ------ Inventory ------
	CreateInvItems(self,ItNa_KsiegaLukora,1);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 38/* TODO To sobie dostosuj*/, 1, ITNA_GUR_M );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_29;
};

FUNC VOID Rtn_Start_29 ()
{	
	TA_Stand_WP		(07,30,23,00,"NASZ_OZYWIENIEC_15");	
   	TA_Stand_WP		(23,00,07,30,"NASZ_OZYWIENIEC_15");
};

