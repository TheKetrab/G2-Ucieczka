
instance NASZ_207_Mysliwy (Npc_Default)
{
	// ------ NPC ------
	name 	= "Myœliwy";
	guild 	= GIL_OUT;
	id 	= 207;
	voice 	= 5;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 
	EquipItem	(self, ItNa_KapturMysliwego);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITNA_OUT_L );		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_207;
};

FUNC VOID Rtn_Start_207 ()
{
	TA_Smalltalk	(07,00,21,00,"ROCKCAMP");
	TA_Smalltalk 	(21,00,07,00,"ROCKCAMP");
};

FUNC VOID Rtn_Kap4_207 ()
{
	TA_Sit_Bench	(07,00,21,00,"NASZ_MYSLIWI_CMENTARZ_04");
	TA_Sit_Bench 	(21,00,07,00,"NASZ_MYSLIWI_CMENTARZ_04");
};
