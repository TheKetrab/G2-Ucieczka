
instance NASZ_217_Louis (Npc_Default)
{
	// ------ NPC ------
	name 	= "Louis";
	guild 	= GIL_OUT;
	id 	= 217;
	voice 	= 12;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	CreateInvItems (self, ItNa_Key_Louis, 1);
		
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITNA_OUT_M);		
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_217;
};

FUNC VOID Rtn_Start_217 ()
{
	TA_Sit_Campfire 	(16,40,20,50,"NASZ_MYSLIWI_GORA_17");
	TA_Sleep		 	(20,50,04,35,"NASZ_MYSLIWI_GORA_03");
	TA_Practice_Sword	(04,35,09,50,"NASZ_MYSLIWI_CMENTARZ_05");
	TA_SmallTalk		(09,50,11,30,"LOCATION_02_10");
	TA_Stand_Eating		(11,30,13,55,"NASZ_MYSLIWI_CMENTARZ_05");
	TA_SmallTalk		(13,55,16,40,"LOCATION_02_10");
};

FUNC VOID Rtn_FollowRenegaci_217 ()
{
	TA_Follow_Player	(08,00,23,00,"OW_PATH_263");
	TA_Follow_Player	(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_StandRenegaci_217 ()
{
	TA_Stand_WP		(08,00,23,00,"OW_PATH_263");
	TA_Stand_WP		(23,00,08,00,"OW_PATH_263");		
};

FUNC VOID Rtn_FightRenegaci_217 ()
{
	TA_RunToWP		(08,00,23,00,"NASZ_KOPALNIA_NOWY_02");
	TA_RunToWP		(23,00,08,00,"NASZ_KOPALNIA_NOWY_02");		
};