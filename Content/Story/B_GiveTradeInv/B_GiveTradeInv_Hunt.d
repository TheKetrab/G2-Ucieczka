var int Hunt_ItemsGiven_Chapter_1;
var int Hunt_ItemsGiven_Chapter_2;
var int Hunt_ItemsGiven_Chapter_3;
var int Hunt_ItemsGiven_Chapter_4;

FUNC VOID B_GiveTradeInv_Hunt (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Hunt_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Hammer, 1); 
	
		CreateInvItems (slf, ItNa_Szabla, 1); 
		CreateInvItems (slf, ItNa_StaryPykacz, 1); 
		CreateInvItems (slf, ItNa_Rozpruwacz, 1); 
		CreateInvItems (slf, ItNa_SolidnaKlinga, 1); 
		CreateInvItems (slf, ItNa_Klujec, 1); 
		CreateInvItems (slf, ItNa_OstryMiecz, 1); 
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1); 

		CreateInvItems (slf, ItRw_Arrow, 500); 
		CreateInvItems (slf, ItNa_OstraStrzala, 50); 

		CreateInvItems (slf, ItRw_Bow_L_01, 1); 
		CreateInvItems (slf, ItRw_Bow_L_02, 1); 
		CreateInvItems (slf, ItRw_Bow_L_03, 1); 
		CreateInvItems (slf, ItRw_Bow_L_03, 1); 
		CreateInvItems (slf, ItRw_Bow_L_04, 1); 
	
		
		Hunt_ItemsGiven_Chapter_1 = TRUE;
	};
	if ((Kapitel >= 2)
	&& (Hunt_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItNa_Smyk, 1); 
		CreateInvItems (slf, ItNa_Kosmyk, 1); 		
		CreateInvItems (slf, ItMw_Rapier, 1); 
		CreateInvItems (slf, ItMw_Doppelaxt, 1); 
		CreateInvItems (slf, ItMw_Rabenschnabel, 1); 

		CreateInvItems (slf, ItRw_Arrow, 1000); 
		CreateInvItems (slf, ItNa_OstraStrzala, 50); 
		CreateInvItems (slf, ItNa_OgnistaStrzala, 30); 

		CreateInvItems (slf, ItRw_Bow_M_01, 1); 
		CreateInvItems (slf, ItRw_Bow_M_02, 1); 
		CreateInvItems (slf, ItRw_Bow_M_03, 1); 
		CreateInvItems (slf, ItRw_Bow_M_04, 1); 

		CreateInvItems (slf, ItNa_PasMysliwego, 1); 

		Hunt_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Hunt_ItemsGiven_Chapter_3 == FALSE))
	{
		
		CreateInvItems (slf, ItNa_GrzechSzakala, 1); 		
		CreateInvItems (slf, ItMw_Meisterdegen, 1); 	

		CreateInvItems (slf, ItRw_Arrow, 1000); 
		CreateInvItems (slf, ItNa_OstraStrzala, 50); 
		CreateInvItems (slf, ItNa_OgnistaStrzala, 50); 
		
		CreateInvItems (slf, ItRw_Bow_H_01, 1); 
		CreateInvItems (slf, ItRw_Bow_H_02, 1); 
		CreateInvItems (slf, ItRw_Bow_H_03, 1); 
		CreateInvItems (slf, ItRw_Bow_H_04, 1); 

		Hunt_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Hunt_ItemsGiven_Chapter_4 == FALSE))
	{

		CreateInvItems (slf, ItRw_Arrow, 1000); 
		CreateInvItems (slf, ItNa_OstraStrzala, 50); 
	
		Hunt_ItemsGiven_Chapter_4 = TRUE;
	};

};
