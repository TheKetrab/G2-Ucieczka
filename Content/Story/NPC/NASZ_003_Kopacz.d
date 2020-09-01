
instance NASZ_003_Kopacz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kopacz";
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 3;
	voice 		= 6;
	flags       = 2;							
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	EquipItem (self, ItMw_2H_Axe_L_01);
	
	// ------ Inventory ------

	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_P_OldMan_Gravo, BodyTex_P,  ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_3;
};

FUNC VOID Rtn_Start_3 ()
{	
	TA_Sit_Throne	 (08,00,23,00,"NASZ_ZAMEK_OBOZ_01");
	TA_Sit_Throne	 (23,00,08,00,"NASZ_ZAMEK_OBOZ_01");
};

FUNC VOID Rtn_Twierdza_3 ()
{	
	TA_Sit_Bench	 (08,00,23,00,"NASZ_TWIERDZA_52");
	TA_Sit_Bench	 (23,00,08,00,"NASZ_TWIERDZA_52");
};

FUNC VOID Rtn_Kap4_3 ()
{	
	TA_Sit_Campfire (20,00,08,00,"NASZ_LOWCY_DOL_12");
	TA_Sit_Campfire (08,00,20,00,"NASZ_LOWCY_DOL_12");
};

