
instance NASZ_411_CzlonekBractwa (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cz³onek Bractwa";	
	guild 		= GIL_NONE;
	id 			= 411;
	voice 		= 19;
	flags       = 6;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	Createinvitems (self, ItNa_Mapa_ObozNaBagnie, 1);		
	Createinvitems (self, ItMi_Gold, 48);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Fortuno, BodyTex_N, ITAR_LESTER);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_411;
};

FUNC VOID Rtn_Start_411 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_PALISADA_TRUP");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_PALISADA_TRUP");
};
