// ******************
// B_Addon_GivePotion
// ******************

// ------------------------------------------------------
instance DIA_Addon_GivePotion(C_INFO)
{

	nr			= 777;
	condition	= DIA_Addon_GivePotion_Condition;
	information	= DIA_Addon_GivePotion_Info;
	permanent	= TRUE;
	description = "(Daj miksturê lecznicz¹)";
};                       
FUNC INT DIA_Addon_GivePotion_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.flags	!= NPC_FLAG_IMMORTAL)	
	{
		if (Npc_HasItems (other,ItPo_Health_01) >= 1)
		|| (Npc_HasItems (other,ItPo_Health_02) >= 1)
		|| (Npc_HasItems (other,ItPo_Health_03) >= 1)
		{
			return TRUE;
		};
	};
};
func VOID DIA_Addon_GivePotion_Info()
{	
	Info_ClearChoices (DIA_Addon_GivePotion);
	Info_AddChoice (DIA_Addon_GivePotion,DIALOG_BACK,DIA_Addon_GivePotion_BACK);
	if (Npc_HasItems (other,ItPo_Health_03) >= 1)
	{
		Info_AddChoice (DIA_Addon_GivePotion,"(Daj eliksir leczniczy)",DIA_Addon_GivePotion_ItPo_Health_03);
	};
	if (Npc_HasItems (other,ItPo_Health_02) >= 1)
	{
		Info_AddChoice (DIA_Addon_GivePotion,"(Daj ekstrakt leczniczy)",DIA_Addon_GivePotion_ItPo_Health_02);
	};
	if (Npc_HasItems (other,ItPo_Health_01) >= 1)
	{
		Info_AddChoice (DIA_Addon_GivePotion,"(Daj esencjê lecznicz¹)",DIA_Addon_GivePotion_ItPo_Health_01);
	};
};
// ------------------------------------------------------------
func void B_Addon_DrinkPotion ()
{
	HeroSay_TakeThisPotion();

	if ((self.attribute[ATR_HITPOINTS]) < (self.attribute[ATR_HITPOINTS_MAX])) //geändert m.F. 
	{
		if (Npc_HasItems(self,ItPo_Health_03) > 0)			
		{
			B_UseItem (self, ItPo_Health_03);
		}
		else if (Npc_HasItems(self,ItPo_Health_02) > 0)
		{
			B_UseItem (self, ItPo_Health_02);
		}
		else if (Npc_HasItems (self,ItPo_Health_01) > 0)
		{
			B_UseItem (self, ItPo_Health_01);
		};
	};

	Info_ClearChoices (DIA_Addon_GivePotion);
};
// ------------------------------------------------------------
func void DIA_Addon_GivePotion_BACK()
{
	Info_ClearChoices (DIA_Addon_GivePotion);
};
// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_03()
{
	B_GiveInvItems (other,self,ItPo_Health_03,1);
	B_Addon_DrinkPotion();
};
// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_02()
{
	B_GiveInvItems (other,self,ItPo_Health_02,1);
	B_Addon_DrinkPotion();
};
// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_01()
{
	B_GiveInvItems (other,self,ItPo_Health_01,1);
	B_Addon_DrinkPotion();
};



























// ------------------------------------------------------
instance DIA_Addon_GiveMeal(C_INFO)
{

	nr			= 777;
	condition	= DIA_Addon_GiveMeal_Condition;
	information	= DIA_Addon_GiveMeal_Info;
	permanent	= TRUE;
	description = "(Daj leczniczy posi³ek)";
};                       
FUNC INT DIA_Addon_GiveMeal_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.flags	!= NPC_FLAG_IMMORTAL)	
	{
		if (Npc_HasItems (other,ItPl_Health_Herb_01) >= 1)
		|| (Npc_HasItems (other,ItPl_Health_Herb_02) >= 1)
		|| (Npc_HasItems (other,ItPl_Health_Herb_03) >= 1)
		|| (Npc_HasItems (other,ItPl_Mushroom_01) >= 1)
		|| (Npc_HasItems (other,ItPl_Mushroom_02) >= 1)
		|| (Npc_HasItems (other,ItFoMutton) >= 1)
		|| (Npc_HasItems (other,ItFoMuttonRaw) >= 1)
		
		{
			return TRUE;
		};
	};
};
func VOID DIA_Addon_GiveMeal_Info()
{	
	Info_ClearChoices (DIA_Addon_GiveMeal);
	Info_AddChoice (DIA_Addon_GiveMeal,DIALOG_BACK,DIA_Addon_GiveMeal_BACK);
	if (Npc_HasItems (other,ItPl_Health_Herb_03) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj korzeñ leczniczy)",DIA_Addon_GiveMeal_ItPl_Health_03);
	};
	if (Npc_HasItems (other,ItPl_Health_Herb_02) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj ziele lecznicze)",DIA_Addon_GiveMeal_ItPl_Health_02);
	};
	if (Npc_HasItems (other,ItPl_Health_Herb_01) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj roœlinê lecznicz¹)",DIA_Addon_GiveMeal_ItPl_Health_01);
	};
	if (Npc_HasItems (other,ItPl_Mushroom_02) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj du¿ego grzyba)",DIA_Addon_GiveMeal_ItPl_Mushroom_02);
	};
	if (Npc_HasItems (other,ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj piekielnika)",DIA_Addon_GiveMeal_ItPl_Mushroom_01);
	};
	if (Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj surowe miêso)",DIA_Addon_GiveMeal_ItFoMuttonRaw);
	};
	if (Npc_HasItems (other,ItFoMutton) >= 1)
	{
		Info_AddChoice (DIA_Addon_GiveMeal,"(Daj sma¿one miêso)",DIA_Addon_GiveMeal_ItFoMutton);
	};
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_BACK()
{
	Info_ClearChoices (DIA_Addon_GiveMeal);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItPl_Health_03()
{
	B_GiveInvItems (other,self,ItPl_Health_Herb_03,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItPl_Health_Herb_03);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItPl_Health_02()
{
	B_GiveInvItems (other,self,ItPl_Health_Herb_02,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItPl_Health_Herb_02);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItPl_Health_01()
{
	B_GiveInvItems (other,self,ItPl_Health_Herb_01,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItPl_Health_Herb_01);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItPl_Mushroom_02()
{
	B_GiveInvItems (other,self,ItPl_Mushroom_02,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItPl_Mushroom_02);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItPl_Mushroom_01()
{
	B_GiveInvItems (other,self,ItPl_Mushroom_01,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItPl_Mushroom_01);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItFoMuttonRaw()
{
	B_GiveInvItems (other,self,ItFoMuttonRaw,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItFoMuttonRaw);
};
// ------------------------------------------------------------
func void DIA_Addon_GiveMeal_ItFoMutton()
{
	B_GiveInvItems (other,self,ItFoMutton,1);
	HeroSay_TakeThisMeal();
	B_UseItem (self, ItFoMutton);
};
















// ****************************************************************
// ----------------------------------------------------------------

func void B_Addon_GivePotion(var C_NPC slf)
{
	DIA_Addon_GivePotion.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_GiveMeal.npc   = Hlp_GetInstanceID(slf);
};
