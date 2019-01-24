INSTANCE NASZ_127_Jeremiasz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jeremiasz";
	guild 		= GIL_DJG;
	id 			= 127;
	voice 		= 14;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItNa_Djg_Weapon_L); 
	
	// ------ Inventory ------
	

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",Face_N_OldBald_Jeremiah, BodyTexMiner_N, -1);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_127;
};

FUNC VOID Rtn_Start_127 ()
{	
	TA_Potion_Alchemy	(08,10,16,30,"NASZ_LOWCY_KARCZMA_13");
	TA_Sit_Bench		(16,30,22,20,"NASZ_LOWCY_KARCZMA_15");
	TA_Sleep			(22,20,08,10,"NASZ_LOWCY_KARCZMA_12");
};

FUNC VOID Rtn_AlmostDead_127 ()
{	
	TA_Sleep_Deep		(08,00,20,00,"NASZ_LOWCY_KARCZMA_12");
	TA_Sleep_Deep		(20,00,08,00,"NASZ_LOWCY_KARCZMA_12");
};
