
instance NASZ_451_OrkMiecz (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ork";
	guild 		= GIL_ORC;
	id 			= 451;
	voice 		= 18;
	flags       = 0;
	npctype		= NPCTYPE_FRIEND;
	level		=	30;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

//----- Attribute -----   
	attribute	[ATR_STRENGTH]		=	55; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	30;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
  
   damagetype                   =   DAM_EDGE;
	
   fight_tactic   =    FAI_ORC;
   
   senses			= 	SENSE_HEAR | SENSE_SEE;
	senses_range	= 500;

   Mdl_SetVisual      (self,   "Orc.mds");
   Mdl_SetVisualBody   (self,   "ORC_BODYSCOUT",   DEFAULT,   DEFAULT,   "Orc_HeadSlave",   DEFAULT,     DEFAULT,   -1);

	EquipItem			(self, ItMw_2H_OrcAxe_02);
	
	CreateInvItems (self, ItMi_Nugget,1);
	
	daily_routine 		= Rtn_Start_451;  

};

FUNC VOID Rtn_Start_451 ()
{	
	 TA_Stand_WP 	(04,10,23,40,"TOT");
	TA_Stand_WP 	(23,40,04,10,"NASZ_MIECZ_6");
};
