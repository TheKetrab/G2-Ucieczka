
instance NASZ_414_Zombie (Npc_Default)
{
	// ------ NSC ------
	name 		= "Zombie";	
	guild 		= GIL_NONE;
	id 			= 414;
	voice 		= 30;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
	slf.attribute[ATR_HITPOINTS_MAX] = 2000;
	slf.attribute[ATR_HITPOINTS] = 2000;

	level		= 100;

	EquipItem	(self, ItMw_1h_MISC_Sword); 


	protection	[PROT_BLUNT]		=	9999;
	protection	[PROT_EDGE]			=	9999;
	protection	[PROT_FIRE]			=	9999;	//immun
		
	// ------ Kampf-Taktik ------
	fight_tactic					= FAI_ZOMBIE;
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
		
	// ------ visuals ------																			
	//Mdl_SetVisual		(self, "Zombie.mds");
	//Mdl_SetVisualBody	(self, "Zom_Body", 0, 0, "Hum_Head_Pony", Face_N_ZombieMud, 0, NO_ARMOR);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_N_ZombieMud, BodyTex_P, ITAR_MayaZombie_Addon);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_414;
};

FUNC VOID Rtn_Start_414 ()
{	
	TA_Read_Bookstand		(08,00,23,00,"NASZ_BANDYCI_SECRET_3");
    TA_Read_Bookstand		(23,00,08,00,"NASZ_BANDYCI_SECRET_3");
};
