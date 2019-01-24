INSTANCE NASZ_312_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_SLD;
	id 			= 312;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
		
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItNa_BAN_Crossbow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Bolt,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Normal_Kirgo, BodyTex_B, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_312;
};

FUNC VOID Rtn_Start_312 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NASZ_BANDYCI_OBOZ_13");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_OBOZ_13");
};
