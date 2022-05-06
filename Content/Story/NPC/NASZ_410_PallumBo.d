
instance NASZ_410_PallumBo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pallum-Bo";
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 410;
	voice 		= 18;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_OCMAIN;
	level		=	50;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	//----- Attribute -----   
	attribute	[ATR_STRENGTH]		=	180; //+100 Waffe //MIN 120!
	attribute	[ATR_DEXTERITY]		=	130; 
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	100;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 100;
	HitChance	[NPC_TALENT_2H]			= 100;
	HitChance	[NPC_TALENT_BOW]		= 100;
	HitChance	[NPC_TALENT_CROSSBOW]	= 100;
  		
   damagetype                   =   DAM_EDGE;
	
   fight_tactic   =    FAI_ORC;

   Mdl_SetVisual      (self,   "Orc.mds");
   Mdl_SetVisualBody   (self,   "Orc_BodyElite",   DEFAULT,   DEFAULT,   "Orc_HeadWarrior",   DEFAULT,     DEFAULT,   -1);

	EquipItem			(self, ItNa_RekaTrolla);
	
	CreateInvItems (self, ItMi_Nugget,1);
	
	daily_routine 		= Rtn_Start_410;  
	
	PallumBoInserted = true;

};

FUNC VOID Rtn_Start_410 ()
{	
	 TA_Stand_WP 	(08,00,20,00,"NASZ_BANDYCI_ARENA_4");
     	 TA_Stand_WP 	(20,00,08,00,"NASZ_BANDYCI_ARENA_4");
};
