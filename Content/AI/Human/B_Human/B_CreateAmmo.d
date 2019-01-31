// ******************************************************
// B_CreateAmmo
// ------------
// generiert Munition, wenn FK-Waffe equippt oder gezogen
// ******************************************************

func void B_CreateAmmo(var C_NPC slf)
{
	var C_ITEM rangedWeapon;
	
	if (Npc_IsInFightMode(slf, FMODE_FAR))
	{
		rangedWeapon = Npc_GetReadiedWeapon(slf);
	}
	else if (Npc_HasEquippedRangedWeapon (slf))
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(slf);
	}
	else //weder gezogenen noch equippten Bogen
	{
		return;
	};
		
	// ------ Munition auffüllen ------
	if (rangedWeapon.munition == ItRw_Arrow)
	{
		if (Npc_HasItems(slf, ItRw_Arrow) < 10)
		{
			CreateInvItems (slf, ItRw_Arrow, 10);
		};
	}
	else if (rangedWeapon.munition == ItRw_Bolt)
	{
		if (Npc_HasItems(slf, ItRw_Bolt) < 10)
		{
			CreateInvItems (slf, ItRw_Bolt, 10);
		};
	}
	else if (rangedWeapon.munition == ItNa_LodowaStrzala)
	{
		if (Npc_HasItems(slf, ItNa_LodowaStrzala) < 10)
		{
			CreateInvItems (slf, ItNa_LodowaStrzala, 10);
		};
	}	
	else if (rangedWeapon.munition == ItNa_OgnistaStrzala)
	{
		if (Npc_HasItems(slf, ItNa_OgnistaStrzala) < 10)
		{
			CreateInvItems (slf, ItNa_OgnistaStrzala, 10);
		};
	}
	else if (rangedWeapon.munition == ItNa_OstraStrzala)
	{
		if (Npc_HasItems(slf, ItNa_OstraStrzala) < 10)
		{
			CreateInvItems (slf, ItNa_OstraStrzala, 10);
		};
	}	
	else if (rangedWeapon.munition == ItRw_SharpBolt)
	{
		if (Npc_HasItems(slf, ItRw_SharpBolt) < 10)
		{
			CreateInvItems (slf, ItRw_SharpBolt, 10);
		};
	};
							
};

