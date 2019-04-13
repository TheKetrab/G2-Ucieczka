instance NASZ_323_Niewolnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niewolnik";
	guild 		= GIL_SLD;
	id 			= 323;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_IGNORE_Sheepkiller]	= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self,1);	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough02, BodyTex_L, ITAR_BAU_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_323;
};

FUNC VOID Rtn_Start_323 ()
{	
	TA_Pick_Ore		(08,00,23,00,"NASZ_BANDYCI_WODOSPAD_05");
    TA_Pick_Ore		(23,00,08,00,"NASZ_BANDYCI_WODOSPAD_05");
};
