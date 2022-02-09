
instance NASZ_130_Jenkins (Npc_Default)
{
	// ------ NPC ------
	name 	= "Jenkins";
	guild 	= GIL_DJG;
	id 	= 130;
	voice 	= 11;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 16);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Pony", Face_N_Normal07, BodyTex_N, ITNA_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_130;
};

FUNC VOID Rtn_Start_130 ()
{
	TA_Stand_WP	(20,00,08,00,"NASZ_LOWCY_ZWIADOWCY_02");
	TA_Stand_WP	(08,00,20,00,"NASZ_LOWCY_ZWIADOWCY_02");
};

FUNC VOID Rtn_Kap4_130 ()
{
	TA_Stand_Guarding		(20,30,06,00,"NASZ_JENKINS_KAP4_01");
	TA_Stand_Eating			(06,00,10,00,"NASZ_JENKINS_KAP4_01");
	TA_Smalltalk			(10,00,14,00,"NASZ_JENKINS_KAP4_04");
	TA_Stand_ArmsCrossed	(14,00,17,00,"NASZ_JENKINS_KAP4_01");
	TA_Smalltalk			(17,00,20,30,"NASZ_JENKINS_KAP4_04");
};

