
instance NASZ_131_Lowca (Npc_Default)
{
	// ------ NPC ------
	name 	= "£owca orków";
	guild 	= GIL_DJG;
	id 	= 131;
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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_PONY", 109, BodyTex_N, ITNA_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_131;
};

FUNC VOID Rtn_Start_131 ()
{
	TA_Sit_Campfire	(20,00,08,00,"NASZ_LOWCY_ZWIADOWCY_06");
	TA_Sit_Campfire	(08,00,20,00,"NASZ_LOWCY_ZWIADOWCY_06");
};

FUNC VOID Rtn_Kap4_131 ()
{
	TA_Stand_ArmsCrossed	(20,30,10,00,"NASZ_JENKINS_KAP4_02");
	TA_Smalltalk			(10,00,14,00,"NASZ_ZAMEK_1");
	TA_Practice_Sword		(14,00,17,00,"NASZ_JENKINS_KAP4_02");
	TA_Smalltalk			(17,00,20,30,"NASZ_ZAMEK_1");
};

