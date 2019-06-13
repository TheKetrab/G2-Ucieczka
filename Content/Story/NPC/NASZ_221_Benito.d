
instance NASZ_221_Benito (Npc_Default)
{
	// ------ NPC ------
	name 	= "Benito";
	guild 	= GIL_OUT;	
	id 	= 221;
	voice 	= 10;
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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_B_Benito, BodyTex_B, ITNA_OUT_H );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75);

	// ------ Rutyna ------
	daily_routine = Rtn_Bandyci_221;
};

FUNC VOID Rtn_Bandyci_221 ()
{
	TA_Stand_ArmsCrossed 	(11,00,15,00,"NASZ_BANDYCI_OBOZ_09");
	TA_Stand_ArmsCrossed 	(15,00,11,00,"NASZ_BANDYCI_OBOZ_09");
};

FUNC VOID Rtn_Follow_221()
{	
	TA_Follow_Player			(08,00,23,00,"OW_ICEDRAGON_01");
	TA_Follow_Player			(23,00,08,00,"OW_ICEDRAGON_01");
};

FUNC VOID Rtn_Twierdza_221 ()
{
	TA_SmallTalk		(07,00,21,00,"NASZ_TWIERDZA_11");
	TA_SmallTalk		(21,00,07,00,"NASZ_TWIERDZA_11");
};

FUNC VOID Rtn_TwierdzaAtak_221 ()
{
	TA_Stand_WP		(07,00,21,00,"NASZ_TWIERDZA_41");
	TA_Stand_WP		(21,00,07,00,"NASZ_TWIERDZA_41");
};

FUNC VOID Rtn_Kap4_221 ()
{
	TA_Stand_Guarding		(07,00,21,00,"NASZ_MYSLIWI_GATE_2");
	TA_Stand_Guarding		(21,00,07,00,"NASZ_MYSLIWI_GATE_2");
};
