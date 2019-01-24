
instance NASZ_228_Chris (Npc_Default)
{
	// ------ NSC ------
	name 		= "Chris";
	guild 		= GIL_OUT;
	id 			= 228;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	attribute	[ATR_HITPOINTS_MAX]	=	2000;
	attribute	[ATR_HITPOINTS]		=	2000;

	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRw_Arrow,25);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITNA_OUT_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_228;
};

FUNC VOID Rtn_Start_228 ()
{
	TA_Stand_Guarding		(04,30,10,40,"NASZ_MYSLIWI_BALKON_04");
	TA_SmallTalk		(10,40,13,45,"NASZ_MYSLIWI_BALKON_04");
	TA_Sit_CampFire		(13,45,19,35,"NASZ_MYSLIWI_BALKON_02");
	TA_Roast_Scavenger		(19,35,23,20,"NASZ_MYSLIWI_BALKON_01");	 
	TA_Sit_CampFire		(23,20,04,30,"NASZ_MYSLIWI_BALKON_02");
};

FUNC VOID Rtn_Guide_228 ()
{
	TA_Guide_Player 	(07,00,19,00,"OW_PATH_100");
	TA_Guide_Player 		(19,00,07,00,"OW_PATH_100");	
};

FUNC VOID Rtn_Guide2_228 ()
{
	TA_Guide_Player 	(07,00,19,00,"OW_PATH_340");
	TA_Guide_Player 		(19,00,07,00,"OW_PATH_340");	
};
