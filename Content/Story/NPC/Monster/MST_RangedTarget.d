
PROTOTYPE Mst_Default_RangedTarget(C_Npc)			
{
	//----- Tier ----
	name							=	"Tarcza strzelecka";
	guild							=	GIL_MEATBUG;
	//aivar[AIV_MM_REAL_ID]			= 	ID_MEATBUG;
	aivar[AIV_MM_REAL_ID]			=	ID_RangedTarget;
	level							=	0;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	5;
	attribute	[ATR_HITPOINTS]		=	5;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	IMMUNE;
	protection	[PROT_EDGE]			=	IMMUNE;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	IMMUNE;
	protection	[PROT_FLY]			=	IMMUNE;	
	protection	[PROT_MAGIC]		=	IMMUNE;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

};

//************
//	Visuals
//************

func void B_SetVisuals_RangedTarget()
{
	// niewidzialna

	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	
	var oCNpc slf; slf = Hlp_GetNpc(self);
	slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_castDynShadow;
	slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_physicsEnabled;
	slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_collDetectionStatic;
	slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~zCVob_bitfield0_collDetectionDynamic;
	slf._zCVob_type = 129;
	slf.noFocus = 1;		
 };

//***************
//	RangedTarget
//***************

INSTANCE RangedTarget_Mysliwi1 (Mst_Default_RangedTarget)
{
	B_SetVisuals_RangedTarget();
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

INSTANCE RangedTarget_Mysliwi2 (Mst_Default_RangedTarget)
{
	B_SetVisuals_RangedTarget();
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

