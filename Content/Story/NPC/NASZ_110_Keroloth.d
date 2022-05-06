
instance NASZ_110_Keroloth  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Keroloth";
	guild 		= GIL_DJG;
	id 			= 110;
	voice 		= 7;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem	(self, ItNa_Djg_Weapon_H);
	EquipItem	(self, ItNa_DJG_CrossbowH);
	Createinvitems (self, ItRw_Bolt, 22);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal20, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_110;
};


FUNC VOID Rtn_PreStart_110 ()
{	
	TA_Stand_Guarding		(08,00,20,00,"NASZ_LOWCY_DOM_05");
	TA_Stand_Guarding		(20,00,08,00,"NASZ_LOWCY_DOM_05");

};

FUNC VOID Rtn_Start_110 ()
{	
	TA_Stand_Guarding		(05,05,10,50,"NASZ_LOWCY_DOM_05");
	TA_Sit_Chair			(10,50,13,20,"NASZ_LOWCY_DOM_05");
	TA_Stand_Eating			(13,20,15,30,"NASZ_LOWCY_DOM_05");
	TA_Sit_Chair			(15,30,17,40,"NASZ_LOWCY_DOM_05");
	TA_Read_Bookstand		(17,40,20,10,"NASZ_LOWCY_DOM_07");
	TA_Pray_Innos_FP		(20,10,01,20,"NASZ_LOWCY_GORA_12");
	TA_Sit_Campfire			(01,20,05,05,"PATH_OC_NC_13");
	
};

FUNC VOID Rtn_TwierdzaFollow_110 ()
{	
	TA_Guide_Player		(08,00,20,00,"OW_PATH_186");
	TA_Guide_Player		(20,00,08,00,"OW_PATH_186");
};

FUNC VOID Rtn_TwierdzaWalkaPre_110 ()
{	
	TA_RunToWP		(08,00,20,00,"NASZ_TWIERDZA_18");
	TA_RunToWP			(20,00,08,00,"NASZ_TWIERDZA_18");
};


FUNC VOID Rtn_TwierdzaIn_110 ()
{	
	TA_Sit_Throne		(08,00,20,00,"NASZ_TWIERDZA_20");
	TA_Sit_Throne			(20,00,08,00,"NASZ_TWIERDZA_20");
};

FUNC VOID Rtn_FollowZamek_110()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_110()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_110()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_110()
{	
	TA_Guide_Player 			(08,00,23,00,"OC_EBR_HALL_CENTER");
	TA_Guide_Player			(23,00,08,00,"OC_EBR_HALL_CENTER");
};


FUNC VOID Rtn_Zamek_110()
{	
	//TA_Stand_Guarding 			(08,00,23,00,"OC_CENTER_04");
	//TA_Stand_Guarding			(23,00,08,00,"OC_CENTER_04");
	TA_Sit_Chair 			(08,00,23,00,"NASZ_INCASTLE_CHAIR_2");
	TA_Sit_Chair			(23,00,08,00,"NASZ_INCASTLE_CHAIR_2");
};

FUNC VOID Rtn_Scena1_110()
{	
	TA_Stand_Guarding 			(08,00,23,00,"OC_EBR_HALL_THRONE");
	TA_Stand_Guarding			(23,00,08,00,"OC_EBR_HALL_THRONE");
};

FUNC VOID Rtn_FollowInZamek_110()
{	
	TA_Follow_Player 			(08,00,23,00,"OC_CENTER_04");
	TA_Follow_Player			(23,00,08,00,"OC_CENTER_04");
};

FUNC VOID Rtn_UltraFinal_110 ()
{	
	TA_Smalltalk		(08,00,22,00,"NASZ_ULTRAFINAL_02");
	TA_Smalltalk 	(22,00,08,00,"NASZ_ULTRAFINAL_02");
};

FUNC VOID Rtn_Scena2_110 ()
{	
	TA_Stand_WP		(08,00,22,00,"NASZ_FILM_SCENA2_02");
	TA_Stand_WP 	(22,00,08,00,"NASZ_FILM_SCENA2_02");
};

FUNC VOID Rtn_Scena2Goal_110 ()
{	
	TA_RunToWP		(08,00,22,00,"NASZ_FILM_SCENA2_GOAL");
	TA_RunToWP 	(22,00,08,00,"NASZ_FILM_SCENA2_GOAL");
};
