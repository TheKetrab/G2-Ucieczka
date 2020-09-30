/*************************************************************************
**	OrcBiter Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcBiter(C_Npc)			
{
	name							=	"K¹sacz";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCBITER;
	level							=	12;
//----------------------------------------------------
	attribute	[ATR_STRENGTH]		= 60;
	attribute	[ATR_DEXTERITY]		= 60;
	attribute	[ATR_HITPOINTS_MAX]	= 120;
	attribute	[ATR_HITPOINTS]		= 120;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
//----------------------------------------------------
	protection	[PROT_BLUNT]		= 80;
	protection	[PROT_EDGE]			= 80;
	protection	[PROT_POINT]		= 50;
	protection	[PROT_FIRE]			= 80;
	protection	[PROT_FLY]			= 80;
	protection	[PROT_MAGIC]		= 0;
//----------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------
	fight_tactic					=	FAI_SCAVENGER;
//----------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= PERC_DIST_MONSTER_ACTIVE_MAX;

//	aivar[AIV_MM_Behaviour]		= HUNTER;
	
//	aivar[AIV_MM_PercRange]		= 1200;
//	aivar[AIV_MM_DrohRange]		= 1000;
//	aivar[AIV_MM_AttackRange]	= 700;
//	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	aivar[AIV_POISON] = POISON_1;
};
//-------------------------------------------------------------
func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sc2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	OrcBiter    														**
*************************************************************************/

INSTANCE OrcBiter (Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
};

//************
//	Gigant
//************
INSTANCE OrcBiterGigant1 (Mst_Default_OrcBiter)
{

	name = "Olbrzymi k¹sacz";
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_REAL_ID]		= 	ID_GIGANT;
	Mdl_SetModelScale(self,	1.50,	1.50, 	1.50);
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	250;
	protection	[PROT_BLUNT]		= 	170;
	protection	[PROT_EDGE]			= 	170;
	protection	[PROT_POINT]		=	170;
	level = 40;
};

INSTANCE OrcBiterGigant2 (Mst_Default_OrcBiter)
{
	name = "Olbrzymi k¹sacz";
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_REAL_ID]		= 	ID_GIGANT;
	Mdl_SetModelScale(self,	1.50,	1.50, 	1.50);
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	250;
	protection	[PROT_BLUNT]		= 	170;
	protection	[PROT_EDGE]			= 	170;
	protection	[PROT_POINT]		=	170;
	level = 40;
};

