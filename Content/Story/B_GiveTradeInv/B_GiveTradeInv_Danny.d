var int Danny_ItemsGiven_Chapter_1;

FUNC VOID B_GiveTradeInv_Danny (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Danny_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf,ItMi_Gold,100); 
		CreateInvItems (slf,ItFo_SmellyFish,27); 
		CreateInvItems (slf,ItFo_Fish,18);
		CreateInvItems (slf,ItNa_Losos,12);
		CreateInvItems (slf,ItFo_FishSoup,14);
		CreateInvItems (slf,ItNa_Przepis_ZupaRybna,1);

		Danny_ItemsGiven_Chapter_1 = TRUE;
	};

};