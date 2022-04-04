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
	attribute[ATR_HITPOINTS_MAX]	= 50;
	attribute[ATR_HITPOINTS] 		= 50;

	aivar[REAL_STRENGTH] 			= 5;
	aivar[REAL_DEXTERITY] 			= 5;
	aivar[REAL_MANA_MAX] 			= 5;
	
	//Nałożona broń
	EquipItem (self, ItMw_2H_Axe_L_01);
	Npc_GetInvItem(self,ItMw_2H_Axe_L_01);
	QS_PutSlot(self,1,_@(item));
	
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

instance PC_Hero_Kap1 (NPC_DEFAULT)
{
	name 		= "Will";
	level		= 5;
	
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 20;
	attribute[ATR_MANA_MAX] 		= 5;
	attribute[ATR_MANA] 			= 5;
	attribute[ATR_HITPOINTS_MAX]	= 80;
	attribute[ATR_HITPOINTS] 		= 80;

	aivar[REAL_STRENGTH] 			= 10;
	aivar[REAL_DEXTERITY] 			= 20;
	aivar[REAL_MANA_MAX] 			= 5;
	
	EquipItem (self, ItMw_1H_Sword_Short_02);
	CreateInvItems (self,ItRw_Arrow, 100);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_Leather_L);
	Mdl_SetVisual (self,"HUMANS.MDS");
	Mdl_SetModelFatness	(self, -1);
	
	B_SetFightSkills 	(self, 10);
};

instance PC_Hero_Kap2 (NPC_DEFAULT)
{
	name 		= "Will";
	level		= 10;
	
	attribute[ATR_STRENGTH] 		= 20;
	attribute[ATR_DEXTERITY] 		= 45;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 140;
	attribute[ATR_HITPOINTS] 		= 140;

	aivar[REAL_STRENGTH] 			= 20;
	aivar[REAL_DEXTERITY] 			= 45;
	aivar[REAL_MANA_MAX] 			= 10;
	
	EquipItem (self, ItNa_Out_Weapon_H);
	EquipItem (self, ItRw_Bow_L_04);
	CreateInvItems (self,ItRw_Arrow, 500);

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITNA_BAN_M);
	Mdl_SetVisual (self,"HUMANS.MDS");
	Mdl_SetModelFatness	(self, -1);
	
	B_SetFightSkills 	(self, 30);
};

instance PC_Hero_Kap3 (NPC_DEFAULT)
{
	name 		= "Will";
	level		= 15;
	
	attribute[ATR_STRENGTH] 		= 20;
	attribute[ATR_DEXTERITY] 		= 75;
	attribute[ATR_MANA_MAX] 		= 20;
	attribute[ATR_MANA] 			= 20;
	attribute[ATR_HITPOINTS_MAX]	= 200;
	attribute[ATR_HITPOINTS] 		= 200;

	aivar[REAL_STRENGTH] 			= 20;
	aivar[REAL_DEXTERITY] 			= 75;
	aivar[REAL_MANA_MAX] 			= 20;
	
	EquipItem (self, ItNa_StaryPykacz);
	EquipItem (self, ItRw_Bow_M_04);
	CreateInvItems (self,ItRw_Arrow, 500);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITNA_OUT_H);
	Mdl_SetVisual (self,"HUMANS.MDS");
	Mdl_SetModelFatness	(self, -1);
	
	B_SetFightSkills 	(self, 45);
};

instance PC_Hero_Kap4 (NPC_DEFAULT)
{
	name 		= "Will";
	level		= 25;
	
	attribute[ATR_STRENGTH] 		= 30;
	attribute[ATR_DEXTERITY] 		= 90;
	attribute[ATR_MANA_MAX] 		= 20;
	attribute[ATR_MANA] 			= 20;
	attribute[ATR_HITPOINTS_MAX]	= 250;
	attribute[ATR_HITPOINTS] 		= 250;
	
	aivar[REAL_STRENGTH] 			= 30;
	aivar[REAL_DEXTERITY] 			= 90;
	aivar[REAL_MANA_MAX] 			= 20;

	EquipItem (self, ItMw_Meisterdegen);
	EquipItem (self, ItRw_Bow_H_03);
	CreateInvItems (self,ItRw_Arrow, 500);
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITNA_OUT_ULTRA);
	Mdl_SetVisual (self,"HUMANS.MDS");
	Mdl_SetModelFatness	(self, -1);
	
	B_SetFightSkills 	(self, 60);
};
