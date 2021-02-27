var int Engor_ItemsGiven_Chapter_1;
var int Engor_ItemsGiven_Chapter_2;
var int Engor_ItemsGiven_Chapter_3;
var int Engor_ItemsGiven_Chapter_4;

FUNC VOID B_GiveTradeInv_Engor (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Engor_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Hammer, 1); 
	
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItPo_Mana_01 	,2); 
		CreateInvItems (slf,ItPo_Health_01	,3);
		CreateInvItems (slf,ItNa_Odtrutka	,2);
		CreateInvItems (slf,ItNa_ZupaGrzybowa	,4);
		CreateInvItems (slf,ItFo_Stew , 2); 

		// ------ AmRiBe ------
		CreateInvItems (slf,ItBe_Addon_Prot_MAGIC, 1); 
		CreateInvItems (slf,ItAm_Hp_Mana_01 ,1);	

		// ------ Engor ------
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf,ItFo_Bread , 3);
		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItFo_Bacon, 2); 
		CreateInvItems (slf,ItPl_Beet, 7); 		
		CreateInvItems (slf,ItAm_Hp_01, 1);
		CreateInvItems (slf,ItNa_Butelka, 12);
		CreateInvItems (slf,ItNa_Chmiel, 23);
		CreateInvItems (slf,ItFo_Apple, 7);
		CreateInvItems (slf,ItNa_KsiegaWiedzy, 1);
		CreateInvItems (slf,ItMi_Saw, 1);
		CreateInvItems (slf,ItMi_Coal, 75);
		CreateInvItems (slf,ItWr_Map_OldWorld, 1);
		Engor_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Engor_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf,ItPo_Health_01	,2);
		CreateInvItems (slf,ItNa_Odtrutka	,6);
		CreateInvItems (slf,ItNa_ZupaGrzybowa	,3);

		// ------ Engor ------
		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItFoMutton, 6); 
		CreateInvItems (slf,ItFo_Stew , 2); 
		CreateInvItems (slf,ItFo_Fishsoup, 5);
		CreateInvItems (slf,ItNa_PasLowcyOrkow, 1);
		CreateInvItems (slf,ItMi_Coal, 50);
		CreateInvItems (slf,ItSc_InstantFireball ,3);

		Engor_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Engor_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 120); 
		CreateInvItems (slf,ItPo_Mana_01 ,2);
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf,ItPo_Health_01,1);
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItNa_Odtrutka	,5);
		CreateInvItems (slf,ItSc_InstantFireball ,3);

		// ------ Engor ------
		CreateInvItems (slf,ItPo_Health_01	, 3);
		CreateInvItems (slf,ItPo_Health_02	, 2);
		CreateInvItems (slf,ItPo_Health_03	, 2);

		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItFo_Bacon , 2); 
		CreateInvItems (slf,ItFoMutton, 10); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Sausage, 4); 
		CreateInvItems (slf,ItFo_Booze, 5); 
		CreateInvItems (slf,ItPl_Beet, 5); 	
		CreateInvItems (slf,ItFo_Sausage, 13);		
		CreateInvItems (slf,ItMi_Coal, 25);
		Engor_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Engor_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf,ItNa_Odtrutka	,8);

		CreateInvItems (slf, ItMi_Gold, 220); 
		CreateInvItems (slf,ItPo_Health_01	,3);
		CreateInvItems (slf,ItPo_Health_02	, 2); 
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItFo_Water , 5);
		
		// ------ Engor ------
		CreateInvItems (slf,ItFo_Wine, 4); 
		CreateInvItems (slf,ItFo_Milk , 6); 
		CreateInvItems (slf,ItFoMutton, 3); 
		CreateInvItems (slf,ItFo_Stew , 2); 
		CreateInvItems (slf,ItFo_Sausage, 4); 
		CreateInvItems (slf,ItFo_Bacon, 6); 

		Engor_ItemsGiven_Chapter_4 = TRUE;
	};
};