
instance NASZ_224_Dobar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dobar";
	guild 		= GIL_OUT;
	id 			= 224;
	voice 		= 8;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_Vlk_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMi_Nugget,1);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Snaf, BodyTex_N, ITAR_Smith);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_224;
};

FUNC VOID Rtn_Start_224 ()
{	
	TA_Smith_Anvil			(08,30,09,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(09,00,09,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(09,30,10,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(10,00,10,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(10,30,11,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(11,00,11,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(11,30,12,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(12,00,12,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(12,30,13,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(13,00,13,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(13,30,14,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(14,00,14,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(14,30,15,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(15,00,15,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(15,30,16,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(16,00,16,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(16,30,17,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(17,00,17,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(17,30,18,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(18,00,18,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(18,30,19,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(19,00,19,30,"NASZ_MYSLIWI_DOL_17"	);
    TA_Smith_Anvil			(19,30,20,00,"NASZ_MYSLIWI_DOL_18"	);
  	TA_Smith_Sharp			(20,00,20,30,"NASZ_MYSLIWI_DOL_17"	);
    
    TA_Sleep				(20,30,08,30,"NASZ_MYSLIWI_DOL_23");
};

