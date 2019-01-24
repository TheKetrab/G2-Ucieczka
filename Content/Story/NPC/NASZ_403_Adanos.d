instance NASZ_403_Adanos (Npc_Default)
{
	// ------ NSC ------
	name 		= "Adanos";
	guild 		= GIL_NONE;
	id 			= 403;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMW_Addon_Stab05);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Wolf, BodyTex_N, ITAR_KDW_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	EquipItem			(self, ItRu_Geyser);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_403;
};

FUNC VOID Rtn_Start_403 ()
{
	TA_Sit_Campfire		(08,00,22,00,"OW_ICEDRAGON_15");
	TA_Stand_Eating		(22,00,08,00,"OW_ICEDRAGON_15");	
};

FUNC VOID Rtn_Final_403 ()
{
	TA_Stand_ArmsCrossed		(08,00,22,00,"NASZ_DYMOONDO_K");
	TA_Stand_ArmsCrossed		(22,00,08,00,"NASZ_DYMOONDO_K");	
};

FUNC VOID Rtn_Ritual_403 ()
{
	TA_Circle		(08,00,22,00,"NASZ_DYMOONDO_K");
	TA_Circle		(22,00,08,00,"NASZ_DYMOONDO_K");	
};

FUNC VOID Rtn_Teleported_403()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};
