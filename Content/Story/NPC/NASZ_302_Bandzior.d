INSTANCE NASZ_302_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_BDT;
	id 			= 302;
	voice 		= 11;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Okyl, BodyTex_N, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_302;
};

FUNC VOID Rtn_Start_302 ()
{	
	TA_Stand_ArmsCrossed				(08,00,23,00,"OW_MINE3_OUT");
    	TA_Stand_ArmsCrossed				(23,00,08,00,"OW_MINE3_OUT");
};
