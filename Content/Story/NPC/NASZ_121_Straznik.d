
instance NASZ_121_Straznik (Npc_Default)
{
	// ------ NPC ------
	name 	= "Stra�nik";
	guild 	= GIL_DJG;
	id 	= 121;
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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Thief", Face_N_Weak_Markus_Kark, BodyTex_N, ITNA_DJG_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_121;
};

FUNC VOID Rtn_Start_121 ()
{
	TA_Stand_Torch  (21,00,05,00,"PATH_OC_NC_18");
	TA_Stand_WP     (05,00,21,00,"PATH_OC_NC_18");
};
