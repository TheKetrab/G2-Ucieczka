
instance NASZ_407_Straznik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik krypty";	
	guild 		= GIL_NONE;
	id 			= 407;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	bodyStateInterruptableOverride = TRUE; 
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	aivar[REAL_STRENGTH] = 60;
	attribute[ATR_STRENGTH] = 60;	
	
	Createinvitems (self, ItNa_KeyStraznik_Sila, 1);			
	Createinvitems (self, ItMi_DarkPearl, 1);		
	Createinvitems (self, ItRi_Hp_01, 1);
	Createinvitems (self, ItPl_Strength_Herb_01, 6);	
	Createinvitems (self, ItPo_Perm_Health, 1);	
	Createinvitems (self, ItMi_OldCoin, 50);

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_Zweihaender2);
	// ------ Inventory ------
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITAR_KDW_L_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_407;
};

FUNC VOID Rtn_Start_407 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"PLATEAU_ROUND02_CAVE_MOVE");
    TA_Stand_ArmsCrossed		(23,00,08,00,"PLATEAU_ROUND02_CAVE_MOVE");
};
