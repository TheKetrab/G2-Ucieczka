
instance NASZ_304_Bam (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bam"; 
	guild 		= GIL_SLD;
	id 			= 304;
	voice 		= 1;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	 
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Silas, BodyTex_B, ITNA_BAN_H);	 
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 90); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_304;
};

FUNC VOID Rtn_Start_304 ()
{	
	 TA_Stand_Guarding		(08,00,22,00,"OW_PATH_033_TO_CAVE5");
	TA_Smalltalk 			(22,00,08,00,"NASZ_BANDYCI_TRON_03");
};

FUNC VOID Rtn_Artefakt_304 ()
{	
	 TA_Stand_Guarding		(08,00,22,00,"NASZ_BANDYCI_POZA_4");
   TA_Stand_Guarding			(22,00,08,00,"NASZ_BANDYCI_POZA_4");
};

FUNC VOID Rtn_Follow_304 ()
{	
	 TA_Follow_Player		(08,00,22,00,"NASZ_KOPALNIA_NOWY_02");
   TA_Follow_Player			(22,00,08,00,"NASZ_KOPALNIA_NOWY_02");
};

FUNC VOID Rtn_Follow2_304 ()
{	
	 TA_Follow_Player		(08,00,22,00,"OW_MINE2_04");
   TA_Follow_Player			(22,00,08,00,"OW_MINE2_04");
};



FUNC VOID Rtn_Koniec_304 ()
{	
	TA_RunToWP			(08,00,23,00,"NASZ_BANDYCI_RYBY_I");
    TA_RunToWP			(23,00,08,00,"NASZ_BANDYCI_RYBY_I");
};

FUNC VOID Rtn_Koniec2_304 () // FIX Ucieczka 1.1 - Bam jest nieœmiertelny i nie jest liczony do bandit counter
{	
	TA_RunToWP			(08,00,23,00,"TOT");
    TA_RunToWP			(23,00,08,00,"TOT");
};
