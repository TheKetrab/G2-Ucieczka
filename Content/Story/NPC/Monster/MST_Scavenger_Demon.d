//****************************
//	Scavenger-Demon Prototype
//****************************

PROTOTYPE Mst_Default_Scavenger_Demon(C_Npc)			
{
	//----- Monster ----
	name							=	NAME_ADDON_SCAVENGERGL;
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCAVENGER_DEMON;
	level							=	12;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections -----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SCAVENGER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
};


//************
//	Visuals
//************


func void B_SetVisuals_Scavenger_Demon()
{
	Mdl_SetVisual			(self,	"ScavengerGL.mds");
	//								Body-Mesh					Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Scavenger_Demon_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};



//***************
//	Scavenger    
//***************

INSTANCE Scavenger_Demon	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};



//***************
//	ScavengerGrozny    
//***************

INSTANCE Scavenger_Demon_Grozny	(Mst_Default_Scavenger_Demon)
{

	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);

	//----- Monster ----
	name							=	"Dziki preriowy œcierwojad";
	level							=	14;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	160;
	attribute	[ATR_HITPOINTS]		=	160;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections -----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	100;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

	Mdl_SetModelScale(self,	1.10,	1.10, 	1.10);
};

//***************
//	NiespokojnyScierwojad    
//***************

INSTANCE NiespokojnyScierwojad1	(Mst_Default_Scavenger_Demon)
{
	name = "Niespokojny œcierwojad";
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);

	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	120;
	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
};

INSTANCE NiespokojnyScierwojad2	(Mst_Default_Scavenger_Demon)
{
	name = "Niespokojny œcierwojad";
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);

	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	120;
	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
};

INSTANCE NiespokojnyScierwojad3	(Mst_Default_Scavenger_Demon)
{
	name = "Niespokojny œcierwojad";
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);

	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	120;
	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
};





INSTANCE QuestWrzodScavengerDemon	(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	guild = GIL_FRIENDLY_ORC;
	name	=	"Oswojony œcierwojad";
};