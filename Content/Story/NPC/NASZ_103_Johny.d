
instance NASZ_103_Johny (Npc_Default)
{
	// ------ NPC ------
	name 	= "Johny";
	guild 	= GIL_DJG;
	id 	= 103;
	voice 	= 8;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_L);
	EquipItem	(self, ItNa_DrewnianaTarcza1);

	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Orik, BodyTex_B, ITNA_DJG_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_103;
};

FUNC VOID Rtn_Start_103 ()
{
	TA_Sit_Campfire	(19,30,00,40,"NASZ_LOWCY_DOL_11");
	TA_Sleep		(00,40,07,30,"NASZ_LOWCY_GORA_19");	
	TA_Sit_Bench	(07,30,19,30,"NASZ_LOWCY_KUZNIA_01");
};

FUNC VOID Rtn_Twierdza_103 ()
{	
	TA_SmallTalk	(06,40,21,10,"NASZ_TWIERDZA_23");
	TA_Sleep		(21,10,06,40,"NASZ_TWIERDZA_48");
};

FUNC VOID Rtn_TwierdzaAtak_103 ()
{
	TA_Chest	(06,00,06,30,"NASZ_TWIERDZA_11");
	TA_Chest	(06,30,07,00,"NASZ_TWIERDZA_13");
	TA_Chest	(07,00,07,30,"NASZ_TWIERDZA_34");
	TA_Chest	(07,30,08,00,"NASZ_TWIERDZA_35");
	TA_Chest	(08,00,08,30,"NASZ_TWIERDZA_11");
	TA_Chest	(08,30,09,00,"NASZ_TWIERDZA_13");
	TA_Chest	(09,00,09,30,"NASZ_TWIERDZA_34");
	TA_Chest	(09,30,10,00,"NASZ_TWIERDZA_35");
	TA_Chest	(10,00,10,30,"NASZ_TWIERDZA_11");
	TA_Chest	(10,30,11,00,"NASZ_TWIERDZA_13");
	TA_Chest	(11,00,11,30,"NASZ_TWIERDZA_34");
	TA_Chest	(11,30,12,00,"NASZ_TWIERDZA_35");
	TA_Chest	(12,00,12,30,"NASZ_TWIERDZA_11");
	TA_Chest	(12,30,13,00,"NASZ_TWIERDZA_13");
	TA_Chest	(13,00,13,30,"NASZ_TWIERDZA_34");
	TA_Chest	(13,30,14,00,"NASZ_TWIERDZA_35");
	TA_Chest	(14,00,14,30,"NASZ_TWIERDZA_11");
	TA_Chest	(14,30,15,00,"NASZ_TWIERDZA_13");
	TA_Chest	(15,00,15,30,"NASZ_TWIERDZA_34");
	TA_Chest	(15,30,16,00,"NASZ_TWIERDZA_35");
	TA_Chest	(16,00,16,30,"NASZ_TWIERDZA_11");
	TA_Chest	(16,30,17,00,"NASZ_TWIERDZA_13");
	TA_Chest	(17,00,17,30,"NASZ_TWIERDZA_34");
	TA_Chest	(17,30,18,00,"NASZ_TWIERDZA_35");
	TA_Chest	(18,00,18,30,"NASZ_TWIERDZA_11");
	TA_Chest	(18,30,19,00,"NASZ_TWIERDZA_13");
	TA_Chest	(19,00,19,30,"NASZ_TWIERDZA_34");
	TA_Chest	(19,30,20,00,"NASZ_TWIERDZA_35");
	TA_Chest	(20,00,20,30,"NASZ_TWIERDZA_11");
	TA_Chest	(20,30,21,00,"NASZ_TWIERDZA_13");
	TA_Chest	(21,00,21,30,"NASZ_TWIERDZA_34");
	TA_Chest	(21,30,22,00,"NASZ_TWIERDZA_35");
	
	TA_Stand_Guarding	(22,00,06,00,"NASZ_TWIERDZA_10");

};

FUNC VOID Rtn_Spotkanie_103 ()
{
	TA_SmallTalk	(20,00,05,30,"OW_DJG_SWAMPCAMP_02");
	TA_Sit_Bench	(05,30,20,00,"NASZ_LOWCY_KUZNIA_01");
};

FUNC VOID Rtn_InCastle_103 ()
{
	TA_Stand_WP		(20,00,05,30,"OC_GUARD_STORE_01");
	TA_Stand_WP		(05,30,20,00,"OC_GUARD_STORE_01");
};

FUNC VOID Rtn_Scena5_103 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_103 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};
