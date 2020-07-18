//*********************
//	Ur-Shak
//*********************

INSTANCE NASZ_453_UrShak (Mst_Default_OrcShaman)
{
	name			=	"Ur-Shak";
	level			=	100;
	id = 453;

	//----- Attributes ----	
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	80;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 		=	100;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	140;
	protection	[PROT_EDGE]		=	140;
	protection	[PROT_POINT]		=	140;
	protection	[PROT_FIRE]		=	140;
	protection	[PROT_FLY]		=	140;
	protection	[PROT_MAGIC]		=	140;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]		= 	100;
	HitChance	[NPC_TALENT_2H]		= 	100;
	HitChance	[NPC_TALENT_BOW]	= 	60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 	60;
	
	// ------ Visuals ------
	B_SetVisuals_OrcShaman();
	
	//-------- Inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_04);
	EquipItem (self, ItNa_Kostur_UrShaka);
	
	//----- Daily Routine ----
	start_aistate				=  ZS_Kazmin;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};
