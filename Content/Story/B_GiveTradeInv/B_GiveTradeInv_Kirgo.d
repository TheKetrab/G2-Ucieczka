var int Kirgo_ItemsGiven_Chapter_1;
var int Kirgo_ItemsGiven_Chapter_2;
var int Kirgo_ItemsGiven_Chapter_3;
var int Kirgo_ItemsGiven_Chapter_4;
var int Kirgo_ItemsWrzod;

FUNC VOID B_GiveTradeInv_Kirgo (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Kirgo_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItPo_Mana_01 	,5); 
		CreateInvItems (slf,ItPo_Speed 	,4); 
		CreateInvItems (slf,ItPo_Health_01	,3);
		CreateInvItems (slf,ItNa_Odtrutka	,8);
		
		// ------ Scrolls ------
		CreateInvItems (slf,ItSc_Light		,1);
		CreateInvItems (slf,ItSc_Sleep		,1);
		CreateInvItems (slf,ItSc_Firebolt 	,2);
		CreateInvItems (slf,ItSc_SumGobSkel	,1);	
		CreateInvItems (slf,ItNa_Oswojenie	,2);	
		CreateInvItems (slf,ItNa_TrfMeatbug	,1);
			
		Kirgo_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Kirgo_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf,ItNa_Odtrutka	,15);

		CreateInvItems (slf, ItMi_Gold, 60); 
		CreateInvItems (slf,ItPo_Mana_01 	,4); 
		CreateInvItems (slf,ItPo_Health_01	,2); 
		CreateInvItems (slf,ItPo_Mana_02 	, 2);
		CreateInvItems (slf,ItPo_Health_02	, 2); 	
		CreateInvItems (slf, ItPo_Speed, 6); 

		CreateInvItems (slf, ItPl_Health_Herb_01, 14); 
		CreateInvItems (slf, ItPl_Health_Herb_02, 12); 
		CreateInvItems (slf, ItPl_Health_Herb_03, 6); 
		
		CreateInvItems (slf,ItSc_InstantFireball ,3);
		CreateInvItems (slf, ItNa_GroupHeal, 1); 
		Kirgo_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Kirgo_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf,ItNa_Odtrutka	,19);

		CreateInvItems (slf, ItMi_Gold, 120);  
		CreateInvItems (slf,ItPo_Health_01	,5);
		CreateInvItems (slf,ItPo_Health_02	, 3);
		CreateInvItems (slf,ItPo_Health_03	, 4);
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItSc_InstantFireball ,5);
		CreateInvItems (slf,ItNa_Oswojenie	,3);
		CreateInvItems (slf, ItNa_GroupHeal, 2); 		
		CreateInvItems (slf,ItNa_TrfMeatbug	,1);

		Kirgo_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Kirgo_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf,ItNa_Odtrutka	,18);

		CreateInvItems (slf, ItMi_Gold, 220); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ItPo_Mana_01 	,3); 
		CreateInvItems (slf,ItPo_Health_02	, 4); 
		CreateInvItems (slf,ItPo_Health_03	, 2); 
		CreateInvItems (slf,ItNa_Oswojenie	,1);
		CreateInvItems (slf, ItNa_GroupHeal, 1); 
		Kirgo_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((npc_knowsinfo (other, DIA_NASZ_225_Wrzod_CanIHelp))
	&& (Kirgo_ItemsWrzod == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 220); 
		CreateInvItems (slf,ItNa_Oswojenie	,4);

		Kirgo_ItemsWrzod = TRUE;
	};
};
