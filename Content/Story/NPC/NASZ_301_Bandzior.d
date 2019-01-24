INSTANCE NASZ_301_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_BDT;
	id 			= 301;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItNa_Ban_Weapon_M);
	EquipItem			(self, ItNa_MalaPawez);
		
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems 	(self, ItNa_Key_Bandzior, 1 );	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_301;
};

FUNC VOID Rtn_Start_301 ()
{	
	TA_Stand_ArmsCrossed				(08,00,23,00,"OW_MINE3_LEICHE_05");
    TA_Stand_ArmsCrossed				(23,00,08,00,"OW_MINE3_LEICHE_05");
};
