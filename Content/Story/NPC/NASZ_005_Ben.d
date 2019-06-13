instance NASZ_005_Ben (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ben";
	guild 		= GIL_NONE;
	id 			= 5;
	voice 		= 6;
	flags       = 2;							
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	EquipItem (self, ItMw_2H_Axe_L_01);
	
	// ------ Inventory ------

	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Erpresser, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_5;
};

FUNC VOID Rtn_Start_5 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"OW_MINE2_STRF");
	TA_Pick_Ore	 (23,00,08,00,"OW_MINE2_STRF");
 
};

FUNC VOID Rtn_After_5 ()
{	
	TA_Stand_WP	 (08,00,23,00,"OW_PATH_266");
	TA_Stand_WP	 (23,00,08,00,"OW_PATH_266");
 
};

FUNC VOID Rtn_Lowcy_5 ()
{	
	TA_Pick_FP	 (08,00,23,00,"NASZ_LOWCY_GORA_17");
	TA_Pick_FP	 (23,00,08,00,"NASZ_LOWCY_GORA_17");
 
};

FUNC VOID Rtn_TriaMiner_5 ()
{	
	TA_RunToWP	 (08,00,23,00,"NASZ_KOPALNIA_TRIA_BEN");
	TA_RunToWP	 (23,00,08,00,"NASZ_KOPALNIA_TRIA_BEN");
};

