
instance NASZ_108_Lowca (Npc_Default)
{
	// ------ NPC ------
	name 	= "£owca orków";
	guild 	= GIL_DJG;
	id 	= 108;
	voice 	= 9;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	EquipItem	(self, ItNa_DrewnianaTarcza2);
	Createinvitems (self, ItRw_Bolt, 13);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_L_NormalBart02, BodyTex_L, ITNA_DJG_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_PreStart_108;
};

FUNC VOID Rtn_PreStart_108 ()
{
	TA_Sit_Campfire			(04,15,07,45,"NASZ_LOWCY_DOL_13");
	TA_Practice_Sword		(04,15,16,45,"NASZ_LOWCY_TRENING_06");
	TA_Stand_ArmsCrossed	(16,45,19,30,"NASZ_LOWCY_DOL_03");
	TA_Sit_Campfire			(19,30,22,45,"NASZ_LOWCY_DOL_13");
	TA_Pee					(22,45,04,15,"NASZ_LOWCY_DOL_10");
};


FUNC VOID Rtn_Start_108 ()
{
	TA_Sit_Campfire			(04,15,07,45,"NASZ_LOWCY_DOL_13");
	TA_Practice_Sword		(04,15,16,45,"NASZ_LOWCY_TRENING_06");
	TA_Stand_ArmsCrossed	(16,45,19,30,"NASZ_LOWCY_DOL_03");
	TA_Sit_Campfire			(19,30,22,45,"NASZ_LOWCY_DOL_13");
	TA_Sit_Campfire			(22,45,04,15,"NASZ_LOWCY_DOL_13");
};

FUNC VOID Rtn_Twierdza_108 ()
{
	TA_Sit_Campfire	(20,00,08,00,"NASZ_TWIERDZA_25");
	TA_Sit_Campfire	(08,00,20,00,"NASZ_TWIERDZA_25");
};

FUNC VOID Rtn_TwierdzaAtak_108 ()
{
	TA_Stand_WP	(20,00,08,00,"NASZ_TWIERDZA_17");
	TA_Stand_WP	(08,00,20,00,"NASZ_TWIERDZA_17");
};
