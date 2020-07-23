
instance NASZ_215_Kivo (Npc_Default)
{
	// ------ NPC ------
	name 	= "Kivo";
	guild 	= GIL_OUT;
	id 	= 215;
	voice 	= 7;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_L_Kivo, BodyTex_L, ITNA_OUT_H );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_215;
};

FUNC VOID Rtn_Start_215 ()
{
	TA_Stand_ArmsCrossed 	(20,05,22,15,"NASZ_MYSLIWI_CMENTARZ_03");
	TA_Sit_Bench		(22,15,06,10,"NASZ_MYSLIWI_CMENTARZ_04");
	TA_Stand_Eating		(06,10,07,30,"NASZ_MYSLIWI_CMENTARZ_02");
	TA_Pray_Innos_FP 	(07,30,12,05,"NASZ_MYSLIWI_CMENTARZ_03");
	TA_Sit_Bench		(12,05,18,30,"NASZ_MYSLIWI_CMENTARZ_04");
	TA_Stand_Eating		(18,30,20,05,"NASZ_MYSLIWI_CMENTARZ_02");
};

FUNC VOID Rtn_Bandyci_215 ()
{
	TA_Stand_ArmsCrossed		(20,00,22,00,"NASZ_BANDYCI_OBOZ_22");
	TA_Stand_ArmsCrossed		(22,00,06,00,"NASZ_BANDYCI_OBOZ_22");
};

FUNC VOID Rtn_Follow_215()
{	
	TA_Follow_Player 			(08,00,23,00,"OW_ICEDRAGON_01");
	TA_Follow_Player			(23,00,08,00,"OW_ICEDRAGON_01");
};

FUNC VOID Rtn_Twierdza_215 ()
{
	TA_SmallTalk		(07,00,21,00,"NASZ_TWIERDZA_12");
	TA_SmallTalk		(21,00,07,00,"NASZ_TWIERDZA_12");
};

FUNC VOID Rtn_TwierdzaAfter_215 ()
{
	TA_Stand_ArmsCrossed		(07,00,21,00,"NASZ_TWIERDZA_1");
	TA_Stand_ArmsCrossed		(21,00,07,00,"NASZ_TWIERDZA_1");
};

FUNC VOID Rtn_FollowZamek_215()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_215()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_215()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_215()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};


FUNC VOID Rtn_Kap4_215()
{	
	TA_Stand_Guarding 			(08,00,23,00,"OC_GUARD_PALISADE_05");
	TA_Stand_Guarding			(23,00,08,00,"OC_GUARD_PALISADE_05");
};

FUNC VOID Rtn_FollowRenegaci_215 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_215 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_215 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};

FUNC VOID Rtn_UltraFinal_215 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ULTRAFINAL_10");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ULTRAFINAL_10");
};

FUNC VOID Rtn_Scena5_215 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_215 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};