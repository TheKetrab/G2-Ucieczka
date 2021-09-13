
instance NASZ_232_Jehen (Npc_Default)
{
	// ------ NPC ------
	name 	= "Jehen";
	guild 	= GIL_OUT;
	id 	= 232;
	voice 	= 13;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	Npc_EquipHelmet	(self, ItNa_KapturMysliwego);
	//AI_EquipArmor(self,ItNa_KapturMysliwego);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITNA_OUT_M );		

	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30);

	// ------ Rutyna ------
	daily_routine = Rtn_Ukryty_232;
};


FUNC VOID Rtn_Start_232 ()
{
	TA_Stand_Eating		(08,00,20,00,"NASZ_JEHEN_01");
	TA_Stand_Eating		(20,00,08,00,"NASZ_JEHEN_01");
};

FUNC VOID Rtn_GuideToScavengers_232 ()
{
	TA_Guide_Player		(08,00,20,00,"OW_PATH_186");
	TA_Guide_Player		(20,00,08,00,"OW_PATH_186");
};

FUNC VOID Rtn_GuideBackToCamp_232 ()
{
	TA_Guide_Player		(08,00,20,00,"NASZ_JEHEN_01");
	TA_Guide_Player		(20,00,08,00,"NASZ_JEHEN_01");
};


FUNC VOID Rtn_Prowadzenie_232 ()
{
	TA_Guide_Player		(08,00,20,00,"LOCATION_02_03");
	TA_Guide_Player		(20,00,08,00,"LOCATION_02_03");
};

FUNC VOID Rtn_Mysliwi_232 ()
{
	TA_Sleep		(08,00,20,00,"NASZ_MYSLIWI_DOL_24");
	TA_Sleep		(20,00,08,00,"NASZ_MYSLIWI_DOL_24");
};

FUNC VOID Rtn_Ukryty_232 ()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Namiot_232 ()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"NASZ_JEHEN_QUEST_01");
	TA_Stand_ArmsCrossed		(20,00,08,00,"NASZ_JEHEN_QUEST_01");
};

FUNC VOID Rtn_LastTimeISee_232 ()
{
	TA_Guide_Player		(08,00,20,00,"PATH_TO_PLATEAU06");
	TA_Guide_Player		(20,00,08,00,"PATH_TO_PLATEAU06");
};

FUNC VOID Rtn_DeadWarg_232 ()
{
	TA_Guide_Player		(08,00,20,00,"SPAWN_OW_WARAN_EBENE_02_05");
	TA_Guide_Player		(20,00,08,00,"SPAWN_OW_WARAN_EBENE_02_05");
};

FUNC VOID Rtn_DeadWargWait_232 ()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"SPAWN_OW_WARAN_EBENE_02_05");
	TA_Stand_ArmsCrossed		(20,00,08,00,"SPAWN_OW_WARAN_EBENE_02_05");
};

FUNC VOID Rtn_Korzenie_232 ()
{
	TA_Guide_Player		(08,00,20,00,"NASZ_PRZEJSCIE_ROCKCAMP_2");
	TA_Guide_Player		(20,00,08,00,"NASZ_PRZEJSCIE_ROCKCAMP_2");
};

FUNC VOID Rtn_KorzenieWait_232 ()
{
	TA_Stand_ArmsCrossed		(08,00,20,00,"NASZ_PRZEJSCIE_ROCKCAMP_2");
	TA_Stand_ArmsCrossed		(20,00,08,00,"NASZ_PRZEJSCIE_ROCKCAMP_2");
};

FUNC VOID Rtn_Trup_232 ()
{
	TA_Guide_Player		(08,00,20,00,"NASZ_JEHEN_QUEST_05");
	TA_Guide_Player		(20,00,08,00,"NASZ_JEHEN_QUEST_05");
};

FUNC VOID Rtn_Bestia1_232 ()
{
	TA_RunToWP		(08,00,20,00,"NASZ_JEHEN_QUEST_06");
	TA_RunToWP		(20,00,08,00,"NASZ_JEHEN_QUEST_06");
};

FUNC VOID Rtn_Part2_232 ()
{
	TA_Sit_Campfire		(08,00,20,00,"NASZ_JEHEN_10");
	TA_Sit_Campfire		(20,00,08,00,"NASZ_JEHEN_10");
};
