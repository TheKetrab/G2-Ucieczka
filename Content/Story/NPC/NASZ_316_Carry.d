instance NASZ_316_Carry (Npc_Default)
{
	// ------ NSC ------
	name 		= "Carry"; 
	guild 		= GIL_SLD;
	id 			= 316;
	voice 		= 7;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	 
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItNa_Ban_Weapon_M);
	EquipItem 			(self, ItNa_Shield_Skora);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_NormalBart02, BodyTex_L, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_316;
};

FUNC VOID Rtn_Start_316 ()
{	
	TA_Stand_ArmsCrossed		 (08,00,23,00,"OW_DJG_WATCH_STONEHENGE_01");
    TA_Stand_ArmsCrossed	(23,00,08,00,"OW_DJG_WATCH_STONEHENGE_01");
};

FUNC VOID Rtn_Away_316 ()
{	
	TA_Follow_Player		 (08,00,23,00,"OW_DJG_WATCH_STONEHENGE_01");
    TA_Follow_Player	(23,00,08,00,"OW_DJG_WATCH_STONEHENGE_01");
};

FUNC VOID Rtn_Koniec_316 ()
{	
	TA_Stand_ArmsCrossed		 (08,00,23,00,"NASZ_BANDYCI_RYBY_B");
    TA_Stand_ArmsCrossed	(23,00,08,00,"NASZ_BANDYCI_RYBY_B");
};
