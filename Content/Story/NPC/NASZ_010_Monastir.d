
instance NASZ_010_Monastir (Npc_Default)
{
	// ------ NSC ------
	name 		= "Monastir"; 
	guild 		= GIL_KDW;
	id 			= 10;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Runenschwert);
	EquipItem			(self, ItRw_Bow_H_02);
	CreateInvItems			(self, ItRw_Arrow, 17);
	EquipItem			(self, ItRu_Sleep);
	EquipItem			(self, ItRu_PalRepelEvil);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Monastir, BodyTex_N, ITAR_KDF_H);		
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_10;
};

FUNC VOID Rtn_Start_10 ()
{
	TA_Practice_Magic		(06,30,12,20,"NASZ_LOWCY_DOM_04");
	TA_Sleep		(23,30,06,30,"NASZ_LOWCY_DOM_04");

};

FUNC VOID Rtn_Gate_10()
{
	TA_Stand_ArmsCrossed	 (00,00,12,00,"NASZ_DYMOONDO_G");
	TA_Stand_ArmsCrossed	 (12,00,00,00,"NASZ_DYMOONDO_G");
};

FUNC VOID Rtn_OpeningGate_10()
{
	TA_Circle	 (00,00,12,00,"NASZ_DYMOONDO_G");
	TA_Circle	 (12,00,00,00,"NASZ_DYMOONDO_G");
};

FUNC VOID Rtn_GoToFinal_10()
{
	TA_Guide_Player	 (00,00,12,00,"NASZ_MONASTIR_FINAL");
	TA_Guide_Player	 (12,00,00,00,"NASZ_MONASTIR_FINAL");
};

FUNC VOID Rtn_Final_10()
{
	TA_Stand_ArmsCrossed	 (00,00,12,00,"NASZ_MONASTIR_FINAL");
	TA_Stand_ArmsCrossed	 (12,00,00,00,"NASZ_MONASTIR_FINAL");
};


FUNC VOID Rtn_Kap5GoTo_10()
{
	TA_Follow_Player	 (00,00,12,00,"NASZ_MONASTIR_FINAL");
	TA_Follow_Player	 (12,00,00,00,"NASZ_MONASTIR_FINAL");
};

FUNC VOID Rtn_FollowInZamek_10()
{	
	TA_Follow_Player 			(08,00,23,00,"OC_CENTER_04");
	TA_Follow_Player			(23,00,08,00,"OC_CENTER_04");
};

FUNC VOID Rtn_InCastle_10()
{	
	TA_Stand_ArmsCrossed 			(08,00,23,00,"OC_CENTER_04");
	TA_Stand_ArmsCrossed			(23,00,08,00,"OC_CENTER_04");
};

FUNC VOID Rtn_UltraFinal_10 ()
{	
	TA_Smalltalk		(08,00,22,00,"NASZ_ULTRAFINAL_01");
	TA_Smalltalk 	(22,00,08,00,"NASZ_ULTRAFINAL_01");
};

FUNC VOID Rtn_Scena2_10 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_01");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_01");
};

FUNC VOID Rtn_Scena2Goal_10 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};


FUNC VOID Rtn_Scena5_10 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_10 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 	(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};


