
instance NASZ_319_Niewolnik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Niewolnik"; 
	guild 		= GIL_SLD;
	id 			= 319;
	voice 		= 11;
	flags       = 2;						
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_IGNORE_Sheepkiller]	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	 
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Erpresser, BodyTex_N, ITAR_Prisoner);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_319;
};

FUNC VOID Rtn_Start_319 ()
{
	TA_Pick_Ore		(08,00,22,00,"NASZ_NUGGETMOB_17");
   TA_Pick_Ore		(22,00,08,00,"NASZ_NUGGETMOB_17");
};

FUNC VOID Rtn_After_319 ()
{
	TA_Sit_Campfire		(08,00,22,00,"NASZ_BANDYCI_OBOZ_08");
   TA_Sit_Campfire		(22,00,08,00,"NASZ_BANDYCI_OBOZ_08");
};

FUNC VOID Rtn_Twierdza_319 ()
{
	TA_Chest		(08,00,22,00,"NASZ_TWIERDZA_18");
   TA_Chest		(22,00,08,00,"NASZ_TWIERDZA_18");
};

FUNC VOID Rtn_TwierdzaAtak_319 ()
{
	TA_Stand_ArmsCrossed		(08,00,22,00,"NASZ_TWIERDZA_36");
   TA_Stand_ArmsCrossed		(22,00,08,00,"NASZ_TWIERDZA_36");
};

FUNC VOID Rtn_Kap4_319 ()
{
	TA_Sleep		(08,00,22,00,"NASZ_LOWCY_DOL_05");
   TA_Sleep		(22,00,08,00,"NASZ_LOWCY_DOL_05");
};