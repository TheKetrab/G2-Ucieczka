
// ***** ***** ***** ***** ***** 
//					BONUSPACK
// ***** ***** ***** ***** ***** 
//
// 1. Pierscienie + amulet + pas.
// 2. Za ubranie calego zestawu bonus.
//


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// Wiarolomca: Pierscien Glodu + Pier�cie� Zarazy + Amulet Wojny + Pas �mierci
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

var int P_Glodu_IsEquipped;
var int P_Zarazy_IsEquipped;
var int A_Wojny_IsEquipped;
var int P_Smierci_IsEquipped;
var int Wiarolomca_OneTime;

func int all_wiarolomca_equipped() {

	if (P_Glodu_IsEquipped==TRUE) 
	&& (P_Zarazy_IsEquipped==TRUE) 
	&& (A_Wojny_IsEquipped==TRUE) 
	&& (P_Smierci_IsEquipped==TRUE)
	{
		return TRUE;
	};
	
	return FALSE;
};

FUNC VOID check_all_wiarolomca()
{
	if ((Wiarolomca_OneTime==FALSE) && all_wiarolomca_equipped())
	{
		AI_PlayAni (hero, "S_SUCKENERGY_VICTIM"); 
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
		hero.attribute[0]-=20;
		hero.attribute[1]-=20;
		hero.attribute[2]-=5;
		hero.attribute[3]-=5;
		hero.attribute[4]-=5;
		hero.attribute[5]-=5;
		PrintS_Ext("Moc artefakt�w ochorni�a ci� przed �mierci�, jednak�e zosta�e� os�abiony!", RGBA(255,255,255,0));	
		B_GivePlayerXP(500);
	};
};

FUNC VOID Equip_ItNa_Pierscien_Glodu ()
{
	P_Glodu_IsEquipped = TRUE;
	
	Print("Wyczuwasz silny niepok�j.");
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	
	check_all_wiarolomca();
};

FUNC VOID UnEquip_ItNa_Pierscien_Glodu ()
{
	P_Glodu_IsEquipped = FALSE;
};

FUNC VOID Equip_ItNa_Pierscien_Zarazy ()
{
	P_Zarazy_IsEquipped = TRUE;
	
	Print("Czujesz os�abienie.");
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	
	check_all_wiarolomca();
};

FUNC VOID UnEquip_ItNa_Pierscien_Zarazy ()
{
	P_Zarazy_IsEquipped = FALSE;
};

FUNC VOID Equip_ItNa_Amulet_Wojny ()
{
	A_Wojny_IsEquipped = TRUE;
	
	Print("B�l to tylko zwyczajne, nieistniej�ce odczucie, �miertelniku.");
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	
	check_all_wiarolomca();
};

FUNC VOID UnEquip_ItNa_Amulet_Wojny ()
{
	A_Wojny_IsEquipped = FALSE;
};

FUNC VOID Equip_ItNa_Pas_Smierci ()
{
	P_Smierci_IsEquipped = TRUE;
	
	Print("�ledzimy ka�dy tw�j krok, �miertelniku.");
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	
	check_all_wiarolomca();
};

FUNC VOID UnEquip_ItNa_Pas_Smierci ()
{
	P_Smierci_IsEquipped = FALSE;
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// Magnat: Pierscien Arto + Pier�cie� Blizny + Amulet Gomeza + Pas Bartholo + Maska Kruka
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

var int P_Arto_IsEquipped;		// +5 zr�czno�ci			w skrzyni w pokoju Arto
var int P_Blizny_IsEquipped;	// +5 si�y					na stole w g��wnej sali tronowej
var int A_Gomeza_IsEquipped;	// +5 1h i 2h				w skrzyni w pokoju Gomeza
var int P_Bartholo_IsEquipped;	// +5 mana i hp				powieszony na �cianie przy wej�ciu w prawej dolnej komnacie w domu mag�w
var int M_Kruka_IsEquipped;		// +5 prot do wszystkiego	w piwnicy zamku, w komnacie zaraz przed zeskokiem do wi�zienia, le�y na skrzyni
var int Magnat_OneTime;

func int all_magnat_equipped() {

	if (P_Arto_IsEquipped==TRUE) 
	&& (P_Blizny_IsEquipped==TRUE) 
	&& (A_Gomeza_IsEquipped==TRUE) 
	&& (P_Bartholo_IsEquipped==TRUE)
	&& (M_Kruka_IsEquipped==TRUE)
	{
		return TRUE;
	};
	
	return FALSE;
};

FUNC VOID check_all_magnat()
{
	if ((Magnat_OneTime==FALSE) && all_magnat_equipped())
	{
		Magnat_OneTime = TRUE;
		AddAchievement(Acv23Title,Acv23Content);
		B_GivePlayerXP(500);
	};
};

FUNC VOID Equip_ItNa_Pierscien_Arto ()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,+5);
	P_Arto_IsEquipped = TRUE;
	check_all_magnat();
};

FUNC VOID UnEquip_ItNa_Pierscien_Arto ()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
	P_Arto_IsEquipped = FALSE;
};

FUNC VOID Equip_ItNa_Pierscien_Blizny ()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,+5);
	
	P_Blizny_IsEquipped = TRUE;
	check_all_magnat();
};

FUNC VOID UnEquip_ItNa_Pierscien_Blizny ()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
	P_Blizny_IsEquipped = FALSE;
};

FUNC VOID Equip_ItNa_Amulet_Gomeza ()
{
	A_Gomeza_IsEquipped = TRUE;
	check_all_magnat();
	
	B_AddFightSkill (self, NPC_TALENT_1H, +5);
	B_AddFightSkill (self, NPC_TALENT_2H, +5);
};

FUNC VOID UnEquip_ItNa_Amulet_Gomeza ()
{
	A_Gomeza_IsEquipped = FALSE;

	B_AddFightSkill (self, NPC_TALENT_1H, -5);
	B_AddFightSkill (self, NPC_TALENT_2H, -5);
};

FUNC VOID Equip_ItNa_Pas_Bartholo ()
{
	P_Bartholo_IsEquipped = TRUE;
	check_all_magnat();

	self.attribute[ATR_HITPOINTS]		= self.attribute[ATR_HITPOINTS] + 5;
	self.attribute[ATR_HITPOINTS_MAX]	= self.attribute[ATR_HITPOINTS_MAX] + 5;
	self.attribute[ATR_MANA]			= self.attribute[ATR_MANA] + 5;
	self.attribute[ATR_MANA_MAX]		= self.attribute[ATR_MANA_MAX] + 5;

};

FUNC VOID UnEquip_ItNa_Pas_Bartholo ()
{
	P_Bartholo_IsEquipped = FALSE;

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 5;
	if (self.attribute[ATR_MANA] > 5) { self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 5; }
	else { self.attribute[ATR_MANA] = 0; };

	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 5;
	if (self.attribute[ATR_HITPOINTS] > 5) { self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 5; }
	else { self.attribute[ATR_HITPOINTS] = 1; };

};

FUNC VOID Equip_ItNa_Maska_Kruka ()
{
	M_Kruka_IsEquipped = TRUE;
	check_all_magnat();
};

FUNC VOID UnEquip_ItNa_Maska_Kruka ()
{
	M_Kruka_IsEquipped = FALSE;
};

