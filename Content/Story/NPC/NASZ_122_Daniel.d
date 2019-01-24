instance NASZ_122_Daniel (Npc_Default)
{
	// ------ NSC ------
	name 		= "Daniel"; 
	guild 		= GIL_DJG;
	id 			= 122;
	voice 		= 9;
	flags       = 0;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItNa_Djg_Weapon_L);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKE_Dexter,1);
	CreateInvItems 	(self, ItWr_RavensKidnapperMission_Addon, 1 );
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	daily_routine = Rtn_Start_122;
};	 
	// ------ TA ------
	FUNC VOID RTn_Start_122()
	{
		TA_Sit_Campfire (00,00,12,00,"NASZ_LOWCY_DOL_09");
		TA_Sit_Campfire (12,00,00,00,"NASZ_LOWCY_DOL_09");
	};
	FUNC VOID RTn_Gold_122()
	{
		TA_Pick_Ore (00,00,12,00,"OW_PATH_118");
		TA_Pick_Ore (12,00,00,00,"OW_PATH_118");
	};
	FUNC VOID RTn_InMine_122()
	{
		TA_Pick_Ore (00,00,12,00,"OW_MINE3_LEFT_07");
		TA_Pick_Ore (12,00,00,00,"OW_MINE3_LEFT_07");
	};