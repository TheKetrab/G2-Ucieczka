instance PC_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Will";
	guild		= GIL_NONE;
	id		= 0;
	voice		= 0;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;
		
	// ------ XP Setup ------
	exp			= 0;
	exp_next		= 500;
	lp			= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 5;
	attribute[ATR_DEXTERITY] 		= 5;
	attribute[ATR_MANA_MAX] 		= 5;
	attribute[ATR_MANA] 			= 5;
	attribute[ATR_HITPOINTS_MAX]		= 50;
	attribute[ATR_HITPOINTS] 		= 50;
	
	//Nałożona broń
	EquipItem (self, ItMw_2H_Axe_L_01);
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_Prisoner);
	//Mdl_SetVisualBody (self, "hum_body_Naked0", 	9,			0,		"Hum_Head_Bald", 		Face_N_Normal20,		0, 		NO_ARMOR);	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------  "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetModelFatness	(self, -1);
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 0); 
	Mdl_ApplyOverlayMds	(self, "Humans_X.mds"); 
	//Npc_PercEnable(self, PERC_ASSESSDAMAGE, B_Hero_AssessDamage);	
};
