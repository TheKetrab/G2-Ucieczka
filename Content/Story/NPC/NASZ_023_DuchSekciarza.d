

instance NASZ_023_DuchSekciarza (Npc_Default)
{
	// ------ NSC ------
	name 		= "Duch Sekciarza";
	guild 		= GIL_MEATBUG;
	id 			= 23;
	voice 		= 7;
	flags       = 6;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Spicker);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITNA_GUR_M );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_23;
};

FUNC VOID Rtn_Start_23 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"NASZ_ZAPALISADA_OB_05");	
   	TA_Stand_Guarding		(23,00,07,30,"NASZ_ZAPALISADA_OB_05");
};

FUNC VOID Rtn_WithOrun_23 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"NASZ_ZAPALISADA_OB_21_A");
   	TA_Stand_Guarding		(23,00,07,30,"NASZ_ZAPALISADA_OB_21_A");
};

FUNC VOID Rtn_Rytual_23 () // biegnie do miejsca z rytualem
{	
	TA_RunToWP		(07,30,23,00,"NASZ_ZAPALISADA_OB_16");	
   	TA_RunToWP		(23,00,07,30,"NASZ_ZAPALISADA_OB_16");
};

FUNC VOID Rtn_End_23 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"TOT");	
   	TA_Stand_Guarding		(23,00,07,30,"TOT");
};
