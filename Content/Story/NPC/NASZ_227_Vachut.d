
instance NASZ_227_Vachut (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vachut"; 
	guild 		= GIL_OUT;
	id 			= 227;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_AMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER2;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kharim, BodyTex_B, ITNA_OUT_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_227;
};

FUNC VOID Rtn_Start_227 ()
{
	TA_Sit_Campfire	(08,00,23,00,"SPAWN_TALL_PATH_BANDITOS2_03");
    TA_Sit_Campfire	(23,00,08,00,"SPAWN_TALL_PATH_BANDITOS2_03");
};

FUNC VOID Rtn_Guide_227 ()
{
	TA_Guide_Player		(07,00,21,00,"SPAWN_PATH_GUARD1");
	TA_Guide_Player		(21,00,07,00,"SPAWN_PATH_GUARD1");
};

FUNC VOID Rtn_Topielce_227 ()
{
	TA_Guide_Player		(07,00,21,00,"NASZ_BANDYCI_WODOSPAD_04");
	TA_Guide_Player		(21,00,07,00,"NASZ_BANDYCI_WODOSPAD_04");
};

FUNC VOID Rtn_Twierdza_227 ()
{
	TA_Stand_WP		(07,00,21,00,"NASZ_TWIERDZA_8");
	TA_Stand_WP		(21,00,07,00,"NASZ_TWIERDZA_8");
};

FUNC VOID Rtn_FollowZamek_227()
{	
	TA_RunToWp 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWp			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_227()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_227()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_227()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_Kap4_227()
{	
	TA_Roast_Scavenger 			(08,00,23,00,"OC_CAMPFIRE_BARBQ");
	TA_Roast_Scavenger			(23,00,08,00,"OC_CAMPFIRE_BARBQ");
};


FUNC VOID Rtn_Odpoczynek_227 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};

FUNC VOID Rtn_FollowRenegaci_227 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_227 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_227 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};