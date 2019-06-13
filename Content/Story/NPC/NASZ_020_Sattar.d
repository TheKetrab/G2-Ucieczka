
instance NASZ_020_Sattar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sattar";
	guild 		= GIL_NONE;
	id 			= 20;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Sattar, BodyTex_B,  ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_20;
};

FUNC VOID Rtn_Start_20 ()
{	
	TA_Sit_Campfire	 (08,00,23,00,"NASZ_KOPALNIA_NOWY_26");
	TA_Sit_Campfire	 (23,00,08,00,"NASZ_KOPALNIA_NOWY_26");
 
};

FUNC VOID Rtn_Metody_20 ()
{	
	TA_Sit_Campfire	 (08,00,23,00,"NASZ_KOPALNIA_NOWY_13");
	TA_Sit_Campfire	 (23,00,08,00,"NASZ_KOPALNIA_NOWY_13");
 
};

FUNC VOID Rtn_GoToBen_20 ()
{	
	TA_RunToWP	 (08,00,23,00,"OW_MINE2_04");
	TA_RunToWP	 (23,00,08,00,"OW_MINE2_04");
 
};

FUNC VOID Rtn_Lowcy_20 ()
{	
	TA_Pick_FP	 (08,00,23,00,"NASZ_LOWCY_GORA_16");
	TA_Pick_FP	 (23,00,08,00,"NASZ_LOWCY_GORA_16");
 
};

FUNC VOID Rtn_TriaMiner_20 ()
{	
	TA_RunToWP	 (08,00,23,00,"NASZ_KOPALNIA_TRIA_SATTAR");
	TA_RunToWP	 (23,00,08,00,"NASZ_KOPALNIA_TRIA_SATTAR");
};
