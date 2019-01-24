
instance NASZ_308_Frut (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frut";
	guild 		= GIL_SLD;
	id 			= 308;
	voice 		= 13;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);			
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			
	EquipItem	(self, ItNa_Ban_Weapon_H); 
	EquipItem	(self, ItNa_BAN_Crossbow); 

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Bolt,25);
	
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITNA_BAN_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_308;
};

FUNC VOID Rtn_Start_308 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NASZ_BANDYCI_OBOZ_09");
    TA_Stand_Guarding			(23,00,08,00,"NASZ_BANDYCI_OBOZ_09");
 
};

FUNC VOID Rtn_Artefakt_308 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NASZ_BANDYCI_POZA_3");
    TA_Stand_Guarding			(23,00,08,00,"NASZ_BANDYCI_POZA_3");
 
};


FUNC VOID Rtn_Brama_308 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_PATH_033_TO_CAVE");
    TA_Stand_Guarding			(23,00,08,00,"OW_PATH_033_TO_CAVE");
 
};
