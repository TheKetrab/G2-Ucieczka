//*************************
//	BlackGobbo Prototype	
//*************************

PROTOTYPE Mst_Default_Gobbo_Black(C_NPC)			
{
	//----- Monster ----
	name							=	"Czarny goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_BLACK;
	level							=	8;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	45;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	45;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_GOBBO;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Black()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		1,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Black (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

// ***********
// Gobbo_DaronsStatuenKlauer   	
// ***********
INSTANCE Gobbo_DaronsStatuenKlauer (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	CreateInvItems (self, ItMi_LostInnosStatue_Daron, 1);									
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

// ***********
// Phill Gobbos   	
// ***********

INSTANCE goblin0 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin1 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin2 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin3 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin4 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin5 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

// ***********
// Keroloth Gobbos   	
// ***********

INSTANCE goblin11 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode (self, ItMw_1h_Misc_Sword);
};

INSTANCE goblin12 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

INSTANCE goblin13 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
};

//*** GIGANT ***
INSTANCE BlackGobboGigant1 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	aivar[AIV_MM_REAL_ID]		= 	ID_GIGANT;
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
	Mdl_SetModelScale(self,	1.60,	1.60, 	1.60);
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	200;
	name							=	"Olbrzymi goblin";
	level = 30;

};

INSTANCE BlackGobboGigant2 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	aivar[AIV_MM_REAL_ID]		= 	ID_GIGANT;
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
	Mdl_SetModelScale(self,	1.60,	1.60, 	1.60);
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	200;
	name							=	"Olbrzymi goblin";
	level = 30;
};

INSTANCE BlackGobboGigant3 (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	aivar[AIV_MM_REAL_ID]		= 	ID_GIGANT;
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);
	Mdl_SetModelScale(self,	1.60,	1.60, 	1.60);
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	200;
	name							=	"Olbrzymi goblin";
	level = 30;
};