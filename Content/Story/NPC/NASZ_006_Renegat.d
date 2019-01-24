
instance NASZ_006_Renegat (Npc_Default)
{
	// ------ NSC ------
	name 		= "Renegat";
	guild 		= GIL_NONE;
	id 			= 6;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart05, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6;
};

FUNC VOID Rtn_Start_6 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"OW_PATH_2_04");
	TA_Stand_Guarding	(23,00,08,00,"OW_PATH_2_04");
};

FUNC VOID Rtn_Rabon_6 ()
{	
	TA_Stand_WP	(08,00,23,00,"NASZ_TWIERDZA_1");
	TA_Stand_WP	(23,00,08,00,"NASZ_TWIERDZA_1");
};

