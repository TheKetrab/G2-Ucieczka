
instance NASZ_229_Ayan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ayan";
	guild 		= GIL_OUT;
	id 			= 229;
	voice 		= 6;
	flags       = 2;	//Joly:nur solange Alnveres da ist!																
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	aivar[AIV_MagicUser] = MAGIC_NEVER;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
	self.attribute[ATR_DEXTERITY] = 80;	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------															
	EquipItem	(self, ItNa_Out_Weapon_H);
	EquipItem	(self, ItRw_Bow_H_02); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kharim, BodyTex_B, ITNA_OUT_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_229;
};

FUNC VOID Rtn_Start_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_A");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_A");
};

FUNC VOID Rtn_Most_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_B");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_B");
};

FUNC VOID Rtn_BeforeGraveyard_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_F");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_F");
};

FUNC VOID Rtn_Closed_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_T");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_T");
};

FUNC VOID Rtn_Hey_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_03");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_03");
};

FUNC VOID Rtn_StandInHey_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_03");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_03");
};

FUNC VOID Rtn_GoToBigHall_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_06");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_06");
};

FUNC VOID Rtn_StandInBigHall_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_07");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_07");
};

FUNC VOID Rtn_FollowGlaz_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_07");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_07");
};

FUNC VOID Rtn_GoToUpFloor_229 ()
{	
	TA_Guide_Player (08,00,22,00,"NASZ_OZYWIENIEC_19");
    TA_Guide_Player (22,00,08,00,"NASZ_OZYWIENIEC_19");
};

FUNC VOID Rtn_StandInUpFloor_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_20");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_20");
};

FUNC VOID Rtn_StandIn19_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_19");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_19");
};

FUNC VOID Rtn_StandInLift_229 ()
{	
	TA_RunToWP (08,00,22,00,"NASZ_OZYWIENIEC_08");
    TA_RunToWP (22,00,08,00,"NASZ_OZYWIENIEC_08");
};

//funkcja ktora rusza winda, zmienia tez rutyne ayanowi
FUNC VOID Rtn_FollowLift_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_25");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_25");
};

FUNC VOID Rtn_FollowToDead_229 ()
{	
	TA_Follow_Player (08,00,22,00,"NASZ_OZYWIENIEC_40");
    TA_Follow_Player (22,00,08,00,"NASZ_OZYWIENIEC_40");
};

FUNC VOID Rtn_Stand_229 ()
{	
	TA_Stand_WP (08,00,22,00,"NASZ_OZYWIENIEC_40");
    TA_Stand_WP (22,00,08,00,"NASZ_OZYWIENIEC_40");
};

FUNC VOID Rtn_Odpoczynek_229 ()
{
	TA_FleeToWP	(08,00,23,00,"OC_ROUND_1");
	TA_FleeToWP	(23,00,08,00,"OC_ROUND_1");		
};






FUNC VOID Rtn_Dead_229 ()
{	
	TA_Stand_WP (08,00,22,00,"TOT");
    TA_Stand_WP (22,00,08,00,"TOT");
};

FUNC VOID Rtn_Twierdza_229 ()
{
	TA_Stand_WP		(07,00,21,00,"NASZ_TWIERDZA_7");
	TA_Stand_WP		(21,00,07,00,"NASZ_TWIERDZA_7");
};

FUNC VOID Rtn_FollowZamek_229()
{	
	TA_RunToWP 			(08,00,23,00,"OC_PATH_01");
	TA_RunToWP			(23,00,08,00,"OC_PATH_01");
};

FUNC VOID Rtn_GoToScout_229()
{	
	TA_RunToWP 			(08,00,23,00,"OC_KNECHTCAMP_01");
	TA_RunToWP			(23,00,08,00,"OC_KNECHTCAMP_01");
};

FUNC VOID Rtn_GoToShaman_229()
{	
	TA_RunToWP 			(08,00,23,00,"OC_TRAIN_04");
	TA_RunToWP			(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_GoToDowodca_229()
{	
	TA_Stand_WP 			(08,00,23,00,"OC_TRAIN_04");
	TA_Stand_WP				(23,00,08,00,"OC_TRAIN_04");
};

FUNC VOID Rtn_AyansLastGuide_229()
{	
	TA_Guide_Player (08,00,23,00,"NASZ_OZYWIENIEC_40");
	TA_Guide_Player (23,00,08,00,"NASZ_OZYWIENIEC_40");
};


FUNC VOID Rtn_InCastle_229()
{	
	TA_Stand_Guarding 			(08,00,23,00,"OC_GUARD_PALISADE_05");
	TA_Stand_Guarding			(23,00,08,00,"OC_GUARD_PALISADE_05");
};


