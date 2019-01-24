

instance NASZ_016_Netbek (Npc_Default)
{
	// ------ NSC ------
	name 		= "Netbek";
	guild 		= GIL_OUT;
	id 			= 16;
	voice 		= 5;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Spicker);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Netbek, BodyTex_N, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_16;
};

FUNC VOID Rtn_PreStart_16 ()
{	
	TA_Stand_ArmsCrossed		(07,30,23,00,"NASZ_ZAPALISADA_LAS_48");	
   	TA_Stand_ArmsCrossed		(23,00,07,30,"NASZ_ZAPALISADA_LAS_48");
};

FUNC VOID Rtn_Start_16 ()
{	
	TA_Stand_Eating		(07,40,10,50,"NASZ_ZAPALISADA_LAS_47");	
	TA_Smoke_Joint		(10,50,14,30,"NASZ_ZAPALISADA_LAS_47");	
	TA_SmallTalk		(14,30,18,10,"NASZ_ZAPALISADA_LAS_45");	
	TA_Smoke_Joint		(18,10,22,10,"NASZ_ZAPALISADA_LAS_47");	
   	TA_Sleep			(22,10,07,40,"NASZ_ZAPALISADA_LAS_19");
};

FUNC VOID Rtn_Dead_16 ()
{	
	TA_FleeToWP		(08,00,10,00,"NASZ_ZAPALISADA_SAMOBOJSTWO");	
	TA_FleeToWP		(10,00,08,00,"NASZ_ZAPALISADA_SAMOBOJSTWO");	
};