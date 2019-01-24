
INSTANCE NASZ_106_Jan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jan"; 
	guild 		= GIL_DJG;
	id 			= 106;
	voice 		= 10;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItNa_Djg_Weapon_M);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Richter, BodyTex_N, ITNA_DJG_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_106;
};

FUNC VOID Rtn_Start_106 ()
{
	TA_Smith_Fire		(08,00,08,30,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(08,30,09,00,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(09,00,09,30,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(09,30,10,00,"NASZ_LOWCY_KUZNIA_OGIEN");
 	TA_Smith_Anvil		(10,00,10,30,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(10,30,11,00,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(11,00,11,30,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(11,30,12,00,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(12,00,12,30,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(12,30,13,00,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(13,00,13,30,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(13,30,14,00,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(14,00,14,30,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(14,30,15,00,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(15,00,15,30,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(15,30,16,00,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(16,00,16,30,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(16,30,17,00,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(17,00,17,30,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(17,30,18,00,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(18,00,18,30,"NASZ_LOWCY_KUZNIA_WIADRO");
	TA_Smith_Fire		(18,30,19,00,"NASZ_LOWCY_KUZNIA_OGIEN");
	TA_Smith_Anvil		(19,00,19,30,"NASZ_LOWCY_KUZNIA_KOWADLO");
	TA_Smith_Cool		(19,30,20,00,"NASZ_LOWCY_KUZNIA_WIADRO");

	TA_Roast_Scavenger		(20,00,03,20,"PATH_OC_NC_13");
	TA_Sleep		(03,20,08,00,"NASZ_LOWCY_DOM_04");
};

FUNC VOID Rtn_UltraFinal_106 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_04");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_04");
};


FUNC VOID Rtn_Scena2_106 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_05");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_05");
};

FUNC VOID Rtn_Scena2Goal_106 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};

FUNC VOID Rtn_Scena5_106 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_106 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};