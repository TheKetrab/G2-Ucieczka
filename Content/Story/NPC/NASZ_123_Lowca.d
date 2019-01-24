
instance NASZ_123_Lowca (Npc_Default)
{
	// ------ NSC ------
	name 		= "£owca orków";
	guild 		= GIL_DJG;
	id 			= 123;
	voice 		= 10;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 3);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 13);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Raven, BodyTex_N, ITNA_DJG_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_123;
};

FUNC VOID Rtn_Start_123 ()
{
    TA_Practice_Sword (08,45,20,30,"NASZ_LOWCY_TRENING_02"); 
    TA_Sit_Campfire (20,30,08,45,"NASZ_LOWCY_DOL_12");		
};


FUNC VOID Rtn_Thief_123 ()
{
    TA_Practice_Sword  (02,00,23,30,"NASZ_LOWCY_TRENING_02"); 
    TA_Steal_Sneak  (23,30,02,00,"NASZ_LOWCY_TRENING_15");		
};

FUNC VOID Rtn_Banicja_123 ()
{
    TA_Sit_Campfire  (02,00,23,30,"OW_SPAWN_TRACK_LEICHE_01"); 
    TA_Sit_Campfire  (23,30,02,00,"OW_SPAWN_TRACK_LEICHE_01");		
};

FUNC VOID Rtn_Twierdza_123 ()
{
    TA_Sit_Campfire  (02,00,23,30,"NASZ_TWIERDZA_25"); 
    TA_Sit_Campfire  (23,30,02,00,"NASZ_TWIERDZA_25");		
};

FUNC VOID Rtn_TwierdzaAtak_123 ()
{
    TA_Stand_WP  (02,00,23,30,"NASZ_TWIERDZA_OUT"); 
    TA_Stand_WP  (23,30,02,00,"NASZ_TWIERDZA_OUT");		
};
