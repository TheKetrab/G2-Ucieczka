//**************************
//	Icegolem Prototype	
//**************************

PROTOTYPE Mst_Default_IceGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Lodowy golem";
	guild							=	GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_ICEGOLEM;
	level							=	40;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	180;
	attribute	[ATR_DEXTERITY]		=	180;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	IMMUNE;
	protection	[PROT_POINT]		=	IMMUNE;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	0;

	
	//----- Damage Types ----
	damagetype 						=	DAM_BLUNT;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_IceGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Ice_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};



//***************
//	Ice Golem   
//***************
INSTANCE IceGolem	(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

//*******************
//	Ice Golem  Sylvio 
//*******************
INSTANCE IceGolem_Sylvio1	(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};

INSTANCE IceGolem_Sylvio2	(Mst_Default_IceGolem)
{
	B_SetVisuals_IceGolem();
	Npc_SetToFistMode(self);
};
