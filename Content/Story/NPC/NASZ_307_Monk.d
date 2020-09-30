
instance NASZ_307_Monk (Npc_Default)
{
	// ------ NSC ------
	name 		= "Monk"; 
	guild 		= GIL_SLD;
	id 			= 307;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;

	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItNa_Ban_Weapon_H); 
	EquipItem	(self, ItNa_BAN_Crossbow); 	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Bolt,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Monk, BodyTex_P, ITNA_BAN_H);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_307;
};

FUNC VOID Rtn_Start_307()
{	
	TA_Stand_Guarding	(08,00,23,00,"OW_PATH_033_TO_CAVE");
    TA_Stand_Guarding	(23,00,08,00,"OW_PATH_033_TO_CAVE");
};

FUNC VOID Rtn_Prowadzenie_307()
{	
	TA_Guide_Player 	(08,00,23,00,"OW_PATH_038");
   TA_Guide_Player 	(23,00,08,00,"OW_PATH_038");
};

FUNC VOID Rtn_Atak_307()
{	
	TA_Guide_Player 	(08,00,23,00,"NASZ_BANDYCI_LOWCY_03");
    TA_Guide_Player 	(23,00,08,00,"NASZ_BANDYCI_LOWCY_03");
};

FUNC VOID Rtn_Artefakt_307()
{	
	TA_Stand_ArmsCrossed 	(08,00,23,00,"NASZ_BANDYCI_POZA_5");
    TA_Stand_ArmsCrossed	(23,00,08,00,"NASZ_BANDYCI_POZA_5");
};

FUNC VOID Rtn_Straz_307()
{	
	TA_Stand_Guarding 	(08,00,23,00,"NASZ_BANDYCI_OBOZ_09");
    TA_Stand_Guarding	(23,00,08,00,"NASZ_BANDYCI_OBOZ_09");
};

FUNC VOID Rtn_Koniec_307 ()
{	
	TA_RunToWP			(08,00,23,00,"NASZ_BANDYCI_RYBY_I");
    TA_RunToWP			(23,00,08,00,"NASZ_BANDYCI_RYBY_I");
};

FUNC VOID Rtn_Koniec2_307 () // FIX Ucieczka 1.1 - nie jest liczony do bandit coutner, wiec do TOT
{	
	TA_RunToWP			(08,00,23,00,"TOT");
    TA_RunToWP			(23,00,08,00,"TOT");
};
