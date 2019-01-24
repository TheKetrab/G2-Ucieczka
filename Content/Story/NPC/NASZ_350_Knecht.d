instance NASZ_350_Knecht (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_NONE;
	id 			= 350;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 30;
	slf.attribute[ATR_DEXTERITY] 		= 10;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 1;
	slf.attribute[ATR_HITPOINTS] 		= 1;															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------
	EquipItem (self, ItMw_1h_MISC_Sword);

	// ------ Inventory ------
	B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough02, BodyTex_L, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_350;
};

FUNC VOID Rtn_Start_350 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NASZ_ARTEFAKT_MOC_1");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_ARTEFAKT_MOC_1");
};
