
instance NASZ_004_Bryson (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bryson";
	guild 		= GIL_OUT;
	id 			= 4;
	voice 		= 6;
	flags       = 0;							
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Torlof, BodyTex_N,  ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4;
};

FUNC VOID Rtn_Start_4 ()
{
	TA_Pick_Ore	 (08,00,23,00,"OW_MINE2_08");
    TA_Pick_Ore	 (23,00,08,00,"OW_MINE2_08");
};

FUNC VOID Rtn_GoToTria_4 ()
{
	TA_Stand_WP	 (08,00,23,00,"OW_MINE2_07");
    TA_Stand_WP	 (23,00,08,00,"OW_MINE2_07");
};

FUNC VOID Rtn_RunToOre_4 ()
{
	TA_RunToWP	 (08,00,23,00,"NASZ_KOPALNIA_BRYSON_DEAD");
    TA_RunToWP	 (23,00,08,00,"NASZ_KOPALNIA_BRYSON_DEAD");
};

