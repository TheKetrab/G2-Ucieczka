//********************
//	Bloodfly Prototype
//********************

PROTOTYPE Mst_Default_Bloodfly(C_Npc)			
{
	//----- Monster -----
	name							=	"Krwiopijca";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY;
	level							=	4;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	40; 
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
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
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

//******************
//		Visuals
//******************

func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Bloodfly2()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Bloodfly3()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body3",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Bloodfly   
//*************

INSTANCE Bloodfly	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

// Wsciekly
INSTANCE BloodflyWsciekly01	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly02	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly03	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly04	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly05	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly06	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly07	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly08	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly09	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly10	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly11	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly12	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly13	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly14	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly15	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly16	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly17	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly18	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly19	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

INSTANCE BloodflyWsciekly20	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly3();
	Npc_SetToFistMode(self);
};

//*************
//	YBloodfly   
//*************

INSTANCE YBloodfly	(Mst_Default_Bloodfly)
{
	name							=	"Ma³y krwiopijca";
	
	level							=	3;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20; 
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
		
	B_SetVisuals_Bloodfly();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};
//*************
//	Sleepfly (schlafende Blutfliege)   
//*************

INSTANCE Sleepfly	(Mst_Default_Bloodfly)
{
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= OnlyRoutine;	
	
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};


//********************
//	BloodflyWild Prototype
//********************

PROTOTYPE Mst_Default_BloodflyWild(C_Npc)			
{
	//----- Monster -----
	name							=	"Dziki krwiopijca";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY;
	level							=	9;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	130; 
	attribute	[ATR_HITPOINTS]		=	130;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};


//*************
//	Bloodfly   
//*************

INSTANCE WildBloodfly01	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly02	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly03	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly04	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly05	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly06	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly07	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly08	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly09	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly10	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly11	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly12	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly13	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly14	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly15	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly16	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly17	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly18	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly19	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE WildBloodfly20	(Mst_Default_BloodflyWild)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

INSTANCE QuestWrzodBloodfly	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
	guild = GIL_FRIENDLY_ORC;
	name	=	"Oswojony krwiopijca";
};