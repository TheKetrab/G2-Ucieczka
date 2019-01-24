//*************************
//	Giant_Rat Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Rat(C_Npc)			
{
	//----- Monster ----
	name							=	"Olbrzymi szczur";
	guild							=	GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	3;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_RAT;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Rat    
//***************

INSTANCE Giant_Rat	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//**************************************
//	junge Giant_Rat   (f�r Spielstart) 	
//**************************************

INSTANCE YGiant_Rat	(Mst_Default_Giant_Rat)
{
	//----- Monster ----
	name							=	"M�ody olbrzymi szczur";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	0;

	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;

	//----- Visuals ----
	B_SetVisuals_Giant_Rat();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//*************************
//	Giant_Rat_Huge Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Rat_Huge(C_Npc)			
{
	//----- Monster ----
	name							=	"Paskudny szczur";
	guild							=	GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	8;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	45;
	attribute	[ATR_HITPOINTS]		=	45;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	30;
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_RAT;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

INSTANCE Giant_Rat_Huge01	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge02	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge03	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge04	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge05	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge06	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge07	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge08	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge09	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge10	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge11	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge12	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge13	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge14	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge15	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge16	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge17	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge18	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge19	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge20	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge21	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge22	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge23	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge24	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge25	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge26	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge27	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge28	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge29	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Giant_Rat_Huge30	(Mst_Default_Giant_Rat_Huge)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};