
func void AI_Function_NNII(var c_npc slf, var func function, var int param1, var int param2, var int param3, var int param4) {
    var int s; s = SB_New();
    SB ("NNII ");
    SBi(param1);
    SB (" ");
    SBi(param2);
    SB (" ");
    SBi(param3);
    SB (" ");
    SBi(param4);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};

func void AI_Function_NII(var c_npc slf, var func function, var c_npc npcParam1, var int intParam2, var int intParam3)
{
	 var int s; s = SB_New();
    SB ("NII ");
    SBi(_@(npcParam1));
    SB (" ");
    SBi(intParam2);
    SB (" ");
    SBi(intParam3);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();

};

func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	var string itemname;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};
	
	
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	itemname = item.description;
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_gegeben);
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_erhalten);
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_Function_SI(giver,PrintS_Ext,concatText, RGBA(255,255,255,0));
			//PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	
	//jako jeden pusty wiersz odstepu
	AI_Function_SI(giver,PrintS_Ext," ", RGBA(255,255,255,0));
	//PrintS_Ext(" ", RGBA(255,255,255,0));
	return TRUE;
};



/*
// U12 -> Uwaga! W AI_Function z LeGo dopisany przypadek obsługujący NNII
func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	//var int giverInst; giverInst = Hlp_GetInstanceID(giver);
	//var int takerInst; takerInst = Hlp_GetInstanceID(taker);
	//AI_Function_NNII(hero,_B_GiveInvItems, taker, giver, itemInstance, amount);
	//_B_GiveInvItems(giver,taker,itemInstance,amount);
	AI_Function_NII(giver,__B_GiveInvItems,taker,itemInstance,amount);
};*/

func int __B_GiveInvItems(var c_npc giver, var c_npc taker, var int itemInstance, var int amount)
{

	giver = _^(ECX);

	var string concatText;
	var string itemname;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	itemname = item.description;
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_gegeben);
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_GoldTaken,FONT_ScreenSmall,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_erhalten);
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			PrintS_Ext(concatText, RGBA(255,255,255,0));
			//AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	
	//jako jeden pusty wiersz odstepu
	PrintS_Ext(" ", RGBA(255,255,255,0));
	return TRUE;
};

