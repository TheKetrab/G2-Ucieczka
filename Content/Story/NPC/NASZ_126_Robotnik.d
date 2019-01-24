
instance NASZ_126_Robotnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Robotnik"; 
	guild 		= GIL_DJG;
	id 			= 126;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal_Olli_Kahn, BodyTexMiner_N,-1);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_126;
};

FUNC VOID Rtn_Start_126()
{	
	TA_Repair_Hut 		(11,40,15,20,"NASZ_LOWCY_KARCZMA_29"); 
	TA_Pick_FP 		(15,20,20,10,"NASZ_LOWCY_GORA_10"); 	
	TA_Sit_Bench		(20,10,00,20,"NASZ_LOWCY_KARCZMA_03");  
	TA_Sit_Campfire 	(00,20,08,40,"NASZ_LOWCY_DOL_06");
	TA_SmallTalk 		(08,40,11,40,"NASZ_LOWCY_DOL_06");
}; 

// TODO
FUNC VOID Rtn_Kap4_126()
{	
	TA_Repair_Hut 		(11,40,15,20,"NASZ_LOWCY_KARCZMA_29"); 
	TA_Pick_FP 		(15,20,20,10,"NASZ_LOWCY_GORA_10"); 	
}; 

