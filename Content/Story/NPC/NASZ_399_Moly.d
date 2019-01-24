instance NASZ_399_Moly (Npc_Default)
{
	// ------ NSC ------
	name 		= "Moly";
	//guild 		= GIL_NONE;
	//guild 		= GIL_FRIENDLY_ORC;
	guild							=	GIL_SHEEP;
	id 			= 399;
	voice 		= 8;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	//aivar[AIV_MM_REAL_ID]			= 	ID_SHEEP;

	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 10;
	slf.attribute[ATR_DEXTERITY] 		= 10;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 10;
	slf.attribute[ATR_HITPOINTS] 		= 10;															
		
	// ------ Kampf-Taktik ------
	//fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------

	// ------ Inventory ------
	//B_CreateAmbientInv (self);
		
	// ------ visuals ------																			
	
	Mdl_SetVisual			(self,	"Sheep.mds");
	Mdl_SetVisualBody	(self,	"Sheep_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak05, BodyTex_N, -1);		
	//Mdl_SetModelFatness	(self, 3);
	//Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	//B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	//B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= ZS_MM_AllScheduler; //Rtn_Start_399;
	//senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	//senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	//aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	//aivar[AIV_MM_FollowInWater] = FALSE;
	
	//start_aistate				= ZS_MM_AllScheduler;
	//aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};

FUNC VOID Rtn_Start_399 ()
{	
	TA_Stand_WP		(08,00,23,00,"NASZ_BANDYCI_OBOZ_16");
    TA_Stand_WP		(23,00,08,00,"NASZ_BANDYCI_OBOZ_16");
};

FUNC VOID Rtn_Follow_399 ()
{	
	TA_Follow_Player		(08,00,23,00,"OW_PATH_07_15_CAVE3");
    TA_Follow_Player		(23,00,08,00,"OW_PATH_07_15_CAVE3");
};

FUNC VOID Rtn_Second_399 ()
{	
	TA_Stand_WP		(08,00,23,00,"OW_PATH_07_15_CAVE3");
    TA_Stand_WP		(23,00,08,00,"OW_PATH_07_15_CAVE3");
};
