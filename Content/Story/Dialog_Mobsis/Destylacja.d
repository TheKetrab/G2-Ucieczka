
//*******************************************************
//					Alkohol
//*******************************************************
FUNC VOID DESTYLACJA_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_DESTYLACJA;
		Ai_ProcessInfos (her);
	};
}; 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_MakeAlkohol_Exit (C_INFO)
{
	nr       		= 999;
	npc				= PC_Hero;
	condition		= PC_MakeAlkohol_Exit_Condition;
	information		= PC_MakeAlkohol_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_MakeAlkohol_Exit_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DESTYLACJA)
	{
			return TRUE;
	};
};

FUNC VOID PC_MakeAlkohol_Exit_Info ()
{
	CreateInvItems (self, ItNa_Butelka,1);
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_MakeAlkohol_WywarRoslinaLecznicza (C_INFO)
{
	nr       		= 1;
	npc				= PC_Hero;
	condition		= PC_MakeAlkohol_WywarRoslinaLecznicza_Condition;
	information		= PC_MakeAlkohol_WywarRoslinaLecznicza_Info;
	permanent		= TRUE;
	description		= "Wywar z roœliny leczniczej."; 
};

FUNC INT PC_MakeAlkohol_WywarRoslinaLecznicza_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DESTYLACJA) 
	&& (level_zielarstwa > 0)
	{		
			return TRUE;
	};
};

FUNC VOID PC_MakeAlkohol_WywarRoslinaLecznicza_Info ()
{
	if (npc_hasitems (other, ItPl_Health_Herb_01) >=1) {	
	Npc_RemoveInvItems (hero,ItPl_Health_Herb_01 ,1);

	CreateInvItems (hero, ItNa_WywarRoslinaLecznicza,1 );
	PrintScreen ("Uwarzy³eœ mieszankê.", -1, 50, FONT_ScreenSmall, 2);
	}
	else {
	Print (PRINT_ProdItemsMissing);
	CreateInvItems (self, ItNa_Butelka,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_MakeAlkohol_WywarZieleLecznicze (C_INFO)
{
	nr       		= 2;
	npc				= PC_Hero;
	condition		= PC_MakeAlkohol_WywarZieleLecznicze_Condition;
	information		= PC_MakeAlkohol_WywarZieleLecznicze_Info;
	permanent		= TRUE;
	description		= "Wywar z zió³ leczniczych."; 
};

FUNC INT PC_MakeAlkohol_WywarZieleLecznicze_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DESTYLACJA) 
	&& (level_zielarstwa > 0)
	{		
			return TRUE;
	};
};

FUNC VOID PC_MakeAlkohol_WywarZieleLecznicze_Info ()
{
	if (npc_hasitems (other, ItPl_Health_Herb_01) >=1) {	
	Npc_RemoveInvItems (hero,ItPl_Health_Herb_01 ,1);

	CreateInvItems (hero, ItNa_WywarZieleLecznicze,1 );
	PrintScreen ("Uwarzy³eœ mieszankê.", -1, 50, FONT_ScreenSmall, 2);
	}
	else {
	Print (PRINT_ProdItemsMissing);
	CreateInvItems (self, ItNa_Butelka,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE PC_MakeAlkohol_WywarKorzenLeczniczy (C_INFO)
{
	nr       		= 3;
	npc				= PC_Hero;
	condition		= PC_MakeAlkohol_WywarKorzenLeczniczy_Condition;
	information		= PC_MakeAlkohol_WywarKorzenLeczniczy_Info;
	permanent		= TRUE;
	description		= "Wywar z korzenia leczniczego."; 
};

FUNC INT PC_MakeAlkohol_WywarKorzenLeczniczy_Condition()
{	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DESTYLACJA) 
	&& (level_zielarstwa > 0)
	{		
			return TRUE;
	};
};

FUNC VOID PC_MakeAlkohol_WywarKorzenLeczniczy_Info ()
{
	if (npc_hasitems (other, ItPl_Health_Herb_01) >=1) {
	Npc_RemoveInvItems (hero,ItPl_Health_Herb_01 ,1);

	CreateInvItems (hero, ItNa_WywarKorzenLeczniczy,1 );
	PrintScreen ("Uwarzy³eœ mieszankê.", -1, 50, FONT_ScreenSmall, 2);
	}
	else {
	Print (PRINT_ProdItemsMissing);
	CreateInvItems (self, ItNa_Butelka,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};
