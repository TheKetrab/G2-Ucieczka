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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Grim, BodyTex_N, ITAR_PIR_M_Addon);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	 
	B_SetFightSkills (self, 90); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_8;
};

FUNC VOID Rtn_Start_8 ()
{
	TA_Sleep			(20,50,08,10,"NASZ_MIECZ_4");
	TA_Stand_Eating		(08,10,10,20,"NASZ_MIECZ_5");
	TA_Practice_Sword	(10,20,13,40,"OW_PATH_OC_NC2_TO_TOWER_06");
	TA_Sit_Chair		(13,40,17,50,"NASZ_MIECZ_3");
	TA_Stand_Guarding	(17,50,20,50,"OW_PATH_OC_NC2_TO_TOWER_06");

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