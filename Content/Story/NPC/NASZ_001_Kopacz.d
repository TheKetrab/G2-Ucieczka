
instance NASZ_001_Kopacz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kopacz";
	guild 		= GIL_NONE;
	id 			= 1;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Pacho, BodyTex_B,  ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1;
};

FUNC VOID Rtn_Start_1 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"OW_MINE2_GRIMES");
    TA_Pick_Ore	 (23,00,08,00,"OW_MINE2_GRIMES");
 
};

FUNC VOID Rtn_Lowcy_1 ()
{	
	TA_Pick_FP	 (08,00,23,00,"NASZ_LOWCY_GORA_14");
	TA_Pick_FP	 (23,00,08,00,"NASZ_LOWCY_GORA_14");
 
};
