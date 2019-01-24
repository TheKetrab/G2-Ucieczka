//************************************
//	Shadowbeast-Skeleton PROTOTYPE
//************************************

PROTOTYPE Mst_Default_Shadowbeast_Skeleton(C_Npc)			
{
	//----- Monster ----
	name							=	"Szkielet-cieniostw�r";
	guild							=	GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHADOWBEAST_SKELETON;
	level							=	40;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	200;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	20;

	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SHADOWBEAST;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//************
//	Visuals
//************

func void B_SetVisuals_Shadowbeast_Skeleton()
{
	Mdl_SetVisual			(self, "Shadow.mds");
	//								Body-Mesh					Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self, "Shadowbeast_Skeleton_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************************
//	Shadowbeast_Skeleton    	
//*****************************

INSTANCE Shadowbeast_Skeleton	(Mst_Default_Shadowbeast_Skeleton)
{
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};

INSTANCE BestiaSwiatynna	(Mst_Default_Shadowbeast_Skeleton)
{
	name = "Bestia �wi�tynna";
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItNa_LuskaBestii,3);
};

//*****************************
//	Shadowbeast_Skeleton_Angar    	
//*****************************

INSTANCE Shadowbeast_Skeleton_Angar	(Mst_Default_Shadowbeast_Skeleton)
{
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};

//*****************************
//	XARDAS    	
//*****************************

INSTANCE Shadowbeast_Skeleton_XardasOld	(Mst_Default_Shadowbeast_Skeleton)
{
	guild 		= GIL_WOLF;
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};
