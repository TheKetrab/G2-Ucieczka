
instance NASZ_119_Udar  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Udar";
	guild 		= GIL_DJG;
	id 			= 119;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	//damit er nicht runterspringt
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItNa_Djg_Weapon_H);
	EquipItem	(self, ItNa_DJG_CrossbowH);
	Createinvitems (self, ItRw_Bolt, 28);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Stone, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_119;
};

FUNC VOID Rtn_Start_119 ()
{	
	TA_Stand_Guarding		(07,20,23,10,"OW_WOODRUIN_WOLF_SPAWN");
	TA_Smoke_Waterpipe		(23,10,02,45,"NASZ_LOWCY_KARCZMA_22");
	TA_Sleep				(02,45,07,20,"NASZ_LOWCY_DOM_02");
	
};

// TODO Udar nie zmienia rutyny, czemu?

FUNC VOID Rtn_Kap4_119 ()
{
	TA_Stand_Guarding		(08,00,20,00,"NASZ_LOWCY_DOM_03");
	TA_Stand_Guarding		(20,00,08,00,"NASZ_LOWCY_DOM_03");

};

FUNC VOID Rtn_UdarBoss_119 ()
{
	TA_Stand_Guarding		(07,20,12,50,"NASZ_LOWCY_DOM_03");
	TA_Sit_Chair			(12,50,17,20,"NASZ_LOWCY_DOM_05");
	TA_Stand_Eating			(17,20,19,30,"NASZ_LOWCY_DOM_05");
	TA_Sit_Chair			(19,30,07,20,"NASZ_LOWCY_DOM_05");

};

FUNC VOID Rtn_UltraFinal_119 ()
{	
	TA_Smalltalk		(08,00,22,00,"NASZ_ULTRAFINAL_08");
	TA_Smalltalk 	(22,00,08,00,"NASZ_ULTRAFINAL_08");
};


FUNC VOID Rtn_Scena2_119 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_08");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_08");
};

FUNC VOID Rtn_Scena2Goal_119 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_119 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_119 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};