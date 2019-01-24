
instance NASZ_429_WojownikCienia (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wojownik cienia";	
	guild 		= GIL_WOLF;
	id 			= 429;
	voice 		= 30;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
		aivar[AIV_NewsOverride] 	= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
	//aivar[AIV_EnemyOverride] = TRUE;
	EquipItem	(self,ItMw_Zweihaender2);
	aivar[AIV_IGNORE_Murder] = TRUE;	
	// ------ Kampf-Taktik ------
	fight_tactic					= FAI_ZOMBIE;

	// ------ visuals ------																			
	//Mdl_SetVisual		(self, "Zombie.mds");
	//Mdl_SetVisualBody	(self, "Zom_Body", 0, 0, "Hum_Head_Pony", Face_N_ZombieMud, 0, NO_ARMOR);
	
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, BodyTex_N, ITAR_MayaZombie_Addon);
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_429;
};

FUNC VOID Rtn_Start_429 ()
{	
	TA_Guard_Passage		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_04");
    TA_Guard_Passage		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_04");
};
