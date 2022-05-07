instance NASZ_203_Tabuk (Npc_Default)
{
	// ------ NPC ------
	name 	= "Tabuk";
	guild 	= GIL_OUT;
	id 	= 203;
	voice 	= 5;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_RangedTA_Target] = RangedTarget_Mysliwi2;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Dexter, BodyTex_N, ITNA_OUT_M );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_203;
};

FUNC VOID Rtn_Start_203 ()
{
	TA_Sit_Bench			(16,00,13,00,"NASZ_MYSLIWI_GRUPA_04");
	TA_Practice_Ranged		(13,00,16,00,"NASZ_MYSLIWI_GRUPA_TARCZA1");
};

FUNC VOID Rtn_Kap4_203 ()
{
	TA_Sit_Campfire		(07,00,21,00,"LOCATION_02_04");
	TA_Sit_Campfire	 	(21,00,07,00,"LOCATION_02_04");
};

FUNC VOID Rtn_Tarcza1_203 ()
{
	TA_Stand_ArmsCrossed		(07,00,21,00,"NASZ_MYSLIWI_GRUPA_11");
	TA_Stand_ArmsCrossed	 	(21,00,07,00,"NASZ_MYSLIWI_GRUPA_11");
};

FUNC VOID Rtn_Tarcza2_203 ()
{
	TA_Stand_ArmsCrossed		(07,00,21,00,"NASZ_MYSLIWI_GRUPA_10");
	TA_Stand_ArmsCrossed	 	(21,00,07,00,"NASZ_MYSLIWI_GRUPA_10");
};

FUNC VOID Rtn_Scena5_203 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_203 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};