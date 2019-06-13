
instance NASZ_314_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";	
	guild 		= GIL_SLD;
	id 			= 314;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItNa_Ban_Weapon_M);
	EquipItem (self, ItNa_Shield_Skora);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_314;
};

FUNC VOID Rtn_Start_314 ()
{	
	TA_Sit_Chair	(07,50,21,10,"NASZ_BANDYCI_OBOZ_23");
	TA_Sleep		(21,10,07,50,"NASZ_BANDYCI_OBOZ_23");

};
