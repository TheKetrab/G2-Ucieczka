

instance NASZ_223_Ratford (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ratford";
	guild 		= GIL_OUT;
	id 			= 223;
	voice 		= 5;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	Npc_EquipHelmet	(self, ItNa_KapturMysliwego);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_L_Ratford, BodyTex_L, ITNA_OUT_M);			
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_223;
};

FUNC VOID Rtn_Start_223 ()
{	
	TA_Stand_ArmsCrossed		(07,45,10,30,"NASZ_MYSLIWI_GORA_15"); 
    TA_Sit_Campfire				(10,30,13,05,"NASZ_MYSLIWI_GORA_17");
	TA_Stand_ArmsCrossed		(13,05,16,45,"NASZ_MYSLIWI_BALKON_04");
    TA_Stand_ArmsCrossed		(16,45,18,50,"NASZ_MYSLIWI_GORA_01");	
	TA_Sit_Campfire				(18,50,20,30,"NASZ_MYSLIWI_BALKON_07"); 
	TA_Sleep					(20,30,07,45,"NASZ_MYSLIWI_GORA_16");
};