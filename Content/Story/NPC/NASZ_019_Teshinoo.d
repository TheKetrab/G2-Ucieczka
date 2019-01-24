
instance NASZ_019_Teshinoo (Npc_Default)
{
	// ------ NSC ------
	name 		= "Teshinoo";
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 19;
	voice 		= 18;
	flags       = 0;
	npctype		= NPCTYPE_FRIEND;
	level		=	20;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

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
  
   damagetype                   =   DAM_EDGE;
	
   fight_tactic   =    FAI_ORC;

   Mdl_SetVisual      (self,   "Orc.mds");
   Mdl_SetVisualBody   (self,   "ORC_BODYSCOUT",   DEFAULT,   DEFAULT,   "Orc_HeadSlave",   DEFAULT,     DEFAULT,   -1);

	daily_routine 		= Rtn_Start_19;  

};

FUNC VOID Rtn_Start_19 ()
{	
	TA_Stand_WP 	(08,00,20,00,"NASZ_ORCCITY_PRISON_02");
    TA_Stand_WP 	(20,00,08,00,"NASZ_ORCCITY_PRISON_02");
};

FUNC VOID Rtn_GoToYou_19 ()
{
	TA_Stand_WP  (08,00,20,00,"NASZ_ORCCITY_PRISON_04"); 
	TA_Stand_WP	 (20,00,08,00,"NASZ_ORCCITY_PRISON_04");
};

FUNC VOID Rtn_FollowMain_19 ()
{
	TA_Follow_Player	(08,00,20,00,"NASZ_ORCCITY_MAIN_02"); 
	TA_Follow_Player	(20,00,08,00,"NASZ_ORCCITY_MAIN_02");
};

FUNC VOID Rtn_GuidePrison_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_PRISON_07"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_PRISON_07");
};

FUNC VOID Rtn_GuideSchool_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_SECOND_02"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_SECOND_02");
};

FUNC VOID Rtn_GuideShaman_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_MAIN_08"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_MAIN_08");
};

FUNC VOID Rtn_GuidePortal_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_PORTAL_10"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_PORTAL_10");
};

FUNC VOID Rtn_GuideBoss_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_FIRST_06"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_FIRST_06");
};

FUNC VOID Rtn_GuideMain_19 ()
{
	TA_Guide_Player	(08,00,20,00,"NASZ_ORCCITY_MAIN_02"); 
	TA_Guide_Player	(20,00,08,00,"NASZ_ORCCITY_MAIN_02");
};
