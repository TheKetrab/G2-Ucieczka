
instance NASZ_412_CatSan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cat-San";	
	guild 		= GIL_FRIENDLY_ORC;
	id 			= 412;
	voice 		= 50;
	flags 		= NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
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
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",		DEFAULT,  	DEFAULT,	-1);
	
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_412;
};

FUNC VOID Rtn_Start_412 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"LOCATION_19_03_SECOND_ETAGE4");
    TA_Stand_ArmsCrossed		(23,00,08,00,"LOCATION_19_03_SECOND_ETAGE4");
};
FUNC VOID Rtn_UrShack_412 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"OW_ROCKDRAGON_11");
    TA_Stand_ArmsCrossed		(23,00,08,00,"OW_ROCKDRAGON_11");
};
