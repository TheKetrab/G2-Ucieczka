instance NASZ_309_Straznik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik";
	guild 		= GIL_SLD;
	id 			= 309;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCMAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	
	EquipItem			(self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart12, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_309;
};

FUNC VOID Rtn_Start_309 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NASZ_BANDYCI_GROTA_04");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_GROTA_04");
};

FUNC VOID Rtn_Artefakt_309 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"NASZ_BANDYCI_POZA_9");
    TA_Stand_Guarding		(23,00,08,00,"NASZ_BANDYCI_POZA_9");
};
