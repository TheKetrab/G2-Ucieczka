
var int Benito_ItemsGiven_Chapter_1;

FUNC VOID B_GiveTradeInv_Benito (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Benito_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		// ------ Waffen ------
		CreateInvItems (slf, ItMi_Joint, 18);
		CreateInvItems (slf, ItMi_ApfelTabak, 8);
		CreateInvItems (slf, ItMi_PilzTabak, 3); 
		CreateInvItems (slf, ItMi_DoppelTabak, 4); 
		CreateInvItems (slf, ItMi_Honigtabak, 6); 
		CreateInvItems (slf, ItMi_SumpfTabak, 3); 
		CreateInvItems (slf, ItNa_MrokPolnocy, 12); 

		CreateInvItems (slf, ItFo_Addon_Pfeffer_01, 8); 
	
		Benito_ItemsGiven_Chapter_1 = TRUE;
	};
	

};
