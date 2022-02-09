
instance NASZ_002_Daryl (Npc_Default)
{
	// ------ NSC ------
	name 		= "Daryl";
	guild 		= GIL_NONE;
	id 			= 2;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal08, BodyTex_N,  ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_2;
};

FUNC VOID Rtn_PreStart_2 ()
{	
	TA_Sit_Campfire	 (08,00,23,00,"OW_MINE2_05");
	TA_Sit_Campfire	 (23,00,08,00,"OW_MINE2_05");
 
};

FUNC VOID Rtn_Start_2 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"NASZ_KOPALNIA_NOWY_04");
	TA_Pick_Ore	 (23,00,08,00,"NASZ_KOPALNIA_NOWY_04");
 
};


FUNC VOID Rtn_SitBryson_2 ()
{	
	TA_Stand_WP	 (08,00,23,00,"NASZ_KOPALNIA_NOWY_20");
	TA_Stand_WP	 (23,00,08,00,"NASZ_KOPALNIA_NOWY_20");
 
};

FUNC VOID Rtn_Metody_2 ()
{	
	TA_Stand_Guarding	 (08,00,23,00,"NASZ_KOPALNIA_NOWY_12");
	TA_Stand_Guarding	 (23,00,08,00,"NASZ_KOPALNIA_NOWY_12");
 
};

FUNC VOID Rtn_GoToBen_2 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"NASZ_NUGGETMOB_18");
	TA_Pick_Ore	 (23,00,08,00,"NASZ_NUGGETMOB_18");
 
};


FUNC VOID Rtn_Lowcy_2 ()
{	
	TA_Pick_FP	 (08,00,23,00,"NASZ_LOWCY_GORA_15");
	TA_Pick_FP	 (23,00,08,00,"NASZ_LOWCY_GORA_15");
 
};

FUNC VOID Rtn_TriaMiner_2 ()
{	
	TA_RunToWP	 (08,00,23,00,"NASZ_KOPALNIA_TRIA_DARYL");
	TA_RunToWP	 (23,00,08,00,"NASZ_KOPALNIA_TRIA_DARYL");
};
