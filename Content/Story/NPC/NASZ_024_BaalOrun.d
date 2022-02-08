

instance NASZ_024_BaalOrun (Npc_Default)
{
	// ------ NSC ------
	name 		= "Baal Orun";
	guild 		= GIL_MEATBUG;
	id 			= 24;
	voice 		= 8;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Orun, BodyTex_N, ITNA_GUR_M );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_24;
};

FUNC VOID Rtn_Start_24 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"NASZ_ZAPALISADA_OB_21");	
   	TA_Stand_Guarding		(23,00,07,30,"NASZ_ZAPALISADA_OB_21");
};

FUNC VOID Rtn_End_24 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"TOT");	
   	TA_Stand_Guarding		(23,00,07,30,"TOT");
};

FUNC VOID Rtn_Rytual_24 () // biegnie do miejsca z rytualem
{	
	TA_RunToWP		(07,30,23,00,"NASZ_ZAPALISADA_OB_16");	
   	TA_RunToWP		(23,00,07,30,"NASZ_ZAPALISADA_OB_16");
};

FUNC VOID Rtn_OrunRitual_24 () // odprawia rutyal
{	
	TA_Practice_Magic		(07,30,23,00,"NASZ_ZAPALISADA_OB_16");	
   	TA_Practice_Magic		(23,00,07,30,"NASZ_ZAPALISADA_OB_16");
};

