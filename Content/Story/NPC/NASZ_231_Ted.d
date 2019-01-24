instance NASZ_231_Ted (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ted";
	guild 		= GIL_OUT;
	id 			= 231;
	voice 		= 11;
	flags      	= 2;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_ShortSword4);
	EquipItem	(self, ItRw_Sld_Bow); 
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ItRw_Arrow,25);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITNA_OUT_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_231;
};

FUNC VOID Rtn_PreStart_231()
{
	TA_Follow_Player	(06,00,12,00,"NASZ_TED_START");
	TA_Follow_Player	(12,00,06,00,"NASZ_TED_START");
};

FUNC VOID Rtn_Start_231()
{
	TA_Sit_Campfire	(06,00,12,00,"NASZ_TED_START");
	TA_Sit_Campfire	(12,00,06,00,"NASZ_TED_START");
};

FUNC VOID Rtn_Kap2_231()
{
	TA_Sit_Campfire	(06,00,12,00,"NASZ_TED_SIT");
	TA_Sit_Campfire	(12,00,06,00,"NASZ_TED_SIT");
};

FUNC VOID Rtn_Kap4_231()
{
	TA_Stand_ArmsCrossed	(06,00,12,00,"NASZ_ZAPALISADA_KLASZTOR_02");
	TA_Stand_ArmsCrossed	(12,00,06,00,"NASZ_ZAPALISADA_KLASZTOR_02");
};

FUNC VOID Rtn_GoToWieza_231()
{
	TA_Guide_Player	(06,00,12,00,"NASZ_ZAPALISADA_KLASZTOR_08");
	TA_Guide_Player	(12,00,06,00,"NASZ_ZAPALISADA_KLASZTOR_08");
};

FUNC VOID Rtn_UnderWieza_231()
{
	TA_Stand_ArmsCrossed	(06,00,12,00,"NASZ_ZAPALISADA_KLASZTOR_08");
	TA_Stand_ArmsCrossed	(12,00,06,00,"NASZ_ZAPALISADA_KLASZTOR_08");
};

FUNC VOID Rtn_Gora_231()
{
	TA_Read_Bookstand	(06,00,12,00,"NASZ_ZAPALISADA_KLASZTOR_14");
	TA_Read_Bookstand	(12,00,06,00,"NASZ_ZAPALISADA_KLASZTOR_14");
};

