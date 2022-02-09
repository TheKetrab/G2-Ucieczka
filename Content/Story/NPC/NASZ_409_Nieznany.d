
instance NASZ_409_Nieznany (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nieznany";	
	guild 		= GIL_NONE;
	id 			= 409;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	bodyStateInterruptableOverride = TRUE; 
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;	
		
	// ------ Kampf-Taktik ------
	fight_tactic   = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																
	CreateInvItems (self, ItNa_OkoSwiata, 1);
	Createinvitems (self, ItPo_Perm_Mana, 2);	
	Createinvitems (self, ItSc_Shrink, 1);	
	Createinvitems (self, ItSc_ArmyOfDarkness, 1);	
	Createinvitems (self, Value_Sc_SumDemon, 3);
	Createinvitems (self, ItPo_Mana_01, 2);
	Createinvitems (self, ItMi_OldCoin, 130);
	Createinvitems (self, ItPl_Perm_Herb, 1);

	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Normal_GorNaBar, BodyTex_L, ITAR_Xardas);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_409;
};

FUNC VOID Rtn_Start_409 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_BANDYCI_ARTEFAKT_2");
	TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_BANDYCI_ARTEFAKT_2");
};
