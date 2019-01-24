instance NASZ_225_Wrzod (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wrzód"; 
	guild 		= GIL_OUT;
	id 			= 225;
	voice 		= 1;
	flags       = 2;								
	npctype		= NPCTYPE_AMBIENT;
	
	//--------Aivars-----------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Mud, BodyTex_N, ITAR_PRISONER);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	daily_routine = Rtn_Start_225;
};
	// ------ TA ------
	FUNC VOID RTN_Start_225()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"NASZ_MYSLIWI_GORA_04");
	TA_Stand_ArmsCrossed (12,00,00,00,"NASZ_MYSLIWI_GORA_04");
};

FUNC VOID RTN_Aran_225()
{
	TA_Sit_Bench (00,00,12,00,"LOCATION_01_06");
	TA_Sit_Bench (12,00,00,00,"LOCATION_01_06");
};

FUNC VOID RTN_Kap4_225()
{
	TA_Krzyk (00,00,12,00,"LOCATION_01_06");
	TA_Krzyk (12,00,00,00,"LOCATION_01_06");
};

FUNC VOID RTN_Kap4Done_225()
{
	TA_WrzodFinal (00,00,12,00,"NASZ_ZAPALISADA_TARTAK_10");
	TA_WrzodFinal (12,00,00,00,"NASZ_ZAPALISADA_TARTAK_10");
};