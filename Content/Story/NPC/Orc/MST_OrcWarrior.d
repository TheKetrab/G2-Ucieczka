//*****************************
//	Orc WARRIOR Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcWarrior(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork-wojownik";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice							=	18;
	level							=	20;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	60; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
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

func void B_SetVisuals_OrcWarrior()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Orc Warrior Roam    														
//******************

INSTANCE OrcWarrior_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//******************
//	Orc Warrior Rest    														
//******************

INSTANCE OrcWarrior_Rest (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	45;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//******************
//	Orc Warrior Sit    														
//******************

INSTANCE OrcWarrior_Sit (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};



//******************************************************************************************************************************************************************************************************
//	Story Orks   														
//******************************************************************************************************************************************************************************************************

// ------ Ork vor Stadt ------
INSTANCE OrcWarrior_Harad (Mst_Default_OrcWarrior)
{
	name							=	"Ork-zwiadowca";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	75;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


// ----- Lobarts Orks ------
INSTANCE OrcWarrior_Lobart1 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart2 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart3 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart4 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart5 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart6 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//******************
//	Orc Miecz 														
//******************
/*
INSTANCE OrcMiecz (Mst_Default_OrcWarrior)
{
	//----- Monster -----
	name					=	"Ork-wojownik";
	guild					=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice					=	18;
	level					=	20;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 		=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]		=	60;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]		=	60;
	protection	[PROT_FLY]		=	60;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]		= 60;

	//-------- Visual --------
	B_SetVisuals_OrcWarrior();

	//-------- Inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	aivar[AIV_FollowDist] = 25;
};
*/
//******************
//	Orc Warrior Keroloth														
//******************

INSTANCE Orc_Keroloth_A (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	name							=	"Ork-wygnaniec";
	attribute	[ATR_HITPOINTS_MAX] =	80;
	attribute	[ATR_HITPOINTS]		=	55;
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;

	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	20;
	
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE Orc_Keroloth_B (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	name							=	"Ork-wygnaniec";
	attribute	[ATR_HITPOINTS_MAX] =	80;
	attribute	[ATR_HITPOINTS]		=	35;
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	20;
	
	B_SetVisuals_OrcWarrior();
	Createinvitems (self, ItRi_Prot_Total_02, 1);

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//******************
//	Erak's Orcs 														
//******************

INSTANCE Orc_Erak_A (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE Orc_Erak_B (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE Orc_Erak_C (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE Orc_Erak_D (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE Orc_Erak_E (Mst_Default_OrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};

//******************
//	Twierdza   														
//******************

INSTANCE OrcWarrior_TwierdzaA (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaB (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaC (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaD (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaE (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaF (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaG (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaH (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_TwierdzaI (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};


//*********** ZAMEK ************
INSTANCE OrcWarrior_ZamekA (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_ZamekB (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

//******************
//	Orc Warrior Roam & Rest Obozy  														
//******************

INSTANCE OrcWarrior_Roam_ObozPalisade (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Rest_ObozPalisade (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Roam_ObozZamek (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Rest_ObozZamek (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Roam_ObozLasOC (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Rest_ObozLasOC (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Roam_ObozKopalnia (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Rest_ObozKopalnia (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Roam_ObozKlif (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Rest_ObozKlif (Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem (self, ItMw_2H_OrcAxe_03);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//*********** FORT FRIENDLY ************
INSTANCE OrcWarrior_FortA (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortB (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortC (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortD (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortE (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortF (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};

INSTANCE OrcWarrior_FortG (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;

	guild 		=		GIL_FRIENDLY_ORC;
	EquipItem (self, ItMw_2H_OrcAxe_02);
};
