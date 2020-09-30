
instance NASZ_430_StaryTrup (Npc_Default)
{
	// ------ NSC ------
	name 		= "Stary trup";	
	guild 		= GIL_SKELETON;
	id 			= 430;
	voice 		= 20;
	flags 		= 1;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	protection	[PROT_BLUNT]		=	140;
	protection	[PROT_EDGE]			=	140;
	protection	[PROT_POINT]		=	120;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	0;
		slf.attribute[ATR_HITPOINTS_MAX] = 800;
		slf.attribute[ATR_HITPOINTS] = 800;

	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	EquipItem	(self, ItRw_Bow_H_01); 
	CreateInvItems (self, ItRw_Arrow,25);
	CreateInvItems (self, ItNa_Mapa_Adanos,1);

	
	// ------ visuals ------																			
	//B_SetNpcVisual 		(self, "Ske_Body", "Hum_Head_Bald",1,1,-1);		
	//Mdl_SetModelFatness	(self, 0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 	
		//B_SetVisuals_Skeleton();
		//Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	// ------ NSC-relevante Talente vergeben ------
	
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//				Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",		DEFAULT,  	DEFAULT,	-1);
	
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_430;
};

FUNC VOID Rtn_Start_430 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_FOGTOWER_01");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_FOGTOWER_01");
};
