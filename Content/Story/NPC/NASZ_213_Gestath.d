
instance NASZ_213_Gestath (Npc_Default)
{
	// ------ NPC ------
	name 	= "Gestath";
	guild 	= GIL_OUT;
	id 	= 213;
	voice 	= 5;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	attribute[ATR_STRENGTH] = 90;
	aivar[REAL_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	aivar[REAL_DEXTERITY] = 90;
	
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_S);
	EquipItem	(self, ItRw_Bow_H_03); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Psionic", Face_B_Thorus, BodyTex_B, ITAR_DJG_Crawler );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 90);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_213;
};

FUNC VOID Rtn_Start_213 ()
{
	TA_Stand_Eating		(07,05,10,20,"LOCATION_02_07");
	TA_Stand_ArmsCrossed 	(10,20,18,10,"NASZ_MYSLIWI_DOL_09");
	TA_Sit_Bench	 	(18,10,07,05,"LOCATION_02_07");
};

FUNC VOID Rtn_Bandyci_213 ()
{
	TA_Stand_Guarding	(07,00,21,00,"OW_PATH_033_TO_CAVE2");
	TA_Stand_Guarding	(21,00,07,00,"OW_PATH_033_TO_CAVE2");
};

FUNC VOID Rtn_Twierdza_213 ()
{
	TA_Stand_Eating		(07,00,21,00,"NASZ_TWIERDZA_19");
	TA_Stand_Eating		(21,00,07,00,"NASZ_TWIERDZA_19");
};

FUNC VOID Rtn_TwierdzaAtak_213 ()
{
	TA_Stand_WP		(07,00,21,00,"NASZ_TWIERDZA_33");
	TA_Stand_WP		(21,00,07,00,"NASZ_TWIERDZA_33");
};

FUNC VOID Rtn_TOT_213 ()
{
	TA_Stand_WP		(07,00,21,00,"TOT");
	TA_Stand_WP		(21,00,07,00,"TOT");
};
