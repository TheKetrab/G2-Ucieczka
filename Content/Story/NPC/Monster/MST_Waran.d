//**********************
//	Waran Prototype		
//**********************

PROTOTYPE Mst_Default_Waran(C_Npc)			
{
	//----- Monster ----
	name							=	"Jaszczur";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	30;
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

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	aivar[AIV_POISON] = POISON_1;
};

//************
//	Visuals
//************

func void B_SetVisuals_Waran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Waran2()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};



//**************
//	Waran    	
//**************

INSTANCE Waran	(Mst_Default_Waran)
{
	Npc_SetToFistMode(self);
	B_SetVisuals_Waran2();
};

//Addon


INSTANCE BeachWaran1	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};


INSTANCE BeachWaran2	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

//**************
//	Grozny Jaszczur    	
//**************

PROTOTYPE Mst_Default_WaranGrozny(C_Npc)			
{
	//----- Monster ----
	name							=	"Groüny jaszczur";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	level							=	24;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	attribute	[ATR_HITPOINTS_MAX]	=	240;
	attribute	[ATR_HITPOINTS]		=	240;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	aivar[AIV_POISON] = POISON_2;
};

INSTANCE GroznyJaszczur	(Mst_Default_WaranGrozny)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};
