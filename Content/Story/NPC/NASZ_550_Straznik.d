
instance NASZ_550_Straznik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stra¿nik portalu";
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 550;
	voice 		= 18;
	flags       = 0;
	npctype		= NPCTYPE_FRIEND;
	level		=	30;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

//----- Attribute -----   
	attribute	[ATR_STRENGTH]		=	80; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	800;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
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
   Mdl_SetVisualBody   (self,   "UOS_Body",   DEFAULT,   DEFAULT,   "",   DEFAULT,     DEFAULT,   -1);
   Mdl_SetModelScale(self,	1.10,	1.10, 	1.10);

   EquipItem (self, ItNa_ShaBaNakk);

	daily_routine 		= Rtn_Start_550;  

};

FUNC VOID Rtn_Start_550 ()
{	
	 TA_Stand_WP 	(08,00,20,00,"NASZ_ORCCITY_PORTAL_17");
     TA_Stand_WP 	(20,00,08,00,"NASZ_ORCCITY_PORTAL_17");
};
