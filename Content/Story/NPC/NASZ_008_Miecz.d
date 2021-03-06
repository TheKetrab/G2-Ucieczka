instance NASZ_008_Miecz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miecz";
	guild 		= GIL_PIR;
	id 			= 8;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;															
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);

	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------
	EquipItem			(self, ItMw_Piratensaebel);
	EquipItem			(self, ItRw_Mil_Crossbow);		

	// ------ Inventory ------

	CreateInvItems (self, ItRw_Bolt,25);
	CreateInvItems (self, ItFo_Addon_Grog,2);		
	CreateInvItems (self, ItFo_Cheese,3);
	CreateInvItems (self, ItFo_Apple,2);

	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Miecz, BodyTex_B, ITAR_PIR_M_Addon);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	 
	B_SetFightSkills (self, 90); //Grenzen f�r Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_8;
};

FUNC VOID Rtn_Start_8 ()
{
	TA_Sleep			(20,50,08,10,"NASZ_MIECZ_4");
	TA_Stand_Eating		(08,10,09,30,"NASZ_MIECZ_5");
	TA_Miecz_Sing		(09,30,11,20,"OW_PATH_OC_NC2_TO_TOWER_06");
	TA_Practice_Sword	(11,20,13,40,"OW_PATH_OC_NC2_TO_TOWER_06");
	TA_Miecz_Sing		(13,40,16,20,"OW_PATH_OC_NC2_TO_TOWER_06");
	TA_Sit_Chair		(16,20,18,30,"NASZ_MIECZ_3");
	TA_Stand_Guarding	(18,30,20,50,"OW_PATH_OC_NC2_TO_TOWER_06");

};

FUNC VOID Rtn_Duchy_8 ()
{
	TA_Stand_ArmsCrossed		(21,00,08,00,"OW_PATH_51");
	TA_Stand_ArmsCrossed		(08,00,21,00,"OW_PATH_51");

};

FUNC VOID Rtn_Guide_8 ()
{
	TA_Guide_Player 		(21,00,08,00,"OW_PATH_046");
	TA_Guide_Player 		(08,00,21,00,"OW_PATH_046");

};