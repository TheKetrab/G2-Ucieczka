
instance NASZ_101_Korth (Npc_Default)
{
	// ------ NSC ------
	name 		= "Korth"; 
	guild 		= GIL_DJG;
	id 			= 101;
	voice 		= 55;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	slf.attribute[ATR_STRENGTH]	= 110;
	slf.aivar[REAL_STRENGTH]	= 110;	

	slf.attribute[ATR_HITPOINTS_MAX] = 450;
	slf.attribute[ATR_HITPOINTS] = 450;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItNa_Djg_Weapon_M); 
	EquipItem	(self, ItNa_DJG_Crossbow);	
	Createinvitems (self, ItRw_Bolt, 15);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, ITNA_DJG_M );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_101;
};
FUNC VOID Rtn_PreStart_101 ()
{	
	TA_Follow_Player		(08,00,22,00,"OW_PATH_1_1_WASH");
	TA_Follow_Player 	(22,00,08,00,"OW_PATH_1_1_WASH");
};
FUNC VOID Rtn_Start_101 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"OW_PATH_1_1_WASH");
	TA_Stand_ArmsCrossed 	(22,00,08,00,"OW_PATH_1_1_WASH");
};
FUNC VOID Rtn_Prowadzenie_101 ()
{
	TA_Guide_Player  (08,00,20,00,"PATH_OC_NC_11"); 
	TA_Guide_Player	 (20,00,08,00,"PATH_OC_NC_11");
};
FUNC VOID Rtn_Help_101 ()
{
	TA_Guide_Player  (08,00,20,00,"OW_ADD_12"); 
	TA_Guide_Player	 (20,00,08,00,"OW_ADD_12");
};
FUNC VOID Rtn_MineA_101 ()
{
	TA_Guide_Player  (08,00,20,00,"OW_NEWMINE_09_B"); 
	TA_Guide_Player	 (20,00,08,00,"OW_NEWMINE_09_B");
};
FUNC VOID Rtn_MineB_101 ()
{
	TA_Sit_Campfire  (08,00,20,00,"OW_NEWMINE_11"); 
	TA_Sit_Campfire	 (20,00,08,00,"OW_NEWMINE_11");
};
FUNC VOID Rtn_Piwo_101 ()
{
	TA_Guide_Player  (08,00,20,00,"NASZ_PIWO_1"); 
	TA_Guide_Player	 (20,00,08,00,"NASZ_PIWO_1");
};
FUNC VOID Rtn_Uzupelnia_101 ()
{	
	TA_Potion_Alchemy	(05,00,20,00,"NASZ_PIWO_1");
	TA_Potion_Alchemy	(20,00,05,00,"NASZ_PIWO_1");
};
FUNC VOID Rtn_Twierdza_101 ()
{	
	TA_SmallTalk	(06,40,21,10,"NASZ_TWIERDZA_32");
	TA_Sleep		(21,10,06,40,"NASZ_TWIERDZA_47");
};

FUNC VOID Rtn_TwierdzaAtak_101 ()
{	
	TA_Sit_Bench	(05,00,20,00,"NASZ_TWIERDZA_13");
	TA_Sit_Bench	(20,00,05,00,"NASZ_TWIERDZA_13");
};

FUNC VOID Rtn_InCastle_101 ()
{	
	TA_Stand_Guarding		(05,00,21,00,"NASZ_ZAMEK_PASSAGE");
	TA_Stand_Torch	 		(21,00,05,00,"NASZ_ZAMEK_PASSAGE");
};


FUNC VOID Rtn_Kap4_101 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NASZ_LOWCY_DOL_11");
	TA_Sit_Campfire 	(22,00,08,00,"NASZ_LOWCY_DOL_11");
};


FUNC VOID Rtn_UltraFinal_101 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_03");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_03");
};


FUNC VOID Rtn_Scena2_101 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_04");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_04");
};

FUNC VOID Rtn_Scena2Goal_101 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_101 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_101 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};