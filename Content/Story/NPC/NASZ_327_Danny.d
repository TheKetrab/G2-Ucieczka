instance NASZ_327_Danny (Npc_Default)
{
	// ------ NSC ------
	name 		= "Danny";
	guild 		= GIL_SLD;
	id 			= 327;
	voice 		= 9;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------
	EquipItem		(self, ItNa_Ban_Weapon_M);

	// ------ Inventory ------
	B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Danny, BodyTex_N, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_327;
};

FUNC VOID Rtn_Start_327 ()
{	
	TA_Sit_Bench		(10,33,13,47,"NASZ_BANDYCI_RYBY_I");
	TA_Stand_Eating		(13,47,17,14,"NASZ_BANDYCI_RYBY_H");	
	TA_Stand_WP		(17,14,23,11,"NASZ_BANDYCI_RYBY_F");
	TA_Sleep		(23,11,07,39,"NASZ_BANDYCI_RYBY_D");	
	TA_Wash_FP		(07,39,10,33,"NASZ_BANDYCI_RYBY_L");
};

FUNC VOID Rtn_Koniec_327 ()
{	
	TA_Stand_WP		(08,00,23,00,"NASZ_BANDYCI_RYBY_F");
	TA_Stand_WP		(23,00,08,00,"NASZ_BANDYCI_RYBY_F");
};
