instance NASZ_230_Dymoondo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dymoondo";
	guild 		= GIL_OUT;
	id 			= 230;
	voice 		= 4;
	flags      	= 2;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Jackal, BodyTex_L, ITNA_OUT_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_230;
};
FUNC VOID Rtn_Start_230()
{
	TA_Sit_Campfire (00,00,12,00,"NASZ_MYSLIWI_POZA_2");
	TA_Sit_Campfire (12,00,00,00,"NASZ_MYSLIWI_POZA_2");
};

FUNC VOID Rtn_Follow_230()
{
	TA_Follow_Player (00,00,12,00,"NASZ_MYSLIWI_POZA_2");
	TA_Follow_Player (12,00,00,00,"NASZ_MYSLIWI_POZA_2");
};

FUNC VOID Rtn_Kap4_230()
{
	TA_Stand_ArmsCrossed (00,00,12,00,"OW_PATH_3_06");
	TA_Stand_ArmsCrossed (12,00,00,00,"OW_PATH_3_06");
};

FUNC VOID Rtn_Kap4Mysliwi_230()
{
	TA_Sit_Campfire (00,00,12,00,"NASZ_MYSLIWI_DYMOONDO_KAP4");
	TA_Sit_Campfire (12,00,00,00,"NASZ_MYSLIWI_DYMOONDO_KAP4");
};


