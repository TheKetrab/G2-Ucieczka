instance NASZ_404_Beliar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Beliar"; 
	guild 		= GIL_NONE;
	id 			= 404;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_BeliarWeapon_2H_20); 
	
	// ------ Inventory ------
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_Xardas);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	EquipItem			(self, ItRu_Skull);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_404;
};

FUNC VOID Rtn_Start_404()
{	
	TA_Read_Bookstand	(08,00,20,00,"DT_E3_07");
	TA_Read_Bookstand	(20,00,08,00,"DT_E3_07");
};

FUNC VOID Rtn_Final_404()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NASZ_DYMOONDO_L");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NASZ_DYMOONDO_L");
};

FUNC VOID Rtn_Ritual_404()
{	
	TA_Circle	(08,00,20,00,"NASZ_DYMOONDO_L");
	TA_Circle	(20,00,08,00,"NASZ_DYMOONDO_L");
};

FUNC VOID Rtn_Teleported_404()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};
