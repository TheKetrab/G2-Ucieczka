instance NASZ_211_Hunt (Npc_Default)
{
	// ------ NPC ------
	name 	= "Hunt";
	guild 	= GIL_OUT;
	id 	= 211;
	voice 	= 5;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Atrybuty ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Taktyka Walki ------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / NORMAL / COWARD
	
	// ------ Na³o¿ona broñ ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	
	// ------ Inwentarz ------
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ Wygl¹d ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_FatBald", Face_L_Tough_Santino, BodyTex_L, ITNA_OUT_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa (dziwne to to :P)--
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_211;
};

FUNC VOID Rtn_Start_211 ()
{
	TA_Stand_ArmsCrossed 	(07,30,11,50,"LOCATION_02_08");
	TA_Stand_Eating			(11,50,13,20,"LOCATION_02_08");
	TA_Stand_ArmsCrossed 	(13,20,17,05,"LOCATION_02_08");
	TA_Chest		 		(17,05,19,40,"NASZ_MYSLIWI_DOL_14");
	TA_Stand_ArmsCrossed 	(19,40,21,35,"LOCATION_02_08");
	TA_Sleep	 			(21,35,07,30,"NASZ_MYSLIWI_DOL_13");
	
};