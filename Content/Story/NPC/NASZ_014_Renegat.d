INSTANCE NASZ_014_Renegat (Npc_Default)
{
	// ------ NSC ------
	name 		= "Renegat";
	guild 		= GIL_NONE;
	id 			= 14;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_SLD_Sword);
	EquipItem 	(self,itRw_Mil_Crossbow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Bolt,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Tough_Lee_ähnlich, BodyTex_N, ITAR_PAL_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_14;
};

FUNC VOID Rtn_Start_14 ()
{	
	TA_Stand_Guarding 		(06,40,00,20,"OW_PATH_264"); 
    TA_Sleep				(00,20,06,40,"NASZ_KOPALNIA_NOWY_11");
};

FUNC VOID Rtn_Follow_14 ()
{	
	TA_Follow_Player 		(06,40,00,20,"OW_PATH_264"); 
    TA_Follow_Player				(00,20,06,40,"NASZ_KOPALNIA_NOWY_11");
};
