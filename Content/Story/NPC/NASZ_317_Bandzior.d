instance NASZ_317_Bandzior (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandzior";
	guild 		= GIL_SLD;
	id 			= 317;
	voice 		= 4;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
		
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bloodwyn, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_317;
};

FUNC VOID Rtn_Start_317 ()
{
    TA_Stand_Guarding 	  (08,00,16,00,"NASZ_BANDYCI_WODOSPAD_02");
    TA_Stand_Guarding 	  (16,00,08,00,"NASZ_BANDYCI_WODOSPAD_02");  
};

FUNC VOID Rtn_Koniec_317 ()
{
    TA_SmallTalk 	  (08,00,16,00,"NASZ_BANDYCI_RYBY_E");
    TA_SmallTalk 	  (16,00,08,00,"NASZ_BANDYCI_RYBY_E");  
};