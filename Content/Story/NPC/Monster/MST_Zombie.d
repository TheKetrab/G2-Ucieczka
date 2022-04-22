//*********************
//	Zombie Prototype	
//*********************

PROTOTYPE Mst_Default_Zombie(C_Npc)			
{
	//----- Monster ----
	name							=	"Zombie";
	guild							=	GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_ZOMBIE;
	level							=	10;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	30;	
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Type ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ZOMBIE;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void B_SetVisuals_Zombie01()
{
var int RandomZombieFace;

	Mdl_SetVisual			(self,	"Zombie.mds");

	RandomZombieFace = Hlp_Random (5);
	
	if (RandomZombieFace < 2) {
		Mdl_SetVisualBody 		(self,	"HUM_BODY_NAKED0",		ZombieBlack,			0,			"Hum_Head_Bald", Face_ZombieBlack1,  		DEFAULT,	-1);
	}
	
	else if (RandomZombieFace == 2) {
		Mdl_SetVisualBody 		(self,	"HUM_BODY_NAKED0",		ZombieBlack,			0,			"Hum_Head_Bald", Face_ZombieBlack2,  		DEFAULT,	-1);
	}
	
	else if (RandomZombieFace == 3) {
		//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony",Face_ZombiePale1, ZombiePale, NO_ARMOR);	
		Mdl_SetVisualBody 		(self,	"HUM_BODY_NAKED0",		ZombiePale,			0,			"Hum_Head_Pony", Face_ZombiePale1,  		DEFAULT,	-1);
	}
	
	else {
		Mdl_SetVisualBody 		(self,	"HUM_BODY_NAKED0",		ZombiePale,			0,			"Hum_Head_Pony", Face_ZombiePale2,  		DEFAULT,	-1);
	};
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	-1);
};
//-------------------------------------------------------------
func void B_SetVisuals_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	-1);
};


//***********
//	Zombie01   
//***********

INSTANCE Zombie01		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie01_OutCamp1		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};
INSTANCE Zombie01_OutCamp2		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};
INSTANCE Zombie01_OutCamp3		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};


INSTANCE Zombie0exp		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
	level = 0;
};

//************
//	Zombie02  
//************

INSTANCE Zombie02	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie02();
	Npc_SetToFistMode(self);
};


//*************
//	Zombie03   
//*************

INSTANCE Zombie03	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie03();
	Npc_SetToFistMode(self);
};


//*************
//	Zombie04   	
//*************

INSTANCE Zombie04	(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie04();
	Npc_SetToFistMode(self);
};

//********************************
//	Bloodwyn Zombie 	
//********************************
INSTANCE Zombie_Addon_Knecht	(Mst_Default_Zombie)
{
	
	name 			= "S³uga Kruka";
	
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Thorus_Addon);
	
	Npc_SetToFistMode(self);
};
//********************************
//	Bloodwyn Zombie 	
//********************************
INSTANCE Zombie_Addon_Bloodwyn	(Mst_Default_Zombie)
{
	
	name = "O¿ywiony Bloodwyn";
	level							=	25;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1600;
	attribute	[ATR_HITPOINTS]		=	1600;
	
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_Thorus_Addon);
	
	Npc_SetToFistMode(self);
};

//********************************
//	Paladin Zombies
//********************************
func void ZS_Pal_ZOMBIE ()
{
	self.senses			=	SENSE_SMELL ;
	self.senses_range	=	2000;	
	Npc_SetPercTime		(self, 1);	
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER	, 	B_Pal_ZOMBIE_RISE	); 

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
		
func int ZS_Pal_ZOMBIE_Loop ()	
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
  	{
  		AI_PlayAni (self,"T_DOWN");
  		self.aivar[AIV_TAPOSITION] = ISINPOS;
  	};
	return LOOP_CONTINUE;
};

func void ZS_Pal_ZOMBIE_END()
{
	
};

func void B_Pal_ZOMBIE_RISE ()
{
	if (Npc_GetDistToNpc (self,hero) <= 1400)
	{
		AI_PlayAni (self,"T_RISE");
		
		
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		self.bodyStateInterruptableOverride 	= FALSE;
		self.start_aistate				= ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] 	= OnlyRoutine;
	};
		
};



func void B_SetVisuals_Pal_Zombie01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_PAL_SKEL);
};

//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_PAL_SKEL);
};
//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_PAL_SKEL);
};
//-------------------------------------------------------------
func void B_SetVisuals_Pal_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_PAL_SKEL);
};


INSTANCE Pal_Zombie01		(Mst_Default_Zombie)
{
	level = 25;

	B_SetVisuals_Pal_Zombie01();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie02		(Mst_Default_Zombie)
{
	level = 25;

	B_SetVisuals_Pal_Zombie02();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie03		(Mst_Default_Zombie)
{
	level = 25;

	B_SetVisuals_Pal_Zombie03();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE Pal_Zombie04		(Mst_Default_Zombie)
{
	level = 25;

	B_SetVisuals_Pal_Zombie04();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//MayaZobies
func void B_SetVisuals_Maya_Zombie01()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		DEFAULT,	ITAR_MayaZombie_Addon);
};

//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie02()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		DEFAULT,	ITAR_MayaZombie_Addon);
};
//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie03()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		DEFAULT,	ITAR_MayaZombie_Addon);
};
//-------------------------------------------------------------
func void B_SetVisuals_Maya_Zombie04()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		DEFAULT,	ITAR_MayaZombie_Addon);
};

INSTANCE MayaZombie01		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie01();
	Npc_SetToFistMode(self);
	
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE MayaZombie02		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie02();
	Npc_SetToFistMode(self);
};

INSTANCE MayaZombie03		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie03();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_Pal_ZOMBIE;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE MayaZombie04		(Mst_Default_Zombie)
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};
//*************
//	Einer der Totenwächter  	
//*************

INSTANCE MayaZombie04_Totenw	(Mst_Default_Zombie) 
{
	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

//************************
//	SummonedZombie
//***********************

INSTANCE Summoned_Zombie		(Mst_Default_Zombie)
{
	name							= NAME_Addon_Summoned_Zombie;
	guild							= GIL_SUMMONEDZombie;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONEDZombie;
	level							= 0;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 200;
	attribute	[ATR_DEXTERITY]		= 200;

	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;

	B_SetVisuals_Maya_Zombie04();
	Npc_SetToFistMode(self);
};

//************************
//	Ozywieniec
//***********************

INSTANCE Ozywieniec		(Mst_Default_Zombie)
{
	name							= "O¿ywieniec";
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONEDZombie;
	level = 70;

	//----- Attribute ----
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;
	attribute	[ATR_STRENGTH]		= 1000;
	attribute	[ATR_DEXTERITY]		= 1000;

	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;	
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	0;

	B_SetVisuals_Pal_Zombie04();
	Npc_SetToFistMode(self);
};

//***********
//	KAP4Event   
//***********

INSTANCE Zombie31		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie32		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie33		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie34		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie35		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie36		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie37		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie38		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie39		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie40		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie41		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie42		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie43		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie44		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie45		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};

INSTANCE Zombie46		(Mst_Default_Zombie)
{
	B_SetVisuals_Zombie01();
	Npc_SetToFistMode(self);
};
