
instance NASZ_406_Straznik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik krypty";	
	guild 		= GIL_NONE;
	id 			= 406;
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
	Createinvitems (self, ItNa_KeyStraznik_Moc, 1);		
	Createinvitems (self, ItRu_Skull, 1);
	Createinvitems (self, ItRi_Mana_01, 1);	
	Createinvitems (self, ItSc_InstantFireball, 2);	
	Createinvitems (self, ItSc_FullHeal, 1);	
	Createinvitems (self, ItSc_SumSkel, 1);	
	Createinvitems (self, ItSc_TrfDragonSnapper, 1);
	Createinvitems (self, ItSc_Whirlwind, 2);
	Createinvitems (self, ItMi_OldCoin, 70);
	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_ToughBald_Nek, BodyTex_P, ITAR_KDW_L_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_406;
};

FUNC VOID Rtn_Start_406 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
    TA_Stand_ArmsCrossed		(23,00,08,00,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
};
