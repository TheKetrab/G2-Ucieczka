
instance NASZ_405_VanGan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Van-Gan";
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 405;
	voice 		= 18;
	flags       = 0;
	npctype		= NPCTYPE_FRIEND;
	level		=	30;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

//----- Attribute -----   
	attribute	[ATR_STRENGTH]		=	180; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	800;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
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
  
   damagetype                   =   DAM_EDGE;
	
   fight_tactic   =    FAI_ORC;

   Mdl_SetVisual      (self,   "Orc.mds");
   Mdl_SetVisualBody   (self,   "Orc_BodyWarrior",   DEFAULT,   DEFAULT,   "Orc_HeadWarrior",   DEFAULT,     DEFAULT,   -1);

	EquipItem			(self, ItMw_2H_OrcAxe_03);
	
	CreateInvItems (self, ItMi_Nugget,1);
	
	daily_routine 		= Rtn_Start_405;  

};

FUNC VOID Rtn_Start_405 ()
{	
	 TA_Stand_WP 	(08,00,20,00,"NASZ_BANDYCI_OBOZ_19");
     	 TA_Stand_WP 	(20,00,08,00,"NASZ_BANDYCI_OBOZ_19");
};

FUNC VOID Rtn_GoA_405 ()
{
	TA_Guide_Player  (08,00,20,00,"MOVEMENT_OW_BLACKGOBBO_A2"); 
	TA_Guide_Player	 (20,00,08,00,"MOVEMENT_OW_BLACKGOBBO_A2");
};

FUNC VOID Rtn_GoB_405 ()
{
	TA_Guide_Player  (08,00,20,00,"NASZ_BANDYCI_ARENA_3"); 
	TA_Guide_Player	 (20,00,08,00,"NASZ_BANDYCI_ARENA_3");
};

FUNC VOID Rtn_GoC_405 ()
{
	TA_Follow_Player   (08,00,20,00,"NASZ_BANDYCI_ARENA_3"); 
	TA_Follow_Player   (20,00,08,00,"NASZ_BANDYCI_ARENA_3");
};