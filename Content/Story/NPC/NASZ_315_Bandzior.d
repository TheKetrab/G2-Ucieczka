INSTANCE NASZ_315_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_SLD;
	id 			= 315;
	voice 		= 6;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	attribute[ATR_STRENGTH] = 60;	
	attribute[ATR_HITPOINTS_MAX] = 450;
	attribute[ATR_HITPOINTS] = 450;
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItNa_Ban_Weapon_H);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart21, BodyTex_N, ITNA_BAN_M);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_315;
};

FUNC VOID Rtn_Start_315 ()
{	
	TA_Practice_Sword 	(05,00,20,00,"NASZ_BANDYCI_POZA_1");
	TA_Sit_Campfire		(20,00,05,00,"NASZ_BANDYCI_POZA_1");
};

FUNC VOID Rtn_Fight_315 ()
{	
	TA_Guide_Player 	(05,00,20,00,"OW_PATH_3_STONES");
	TA_Guide_Player		(20,00,05,00,"OW_PATH_3_STONES");
};

FUNC VOID Rtn_Away_315 ()
{	
	TA_Practice_Sword	(05,00,20,00,"OW_PATH_07_15_CAVE3");
	TA_Practice_Sword		(20,00,05,00,"OW_PATH_07_15_CAVE3");
};

FUNC VOID Rtn_Koniec_315 ()
{	
	TA_Practice_Sword	(05,00,20,00,"NASZ_BANDYCI_RYBY_G");
	TA_Practice_Sword		(20,00,05,00,"NASZ_BANDYCI_RYBY_G");
};

