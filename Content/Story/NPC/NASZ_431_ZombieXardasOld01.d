


prototype NASZ_ZombieXardas_Old(C_Npc)
{
	//----- Monster ----
	name							=	"Zombie";
	guild							=	GIL_FRIENDLY_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	50;	
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Type ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ZOMBIE;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

instance NASZ_431_ZombieXardasOld01 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombiePale2, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_431;
};

FUNC VOID Rtn_Start_431 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_05");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_05");
};
FUNC VOID Rtn_After_431 ()
{	
	TA_Stand_WP		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_05");
    TA_Stand_WP		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_05");
};
instance NASZ_432_ZombieXardasOld02 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_432;
};

FUNC VOID Rtn_Start_432 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_06");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_06");
};

instance NASZ_433_ZombieXardasOld03 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack2, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_433;
};

FUNC VOID Rtn_Start_433 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_07");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_07");
};

instance NASZ_434_ZombieXardasOld04 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_434;
};

FUNC VOID Rtn_Start_434 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_08");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_08");
};

instance NASZ_435_ZombieXardasOld05 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_ZombiePale1, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_435;
};

FUNC VOID Rtn_Start_435 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_09");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_09");
};

instance NASZ_436_ZombieXardasOld06 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_436;
};

FUNC VOID Rtn_Start_436 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_10");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_10");
};

instance NASZ_437_ZombieXardasOld07 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack2, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_437;
};

FUNC VOID Rtn_Start_437 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_11");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_11");
};

instance NASZ_438_ZombieXardasOld08 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_438;
};

FUNC VOID Rtn_Start_438 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_12");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_12");
};

instance NASZ_439_ZombieXardasOld09 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_ZombiePale1, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_439;
};

FUNC VOID Rtn_Start_439 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_13");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_13");
};

instance NASZ_440_ZombieXardasOld10 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_440;
};

FUNC VOID Rtn_Start_440 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_14");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_14");
};








instance NASZ_441_ZombieXardasOld11 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombiePale2, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_441;
};

FUNC VOID Rtn_Start_441 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_15");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_15");
};

instance NASZ_442_ZombieXardasOld12 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_442;
};

FUNC VOID Rtn_Start_442 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_16");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_16");
};

instance NASZ_443_ZombieXardasOld13 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack2, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_443;
};

FUNC VOID Rtn_Start_443 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_17");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_17");
};

instance NASZ_444_ZombieXardasOld14 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_444;
};

FUNC VOID Rtn_Start_444 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_18");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_18");
};

instance NASZ_445_ZombieXardasOld15 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_ZombiePale1, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_445;
};

FUNC VOID Rtn_Start_445 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_19");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_19");
};

instance NASZ_446_ZombieXardasOld16 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_446;
};

FUNC VOID Rtn_Start_446 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_20");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_20");
};

instance NASZ_447_ZombieXardasOld17 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack2, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_447;
};

FUNC VOID Rtn_Start_447 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_21");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_21");
};

instance NASZ_448_ZombieXardasOld18 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_448;
};

FUNC VOID Rtn_Start_448 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_22");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_22");
};

instance NASZ_449_ZombieXardasOld19 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_ZombiePale1, ZombiePale, NO_ARMOR);		
	daily_routine 		= Rtn_Start_449;
};

FUNC VOID Rtn_Start_449 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_23");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_23");
};

instance NASZ_450_ZombieXardasOld20 (NASZ_ZombieXardas_Old)
{																	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_ZombieBlack1, ZombieBlack, NO_ARMOR);		
	daily_routine 		= Rtn_Start_450;
};

FUNC VOID Rtn_Start_450 ()
{	
	TA_WatchArena		(08,00,23,00,"NASZ_XARDAS_OLD_POKOJ_2_24");
    TA_WatchArena		(23,00,08,00,"NASZ_XARDAS_OLD_POKOJ_2_24");
};
