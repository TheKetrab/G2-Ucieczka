
instance NASZ_206_Mysliwy (Npc_Default)
{
	// ------ NPC ------
	name 	= "Myœliwy";
	guild 	= GIL_OUT;
	id 	= 206;
	voice 	= 5;
	flags   = 0;																			//NPC_FLAG_IMMORTAL oder 0
	npctype	= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_RangedTA_Target] = RangedTarget_Mysliwi2;

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
	B_SetNpcVisual 	     	(self, MALE, "Hum_Head_Pony", Face_L_ToughBart_Quentin, BodyTex_L, ITNA_OUT_L );		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Mage / Militia / Tired 
							      // Relaxed / Arrogance
	// --Istotne talenty NPCa
	B_GiveNpcTalents (self);
	
	// ------ Talent walki ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50);

	// ------ Rutyna ------
	daily_routine = Rtn_Start_206;
};

FUNC VOID Rtn_Start_206 ()
{
	TA_Pee					(06,20,08,30,"NASZ_MYSLIWI_GRUPA_06");
	TA_Practice_Ranged		(08,30,11,30,"NASZ_MYSLIWI_GRUPA_TARCZA1");
	TA_Stand_Eating			(11,30,16,20,"NASZ_MYSLIWI_GRUPA_02");
	TA_Practice_Ranged		(16,20,18,20,"NASZ_MYSLIWI_GRUPA_TARCZA1");
	TA_Pee					(18,20,20,50,"NASZ_MYSLIWI_GRUPA_06");
	TA_Stand_ArmsCrossed	(20,50,06,20,"OW_DJG_ROCKCAMP_01");
};

FUNC VOID Rtn_DontInterruptInShooting_206 ()
{
	// to samo co Start, oprocz Pee i PracticeRanged, bo wtedy przeszkadza
	
	TA_Stand_ArmsCrossed	(06,20,11,30,"OW_DJG_ROCKCAMP_01");
	//TA_Pee					(06,20,08,30,"NASZ_MYSLIWI_GRUPA_06");
	//TA_Practice_Ranged		(08,30,11,30,"NASZ_MYSLIWI_GRUPA_TARCZA1");
	
	TA_Stand_Eating			(11,30,16,20,"NASZ_MYSLIWI_GRUPA_02");
	
	TA_Stand_ArmsCrossed	(16,20,20,50,"OW_DJG_ROCKCAMP_01");
	//TA_Practice_Ranged		(16,20,18,20,"NASZ_MYSLIWI_GRUPA_TARCZA1");
	//TA_Pee					(18,20,20,50,"NASZ_MYSLIWI_GRUPA_06");
	
	TA_Stand_ArmsCrossed	(20,50,06,20,"OW_DJG_ROCKCAMP_01");
};

FUNC VOID Rtn_Kap4_206 ()
{
	TA_Sit_Campfire		(07,00,21,00,"NASZ_MYSLIWI_DOL_29");
	TA_Sit_Campfire		(21,00,07,00,"NASZ_MYSLIWI_DOL_29");
};
