
instance NASZ_111_Gerold  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gerold";
	guild 		= GIL_DJG;
	id 			= 111;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 9);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Blade, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_111;
};
FUNC VOID Rtn_Start_111 ()
{	
	TA_Sit_Bench		(08,00,22,00,"NASZ_LOWCY_DOL_02");
	TA_Sit_Bench		(22,00,08,00,"NASZ_LOWCY_DOL_02");
};
FUNC VOID Rtn_Cmentarz_111 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NASZ_LOWCY_CMENTARZ_02");
	TA_Stand_Guarding		(22,00,08,00,"NASZ_LOWCY_CMENTARZ_02");
};
FUNC VOID Rtn_Guide_111 ()
{
	TA_Follow_Player (08,00,20,00,"NASZ_LOWCY_CMENTARZ_03"); 
	TA_Follow_Player (20,00,08,00,"NASZ_LOWCY_CMENTARZ_03");
};

// TODO
FUNC VOID Rtn_Kap4_111 ()
{
	TA_Follow_Player (08,00,20,00,"NASZ_LOWCY_CMENTARZ_03"); 
	TA_Follow_Player (20,00,08,00,"NASZ_LOWCY_CMENTARZ_03");
};
