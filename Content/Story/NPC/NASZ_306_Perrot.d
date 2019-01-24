
instance NASZ_306_Perrot (Npc_Default)
{
	// ------ NSC ------
	name 		= "Perrot";
	guild 		= GIL_SLD;
	id 			= 306;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
																	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItNa_Ban_Weapon_M);
	EquipItem			(self, ItNa_Shield_Skora);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_306;
};

FUNC VOID Rtn_Start_306 ()
{	
	TA_Stand_Eating		(08,00,23,00,"NASZ_BANDYCI_OBOZ_14");
    TA_Stand_Eating		(23,00,08,00,"NASZ_BANDYCI_OBOZ_14");
};


FUNC VOID Rtn_Owca_306 ()
{	
	TA_Potion_Alchemy	(08,00,23,00,"OW_PATH_07_15_CAVE3");
	TA_Potion_Alchemy	(23,00,08,00,"OW_PATH_07_15_CAVE3");
};

FUNC VOID Rtn_Koniec_306 ()
{	
	TA_Sit_Bench	(08,00,23,00,"NASZ_BANDYCI_RYBY_I");
	TA_Sit_Bench	(23,00,08,00,"NASZ_BANDYCI_RYBY_I");
};