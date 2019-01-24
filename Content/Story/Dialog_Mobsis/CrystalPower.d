
// ****************************************************
// CRYSTALPOWER_S1
// --------------
// Funktion wird durch Runentisch-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMi_RuneBlank
// *****************************************************
FUNC VOID CRYSTALPOWER_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE; 
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_CRYSTALPOWER;
		Ai_ProcessInfos (her);
	};
}; 

//*******************************************************
//	CrystalPower Dialog abbrechen
//*******************************************************
INSTANCE PC_CrystalPower_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_CrystalPower_End_Condition;
	information		= PC_CrystalPower_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_CrystalPower_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_CRYSTALPOWER)
	{	
		return TRUE;
	};
};

FUNC VOID PC_CrystalPower_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
// Pierscien Szybkoœci
//---------------------------
//*******************************************************
INSTANCE PC_CrystalPower_PierscienSzybkosci (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_CrystalPower_PierscienSzybkosci_Condition;
	information		= PC_CrystalPower_PierscienSzybkosci_Info;
	permanent		= TRUE;
	description		= "Na³aduj pierœcieñ szybkoœci."; 
};

FUNC INT PC_CrystalPower_PierscienSzybkosci_Condition ()
{
	if ( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_CRYSTALPOWER)
	&& (npc_hasitems (hero, ItNa_SpeedRing) >= 1)
	&& (npc_hasitems (hero, ItNa_Krysztal) >= 1) )
	{	
		return TRUE;
	};
};

FUNC VOID PC_CrystalPower_PierscienSzybkosci_Info()
{
	Info_ClearChoices (PC_CrystalPower_PierscienSzybkosci);
	
	Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,DIALOG_BACK,PC_CrystalPower_PierscienSzybkosci_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 1 kryszta³u.",PC_CrystalPower_PierscienSzybkosci_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 10 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 30 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_30); 
	};

};
FUNC VOID PC_CrystalPower_PierscienSzybkosci_BACK()
{
	Info_ClearChoices (PC_CrystalPower_PierscienSzybkosci);
};

FUNC VOID PC_CrystalPower_PierscienSzybkosci_1()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 1);
	secSpeedRing = secSpeedRing + 60;
	
	PrintS_Ext("Do³adowano: 1 minutê", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

	Info_ClearChoices (PC_CrystalPower_PierscienSzybkosci);
	
	Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,DIALOG_BACK,PC_CrystalPower_PierscienSzybkosci_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 1 kryszta³u.",PC_CrystalPower_PierscienSzybkosci_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 10 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 30 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_30); 
	};
};

FUNC VOID PC_CrystalPower_PierscienSzybkosci_10()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 10);
	secSpeedRing = secSpeedRing + 600;

	PrintS_Ext("Do³adowano: 10 minut", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));
	
	Info_ClearChoices (PC_CrystalPower_PierscienSzybkosci);
	
	Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,DIALOG_BACK,PC_CrystalPower_PierscienSzybkosci_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 1 kryszta³u.",PC_CrystalPower_PierscienSzybkosci_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 10 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 30 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_30); 
	};
};

FUNC VOID PC_CrystalPower_PierscienSzybkosci_30()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 30);
	secSpeedRing = secSpeedRing + 1800;
	
	PrintS_Ext("Do³adowano: 30 minut", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

	Info_ClearChoices (PC_CrystalPower_PierscienSzybkosci);
	
	Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,DIALOG_BACK,PC_CrystalPower_PierscienSzybkosci_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 1 kryszta³u.",PC_CrystalPower_PierscienSzybkosci_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 10 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_PierscienSzybkosci,"U¿yj 30 kryszta³ów.",PC_CrystalPower_PierscienSzybkosci_30); 
	};
};

//*******************************************************
// Miecz Runiczny
//---------------------------
//*******************************************************
INSTANCE PC_CrystalPower_MieczRuniczny (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_CrystalPower_MieczRuniczny_Condition;
	information		= PC_CrystalPower_MieczRuniczny_Info;
	permanent		= TRUE;
	description		= "Na³aduj miecz runiczny."; 
};

FUNC INT PC_CrystalPower_MieczRuniczny_Condition ()
{
	if ( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_CRYSTALPOWER)
	&& ((npc_hasitems (hero, ItNa_MieczRunicznyA) >= 1) || (npc_hasitems (hero, ItNa_MieczRunicznyB) >= 1) || (npc_hasitems (hero, ItNa_MieczRunicznyC) >= 1))
	&& (npc_hasitems (hero, ItNa_Krysztal) >= 1) )
	{	
		return TRUE;
	};
};

FUNC VOID PC_CrystalPower_MieczRuniczny_Info()
{
	Info_ClearChoices (PC_CrystalPower_MieczRuniczny);
	
	Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,DIALOG_BACK,PC_CrystalPower_MieczRuniczny_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 1 kryszta³u.",PC_CrystalPower_MieczRuniczny_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 10 kryszta³ów.",PC_CrystalPower_MieczRuniczny_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 30 kryszta³ów.",PC_CrystalPower_MieczRuniczny_30); 
	};

};
FUNC VOID PC_CrystalPower_MieczRuniczny_BACK()
{
	Info_ClearChoices (PC_CrystalPower_MieczRuniczny);
};

FUNC VOID PC_CrystalPower_MieczRuniczny_1()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 1);
	mocMieczRuniczny = mocMieczRuniczny + 1;
	
	PrintS_Ext("Do³adowano: moc na 1 uderzenie", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

	Info_ClearChoices (PC_CrystalPower_MieczRuniczny);
	
	Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,DIALOG_BACK,PC_CrystalPower_MieczRuniczny_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 1 kryszta³u.",PC_CrystalPower_MieczRuniczny_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 10 kryszta³ów.",PC_CrystalPower_MieczRuniczny_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 30 kryszta³ów.",PC_CrystalPower_MieczRuniczny_30); 
	};
};

FUNC VOID PC_CrystalPower_MieczRuniczny_10()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 10);
	mocMieczRuniczny = mocMieczRuniczny + 10;

	PrintS_Ext("Do³adowano: moc na 10 uderzeñ", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

	Info_ClearChoices (PC_CrystalPower_MieczRuniczny);
	
	Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,DIALOG_BACK,PC_CrystalPower_MieczRuniczny_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 1 kryszta³u.",PC_CrystalPower_MieczRuniczny_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 10 kryszta³ów.",PC_CrystalPower_MieczRuniczny_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 30 kryszta³ów.",PC_CrystalPower_MieczRuniczny_30); 
	};
};

FUNC VOID PC_CrystalPower_MieczRuniczny_30()
{
	Npc_RemoveInvItems (hero, ItNa_Krysztal, 30);
	mocMieczRuniczny = mocMieczRuniczny + 30;

	PrintS_Ext("Do³adowano: moc na 10 uderzeñ", RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));

	Info_ClearChoices (PC_CrystalPower_MieczRuniczny);
	
	Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,DIALOG_BACK,PC_CrystalPower_MieczRuniczny_BACK);

	if (npc_hasitems (hero, ItNa_Krysztal) >= 1)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 1 kryszta³u.",PC_CrystalPower_MieczRuniczny_1);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 10)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 10 kryszta³ów.",PC_CrystalPower_MieczRuniczny_10);
	};
	if (npc_hasitems (hero, ItNa_Krysztal) >= 30)
	{
		Info_AddChoice 	  (PC_CrystalPower_MieczRuniczny,"U¿yj 30 kryszta³ów.",PC_CrystalPower_MieczRuniczny_30); 
	};
};
