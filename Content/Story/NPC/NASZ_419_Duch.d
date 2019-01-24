
instance NASZ_419_Duch (Npc_Default)
{
	// ------ NSC ------
	name 		= "Duch";	
	guild 		= GIL_BDT;
	id 			= 419;
	voice 		= 18;
	flags 		= NPC_FLAG_GHOST;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	EquipItem			(self, ItMw_2H_OrcAxe_03);

	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//				Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",		DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self,	1.20,	1.20, 	1.20);

	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_419;
};

FUNC VOID Rtn_Start_419 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"FP_ORCTOWN_02");
    TA_Stand_ArmsCrossed		(23,00,08,00,"FP_ORCTOWN_02");
};
