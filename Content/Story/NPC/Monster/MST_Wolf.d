//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Wilk";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	6;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	0;

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};


//************
//	Visuals
//************


func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Wolf2()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Dog()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"DOG_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Wolf    	
//************

INSTANCE Wolf	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//*****************
//	Summoned Wolf    	
//*****************

INSTANCE Summoned_Wolf	(Mst_Default_Wolf)
{
	name							=	"Przyzwany wilk";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//************
//	YWolf    	
//************

INSTANCE YWolf	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"M³ody wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};



//************
//	Missions Wölfe für Pepe: YWolf    	
//************


INSTANCE PEPES_YWolf1	(Mst_Default_Wolf)
{
	name							=	"Mlody wilk";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf2	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Mlody wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf3	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Mlody wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf4	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"Mlody wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

//************
//	Grozny Wilk    	
//************

PROTOTYPE Mst_Default_GroznyWilk(C_Npc)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);

	name							=	"GroŸny wilk";
	level							=	12;
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	140;
	attribute	[ATR_HITPOINTS]		=	140;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
	
	damagetype 						=	DAM_EDGE;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
	
};

INSTANCE GroznyWilk	(Mst_Default_GroznyWilk)
{
	B_SetVisuals_Wolf2();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//************
//	OrcDog    	
//************

PROTOTYPE Mst_Default_OrcDog(C_Npc)
{
	B_SetVisuals_Dog();
	Npc_SetToFistMode(self);

	name							=	"Orkowy pies";
	level							=	15;
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCDOG;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	110;
	attribute	[ATR_DEXTERITY]		=	110;
	attribute	[ATR_HITPOINTS_MAX]	=	280;
	attribute	[ATR_HITPOINTS]		=	280;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_FIRE]			=	130;
	protection	[PROT_FLY]			=	130;
	
	damagetype 						=	DAM_EDGE;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	aivar[AIV_POISON] = POISON_3;
	
};

INSTANCE OrcDog	(Mst_Default_OrcDog)
{
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItNa_SkoraOrkowegoPsa, 1);
};

INSTANCE OrcDog_Easy(Mst_Default_OrcDog)
{
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItNa_SkoraOrkowegoPsa, 1);

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	140;
	attribute	[ATR_HITPOINTS]		=	140;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;

};




//************
//	Zatruty    	
//************
INSTANCE WscieklyWilk	(Mst_Default_GroznyWilk)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	name							=	"Wœciek³y wilk";
	level							=	15;

	CreateInvItems (self, ItFoMuttonRaw, 1);
	aivar[AIV_POISON] = POISON_2;
};


INSTANCE DuchWilk	(Mst_Default_GroznyWilk)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);

	flags = NPC_FLAG_GHOST;
	name							=	"Pradziad wilków";
	level							=	40;

	aivar[AIV_MM_REAL_ID]			= 	ID_SKELETON;
	
	Mdl_SetModelScale(self,	1.15,	1.15, 	1.15);
	
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
};