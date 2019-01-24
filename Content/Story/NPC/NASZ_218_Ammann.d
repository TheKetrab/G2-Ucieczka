
instance NASZ_218_Ammann (Npc_Default)
{
	// ------ NPC ------
	name 	= "Ammann";
	guild 	= GIL_OUT;
	id 	= 218;
	voice 	= 14;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	attribute	[ATR_HITPOINTS_MAX]	=	2000;
	attribute	[ATR_HITPOINTS]		=	2000;
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_Corristo, BodyTex_N, ITNA_OUT_H );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_218;
};

FUNC VOID Rtn_Start_218 ()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"PLATEAU_ROUND01");
	TA_Stand_ArmsCrossed	(22,00,08,00,"PLATEAU_ROUND01");
};

FUNC VOID Rtn_Forteca_218 ()
{
	TA_Guide_Player		(08,00,22,00,"LOCATION_19_03_PATH_RUIN7");
	TA_Guide_Player		(22,00,08,00,"LOCATION_19_03_PATH_RUIN7");
};

FUNC VOID Rtn_After_218 ()
{
	TA_Stand_WP		(08,00,22,00,"LOCATION_19_03_PATH_RUIN10");
	TA_Stand_WP		(22,00,08,00,"LOCATION_19_03_PATH_RUIN10");
};

FUNC VOID Rtn_Twierdza_218 ()
{
	TA_Stand_WP		(08,00,22,00,"NASZ_TWIERDZA_9");
	TA_Stand_WP		(22,00,08,00,"NASZ_TWIERDZA_9");
};

FUNC VOID Rtn_FollowZamek_218()
{	
	TA_RunToWp 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWp			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_218()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_218()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_218()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};


FUNC VOID Rtn_InCastle_218()
{	
	TA_Stand_ArmsCrossed		(08,00,20,00,"OC_GATE_GUARD_03");
	TA_Stand_ArmsCrossed		(20,00,08,00,"OC_GATE_GUARD_03");
};

FUNC VOID Rtn_Odpoczynek_218 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

FUNC VOID Rtn_UltraFinal_218 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_11");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_11");
};

FUNC VOID Rtn_Scena5_218 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_218 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};