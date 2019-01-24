//************************
//	Lurker Prototype
//************************

PROTOTYPE Mst_Default_Lurker(C_Npc)			
{
	//----- Monster ----
	name							=	"Topielec";
	guild							=	GIL_LURKER;
	aivar[AIV_MM_REAL_ID]			= 	ID_LURKER;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_LURKER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
	
	CreateInvItems (self, ItNa_MiesoTopielca, 1);
};

//**************
//	Visuals
//**************

//---------------------------------------------------
func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Lurker2()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body2",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*************
//	Lurker
//*************

INSTANCE Lurker	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

//*************
//	Kervos Lurker
//*************

INSTANCE Kervo_Lurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;	//Joly: damit sie nicht in Kervos Höhle rennen.
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker4	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker5	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker6	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};


//Addon
//Beachlurker

INSTANCE BeachLurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};


//NASZ



PROTOTYPE Mst_Default_WscieklyLurker(C_Npc)			
{
	//----- Monster ----
	name							=	"Wœciek³y topielec";
	guild							=	GIL_LURKER;
	level							=	19;
	aivar[AIV_MM_REAL_ID]			= 	ID_WSCIEKLYLURKER;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	130;
	attribute	[ATR_HITPOINTS_MAX]	=	190;
	attribute	[ATR_HITPOINTS]		=	190;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]		=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]		=	100;
	protection	[PROT_FLY]		=	100;
	protection	[PROT_MAGIC]		=	100;
	
	//----- Damage Types----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_LURKER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;

	CreateInvItems (self, ItNa_MiesoTopielca, 1);

};




INSTANCE Topielec_Wsciekly_A	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_B	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_C	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_D	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_E	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_F	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_G	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_H	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_I	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_J	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_K	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE topielec_Wsciekly_L	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_M	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_N	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

INSTANCE Topielec_Wsciekly_O	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};


//*************
//	Wsciekly Topielec
//*************

INSTANCE Topielec_Wsciekly	(Mst_Default_WscieklyLurker)
{
	B_SetVisuals_Lurker2();
	Npc_SetToFistMode(self);
};

//*************
//	Grozny Topielec
//*************

INSTANCE GroznyTopielec	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	
	name							=	"GroŸny topielec";
	level							=	16;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	160;
	attribute	[ATR_HITPOINTS]		=	160;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	
};
