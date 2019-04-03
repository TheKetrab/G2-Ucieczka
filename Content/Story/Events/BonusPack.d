
// ***** ***** ***** ***** ***** 
//					BONUSPACK
// ***** ***** ***** ***** ***** 
//
// 1. Pierscien + amulet + pas.
// 2. Za ubranie calego zestawu bonus.
//


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// Wiarolomca: Pierscien Glodu + Pierœcieñ Zarazy + Amulet Wojny + Pas Œmierci
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
	
	Print("Wyczuwasz silny niepokój.");
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
	
	Print("Czujesz os³abienie.");
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
	
	Print("Ból to tylko zwyczajne, nieistniej¹ce odczucie, œmiertelniku.");
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
	
	Print("Œledzimy ka¿dy twój krok, œmiertelniku.");
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	
	check_all_wiarolomca();
};

FUNC VOID UnEquip_ItNa_Pas_Smierci ()
{
	P_Smierci_IsEquipped = FALSE;
};

