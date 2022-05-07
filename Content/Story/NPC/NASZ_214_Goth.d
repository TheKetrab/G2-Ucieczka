instance NASZ_214_Goth (Npc_Default)
{
	// ------ NSC ------
	name 		= "Goth";
	guild 		= GIL_OUT;
	id 			= 214;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal_Sly, BodyTex_N, ITNA_OUT_L);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_214;
};


FUNC VOID Rtn_PreStart_214 ()
{	
   	TA_Stand_Guarding		(05,00,21,00,"LOCATION_02_03");
   	TA_Stand_Torch			(21,00,05,00,"LOCATION_02_03");
};

FUNC VOID Rtn_Start_214 ()
{	
   	TA_Stand_Guarding		(06,25,21,25,"LOCATION_02_03");
   	TA_Stand_Guarding		(21,25,06,25,"NASZ_MYSLIWI_GORA_19");
};

FUNC VOID Rtn_Wait4Draal_214 ()
{	
   	TA_Stand_Guarding		(06,25,21,25,"LOCATION_02_04");
   	TA_Stand_Guarding		(21,25,06,25,"LOCATION_02_04");
};

FUNC VOID Rtn_Kap4_214 ()
{	
   	TA_Stand_WP		(08,00,20,00,"LOCATION_02_03");
   	TA_Stand_WP		(20,00,08,00,"LOCATION_02_03");
};
