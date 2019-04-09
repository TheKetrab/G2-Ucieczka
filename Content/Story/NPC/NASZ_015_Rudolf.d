

instance NASZ_015_Rudolf (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rudolf";
	guild 		= GIL_OUT;
	id 			= 15;
	voice 		= 5;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	attribute[ATR_STRENGTH] = 100;
	aivar[REAL_STRENGTH] = 100;
		
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Pal_Sword);
	EquipItem			(self, ItNa_Shield_Paladin);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Senyan, BodyTex_N, ITAR_PAL_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_15;
};

FUNC VOID Rtn_PreStart_15 ()
{	
	TA_Sit_Campfire		(07,30,23,00,"NASZ_ZAPALISADA_LAS_17");	
   	TA_Sit_Campfire		(23,00,07,30,"NASZ_ZAPALISADA_LAS_17");
};

FUNC VOID Rtn_Start_15 ()
{	
	TA_SmallTalk			(14,30,18,10,"NASZ_ZAPALISADA_LAS_45");	
   	TA_Sit_Campfire			(18,10,04,30,"NASZ_ZAPALISADA_LAS_17");
	TA_Stand_Guarding		(04,30,08,20,"NASZ_ZAPALISADA_LAS_16");
	TA_Practice_Sword		(08,20,11,45,"NASZ_ZAPALISADA_LAS_46");
	TA_Stand_Guarding		(11,45,14,30,"NASZ_ZAPALISADA_LAS_16");
};

FUNC VOID Rtn_UltraFinal_15 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_06");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_06");
};


FUNC VOID Rtn_Scena2_15 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_03");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_03");
};

FUNC VOID Rtn_Scena2Goal_15 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_15 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_15 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};