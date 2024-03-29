
instance NASZ_132_Lowca (Npc_Default)
{
	// ------ NPC ------
	name 	= "�owca ork�w";
	guild 	= GIL_DJG;
	id 	= 132;
	voice 	= 11;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na�o�ona bro� ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_M);
	EquipItem	(self, ItNa_DJG_Crossbow);
	Createinvitems (self, ItRw_Bolt, 16);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
		
	// ------ Wygl�d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_Weak_Cipher_alt, BodyTex_N, ITNA_DJG_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_132;
};

FUNC VOID Rtn_Start_132 ()
{
	TA_Sit_Campfire	(20,00,08,00,"NASZ_LOWCY_ZWIADOWCY_05");
	TA_Sit_Campfire	(08,00,20,00,"NASZ_LOWCY_ZWIADOWCY_05");
};

FUNC VOID Rtn_Kap4_132 ()
{
	TA_Sit_Campfire		(18,30,09,45,"NASZ_JENKINS_KAP4_03");
	TA_Stand_Eating		(09,45,18,30,"NASZ_JENKINS_KAP4_05");

};



