
instance NASZ_216_Aran (Npc_Default)
{
	// ------ NPC ------
	name 	= "Aran";
	guild 	= GIL_OUT;
	id 	= 216;
	voice 	= 10;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Thief", Face_N_Raven, BodyTex_N, ITNA_OUT_H );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_216;
};

FUNC VOID Rtn_Start_216 ()
{
	TA_Stand_Eating		 (08,10,11,05,"LOCATION_01_06");
	TA_Stand_ArmsCrossed (11,05,15,50,"LOCATION_01_07");
	TA_Practice_Sword	 (15,50,21,20,"LOCATION_01_06");
	TA_Sleep		 	 (21,20,08,10,"LOCATION_01_07");
};

FUNC VOID Rtn_Twierdza_216 ()
{
	TA_Sit_Bench		(07,00,21,00,"NASZ_TWIERDZA_16");
	TA_Sit_Bench		(21,00,07,00,"NASZ_TWIERDZA_16");
};

FUNC VOID Rtn_TwierdzaAtak_216 ()
{
	TA_Sit_Campfire		(07,00,21,00,"NASZ_TWIERDZA_34");
	TA_Sit_Campfire		(21,00,07,00,"NASZ_TWIERDZA_34");
};

FUNC VOID Rtn_Kap4_216 ()
{
	TA_Stand_Guarding		(07,00,21,00,"NASZ_MYSLIWI_GATE_1");
	TA_Stand_Guarding		(21,00,07,00,"NASZ_MYSLIWI_GATE_1");
};


FUNC VOID Rtn_Scena5_216 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_ORCCITY_MAIN_16");
	TA_Stand_WP 	(22,00,08,00,"NASZ_ORCCITY_MAIN_16");
};

FUNC VOID Rtn_Scena5Goal_216 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_ORCCITY_PORTAL_05");
	TA_RunToWP 		(22,00,08,00,"NASZ_ORCCITY_PORTAL_05");
};
