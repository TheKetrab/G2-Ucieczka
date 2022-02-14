INSTANCE NASZ_030_Dusty (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dusty";
	guild 		= GIL_MEATBUG;
	id 			= 30;
	voice 		= 14;
	flags       = 6;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Spicker); 
	
	// ------ Inventory ------
	

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",Face_N_NormalBart_Dusty, BodyTexMiner_N, -1);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_30;
};

FUNC VOID Rtn_Start_30 ()
{	
	TA_Stand_WP		(08,00,16,00,"NASZ_ZAPALISADA_OB_44");
	TA_Stand_WP		(16,00,08,00,"NASZ_ZAPALISADA_OB_44");
};

FUNC VOID Rtn_End_30 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"TOT");	
   	TA_Stand_Guarding		(23,00,07,30,"TOT");
};
