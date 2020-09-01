//****************************
//	Orc SHAMAN Prototype		
//****************************

PROTOTYPE Mst_Default_OrcShaman(C_Npc)			
{
	//----- Monster ----
	name							=	"Ork-szaman";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCSHAMAN;
	voice							=	18;
	level							=	25;
	
	//----- Attributes ----	
	attribute	[ATR_STRENGTH]		=	40; //MIN 100! + ca. 70 Waffe
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	75;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	protection	[PROT_MAGIC]		=	75;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE;
	senses_range	= PERC_DIST_MONSTER_ACTIVE_MAX;
	//senses_range	= 	PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};


//****************
//	Visuals
//****************

func void B_SetVisuals_OrcShaman()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_NewOrcShaman()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	//Mdl_SetVisualBody		(self,	"Orc_BodyNewShaman",	DEFAULT,	DEFAULT,	"Orc_HeadNewShaman",	DEFAULT,  	DEFAULT,	-1);
	Mdl_SetVisualBody		(self,	"Orc_BodyNewShaman",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_OrcShamanStone()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShamanStone",	DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};


//****************
//	Orc Shaman    
//****************

INSTANCE OrcShaman_Sit (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcNewShaman (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_NewOrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcShamanStone (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_OrcShamanStone();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

// ORCCITY
INSTANCE OrcShaman_ORCCITY_MAGICCOIN (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	name = "Ur-Kash";
	EquipItem (self, ItMw_2H_OrcAxe_01);
	CreateInvItems (self, ItNa_MagicznaMoneta, 3);									
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

//*********************
//	Hosh-Pak
//*********************

INSTANCE OrcShaman_Hosh_Pak (Mst_Default_OrcShaman)
{
	name							=	"Hosh-Pak";
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};
INSTANCE OrcShaman_Hosh_Pak_Ghost (Mst_Default_OrcShaman)
{
	name							=	"Duch Hosh-Paka";
	flags 							= 	4;
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};
//****************
//	Orc Shaman    
//****************

INSTANCE OrcShaman_Sit_CanyonLibraryKey (Mst_Default_OrcShaman)
{
	name							=	"Anführer der Horde";
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	CreateInvItems (self, ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON, 1);									
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};


//****************
//	Szaman Herszt    
//****************

INSTANCE OrcShamanHerszt (Mst_Default_OrcShaman)
{
	name = "Szaman-Herszt";
	level = 85;

//----- Attributes ----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	125;
	attribute	[ATR_MANA] 		=	125;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]		=	130;
	protection	[PROT_POINT]		=	130;
	protection	[PROT_FIRE]		=	130;
	protection	[PROT_FLY]		=	130;
	protection	[PROT_MAGIC]		=	130;

	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//****************
//	Orc Shaman Obozy
//****************

INSTANCE OrcShaman_Sit_ObozPalisade (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem (self, ItMw_2H_OrcAxe_01);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcShaman_Sit_ObozLasOC (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem (self, ItMw_2H_OrcAxe_01);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcShaman_Sit_ObozKopalnia (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem (self, ItMw_2H_OrcAxe_01);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcShaman_Sit_ObozZamek (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem (self, ItMw_2H_OrcAxe_01);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

INSTANCE OrcShaman_Sit_ObozKlif (Mst_Default_OrcShaman)
{
	B_SetVisuals_OrcShaman();
	EquipItem (self, ItMw_2H_OrcAxe_01);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

//******** Fort Friendly ***********
INSTANCE OrcShaman_FortA (Mst_Default_OrcShaman)
{
	//-------- visual --------
	B_SetVisuals_OrcShaman();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_01);
};

INSTANCE OrcShaman_FortB (Mst_Default_OrcShaman)
{
	//-------- visual --------
	B_SetVisuals_OrcShaman();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_01);
};

INSTANCE OrcShaman_FortC (Mst_Default_OrcShaman)
{
	//-------- visual --------
	B_SetVisuals_OrcShaman();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_01);
};