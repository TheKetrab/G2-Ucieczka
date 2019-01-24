
instance NASZ_212_Drax (Npc_Default)
{
	// ------ NPC ------
	name 	= "Drax";
	guild 	= GIL_OUT;
	id 	= 212;
	voice 	= 5;
	flags   = 2;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 3);
	level = 20;
	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_1H_Sword_L_03);
	EquipItem	(self, ItRw_Sld_Bow); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, ITNA_OUT_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa (dziwne to to :P)--
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_212;
};

FUNC VOID Rtn_Start_212 ()
{
	TA_Stand_ArmsCrossed	(07,00,21,00,"NASZ_MYSLIWI_GORA_13");
	TA_Stand_ArmsCrossed 	(21,00,07,00,"NASZ_MYSLIWI_GORA_13");
};
FUNC VOID Rtn_Flee_212 ()
{	
	TA_FleeToWP	(08,00,23,00,"NASZ_MYSLIWI_DRAX_B");
	TA_FleeToWP	(23,00,08,00,"NASZ_MYSLIWI_DRAX_B");
};