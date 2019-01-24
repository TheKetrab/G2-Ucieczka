
instance NASZ_129_Matt (Npc_Default)
{
	// ------ NPC ------
	name 	= "Matt";
	guild 	= GIL_DJG;
	id 	= 129;
	voice 	= 11;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 16);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FATBALD", 128, 2, ITNA_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_129;
};

FUNC VOID Rtn_Start_129 ()
{
	TA_Stand_Torch	(20,00,08,00,"OW_HOSHPAK_03");
	TA_Stand_WP	(08,00,20,00,"OW_HOSHPAK_03");
};

FUNC VOID Rtn_ToCamp_129 ()
{
	TA_Guide_Player	(20,00,08,00,"NASZ_LOWCY_ZWIADOWCY_01");
	TA_Guide_Player (08,00,20,00,"NASZ_LOWCY_ZWIADOWCY_01");
};

FUNC VOID Rtn_InCamp_129 ()
{
	TA_Stand_ArmsCrossed	(20,00,08,00,"NASZ_LOWCY_ZWIADOWCY_03");
	TA_Stand_ArmsCrossed	(08,00,20,00,"NASZ_LOWCY_ZWIADOWCY_03");
};

FUNC VOID Rtn_GonnaGo_129 ()
{
	TA_Stand_ArmsCrossed	(20,00,08,00,"OW_PATH_1_3");
	TA_Stand_ArmsCrossed	(08,00,20,00,"OW_PATH_1_3");
};

FUNC VOID Rtn_UnderMountain_129 ()
{
	TA_Guide_Player	(20,00,08,00,"OW_PATH_1_12");
	TA_Guide_Player	(08,00,20,00,"OW_PATH_1_12");
};

FUNC VOID Rtn_Mountain_129 ()
{
	TA_Stand_Guarding	(20,00,08,00,"NASZ_WP_MATT_MOUNT_1");
	TA_Stand_Guarding	(08,00,20,00,"NASZ_WP_MATT_MOUNT_1");
};

FUNC VOID Rtn_FollowMountain_129 ()
{
	TA_Follow_Player	(20,00,08,00,"NASZ_WP_MATT_MOUNT_1");
	TA_Follow_Player	(08,00,20,00,"NASZ_WP_MATT_MOUNT_1");
};

FUNC VOID Rtn_Dead_129 ()
{
	TA_Stand_WP	(20,00,08,00,"NASZ_MATT_DEAD");
	TA_Stand_WP	(08,00,20,00,"NASZ_MATT_DEAD");
};


