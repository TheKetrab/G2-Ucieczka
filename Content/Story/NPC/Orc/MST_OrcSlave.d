//*****************************
//	Orc WARRIOR Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcSlave(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCSCOUT;
	voice							=	18;
	level							=	25;
		
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
		
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	80;
		
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//-------- Inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);

	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_MONSTER_ACTIVE_MAX;
	//senses_range	= PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

//**************
//	Visuals
//**************

func void B_SetVisuals_OrcSlave()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYSLAVE",	DEFAULT,	DEFAULT,	"Orc_HeadSlave",	DEFAULT,  	DEFAULT,	-1);
};


func void B_SetVisuals_OrcPal(var c_npc slf)
{
	Mdl_SetVisual			(slf,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(slf,	"ORC_BODYPAL",	DEFAULT,	DEFAULT,	"Orc_HeadPal",	DEFAULT,  	DEFAULT,	-1);
};

func void KurgKanKap3() {
	B_SetVisuals_OrcPal(NASZ_Kurg_Kan);
	B_StartOtherRoutine(NASZ_Kurg_Kan,"WithSword");
};

//******************
//	Orc Slave   														
//******************

INSTANCE OrcSlave (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


INSTANCE NASZ_Kurg_Kan (Mst_Default_OrcSlave)
{
	name = "Kurg-Kan";
	
	guild = GIL_FRIENDLY_ORC;
	
	id 			=		61000;	
	level		= 		5;
	voice 		=		18;
	
	Npctype 	=		NPCTYPE_MAIN;
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	fight_tactic	=	FAI_ORC;
	
	//----- Daily Routine ----
	daily_routine 	= Rtn_Start_61000;
};

FUNC VOID Rtn_Start_61000 ()
{	
	TA_Stand_WP  	(22,00,07,00,"NASZ_MIECZ_6");
    TA_Stand_WP		(07,00,22,00,"TOT");
	
};

FUNC VOID Rtn_Start2_61000 ()
{	
	// caly czas nad mieczem
	TA_Stand_WP  	(22,00,07,00,"NASZ_MIECZ_6");
    TA_Stand_WP		(07,00,22,00,"NASZ_MIECZ_6");
	
};

FUNC VOID Rtn_Follow_61000 ()
{	
	// w razie gdyby sie zgubil, jest w domu kerolotha
	TA_Follow_Player	(06,00,18,00,"NASZ_LOWCY_DOM_03");
	TA_Follow_Player	(18,00,06,00,"NASZ_LOWCY_DOM_03");
};
FUNC VOID Rtn_Karczma_61000 ()
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

FUNC VOID Rtn_WithSword_61000 () {

	TA_Practice_Sword		(09,20,12,30,"NASZ_LOWCY_TRENING_03");
	TA_Stand_Sweeping 		(12,30,15,30,"NASZ_LOWCY_KARCZMA_02");
	TA_Smoke_Joint			(15,30,16,50,"PATH_OC_NC_14"); // TODO
	TA_Practice_Sword		(16,50,19,10,"NASZ_LOWCY_TRENING_03");
	TA_Orc_Sit					(19,10,20,10,"NASZ_LOWCY_KARCZMA_31"); // TODO
	TA_Orc_Dance				(20,10,02,45,"NASZ_LOWCY_KARCZMA_02");
	TA_Orc_Sit					(02,45,09,20,"NASZ_LOWCY_KARCZMA_31"); // TODO
};


FUNC VOID Rtn_Kap3_61000 ()
{	
	TA_Stand_WP  	(08,00,22,00,"OW_WOODRUIN_WOLF_SPAWN");
    TA_Stand_WP		(22,00,08,00,"OW_WOODRUIN_WOLF_SPAWN");
};