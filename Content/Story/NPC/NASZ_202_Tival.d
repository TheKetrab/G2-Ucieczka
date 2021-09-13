
instance NASZ_202_Tival (Npc_Default)
{
	// ------ NPC ------
	name 	= "Tival";
	guild 	= GIL_OUT;
	id 	= 202;
	voice 	= 5;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	Npc_EquipHelmet	(self, ItNa_KapturMysliwego);
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Fatbald", Face_N_Weak_Herek, BodyTex_N, ITNA_OUT_M );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_202;
};

FUNC VOID Rtn_Start_202 ()
{
	TA_Stand_Guarding	(21,00,11,20,"NASZ_MYSLIWI_GRUPA_02");
	TA_SmallTalk 	(11,20,21,00,"NASZ_MYSLIWI_GRUPA_09");
};

FUNC VOID Rtn_Kap4_202 ()
{
	TA_Sit_Chair	(07,00,21,00,"NASZ_TWIERDZA_5");
	TA_Sit_Chair 	(21,00,07,00,"NASZ_TWIERDZA_5");
};
