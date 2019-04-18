
var int Silas_ItemsGiven_Chapter_1;
var int Silas_ItemsGiven_Ryzowka;

FUNC VOID B_GiveTradeInv_Silas (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Silas_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		// ------ Waffen ------
		CreateInvItems (slf, ItFo_Beer, 12);
		CreateInvItems (slf, ItFo_Booze , 6);
		CreateInvItems (slf, ItNa_WyciagJagody, 3); 
		CreateInvItems (slf, ItNa_WyciagGrzyby, 5); 
		CreateInvItems (slf, ItFo_Wine, 10); 
		CreateInvItems (slf, ItFo_Addon_Rum, 6); 
		CreateInvItems (slf, ItFo_Addon_Grog, 5); 
	
		Silas_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if (SILAS_SPRZEDAJE_RYZOWKE)
	&& (Silas_ItemsGiven_Ryzowka == FALSE)
	{
		CreateInvItems (slf, ItNa_Ryzowka, 13); 
		Silas_ItemsGiven_Ryzowka = TRUE;	
	};
	
	

};
