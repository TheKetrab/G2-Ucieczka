// *******************************************
// B_SelectWeapon
// --------------
// Bei Fernkämpfern wird Muni ins Inv gemogelt
// *******************************************

func void B_SelectWeapon(var C_NPC slf, var C_NPC oth)
{
	// EXIT IF...
	
	// ------ NSC im Wasser / beim Fallen ------
	if (C_BodyStateContains(slf,BS_FALL))
	|| (C_BodyStateContains(slf,BS_SWIM))
	|| (C_BodyStateContains(slf,BS_DIVE))
	{
		return;
	};
	
	// ------ Magie wählen oder behalten ------
	if (B_SelectSpell (slf, oth))		//bei HUMANS wählen nur Magier, Paladine oder Dementoren Magie
	{
		return; 			//Magie gewählt!
	};
	
	
	if (Npc_IsInFightMode(slf,FMODE_MAGIC))		//Habe Magie gezogen, will aber keine benutzen!!!
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyMeleeWeapon	(slf); //Schwert ziehen, sonst Fäuste
		return;
	};
	
	// ------ Fernkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf,FMODE_FAR))
	{			
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) 
		|| (!Npc_HasEquippedMeleeWeapon(slf))

		{
			return;
		};
	};
	
	// ------ Nahkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		if (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER)
		|| (!Npc_HasEquippedRangedWeapon(slf))

		{
			return;
		};
	};

		
	// FUNC

	
	// Monk ma nie uzywac kuszy
	if (Npc_IsInFightMode (slf,FMODE_NONE))
	&& (Hlp_GetInstanceID(slf) == NASZ_307_Monk) {
		AI_ReadyMeleeWeapon	(slf);
		return;
	};
	
	// Korth ma nie uzywac kuszy
	if (Npc_IsInFightMode (slf,FMODE_NONE))
	&& (Hlp_GetInstanceID(slf) == NASZ_101_Korth) {
		AI_ReadyMeleeWeapon	(slf);
		return;
	};
	
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSCOUT)
	{				
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
			return;
		}
		else
		{
			AI_RemoveWeapon (slf);
			AI_ReadyMeleeWeapon (slf);
			return;
		};
	};

	if (slf.aivar[AIV_OnlyBow] == TRUE)
	{					
		if (Npc_GetDistToNpc(slf,oth) > 0)
		{
			AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
			return;
			
		};
	};
	
	if (Npc_HasEquippedRangedWeapon(slf)) //Npc_HasReadiedRangedWeapon(slf)
	{
		var c_item rw;  rw = Npc_GetEquippedArmor(oth);
		if(rw.material == MAT_METAL)
		{
			rw = Npc_GetEquippedRangedWeapon(slf);
			
			if(rw.flags & ITEM_BOW)
			{
				rw.munition = ItNa_OstraStrzala;
				B_CreateAmmo(slf);
				AI_RemoveWeapon (slf);
				AI_ReadyRangedWeapon (slf);	
				return;	
			
			}
			else
			{
				rw.munition =  ItRw_SharpBolt;
				B_CreateAmmo(slf);
				AI_RemoveWeapon (slf);
				AI_ReadyRangedWeapon (slf);	
				return;	
			
			};
		};
		
		rw = Npc_GetEquippedRangedWeapon(slf);
		
		if(rw.flags & ITEM_BOW)
		{  
			if (Npc_GetDistToNpc(slf,oth) > 0)
			{
				if(oth.guild == GIL_FireGolem)
				{
					rw.munition = ItNa_LodowaStrzala;
					B_CreateAmmo(slf);
					AI_RemoveWeapon (slf);
					AI_ReadyRangedWeapon (slf);	
					return;
				}
				else if (oth.guild == GIL_IceGolem)
				{
					rw.munition = ItNa_OgnistaStrzala;
					B_CreateAmmo(slf);
					AI_RemoveWeapon (slf);
					AI_ReadyRangedWeapon (slf);
					return;
				};
			};
		};
	
	};
	
	// ------ NK-Waffe ziehen ------
	if (oth.guild !=gil_firegolem && oth.guild != gil_icegolem && Npc_HasEquippedMeleeWeapon(slf)
	&& (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyMeleeWeapon	(slf); //Schwert ziehen, sonst Fäuste
		return;
	};
	
	// ------ Bogen ziehen ------
	if ((oth.guild !=gil_firegolem && oth.guild != gil_icegolem && Npc_HasEquippedRangedWeapon(slf))
	&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER)
	&& (C_NpcHasAttackReasonToKill (slf)))
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon (slf);
		};
			
		AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
		return;
	};
	
	
	// ------ immer noch keine Waffe ------
	if (Npc_IsInFightMode (slf,FMODE_NONE))
	{
		// ------ dann Schwert, egal welche Distanz ------
		if (Npc_HasEquippedMeleeWeapon(slf))
		{
			AI_ReadyMeleeWeapon	(slf); //Schwert ziehen
			return;
		};
		
		// ------ wenn kein Schwert, dann Bogen, egal welche Distanz ------
		if (Npc_HasEquippedRangedWeapon(slf))
		{
			AI_ReadyRangedWeapon (slf); //FK-Waffe ziehen
			return;
		};
		
		// ----- wenn gar keine Waffe: Default (Fäuste) ------
		AI_ReadyMeleeWeapon	(slf);
		return;
	};
	
	
	
	return;
};




