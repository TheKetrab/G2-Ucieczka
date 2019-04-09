instance NASZ_322_Niewolnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niewolnik";
	guild 		= GIL_SLD;
	id 			= 1153;
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
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart12, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_322;
};

FUNC VOID Rtn_Start_322 ()
{	
	TA_Pick_Ore		(08,00,23,00,"NASZ_BANDYCI_WODOSPAD_03");
   TA_Pick_Ore		(23,00,08,00,"NASZ_BANDYCI_WODOSPAD_03");
};
