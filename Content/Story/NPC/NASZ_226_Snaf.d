

instance NASZ_226_Snaf (Npc_Default)
{
	// ------ NSC ------
	name 		= "Snaf";
	guild 		= GIL_OUT;
	id 			= 226;
	voice 		= 13;
	flags       = 1;		//Joly:nur solange Alnveres da ist!																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	attribute[ATR_HITPOINTS] 	 = 300; 
	attribute[ATR_HITPOINTS_MAX] = 300;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Snaf, BodyTex_N, ITNA_Cook_Armor);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_226;
};

FUNC VOID Rtn_Start_226 ()
{	
   	TA_Sit_Bench		(07,05,08,10,"NASZ_MYSLIWI_BALKON_03");
	TA_Cook_Cauldron	(08,10,10,40,"NASZ_MYSLIWI_BALKON_03");
	TA_SmallTalk		(10,40,13,45,"LOCATION_02_16");
   	TA_Sit_Bench		(13,45,15,20,"NASZ_MYSLIWI_BALKON_03");
	TA_Cook_Cauldron	(15,20,18,05,"NASZ_MYSLIWI_BALKON_03");
   	TA_Sit_Bench		(18,05,19,35,"NASZ_MYSLIWI_BALKON_03");
	TA_SmallTalk		(19,35,21,05,"LOCATION_02_16");
	TA_Sit_Bench		(21,05,22,40,"NASZ_MYSLIWI_BALKON_03");
    TA_Sleep			(22,40,07,05,"NASZ_MYSLIWI_BALKON_03");

};

FUNC VOID Rtn_CookingAllTheTime_226 ()
{	
   	TA_Cook_Cauldron	(08,00,20,00,"NASZ_MYSLIWI_BALKON_03");
	TA_Cook_Cauldron	(20,00,08,00,"NASZ_MYSLIWI_BALKON_03");
};




