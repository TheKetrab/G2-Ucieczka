//*****************************
//	Orc WARRIOR Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcScout(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork-kusznik";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCSCOUT;
	voice							=	18;
	level							=	25;
		
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
		
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	80;
		
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//-------- Inventory --------
	EquipItem (self, ItNa_MlotOrkow);
	EquipItem (self, ItNa_OrkowaKusza);

	
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
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_MONSTER_ACTIVE_MAX;
	//senses_range	= PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

//**************
//	Visuals
//**************

func void B_SetVisuals_OrcScout()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYSCOUT",	DEFAULT,	DEFAULT,	"Orc_HeadSlave",	DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Orc Scout   														
//******************

INSTANCE OrcScout (Mst_Default_OrcScout)
{
	//-------- visual --------
	B_SetVisuals_OrcScout();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//******************
//	Twierdza   														
//******************

INSTANCE OrcScout_TwierdzaA (Mst_Default_OrcScout)
{
	//-------- visual --------
	B_SetVisuals_OrcScout();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
};

INSTANCE OrcScout_TwierdzaB (Mst_Default_OrcScout)
{
	//-------- visual --------
	B_SetVisuals_OrcScout();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
};

//*********** ZAMEK ************
INSTANCE OrcScout_ZamekA (Mst_Default_OrcScout)
{
	//-------- visual --------
	B_SetVisuals_OrcScout();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
};

INSTANCE OrcScout_ZamekB (Mst_Default_OrcScout)
{
	//-------- visual --------
	B_SetVisuals_OrcScout();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
};

//****************
//	Scout Herszt    
//****************

INSTANCE OrcScoutHerszt (Mst_Default_OrcScout)
{
	name = "Zwiadowca-Herszt";
	level = 85;

//----- Attributes ----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	125;
	attribute	[ATR_MANA] 		=	125;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]		=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]		=	100;
	protection	[PROT_FLY]		=	100;
	protection	[PROT_MAGIC]		=	100;

	// ------ visuals ------
	B_SetVisuals_OrcScout();
		
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};