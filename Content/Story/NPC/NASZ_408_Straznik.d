
instance NASZ_408_Straznik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik krypty";	
	guild 		= GIL_NONE;
	id 			= 408;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE; 
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	Createinvitems (self, ItNa_KeyStraznik_Odpornosc, 1);	
	Createinvitems (self, ItSc_IceCube, 2);	
	Createinvitems (self, ItAm_Prot_Fire_01, 1);	
	Createinvitems (self, ItSc_LightningFlash, 1);	
	Createinvitems (self, ItMi_Sulfur, 3);
	Createinvitems (self, ItPo_Mana_01, 3);
	Createinvitems (self, ItMi_OldCoin, 80);

	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

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
	daily_routine 		= Rtn_Start_408;
};

FUNC VOID Rtn_Start_408 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"OW_SAWHUT_MOLERAT_SPAWN01");
    TA_Stand_ArmsCrossed		(23,00,08,00,"OW_SAWHUT_MOLERAT_SPAWN01");
};
