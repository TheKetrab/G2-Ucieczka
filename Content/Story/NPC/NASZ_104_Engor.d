
instance NASZ_104_Engor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Engor";
	guild 		= GIL_DJG;
	id 			= 104;
	voice 		= 13;
	flags       = 0;							
	npctype		= NPCTYPE_OCMAIN;

	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------															
	EquipItem			(self, ItNa_Djg_Weapon_L);
	
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Jackal, BodyTex_L, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_104;
};

FUNC VOID Rtn_Start_104 ()
{	
	TA_Sit_Bench	(07,50,21,20,"NASZ_LOWCY_DOM_01");
	TA_Sleep		(21,20,07,50,"NASZ_LOWCY_KARCZMA_27");
};

FUNC VOID Rtn_Lute_104 ()
{	
	TA_Sit_Bench	(07,50,20,10,"NASZ_LOWCY_DOM_01");
	TA_Play_Lute	(20,10,01,45,"NASZ_LOWCY_KARCZMA_24");
	TA_SmallTalk	(01,45,04,20,"NASZ_LOWCY_KARCZMA_06");
	TA_Sleep		(04,20,07,50,"NASZ_LOWCY_KARCZMA_27");
	
};

FUNC VOID Rtn_Spotkanie_104 ()
{	
	TA_Sit_Bench	(05,30,20,00,"NASZ_LOWCY_DOM_01");
	TA_SmallTalk	(20,00,05,30,"OW_DJG_SWAMPCAMP_01");
};
