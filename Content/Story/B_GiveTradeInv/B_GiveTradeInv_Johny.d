var int Johny_ItemsGiven_Chapter_1;
var int Johny_ItemsGiven_Chapter_2;
var int Johny_ItemsGiven_Chapter_3;
var int Johny_ItemsGiven_Chapter_4;

FUNC VOID B_GiveTradeInv_Johny (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Johny_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		// ------ Waffen ------
		CreateInvItems (slf, ItMw_ShortSword3, 1);
		CreateInvItems (slf, ItMw_Kriegskeule, 1); 
		CreateInvItems (slf, ItMw_Hellebarde, 1); 
		CreateInvItems (slf, ItMw_Nagelkeule, 1); 
		CreateInvItems (slf, ItMw_Kriegshammer1, 1); 
		CreateInvItems (slf, ItMw_Nagelkeule2, 1); 
		CreateInvItems (slf, ItMw_Zweihaender1, 1); 
		CreateInvItems (slf, ItMw_Richtstab, 1); 


		
		CreateInvItems (slf, ItMiSwordraw, 5); 
		
		
		CreateInvItems (slf, ItRw_Crossbow_L_01, 1);		
		CreateInvItems (slf, ItRw_Crossbow_L_02, 1);		
		CreateInvItems (slf, ItRw_Mil_Crossbow, 1);		
		
		CreateInvItems (slf, ItRw_Arrow, 500); 
		CreateInvItems (slf, ItRw_Bolt, 500); 
		
		// Tarcze
		CreateInvItems (slf, ItNa_DrewnianaTarcza1, 1);
		CreateInvItems (slf, ItNa_DrewnianaTarcza2, 1);
		CreateInvItems (slf, ItNa_Shield_Metal1, 1);
		CreateInvItems (slf, ItNa_Shield_Metal2, 1);
		CreateInvItems (slf,ItNa_Shield_Nordmar, 1);
		
		// ------ Ringe / Amulette ------
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 
		CreateInvItems (slf, ItNa_PasStalowejReki		, 1); 
		CreateInvItems (slf, ItNa_HuntAmulet		, 1); 
		
		
		Johny_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Johny_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
				
		CreateInvItems (slf, ItRw_Crossbow_M_01, 1);

		CreateInvItems (slf, ItMw_Stabkeule, 1); 
		CreateInvItems (slf, ItMw_Steinbrecher, 1); 
		CreateInvItems (slf, ItMw_Streitaxt1, 1); 
		CreateInvItems (slf, ItMw_Schwert1, 1); 
		CreateInvItems (slf, ItMw_Schwert2, 1); 
		CreateInvItems (slf, ItMw_2H_Axe_Old_03, 1);
		
		CreateInvItems (slf,ItNa_TarczaLowcy, 1);
		CreateInvItems (slf, ItRw_Bolt, 500); 
		
		CreateInvItems (slf, ItRw_Arrow, 500); 
		CreateInvItems (slf, ItNa_OgnistaStrzala, 10); 
		CreateInvItems (slf, ItRw_SharpBolt, 30); 

		
		// Tarcze
		CreateInvItems (slf, ItNa_DrewnianaTarcza4, 1);
		CreateInvItems (slf, ItNa_TarczaNajemnika, 1);



		Johny_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Johny_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMw_Streitkolben , 1);
		CreateInvItems (slf, ItMw_Zweihaender2, 1); 
		CreateInvItems (slf, ItMw_Schwert5, 1);
		CreateInvItems (slf, ItMw_Streitaxt2 , 1);
		
		CreateInvItems (slf, ItRw_Crossbow_M_02, 1);
		CreateInvItems (slf, ItRw_SharpBolt, 50); 

		CreateInvItems (slf,ItNa_StalowaTarczaLowcy, 1);
		CreateInvItems (slf, ItAm_Prot_Edge_01		, 1); 
		
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_Point, 1); 

		CreateInvItems (slf, ItRw_Arrow, 500); 
		CreateInvItems (slf, ItRw_Bolt, 500); 
		
		Johny_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Johny_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMw_Kriegshammer2 , 1);
		CreateInvItems (slf, ItMw_Zweihaender4 , 1);
		CreateInvItems (slf, ItMw_Sturmbringer , 1);
		
		CreateInvItems (slf, ItRw_Crossbow_H_01 , 1);
		CreateInvItems (slf, ItRw_Crossbow_H_02 , 1);
		
		CreateInvItems (slf, ItRw_Arrow, 500); 
		

		// Tarcze
		CreateInvItems (slf, ItNa_TarczaRycerza, 1);

		CreateInvItems (slf, ItMi_Gold, 150); 

		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_EDGE, 1);
		CreateInvItems (slf, ItBe_Addon_Prot_TOTAL, 1);
	

	
		Johny_ItemsGiven_Chapter_4 = TRUE;
	};

};
