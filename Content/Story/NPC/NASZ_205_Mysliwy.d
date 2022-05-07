
instance NASZ_205_Mysliwy (Npc_Default)
{
	// ------ NPC ------
	name 	= "Myœliwy";
	guild 	= GIL_OUT;
	id 	= 205;
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
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Fighter", Face_B_Tough_Pacho, BodyTex_B, ITNA_OUT_L );		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_205;
};

FUNC VOID Rtn_Start_205 ()
{
	TA_Stand_ArmsCrossed	(05,00,21,00,"OW_DJG_ROCKCAMP_02");
	TA_Stand_Torch		 	(21,00,05,00,"OW_DJG_ROCKCAMP_02");
};

FUNC VOID Rtn_Kap3_205 ()
{
	TA_Follow_Player	(07,00,21,00,"OW_DJG_ROCKCAMP_02");
	TA_Follow_Player 	(21,00,07,00,"OW_DJG_ROCKCAMP_02");
};

FUNC VOID Rtn_Kap3Odpoczynek_205 ()
{
	TA_Sit_Campfire	(07,00,21,00,"NASZ_MYSLIWI_GRUPA_07");
	TA_Sit_Campfire 	(21,00,07,00,"NASZ_MYSLIWI_GRUPA_07");
};

FUNC VOID Rtn_Kap4_205 ()
{
	TA_Sit_Campfire	(07,00,21,00,"NASZ_MYSLIWI_DOL_30");
	TA_Sit_Campfire 	(21,00,07,00,"NASZ_MYSLIWI_DOL_30");
};
