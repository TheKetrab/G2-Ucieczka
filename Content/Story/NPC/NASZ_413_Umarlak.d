
instance NASZ_413_Umarlak (Npc_Default)
{
	// ------ NSC ------
	name 		= "Umarlak";	
	guild 		= GIL_NONE;
	id 			= 413;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	Createinvitems (self, ItMw_Orkschlaechter, 1);		
	Createinvitems (self, ItMi_Gold, 32);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_ToughBald_Nek, BodyTex_P, ITAR_CorAngar);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_413;
};

FUNC VOID Rtn_Start_413 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_UMARLAK");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_UMARLAK");
};
