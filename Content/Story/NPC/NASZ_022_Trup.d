
instance NASZ_022_Trup (Npc_Default)
{
	// ------ NSC ------
	name 		= "Trup";	
	guild 		= GIL_NONE;
	id 			= 22;
	voice 		= 19;
	flags       = NPC_FLAG_GHOST;																
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_Lester, BodyTex_P, ITNA_Nov_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_22;
};

FUNC VOID Rtn_Start_22 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_JEHEN_QUEST_05");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_JEHEN_QUEST_05");
};

