
instance NASZ_701_Invisible2 (Npc_Default)
{
	// ------ NSC ------
	name 		= "Przeklêty miecz";	
	guild 		= GIL_SKELETON;
	id 			= 701;
	voice 		= 20;
	flags 		= 1;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_MISC_Sword);

	// ------ Inventory ------

	// ------ visuals ------																			
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_701;
	
	var oCNpc slf; slf = hlp_getnpc(self);
	slf._zCVob_bitfield[0] = slf._zCVob_bitfield[0] & ~ zCVob_bitfield0_castDynShadow;
};

FUNC VOID Rtn_Start_701 ()
{	
	TA_Stand_ArmsCrossed		(08,00,23,00,"NASZ_OZYWIENIEC_42");
    TA_Stand_ArmsCrossed		(23,00,08,00,"NASZ_OZYWIENIEC_42");
};
