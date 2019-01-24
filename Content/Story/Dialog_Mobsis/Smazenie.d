
//*******************************************************
//					Smazenie
//*******************************************************
FUNC VOID SMAZENIE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMAZENIE;
		Ai_ProcessInfos (her);
	};
}; 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_Smazenie_Exit (C_INFO)
{
	nr       		= 999;
	npc				= PC_Hero;
	condition		= PC_Smazenie_Exit_Condition;
	information		= PC_Smazenie_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Smazenie_Exit_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE)
	{
			return TRUE;
	};
};

FUNC VOID PC_Smazenie_Exit_Info ()
{
	B_ENDPRODUCTIONDIALOG ();		
};

//*******************************************************
//					Mieso
//*******************************************************

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_Smazenie_1 (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_Smazenie_1_Condition;
	information		= PC_Smazenie_1_Info;
	permanent		= TRUE;
	description		= "Usma¿ surowe miêso. (1 kawa³ek wêgla)"; 
};

FUNC INT PC_Smazenie_1_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItFoMuttonRaw) >= 1)
	&& (npc_hasitems (hero, ItMi_Coal) >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_Smazenie_1_Info ()
{
		
	Npc_RemoveInvItems (hero, ItFoMuttonRaw, 1);
	Npc_RemoveInvItems (hero, ItMi_Coal, 1);
	
	CreateInvItems (hero, ItFoMutton, 1);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_Smazenie_10 (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_Smazenie_10_Condition;
	information		= PC_Smazenie_10_Info;
	permanent		= TRUE;
	description		= "Usma¿ 10 surowych miês. (10 kawa³ków wêgla)"; 
};

FUNC INT PC_Smazenie_10_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItFoMuttonRaw) >= 10)
	&& (npc_hasitems (hero, ItMi_Coal) >= 10)
	{		
			return TRUE;
	};
};

FUNC VOID PC_Smazenie_10_Info ()
{
		
	Npc_RemoveInvItems (hero, ItFoMuttonRaw, 10);
	Npc_RemoveInvItems (hero, ItMi_Coal, 10);
	
	CreateInvItems (hero, ItFoMutton, 10);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_Smazenie_50 (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_Smazenie_50_Condition;
	information		= PC_Smazenie_50_Info;
	permanent		= TRUE;
	description		= "Usma¿ 50 surowych miês. (50 kawa³ków wêgla)"; 
};

FUNC INT PC_Smazenie_50_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItFoMuttonRaw) >= 50)
	&& (npc_hasitems (hero, ItMi_Coal) >= 50)
	{		
			return TRUE;
	};
};

FUNC VOID PC_Smazenie_50_Info ()
{
		
	Npc_RemoveInvItems (hero, ItFoMuttonRaw, 50);
	Npc_RemoveInvItems (hero, ItMi_Coal, 50);

	CreateInvItems (hero, ItFoMutton, 50);
		
};

//*******************************************************
//					Piekielniki
//*******************************************************

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieGrzyby1_1 (C_INFO)
{
	nr       		= 4;
	npc				= PC_Hero;
	condition		= PC_SmazenieGrzyby1_1_Condition;
	information		= PC_SmazenieGrzyby1_1_Info;
	permanent		= TRUE;
	description		= "Usma¿ piekielnik. (1 kawa³ek wêgla)"; 
};

FUNC INT PC_SmazenieGrzyby1_1_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItPl_Mushroom_01) >= 1)
	&& (npc_hasitems (hero, ItMi_Coal) >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieGrzyby1_1_Info ()
{
		
	Npc_RemoveInvItems (hero, ItPl_Mushroom_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Coal, 1);
	
	CreateInvItems (hero, ItNa_FriedMushroom_01, 1);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieGrzyby1_10 (C_INFO)
{
	nr       		= 5;
	npc				= PC_Hero;
	condition		= PC_SmazenieGrzyby1_10_Condition;
	information		= PC_SmazenieGrzyby1_10_Info;
	permanent		= TRUE;
	description		= "Usma¿ 10 piekielników. (10 kawa³ków wêgla)"; 
};

FUNC INT PC_SmazenieGrzyby1_10_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItPl_Mushroom_01) >= 10)
	&& (npc_hasitems (hero, ItMi_Coal) >= 10)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieGrzyby1_10_Info ()
{
		
	Npc_RemoveInvItems (hero, ItPl_Mushroom_01, 10);
	Npc_RemoveInvItems (hero, ItMi_Coal, 10);
	
	CreateInvItems (hero, ItNa_FriedMushroom_01, 10);
		
};

//*******************************************************
//					Duze grzyby
//*******************************************************

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieGrzyby2_1 (C_INFO)
{
	nr       		= 6;
	npc				= PC_Hero;
	condition		= PC_SmazenieGrzyby2_1_Condition;
	information		= PC_SmazenieGrzyby2_1_Info;
	permanent		= TRUE;
	description		= "Usma¿ du¿ego grzyba. (2 kawa³ki wêgla)"; 
};

FUNC INT PC_SmazenieGrzyby2_1_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItPl_Mushroom_02) >= 1)
	&& (npc_hasitems (hero, ItMi_Coal) >= 2)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieGrzyby2_1_Info ()
{
		
	Npc_RemoveInvItems (hero, ItPl_Mushroom_02, 1);
	Npc_RemoveInvItems (hero, ItMi_Coal, 2);
	
	CreateInvItems (hero, ItNa_FriedMushroom_02, 1);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieGrzyby2_10 (C_INFO)
{
	nr       		= 7;
	npc				= PC_Hero;
	condition		= PC_SmazenieGrzyby2_10_Condition;
	information		= PC_SmazenieGrzyby2_10_Info;
	permanent		= TRUE;
	description		= "Usma¿ 10 du¿ych grzybów. (20 kawa³ków wêgla)"; 
};

FUNC INT PC_SmazenieGrzyby2_10_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItPl_Mushroom_02) >= 10)
	&& (npc_hasitems (hero, ItMi_Coal) >= 20)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieGrzyby2_10_Info ()
{
		
	Npc_RemoveInvItems (hero, ItPl_Mushroom_02, 10);
	Npc_RemoveInvItems (hero, ItMi_Coal, 20);
	
	CreateInvItems (hero, ItNa_FriedMushroom_02, 10);
		
};

//*******************************************************
//					Ryby
//*******************************************************

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieRyby_1 (C_INFO)
{
	nr       		= 8;
	npc				= PC_Hero;
	condition		= PC_SmazenieRyby_1_Condition;
	information		= PC_SmazenieRyby_1_Info;
	permanent		= TRUE;
	description		= "Usma¿ rybê. (1 kawa³ek wêgla)"; 
};

FUNC INT PC_SmazenieRyby_1_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItFo_Fish) >= 1)
	&& (npc_hasitems (hero, ItMi_Coal) >= 1)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieRyby_1_Info ()
{
		
	Npc_RemoveInvItems (hero, ItFo_Fish, 1);
	Npc_RemoveInvItems (hero, ItMi_Coal, 1);
	
	CreateInvItems (hero, ItNa_FriedFish, 1);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_SmazenieRyby_10 (C_INFO)
{
	nr       		= 9;
	npc				= PC_Hero;
	condition		= PC_SmazenieRyby_10_Condition;
	information		= PC_SmazenieRyby_10_Info;
	permanent		= TRUE;
	description		= "Usma¿ 10 ryb. (10 kawa³ków wêgla)"; 
};

FUNC INT PC_SmazenieRyby_10_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMAZENIE) 
	&& (npc_hasitems (hero, ItFo_Fish) >= 10)
	&& (npc_hasitems (hero, ItMi_Coal) >= 10)
	{		
			return TRUE;
	};
};

FUNC VOID PC_SmazenieRyby_10_Info ()
{
		
	Npc_RemoveInvItems (hero, ItFo_Fish, 10);
	Npc_RemoveInvItems (hero, ItMi_Coal, 10);
	
	CreateInvItems (hero, ItNa_FriedFish, 10);
		
};