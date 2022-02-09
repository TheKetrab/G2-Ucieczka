INSTANCE NASZ_311_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_SLD;
	id 			= 311;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_PSIONIC",Face_P_NormalBart01 , BodyTex_P, ITNA_BAN_M);		
	Mdl_SetModelFatness	(self, -2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_311;
};

FUNC VOID Rtn_Start_311 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NASZ_BANDYCI_OBOZ_11");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_OBOZ_11");
};
