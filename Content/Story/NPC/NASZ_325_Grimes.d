
instance NASZ_325_Grimes (Npc_Default)
{
	// ------ NSC ------
	name 		= "Grimes";
	guild 		= GIL_SLD;
	id 			= 325;
	voice 		= 5;
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
	B_CreateAmbientInv 	(self);
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_ImportantGrey, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_325;
};

FUNC VOID Rtn_Start_325 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"NASZ_BANDYCI_WODOSPAD_04");
    TA_Pick_Ore	 (23,00,08,00,"NASZ_BANDYCI_WODOSPAD_04");
 
};

FUNC VOID Rtn_Follow1_325 ()
{
	TA_Follow_Player					(08,00,23,00,"NASZ_BANDYCI_WODOSPAD_07");
    TA_Follow_Player					(23,00,08,00,"NASZ_BANDYCI_WODOSPAD_07");		
};

FUNC VOID Rtn_Follow2_325 ()
{
	TA_Follow_Player					(08,00,23,00,"NASZ_BANDYCI_OBOZ_09");
    TA_Follow_Player					(23,00,08,00,"NASZ_BANDYCI_OBOZ_09");		
};

FUNC VOID Rtn_Pick_325 ()
{	
	TA_Pick_Ore	 (08,00,23,00,"NASZ_BANDYCI_GROTA_01");
    TA_Pick_Ore	 (23,00,08,00,"NASZ_BANDYCI_GROTA_01");
 
};

FUNC VOID Rtn_After_325 ()
{	
	TA_Sit_Campfire	 (08,00,23,00,"NASZ_BANDYCI_OBOZ_21");
    TA_Sit_Campfire	 (23,00,08,00,"NASZ_BANDYCI_OBOZ_21");
 
};

FUNC VOID Rtn_Twierdza_325 ()
{	
	TA_Saw	 (08,00,23,00,"NASZ_TWIERDZA_15");
    TA_Saw	 (23,00,08,00,"NASZ_TWIERDZA_15");
 
};

FUNC VOID Rtn_TwierdzaAtak_325 ()
{	
	TA_Stand_ArmsCrossed	 (08,00,23,00,"NASZ_TWIERDZA_38");
    TA_Stand_ArmsCrossed	 (23,00,08,00,"NASZ_TWIERDZA_38");
 
};

FUNC VOID Rtn_Kap4_325 ()
{	
	TA_Saw	 (08,00,23,00,"NASZ_LOWCY_DOL_14");
    TA_Sit_Campfire	 (23,00,08,00,"NASZ_LOWCY_DOL_11");
 
};

