//***************************
//	Molerat Prototype	
//***************************

PROTOTYPE Mst_Default_Molerat(C_Npc)			
{
	//----- Monster ----
	name							=	"Kretoszczur";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	5;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	40;	
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	25;	
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
	fight_tactic	=	FAI_MOLERAT;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Molerat()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Molerat2()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Molerat	
//*****************
INSTANCE Molerat	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

//*****************
//	Young Molerat	
//*****************
INSTANCE YMolerat	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);

	//----- Monster ----

	name							=	"M≥ody kretoszczur";
	level							=	2;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;	

	CreateInvItems (self, ItFoMuttonRaw, 1);
};

//*****************
//	Grozny Kretoszczut
//*****************
INSTANCE GroznyKretoszczur	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat2();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	
	name							=	"Groüny kretoszczur";
	level							=	10;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	110;
	attribute	[ATR_HITPOINTS]		=	110;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;	
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;	

};


INSTANCE QuestWrzodMolerat	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	guild = GIL_FRIENDLY_ORC;
	name	=	"Oswojony kretoszczur";
};