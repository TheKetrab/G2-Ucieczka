instance NASZ_318_Gobby (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gobby";
	guild 		= GIL_SLD;
	id 			= 318;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItNa_Ban_Weapon_M);
	
	// ------ Inventory ------
	CreateInvItems (self,ItPo_Health_03,2);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Gobby, BodyTex_N, ITNA_BAN_M);	
	Mdl_SetModelFatness	(self, 1.6);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_318;
};
FUNC VOID Rtn_Start_318 ()
{
	TA_Stand_Guarding 	  (19,00,20,00,"NASZ_BANDYCI_WODOSPAD_01");	
	TA_Stand_Guarding 	  (20,00,19,00,"NASZ_BANDYCI_WODOSPAD_01");	

}; 

FUNC VOID Rtn_Koniec_318 ()
{
	TA_SmallTalk		  (19,00,20,00,"NASZ_BANDYCI_RYBY_E");	
	TA_SmallTalk		  (20,00,19,00,"NASZ_BANDYCI_RYBY_E");	

}; 
