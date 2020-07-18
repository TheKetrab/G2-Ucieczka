
INSTANCE NASZ_452_KurgKan (Mst_Default_OrcSlave)
{
	name = "Kurg-Kan";
	guild = GIL_FRIENDLY_ORC;
	id 			=		452;
	level		= 		5;
	voice 		=		18;
	attribute[4] = 100;
	Npctype 	=		NPCTYPE_MAIN;
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	fight_tactic	=	FAI_ORC;
	
	//----- Daily Routine ----
	daily_routine 	= Rtn_Start_452;
};

FUNC VOID Rtn_Start_452 ()
{	
	TA_Stand_WP  	(22,00,07,00,"NASZ_MIECZ_6");
    TA_Stand_WP		(07,00,22,00,"TOT");
	
};

FUNC VOID Rtn_Start2_452 ()
{	
	// caly czas nad mieczem
	TA_Stand_WP  	(22,00,07,00,"NASZ_MIECZ_6");
    TA_Stand_WP		(07,00,22,00,"NASZ_MIECZ_6");
	
};

FUNC VOID Rtn_Follow_452 ()
{	
	// w razie gdyby sie zgubil, jest w domu kerolotha
	TA_Follow_Player	(06,00,18,00,"NASZ_LOWCY_DOM_03");
	TA_Follow_Player	(18,00,06,00,"NASZ_LOWCY_DOM_03");
};
FUNC VOID Rtn_Karczma_452 ()
{	
	// w karczmie
	TA_Sweep_FP          (07,40,10,20,"NASZ_LOWCY_KARCZMA_01");

	// u kerolotha
	TA_Sweep_FP          (10,20,12,30,"NASZ_LOWCY_DOM_03");
	
	// w karczmie
	TA_Stand_Sweeping (12,30,15,30,"NASZ_LOWCY_KARCZMA_02");
	TA_Repair_Hut     (15,30,18,30,"NASZ_LOWCY_GORA_03");

	// u kerolotha
	TA_Sweep_FP          (18,30,20,10,"NASZ_LOWCY_DOM_03");

	// w karczmie
	TA_Orc_Dance	(20,10,02,45,"NASZ_LOWCY_KARCZMA_02");
	TA_Orc_Sit		(02,45,07,40,"NASZ_LOWCY_KARCZMA_31"); // TODO
	
};

FUNC VOID Rtn_WithSword_452 () {

	TA_Practice_Sword		(09,20,12,30,"NASZ_LOWCY_TRENING_03");
	TA_Stand_Sweeping 		(12,30,15,30,"NASZ_LOWCY_KARCZMA_02");
	TA_Smoke_Joint			(15,30,16,50,"PATH_OC_NC_14"); // TODO
	TA_Practice_Sword		(16,50,19,10,"NASZ_LOWCY_TRENING_03");
	TA_Orc_Sit					(19,10,20,10,"NASZ_LOWCY_KARCZMA_31"); // TODO
	TA_Orc_Dance				(20,10,02,45,"NASZ_LOWCY_KARCZMA_02");
	TA_Orc_Sit					(02,45,09,20,"NASZ_LOWCY_KARCZMA_31"); // TODO
};

FUNC VOID Rtn_Kap3_452 ()
{	
	TA_Stand_WP  	(08,00,22,00,"OW_WOODRUIN_WOLF_SPAWN");
    TA_Stand_WP		(22,00,08,00,"OW_WOODRUIN_WOLF_SPAWN");
};
