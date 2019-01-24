instance NASZ_326_Domenic (Npc_Default)
{
	// ------ NSC ------
	name 		= "Domenic";
	guild 		= GIL_SLD;
	id 			= 326;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------
	EquipItem		(self, ItNa_Ban_Weapon_M);

	// ------ Inventory ------
	B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak05, BodyTex_N, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_326;
};

FUNC VOID Rtn_Start_326 ()
{	
	TA_Stand_WP		(08,00,23,00,"OW_PATH_3_09");
    TA_Stand_WP		(23,00,08,00,"OW_PATH_3_09");
};

FUNC VOID Rtn_Odwrocenie_326 ()
{	
	TA_RunToWP		(08,00,23,00,"OW_PATH_STONEHENGE_7");
    TA_RunToWP		(23,00,08,00,"OW_PATH_STONEHENGE_7");
};

FUNC VOID Rtn_Koniec_326 ()
{	
	TA_Practice_Sword		(08,00,23,00,"NASZ_BANDYCI_RYBY_K");
    TA_Practice_Sword		(23,00,08,00,"NASZ_BANDYCI_RYBY_K");
};
