instance NASZ_220_Kirgo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kirgo";
	guild 		= GIL_NONE;
	id 			= 220;
	voice 		= 8;
	flags       = 1;	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 

	// ------ Inventory ------
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B, ITNA_OUT_L);	 
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_220;
};

FUNC VOID Rtn_Start_220 ()
{	
	TA_Potion_Alchemy	(05,20,20,35,"NASZ_MYSLIWI_DOL_02");
	TA_Read_Bookstand	(20,35,05,20,"NASZ_MYSLIWI_DOL_10");
};

FUNC VOID Rtn_Scena5_220 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_220 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};
