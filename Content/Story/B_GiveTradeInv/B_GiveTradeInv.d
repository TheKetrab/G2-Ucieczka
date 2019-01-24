// **********************************************
// B_GiveTradeInventory
// --------------------
// Verteiler. Aufruf aller B_GiveTradeInv-Befehle
// **********************************************

func void B_GiveTradeInv (var C_NPC slf)
{
//******************************************************************
//	Hier muss jeder Händler eingetragen werden!!!!!!!
//******************************************************************	

	
	//Armie Zniechecenia
	var C_NPC Trd_Hunt;		Trd_Hunt=Hlp_GetNpc (NASZ_211_Hunt);
	var C_NPC Trd_Johny;	Trd_Johny=Hlp_GetNpc (NASZ_103_Johny);
	var C_NPC Trd_Engor;	Trd_Engor=Hlp_GetNpc (NASZ_104_Engor);
	var C_NPC Trd_Kirgo;	Trd_Kirgo=Hlp_GetNpc (NASZ_220_Kirgo);
	var C_NPC Trd_Silas;	Trd_Silas=Hlp_GetNpc (NASZ_125_Silas);
	var C_NPC Trd_Benito;	Trd_Benito=Hlp_GetNpc (NASZ_221_Benito);
	var C_NPC Trd_Danny;	Trd_Danny=Hlp_GetNpc (NASZ_327_Danny);
//********************************************************************
//		Hier auch!!!
//********************************************************************

	B_ClearRuneInv (slf);
	
	if (slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		//Armie Zniechecenia	
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hunt)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Hunt	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Johny)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Johny	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Engor)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Engor	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Kirgo)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Kirgo	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Silas)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Silas	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Benito)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Benito	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Danny)	{B_ClearJunkTradeInv (slf); B_GiveTradeInv_Danny	(slf);};
		
		slf.aivar[AIV_ChapterInv] = (Kapitel +1);
	};		
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//	Handelsware Clearen und Ambientstuff in die Tasche, wenn Trader Unconscious oder Dead
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if 	(Npc_IsInState	(slf, ZS_Dead))
	||	(Npc_IsInState	(slf, ZS_Unconscious ))
	{
		//Armie Zniechecenia
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Hunt)	{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Johny)	{B_ClearDeadTrader	(slf);};	
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Engor)	{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Kirgo)	{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Silas)	{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Benito)	{B_ClearDeadTrader	(slf);};
		if  Hlp_GetInstanceID (slf) == Hlp_GetInstanceID (Trd_Danny)	{B_ClearDeadTrader	(slf);};
	};

};
	
	

