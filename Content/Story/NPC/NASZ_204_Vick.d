instance NASZ_204_Vick (Npc_Default)
{
	// ------ NPC ------
	name 	= "Vick";
	guild 	= GIL_OUT;
	id 	= 204;
	voice 	= 5;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 
	EquipItem	(self, ItNa_KapturMysliwego);

	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_N_Corristo , BodyTex_N, ITNA_OUT_L );		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30);

	// ------ Rutyna ------
	daily_routine = Rtn_PreStart_204;
};

FUNC VOID Rtn_PreStart_204 ()
{
	TA_Sit_Campfire		(07,00,21,00,"NASZ_MYSLIWI_GRUPA_03");
	TA_Sit_Campfire		(21,00,07,00,"NASZ_MYSLIWI_GRUPA_03");
};

FUNC VOID Rtn_GuideA_204 ()
{
	TA_Guide_Player		(07,00,21,00,"SPAWN_OW_BLOODFLY_OC_PSI");
	TA_Guide_Player		(21,00,07,00,"SPAWN_OW_BLOODFLY_OC_PSI");
};

FUNC VOID Rtn_GuideB_204 ()
{
	TA_Guide_Player		(07,00,21,00,"LOCATION_02_01");
	TA_Guide_Player		(21,00,07,00,"LOCATION_02_01");
};

FUNC VOID Rtn_Start_204 ()
{
	TA_Stand_WP			(07,00,21,00,"NASZ_MYSLIWI_CMENTARZ_01");
	TA_Stand_WP			(21,00,07,00,"NASZ_MYSLIWI_CMENTARZ_01");
};

FUNC VOID Rtn_Scena5_204 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_204 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};