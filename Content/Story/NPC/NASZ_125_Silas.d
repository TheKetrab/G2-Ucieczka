instance NASZ_125_Silas (Npc_Default)
{
	// ------ NSC ------
	name 		= "Silas";
	guild 		= GIL_DJG;
	id 			= 125;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItNa_Djg_Weapon_L);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Silas, BodyTex_B, ITNA_DJG_L);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_125;
};
FUNC VOID Rtn_Start_125 ()
{
   TA_Stand_Guarding    (19,20,06,15,"OW_PATH_02");
   TA_Cook_Cauldron    (06,15,10,30,"OW_PATH_02");
   TA_Repair_Hut        (10,30,14,55,"NASZ_LOWCY_GORA_03");
   TA_Smoke_Joint       (14,55,19,20,"NASZ_LOWCY_KARCZMA_14");

};


