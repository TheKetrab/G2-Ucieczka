//*************************
//	BlackGobbo Prototype	
//*************************

PROTOTYPE Mst_Default_Gobbo_Warrior (C_NPC)			
{
	//----- Monster ----
	name							=	"Gobli�ski wojownik";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_BLACK;
	level							=	15;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
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
	fight_tactic	=	FAI_GOBBO;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Warrior ()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		2,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Warrior_Visir ()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		3,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Warrior (Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	
	Npc_SetToFightMode (self, ItMw_1h_Misc_Sword); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
	Mdl_SetModelScale(self, 1.15, 1.15, 1.15);
};

INSTANCE Gobbo_Warrior_Snaf (Mst_Default_Gobbo_Warrior)
{
	name = "Gruby goblin";
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode (self, ItMw_1h_Misc_Sword); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
	CreateInvItems(self,ItNa_Przepis_ZupaZDuzychGrzybow,1);
};

INSTANCE Gobbo_Warrior_Kivo (Mst_Default_Gobbo_Warrior)
{
	name = "B��dny goblin";
	B_SetVisuals_Gobbo_Warrior();
	attribute[ATR_STRENGTH] = 70;
	Npc_SetToFightMode (self, ItMw_Orkschlaechter); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
};


// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Warrior_Visir (Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	
	Npc_SetToFightMode (self, ItMw_1h_Misc_Axe); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
	Mdl_SetModelScale(self, 1.15, 1.15, 1.15);
};

