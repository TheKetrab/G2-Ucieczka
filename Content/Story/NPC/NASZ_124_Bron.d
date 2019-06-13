instance NASZ_124_Bron (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bron";
	guild 		= GIL_DJG;
	id 			= 124;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItNa_Djg_Weapon_L);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Bron, BodyTex_B, ITNA_DJG_L);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_124;
};

FUNC VOID Rtn_PreStart_124 ()
{
  	TA_Stand_ArmsCrossed   (08,00,20,00,"NASZ_LOWCY_ZAPASY");
  	TA_Stand_ArmsCrossed  	 (20,00,08,00,"NASZ_LOWCY_ZAPASY");
};

FUNC VOID Rtn_Start_124 ()
{
  	TA_Stand_ArmsCrossed	(07,50,20,20,"NASZ_LOWCY_ZAPASY");
  	TA_Pray_Sleeper_FP 		(20,20,02,45,"NASZ_LOWCY_GORA_13");
	TA_Smalltalk  	 		(02,45,07,50,"NASZ_LOWCY_KARCZMA_02");
	TA_Sleep	  	 		(02,45,07,50,"NASZ_LOWCY_KARCZMA_28");
};

// TODO
FUNC VOID Rtn_Kap4_124 ()
{
  	TA_Stand_ArmsCrossed	(07,50,20,20,"NASZ_LOWCY_ZAPASY");
  	TA_Stand_ArmsCrossed 	(20,20,02,45,"NASZ_LOWCY_GORA_13");
};

FUNC VOID Rtn_Scena5_124 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_124 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};
