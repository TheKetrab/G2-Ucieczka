//********************************
//	DragonSnapper Prototype			
//********************************

PROTOTYPE Mst_Default_DragonSnapper(C_Npc)			
{
	//----- Monster ----
	name							=	"Smoczy zêbacz";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGONSNAPPER;
	level							=	22;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	110; 
	attribute	[ATR_DEXTERITY]		=	110;
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	170;
	protection	[PROT_EDGE]			=	170;
	protection	[PROT_POINT]		=	160;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
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
	fight_tactic	=	FAI_SNAPPER;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;
};


//***********
//	Visuals
//***********

func void B_SetVisuals_DragonSnapper()
{
	Mdl_SetVisual			(self,	"DragonSnapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Razor_Demon_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//********************
//	DragonSnapper    
//********************

INSTANCE DragonSnapper	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE DragonSnapper_Easy	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	80; 
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	280;
	attribute	[ATR_HITPOINTS]		=	280;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	20;
};



//****************************************************************************************************************************************************************************************************************************************************************************************
//	STORY-DragonSnapper    
//****************************************************************************************************************************************************************************************************************************************************************************************

//********************
//	Gaans_Snapper    
//********************

INSTANCE Gaans_Snapper	(Mst_Default_DragonSnapper)
{
	name	=	"Prychaj¹cy smoczy zêbacz";

	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

//********************
//	DragonSnapper Ammann   
//********************

INSTANCE DragonSnapper_Ammann_A	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE DragonSnapper_Ammann_B	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE DragonSnapper_Ammann_C	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

//********************
//	Warta
//********************

INSTANCE DragonSnapperWarta1	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE DragonSnapperWarta2	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
};

INSTANCE DragonSnapperWarta3	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
	guild = GIL_MEATBUG;
	name = "Ranny smoczy zêbacz";
	attribute[ATR_HITPOINTS] = 130;
};

INSTANCE DragonSnapperWarta4	(Mst_Default_DragonSnapper)
{
	B_SetVisuals_DragonSnapper();
	Npc_SetToFistMode(self);
	name	=	"Przywódca stada";
};
