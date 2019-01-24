
PROTOTYPE Mst_Skeleton_Lord	(C_NPC)
{
	//----- Monster ----
	name							=	"Wojownik cienia";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	40;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	80; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	70; //hat RS!
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	70; 
	protection	[PROT_FIRE]			=	70;
	protection	[PROT_FLY]			=	70;
	protection	[PROT_MAGIC]		=	0;	//so lassen!
		
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_HUMAN_STRONG;	

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetFightSkills (self, 90);
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Skeleton_Lord()
{
	Mdl_SetVisual		(self,	"HumanS.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds"); //FIXME s.Skeleton.
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);
};


//**************************************************************
//	Schattenlord 	
//**************************************************************

INSTANCE Skeleton_Lord	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
	EquipItem	(self,ItMw_Zweihaender2);
};

//**************************************************************
//	Schattenlord Inubis	
//**************************************************************

INSTANCE Crypt_Skeleton_Lord	(Mst_Skeleton_Lord)
{
	name		=	"Pan cienia Inubis";

	B_SetVisuals_Skeleton_Lord ();
	
	CreateInvItems	(self,ItMi_Gold,500);
	CreateInvItems 	(self,ItPo_Mana_03,2);
	CreateInvItems 	(self,ItPo_Health_03,2);
	EquipItem	(self,ItMw_Zweihaender2);
};


//**************************************************************
//	Schattenlord Archol	//Joly: Endgegner auf der DI
//**************************************************************

INSTANCE Skeleton_Lord_Archol	(Mst_Skeleton_Lord)
{
	name			=	"Pan cienia, Archol";
	level			=	60;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150; 
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	1000; 
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	10;	

	B_SetVisuals_Skeleton_Lord ();
	
	CreateInvItems	(self,ItMi_Gold,650);
	CreateInvItems	(self,ItKe_EVT_UNDEAD_01,1);
	EquipItem	(self,ItMw_Zweihaender2);
	
};

//**************************************************************
//	Schattenlord Garrel	
//**************************************************************

INSTANCE Skeleton_Lord_Garrel	(Mst_Skeleton_Lord)
{
	name		=	"Pan cienia, Garrel";
	level		= 40;
	B_SetVisuals_Skeleton_Lord ();
	
	EquipItem (self, ItMW_Addon_Hacker_2h_02);
	CreateInvItems	(self,ItMi_Gold,500);
	CreateInvItems 	(self,ItPo_Perm_STR,1);
	CreateInvItems 	(self,ItPo_Health_03,3);
};

// ***** XARDAS OLD
INSTANCE Skeleton_Lord_Xardas_1	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
	EquipItem	(self,ItMw_Zweihaender2);
};
INSTANCE Skeleton_Lord_Xardas_2	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
	EquipItem	(self,ItMw_Zweihaender2);
};
INSTANCE Skeleton_Lord_Xardas_3	(Mst_Skeleton_Lord)
{
	B_SetVisuals_Skeleton_Lord ();
	EquipItem	(self,ItMw_Zweihaender2);
};
