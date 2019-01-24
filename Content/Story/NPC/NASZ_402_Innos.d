instance NASZ_402_Innos (Npc_Default)
{
	// ------ NSC ------
	name 		= "Innos"; 
	guild 		= GIL_NONE;
	id 			= 402;
	voice 		= 9;	//Joly: hat zu viel mit Diego zu tun, als dass man ihm Diegos Stimme gibt.
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;

	// ------ Aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Sturmbringer); 
	
	
	// ------ Inventory ------

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Lares, BodyTex_N,ITAR_KDF_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	EquipItem			(self, ItRu_Firerain);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_402;
};

FUNC VOID Rtn_Start_402()
{	
	TA_Stand_Guarding   (08,00,20,00,"CASTLE_36");
	TA_Stand_Guarding   (20,00,08,00,"CASTLE_36");
};

FUNC VOID Rtn_Final_402()
{	
	TA_Stand_ArmsCrossed   (08,00,20,00,"M");
	TA_Stand_ArmsCrossed   (20,00,08,00,"M");
};

FUNC VOID Rtn_Ritual_402()
{	
	TA_Circle   (08,00,20,00,"M");
	TA_Circle   (20,00,08,00,"M");
};

FUNC VOID Rtn_Teleported_402()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};
