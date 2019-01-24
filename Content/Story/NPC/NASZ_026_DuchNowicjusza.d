

instance NASZ_026_DuchNowicjusza (Npc_Default)
{
	// ------ NSC ------
	name 		= "Duch";
	guild 		= GIL_MEATBUG;
	id 			= 26;
	voice 		= 5;
	flags       = 6;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Spicker);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", 44, 1, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_26;
};

FUNC VOID Rtn_Start_26 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"NASZ_DUCH_NOWICJUSZA");	
   	TA_Stand_Guarding		(23,00,07,30,"NASZ_DUCH_NOWICJUSZA");
};

FUNC VOID Rtn_End_26 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"TOT");	
   	TA_Stand_Guarding		(23,00,07,30,"TOT");
};
