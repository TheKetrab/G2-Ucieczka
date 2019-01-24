
instance NASZ_107_Brutus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brutus";
	guild 		= GIL_DJG;
	id 			= 107;
	voice 		= 6;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	//------- Aivars 
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Djg_Weapon_L);
	EquipItem			(self, ItNa_DrewnianaTarcza1);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_ToughBald, BodyTex_P, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_107;
};

FUNC VOID Rtn_Start_107 ()
{	
	TA_Smith_Sharp			(08,40,19,10,"NASZ_LOWCY_KUZNIA_OSELKA");
	TA_Sleep				(19,10,03,20,"NASZ_LOWCY_DOM_04");
    TA_Roast_Scavenger		(03,20,08,40,"NASZ_LOWCY_DOL_01");
};


FUNC VOID Rtn_BeforeDie_107 ()
{	
	TA_Stand_WP		(10,00,20,00,"TOT");
    TA_Stand_WP		(20,00,10,00,"TOT");

};


FUNC VOID Rtn_Die_107 ()
{	
	TA_Stand_WP		(10,00,20,00,"NASZ_BRUTUS_A");
	TA_Stand_WP		(20,00,10,00,"NASZ_BRUTUS_A");

};
