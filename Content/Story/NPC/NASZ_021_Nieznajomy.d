
instance NASZ_021_Nieznajomy (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nieznajomy";	
	guild 		= GIL_NONE;
	id 			= 21;
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
	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITNA_GUR_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_21;
};

FUNC VOID Rtn_Start_21 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"TOT");
    TA_Stand_ArmsCrossed		(23,00,08,00,"TOT");
};

FUNC VOID Rtn_StartOUT_21 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_JEHEN_QUEST_09");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_JEHEN_QUEST_09");
};

FUNC VOID Rtn_StartDJG_21 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_NIEZNAJOMY_2");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_NIEZNAJOMY_2");
};

FUNC VOID Rtn_Matt_21 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_MATT_DEAD_2");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_MATT_DEAD_2");
};

FUNC VOID Rtn_End_21 ()
{	
	TA_Stand_WP		(08,00,23,00,"TOT");
    TA_Stand_WP		(23,00,08,00,"TOT");
};
