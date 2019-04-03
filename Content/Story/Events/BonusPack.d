
// ***** ***** ***** ***** ***** 
//					BONUSPACK
// ***** ***** ***** ***** ***** 
//
// 1. Pierscien + amulet + pas.
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
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	10);
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

