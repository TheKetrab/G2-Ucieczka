
instance NASZ_305_Rabon (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rabon";
	guild 		= GIL_SLD;
	id 			= 305;
	voice 		= 8;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);			
   attribute   [ATR_HITPOINTS_MAX]   =   300;
   attribute   [ATR_HITPOINTS]      =   300;
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Ban_Weapon_M);
	EquipItem			(self, ItNa_Shield_Skora);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMi_Nugget,1);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Rabon, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_305;
};

FUNC VOID Rtn_Start_305 ()
{	
	  TA_Stand_Guarding		(08,00,20,00,"NASZ_BANDYCI_OBOZ_04");
     TA_Stand_Guarding			(20,00,08,00,"NASZ_BANDYCI_OBOZ_04");
};

FUNC VOID Rtn_Artefakt_305 ()
{	
	  TA_Stand_Guarding		(08,00,20,00,"NASZ_BANDYCI_POZA_8");
     TA_Stand_Guarding			(20,00,08,00,"NASZ_BANDYCI_POZA_8");
};

FUNC VOID Rtn_Twierdza_305 ()
{	
	  TA_Roast_Scavenger		(08,00,20,00,"NASZ_TWIERDZA_5");
     TA_Roast_Scavenger			(20,00,08,00,"NASZ_TWIERDZA_5");
};
