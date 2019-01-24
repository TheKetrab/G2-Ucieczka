instance NASZ_888_Film (Npc_Default)
{
	// ------ NSC ------
	name 		= "Film"; 
	guild 		= GIL_OUT;
	id 			= 888;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,500);
	CreateInvItems (self, ITNA_OUT_L, 1);
	CreateInvItems (self, ITNA_OUT_M, 1);
	CreateInvItems (self, ITNA_OUT_S, 1);
	CreateInvItems (self, ITNA_DJG_L, 1);
	CreateInvItems (self, ITNA_DJG_M, 1);
	CreateInvItems (self, ITNA_DJG_H, 1);
	CreateInvItems (self, ITNA_DJG_S, 1);
	CreateInvItems (self, ITNA_ARMOR_ANCIENT, 1);

	CreateInvItems (self, ItNa_Smyk, 1);
	CreateInvItems (self, ItNa_Kosmyk, 1);
	CreateInvItems (self, ItNa_GrzechSzakala, 1);
	CreateInvItems (self, ItNa_Szabla, 1);
	CreateInvItems (self, ItNa_StaryPykacz, 1);

	CreateInvItems (self, ItRu_Massdeath, 1);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kharim, BodyTex_B, ITNA_OUT_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_888;
};

FUNC VOID Rtn_Start_888 ()
{
	TA_Stand_WP	(08,00,23,00,"XXX");
    TA_Stand_WP	(23,00,08,00,"XXX");
};
