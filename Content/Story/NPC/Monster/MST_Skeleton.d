//************************
//	Skeleton Prototype
//************************

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	//----- Monster ----
	name							=	"Szkielet";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	60; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	140; 
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
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Skeleton()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//				Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",		DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lesser_Skeleton()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Skeleton    
//**************

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetFightSkills (self, 90);
	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE SkeletonGood			(Mst_Default_Skeleton)
{
	B_SetVisuals_Lesser_Skeleton();
	level			=	10;
	EquipItem (self, ItMw_1h_MISC_Sword);
	fight_tactic	=	FAI_HUMAN_COWARD;
	B_SetFightSkills (self, 45);
	
};

INSTANCE SkeletonPro			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	20;
	EquipItem (self, ItMw_1h_MISC_Sword);
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetFightSkills (self, 90);
};

INSTANCE SkeletonShield			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	10;
	EquipItem (self, ItMw_1h_MISC_Sword);
	EquipItem (self, ItNa_DrewnianaTarcza3);
	fight_tactic	=	FAI_HUMAN_COWARD;
	B_SetFightSkills (self, 45);
	Mdl_ApplyOverlayMds	(self, "HUMANS_SHIELD.MDS"); 
};

// --- Skeleton Jenkins ---
INSTANCE Skeleton_Jenkins_1	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	10;
	EquipItem (self, ItMw_1h_MISC_Sword);
	EquipItem (self, ItNa_DrewnianaTarcza3);
	fight_tactic	=	FAI_HUMAN_COWARD;
	B_SetFightSkills (self, 45);
	Mdl_ApplyOverlayMds	(self, "HUMANS_SHIELD.MDS"); 
};

INSTANCE Skeleton_Jenkins_2	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	10;
	EquipItem (self, ItMw_1h_MISC_Sword);
	EquipItem (self, ItNa_DrewnianaTarcza3);
	fight_tactic	=	FAI_HUMAN_COWARD;
	B_SetFightSkills (self, 45);
	Mdl_ApplyOverlayMds	(self, "HUMANS_SHIELD.MDS"); 
};

INSTANCE Skeleton_Jenkins_3			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	20;
	EquipItem (self, ItMw_1h_MISC_Sword);
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetFightSkills (self, 90);
};

INSTANCE Skeleton_Jenkins_4			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	level			=	20;
	EquipItem (self, ItMw_1h_MISC_Sword);
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetFightSkills (self, 90);
};


//**************
//	Skeleton    
//**************

INSTANCE Summoned_Skeleton (Mst_Default_Skeleton)
{
	name							=	"Przyzwany szkielet";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	60; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	140; 
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Lesser_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
	//EquipItem (self, ItRw_Sld_Bow); //FIXME Carsten: Bogen schieﬂt beim Skelett in Zeitlupe...
};

//**************
//	Lesser Skeleton    
//**************

INSTANCE Lesser_Skeleton	(Mst_Default_Skeleton)
{
	name							=	"Pomniejszy szkielet";
	
	level							=	15;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	45; //+30 Waffe
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	130; 
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_Lesser_Skeleton();
	
	// ------ Waffe ------
	EquipItem (self, ItMw_1h_MISC_Sword);
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 	Story Skeletons
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//**************
//	Crypt-Skeletons
//**************

INSTANCE Crypt_Skeleton_Room_01			(Mst_Default_Skeleton)
{
	name							=	"Straønik krypty";

	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
	CreateInvItem (self, ItKe_EVT_CRYPT_01);
};

INSTANCE Crypt_Skeleton_Room_02			(Mst_Default_Skeleton)
{
	name							=	"Straønik krypty";

	aivar[AIV_EnemyOverride] = TRUE;
	
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
	CreateInvItem (self, ItKe_EVT_CRYPT_02);
};

INSTANCE Crypt_Skeleton_Room_03			(Mst_Default_Skeleton)
{
	name							=	"Straønik krypty";

	aivar[AIV_EnemyOverride] = TRUE;
	
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
	CreateInvItem (self, ItKe_EVT_CRYPT_03);
};
//****************************
//	Archols-Skeletons auf DI
//****************************

INSTANCE Skeleton_Archol1	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Archol2	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Archol3	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Archol4	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Archol5	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Archol6	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};
//****************************
//	Marios-Skeletons auf DI
//****************************

INSTANCE Skeleton_Mario1	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Mario2	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Mario3	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Mario4	(Mst_Default_Skeleton)
{
	aivar[AIV_EnemyOverride] = TRUE;

	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

//****************************
//	Cmentarz Lowcy
//****************************

INSTANCE Skeleton_Lowcy_SkeA	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Lowcy_SkeB	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Lowcy_SkeC	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Lowcy_SkeD	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Lowcy_SkeE	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Lowcy_SkeF	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

INSTANCE Skeleton_Lowcy_SkeG	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_1h_MISC_Sword);
};

INSTANCE Skeleton_Lowcy_SkeH	(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();

	EquipItem (self, ItMw_2H_Sword_M_01);
};

//**************
//	Straznik   
//**************

INSTANCE SkeletonStraznikA			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};
INSTANCE SkeletonStraznikB			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};
INSTANCE SkeletonStraznikC			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};
INSTANCE SkeletonStraznikD			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};
INSTANCE SkeletonStraznikE			(Mst_Default_Skeleton)
{
	B_SetVisuals_Skeleton();
	EquipItem (self, ItMw_2H_Sword_M_01);
};

//**************
//	Skeleton  Duch
//**************

INSTANCE Skeleton_Ghost (Mst_Default_Skeleton)
{
	name							=	"Szkielet-duch";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	40; 
	flags = NPC_FLAG_GHOST;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	120; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	120;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	160; 
	protection	[PROT_FIRE]			=	110;
	protection	[PROT_FLY]			=	110;
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton();	
	B_SetFightSkills (self, 100);
	EquipItem (self, ItMw_1h_MISC_Sword);

};

INSTANCE Skeleton_Ghost_Immortal (Mst_Default_Skeleton)
{
	name							=	"Szkielet-duch";
	guild							=	GIL_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	level							=	40; 
	// UWAGA - szkiele-duch Susan MA BY∆ nieúmiertelny!
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	120; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	120;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	160; 
	protection	[PROT_FIRE]			=	110;
	protection	[PROT_FLY]			=	110;
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	B_SetVisuals_Skeleton();	
	B_SetFightSkills (self, 100);
	EquipItem (self, ItNa_MieczSusan); // specjalny úwiecπcy miecz

};
