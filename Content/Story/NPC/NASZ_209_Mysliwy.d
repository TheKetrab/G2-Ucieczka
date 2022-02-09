
instance NASZ_209_Mysliwy (Npc_Default)
{
	// ------ NPC ------
	name 	= "Myœliwy";
	guild 	= GIL_OUT;
	id 	= 209;
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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Bald", Face_N_ToughBart01, BodyTex_N, ITNA_OUT_L );		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_209;
};

FUNC VOID Rtn_Start_209 ()
{
	TA_Sit_CampFire		(00,05,07,20,"NASZ_MYSLIWI_BALKON_05");
	TA_Repair_Hut		(07,20,09,50,"NASZ_MYSLIWI_DOL_11");
	TA_SmallTalk		(09,50,11,30,"LOCATION_02_09");
	TA_Repair_Hut		(11,30,13,55,"NASZ_MYSLIWI_DOL_11");
	TA_SmallTalk		(13,55,16,40,"LOCATION_02_09");
	TA_Sit_CampFire		(16,40,20,20,"NASZ_MYSLIWI_BALKON_05");
	TA_Play_Lute 		(20,20,00,05,"NASZ_MYSLIWI_BALKON_06");
};

FUNC VOID Rtn_Kap4_209 ()
{
	TA_SmallTalk		(07,30,20,20,"NASZ_MYSLIWI_DOL_25");
	TA_Sit_CampFire 	(20,20,07,30,"NASZ_MYSLIWI_DOL_28");
};
