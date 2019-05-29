
instance NASZ_201_Erak (Npc_Default)
{
	// ------ NPC ------
	name 	= "Erak";
	guild 	= GIL_OUT;
	id 	= 201;
	voice 	= 5;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	attribute[ATR_STRENGTH] = 90;
	aivar[REAL_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	aivar[REAL_DEXTERITY] = 90;
	
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_S);
	EquipItem	(self, ItRw_Bow_H_03); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L, ITAR_DJG_Crawler );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_201;
};

FUNC VOID Rtn_Start_201 ()
{
	TA_Stand_ArmsCrossed 	(07,40,10,10,"NASZ_MYSLIWI_GRUPA_05");
	TA_Sit_Chair		(10,10,13,05,"NASZ_MYSLIWI_GRUPA_01");
	TA_Stand_Eating		(13,05,15,45,"NASZ_MYSLIWI_GRUPA_05");
	TA_Sit_Chair		(15,45,17,10,"NASZ_MYSLIWI_GRUPA_01");
	TA_Stand_ArmsCrossed 	(17,10,19,50,"NASZ_MYSLIWI_GRUPA_05");
	TA_Sit_Chair		(19,50,01,20,"NASZ_MYSLIWI_GRUPA_01");
	TA_Sleep	 	(01,20,07,40,"NASZ_MYSLIWI_GRUPA_08");
};

FUNC VOID Rtn_Guide_201 ()
{
	TA_Guide_Player		(07,00,21,00,"OW_WATERFALL_GOBBO10");
	TA_Guide_Player		(21,00,07,00,"OW_WATERFALL_GOBBO10");
};

FUNC VOID Rtn_GuideSneak_201 ()
{
	TA_Go_Sneak_Erak		(07,00,21,00,"LOCATION_29_04");
	TA_Go_Sneak_Erak	(21,00,07,00,"LOCATION_29_04");
};


FUNC VOID Rtn_Bandyci_201 ()
{
	TA_Stand_Guarding	(07,00,21,00,"OW_PATH_033_TO_CAVE3");
	TA_Stand_Guarding 	(21,00,07,00,"OW_PATH_033_TO_CAVE3");
};

FUNC VOID Rtn_Follow_201()
{	
	TA_Follow_Player 			(08,00,23,00,"OW_ICEDRAGON_01");
	TA_Follow_Player			(23,00,08,00,"OW_ICEDRAGON_01");
};

FUNC VOID Rtn_Twierdza_201()
{	
	TA_Stand_Guarding 			(08,00,23,00,"OW_PATH_186");
	TA_Stand_Guarding			(23,00,08,00,"OW_PATH_186");
};

FUNC VOID Rtn_TwierdzaAtak_201()
{	
	TA_Stand_Guarding 			(08,00,23,00,"OW_PATH_187");
	TA_Stand_Guarding			(23,00,08,00,"OW_PATH_187");
};

FUNC VOID Rtn_FollowZamek_201()
{	
	TA_RunToWp 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWp			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_Kap4_201()
{	
	TA_Stand_Eating		(07,05,10,20,"LOCATION_02_07");
	TA_Stand_ArmsCrossed 	(10,20,18,10,"NASZ_MYSLIWI_DOL_09");
	TA_Sit_Bench	 	(18,10,07,05,"LOCATION_02_07");
};

FUNC VOID Rtn_UltraFinal_201 ()
{	
	TA_Smalltalk		(08,00,22,00,"NASZ_ULTRAFINAL_09");
	TA_Smalltalk 	(22,00,08,00,"NASZ_ULTRAFINAL_09");
};

FUNC VOID Rtn_SmazenieMiesa_201 ()
{	
	TA_Cook_Pan		(08,00,22,00,"NASZ_BANDYCI_OBOZ_02");
	TA_Cook_Pan 	(22,00,08,00,"NASZ_BANDYCI_OBOZ_02");
};

