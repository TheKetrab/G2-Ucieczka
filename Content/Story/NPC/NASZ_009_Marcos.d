
instance NASZ_009_Marcos  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marcos";
	guild 		= GIL_NONE;
	id 			= 9;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_OCMAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
	
	self.attribute[ATR_HITPOINTS_MAX] = 230;
	self.attribute[ATR_HITPOINTS] = 230;
	
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Pal_Sword);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	CreateInvItems (self, ItRw_Bolt,25);
	CreateInvItems (self, ItPo_Health_03,5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_9;
};

FUNC VOID Rtn_Start_9 ()
{	
	TA_Sit_Bench		(09,30,19,30,"NASZ_KOPALNIA_NOWY_02");
    TA_Sleep			(19,30,09,30,"NASZ_KOPALNIA_NOWY_02");
};

FUNC VOID Rtn_Follow_9 ()
{	
	TA_Follow_Player	(08,30,21,30,"NASZ_KOPALNIA_NOWY_02");
    TA_Follow_Player	(21,30,08,30,"NASZ_KOPALNIA_NOWY_02");
};

FUNC VOID Rtn_GoToTria_9 ()
{	
	TA_RunToWP	(08,30,21,30,"OW_MINE2_06");
    TA_RunToWP	(21,30,08,30,"OW_MINE2_06");
};

FUNC VOID Rtn_Backing_9 ()
{	
	TA_RunToWP	(08,30,21,30,"NASZ_KOPALNIA_NOWY_02");
    TA_RunToWP	(21,30,08,30,"NASZ_KOPALNIA_NOWY_02");
};
