// *************************************************************
// B_SelectSpell
// -------------
// Magieauswahl für Menschen und Monster
// Wenn Auswahlkriterien erfüllt (je nach Gilde unterschiedlich)
// --> TRUE, sonst FALSE
// Humans zaubern nur als KdF, PAL oder DMT
// *************************************************************

func int B_SelectSpell (var C_NPC slf, var C_NPC oth)
{	

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_115_Kurgan)) && (KurganMozeStop == FALSE) && (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_arena))
	{
		
		if (Npc_HasItems (slf, ItNa_KurganDuch) == 0)
		{	
			//PrintScreen	("Kurgan tworzy zaklêcie", -1,-1, "font_old_20_white.tga",3); //test
			CreateInvItems (slf, ItNa_KurganDuch, 1);
		};
		
		
		if (Kurgan_Przyzwal_Ducha == TRUE)	{
			KurganMozeStop = TRUE;
			//PrintScreen	("Kurgan_Przyzwal_Ducha=TRUE", -1,-1, "font_old_20_white.tga",3); //test
			
			return TRUE;
		};
		//return TRUE;


		//B_ReadySpell (slf, SPL_SummonKurgan, 0);
		//return TRUE;
		if (Kurgan_Przyzwal_Ducha == FALSE){
			//B_ReadySpell (slf, SPL_SummonKurgan, 0);
			//Kurgan_Przyzwal_Ducha = TRUE;
			//PrintScreen	("Kurgan_Przyzwal_Ducha=FALSE", -1,-1, "font_old_20_white.tga",3); //test
			B_ReadySpell (slf, SPL_SummonKurgan, 0);
			return TRUE;
		};

	};	


	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_422_Duch)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_425_Duch))
	{
		if (Npc_HasItems (slf, ItRu_Pyrokinesis) == 0)
		{	
			CreateInvItems (slf, ItRu_Pyrokinesis, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_Pyrokinesis, SPL_COST_Firestorm);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Pyrokinesis, SPL_COST_Firestorm);
			return TRUE;
		};
	};	
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_016_Netbek)) && (NetbekUzywaZwoju == TRUE)
	{			
		if (Npc_HasItems (slf, ItNa_Grow) == 0)
		{	
			CreateInvItems (slf, ItNa_Grow, 1);
		};

			B_ReadySpell (slf, SPL_GROW, 0);
			return TRUE;

	};	
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_404_Beliar))
	{
		if (Npc_HasItems (slf, ItRu_BeliarsRage) == 0)
		{	
			CreateInvItems (slf, ItRu_BeliarsRage, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_Energyball, SPL_Cost_Energyball);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Energyball, SPL_Cost_Energyball);
			return TRUE;
		};
	};	

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_402_Innos))
	{
		if (InnosSieTeleportuje == TRUE) && (Npc_GetDistToWP	(NASZ_402_Innos, "NASZ_OLDTEMPLE_INNOS") < 3000)
		{
			if (Npc_HasItems (slf, ItNa_TeleportLowcy) == 0)
			{	
				CreateInvItems (slf, ItNa_TeleportLowcy, 1);
			};

			B_ReadySpell (slf, SPL_TeleportLowcy, 0);
			return TRUE;
		}

		else
		{
			if (Npc_HasItems (slf, ItRu_ChargeFireBall) == 0)
			{	
				CreateInvItems (slf, ItRu_ChargeFireBall, 1);
			};

			if (C_NpcHasAttackReasonToKill (self))
			{
				B_ReadySpell (slf, SPL_ChargeFireBall, SPL_Cost_ChargeFireBall);
				return TRUE;
			}
			else
			{
				B_ReadySpell (slf, SPL_ChargeFireBall, SPL_Cost_ChargeFireBall);
				return TRUE;
			};
		};	
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_403_Adanos))
	{

		if (AdanosSieTeleportuje == TRUE) && (Npc_GetDistToWP	(NASZ_403_Adanos, "OW_ICEDRAGON_15") < 1000)
		{
			if (Npc_HasItems (slf, ItNa_TeleportLowcy) == 0)
			{	
				CreateInvItems (slf, ItNa_TeleportLowcy, 1);
			};

			B_ReadySpell (slf, SPL_TeleportLowcy, 0);
			return TRUE;
		}

		else
		{
			if (Npc_HasItems (slf, ItRu_Geyser) == 0)
			{	
				CreateInvItems (slf, ItRu_Geyser, 1);
			};

			if (C_NpcHasAttackReasonToKill (self))
			{
				B_ReadySpell (slf, SPL_Geyser, SPL_Cost_Geyser);
				return TRUE;
			}
			else
			{
				B_ReadySpell (slf, SPL_Geyser, SPL_Cost_Geyser);
				return TRUE;
			};
		};
	};	
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_406_Straznik))
	{
		if (Npc_HasItems (slf, ItRu_Skull) == 0)
		{	
			CreateInvItems (slf, ItRu_Skull, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_Skull, SPL_Cost_Skull);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Skull, SPL_Cost_Skull);
			return TRUE;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_408_Straznik))
	{
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{	
			CreateInvItems (slf, ItRu_IceCube, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_IceCube, SPL_Cost_IceCube);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_IceCube, SPL_Cost_IceCube);
			return TRUE;
		};
	};	

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_409_Nieznany))
	{
		if (Npc_HasItems (slf, ItRu_MassDeath) == 0)
		{	
			CreateInvItems (slf, ItRu_MassDeath, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_MassDeath, SPL_Cost_MassDeath);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_MassDeath, SPL_Cost_MassDeath);
			return TRUE;
		};
	};	

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_417_SlugaBeliara))
	{
		if (Npc_HasItems (slf, ItRu_BeliarsRage) == 0)
		{	
			CreateInvItems (slf, ItRu_BeliarsRage, 1);
		};

		if (C_NpcHasAttackReasonToKill (self))
		{
			B_ReadySpell (slf, SPL_Energyball, SPL_Cost_Energyball);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Energyball, SPL_Cost_Energyball);
			return TRUE;
		};
	};	
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NASZ_229_Ayan)) && (!npc_knowsinfo (other, DIA_NASZ_229_Ayan_ready)) && (npc_knowsinfo (other, DIA_NASZ_229_Ayan_chodzmy))
	{
		if (Npc_HasItems (slf, ItNa_TeleportOzywieniec) == 0)
		{	
			CreateInvItems (slf, ItNa_TeleportOzywieniec, 1);
		};

			B_ReadySpell (slf, SPL_TeleportOzywieniec, 0);
			return TRUE;

	};	
	

	
	
	
	
	// ------ Npctype_Friend macht höchstens Sleep ------
	if (slf.npctype == NPCTYPE_FRIEND)
	&& (Npc_IsPlayer (oth))
	&& (oth.guild < GIL_SEPERATOR_HUM) //nicht gegen verwandelten Spieler
	{
		if (slf.guild == GIL_KDF)
		|| (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
		{
			if (Npc_HasItems (slf, ItRu_Sleep) == 0)
			{
				CreateInvItems (slf, ItRu_Sleep, 1);
			};
		
			B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);
			return TRUE;
		}
		else //Nicht-KdF
		{
			return FALSE;
		};
	};


	// ------ Magier ------
	if (slf.guild == GIL_KDF)
	|| (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
	{
		if (Npc_HasItems (slf, ItRu_Concussionbolt) == 0)
		{
			CreateInvItems (slf, ItRu_Concussionbolt, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_InstantFireBall) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireBall, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_Deathball) == 0)
		{
			CreateInvItems (slf, ItRu_Deathball, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_FullHeal) == 0)
		{
			CreateInvItems (slf, ItRu_FullHeal, 1);
		};
		
		if (self.attribute[ATR_HITPOINTS] < 100) 
		{
			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
			return TRUE;
		}
		else if (C_NpcHasAttackReasonToKill (self))
		{
			if (self.flags == NPC_FLAG_IMMORTAL)
			{
				B_ReadySpell (slf, SPL_Deathball, SPL_Cost_Deathball);
			}
			else
			{
				B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireBall);
			};
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Concussionbolt, SPL_Cost_Concussionbolt);
			return TRUE;
		};
	};
	
	// ------ Paladin ------
	if (slf.guild == GIL_PAL)
	{
		if (slf.fight_tactic == FAI_NAILED) //AL-Burgwachen auf den Zinnen
		{
			return FALSE;
		};
			
		if (Npc_HasItems (slf, ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems (slf, ItRu_PalHolyBolt, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		&& (C_NpcIsEvil(oth))
		{
			B_ReadySpell (slf, SPL_PalHolyBolt, SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE; //Angriff mit Waffen
		};
	};
	
	// ------ Skelett Magier ------
	if (slf.guild == GIL_SKELETON_MAGE)
	{
		if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
		{
			CreateInvItems (slf, ItRu_SumSkel, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{
			CreateInvItems (slf, ItRu_IceCube, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_Icebolt) == 0)
		{
			CreateInvItems (slf, ItRu_Icebolt, 1);
		};
		
			// ------ Spruchzyklus bei SUMMON beginnen ------
			if (slf.aivar[AIV_SelectSpell] >= 6)
			{
				slf.aivar[AIV_SelectSpell] = 1;
			};
		
		if (!Npc_IsInState (oth, ZS_MagicFreeze))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			B_ReadySpell (slf, SPL_IceCube,	SPL_Cost_IceCube);
			return TRUE;
		}
		else if (slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Icebolt, SPL_Cost_Icebolt);
			return TRUE;
		};
	};
	
	// ------ Eisgolem ------
	if (slf.guild == GIL_ICEGOLEM)
	{
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{
			CreateInvItems (slf, ItRu_IceCube, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) 
		|| (Npc_IsInState (oth, ZS_MagicFreeze))								
		{
			return FALSE; //Nahkampfangriff
		}
		else
		{
			B_ReadySpell (slf, SPL_IceCube,	SPL_Cost_IceCube);
			return TRUE;
			
		};
	};
	
	// ------ Feuergolem ------
	if (slf.guild == GIL_FIREGOLEM)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell (slf, SPL_InstantFireball,	SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	

	// ------ Sumpfdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Felsdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Feuerdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Eisdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Untoter Drache (ENDGEGNER) ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(self);
		if (Npc_HasItems (slf, ItRu_Deathball) == 0)
		{
			CreateInvItems (slf, ItRu_Deathball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_Deathball, SPL_Cost_Deathball);	
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Ork Schamane ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
				
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	return FALSE; //alle anderen Gilden		
};   
