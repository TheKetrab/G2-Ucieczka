
instance NASZ_011_Renegat (Npc_Default)
{
	// ------ NSC ------
	name 		= "Renegat"; 
	guild 		= GIL_NONE;
	id 			= 11;
	voice 		= 14;
	flags       = 0;																
	npctype		= NPCTYPE_FRIEND;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_Pal_Sword); 
	
	
	// ------ Inventory ------
	// Händler
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart04, BodyTex_N,ITAR_PAL_M);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,75); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11;
};

FUNC VOID Rtn_Start_11 ()
{	
	TA_Stand_ArmsCrossed	(11,00,13,00,"NASZ_KOPALNIA_NOWY_03"); 
	TA_Stand_ArmsCrossed	(13,00,11,00,"NASZ_KOPALNIA_NOWY_03"); 
};

FUNC VOID Rtn_GoToStart_11 ()
{	
	TA_Stand_ArmsCrossed	(11,00,13,00,"NASZ_KOPALNIA_NOWY_01"); 
	TA_Stand_ArmsCrossed	(13,00,11,00,"NASZ_KOPALNIA_NOWY_01"); 
};

FUNC VOID Rtn_Kap2_11 ()
{	
	TA_Stand_ArmsCrossed	(11,00,13,00,"OW_MINE2_STAND_JERGAN"); 
	TA_Stand_ArmsCrossed	(13,00,11,00,"OW_MINE2_STAND_JERGAN"); 
};

FUNC VOID Rtn_Rabon_11 ()
{	
	TA_Sit_CampFire	(11,00,13,00,"OW_PATH_189"); 
	TA_Sit_CampFire	(13,00,11,00,"OW_PATH_189"); 
};

