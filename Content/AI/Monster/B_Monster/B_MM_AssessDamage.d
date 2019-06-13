// *****************
// B_MM_AssessDamage
// *****************

func void B_MM_AssessDamage ()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	
	
	// TODO bogu - ta funckja wywoluje sie kilkanaście razy na jeden atak (uderzenie) golema, przez co po jednym uderzeniu zeruje przeciwnikowi hp. czy da sie to obejsc? czy jest sens?
	// Walka golem vs golem
	if (self.guild == GIL_STONEGOLEM && other.guild == GIL_STONEGOLEM)
	{
		Npc_ChangeAttribute (self, ATR_HITPOINTS, -25);
	};

	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BestiaSwiatynna)) // jesli uderzysz bestie swiatynna
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero)) // i to ty uderzysz
	&& (hero.guild == GIL_DJG)
	&& (npc_knowsinfo(hero,DIA_NASZ_129_Matt_WeAreLate))
	{
		WillUderzylBestieSwiatynna = TRUE;
	};
	
	Kap5FightWithOrc(other,self);
	
	B_BeliarsWeaponSpecialDamage (other, self);

	// EXIT IF
	
	// ------ SONDERFALL: Magic Golem ------ 				//JUUUUNGEEEEE!!!
	
	// ----- wenn Monster Beute von Angreifer ------
	if (C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");	
		return;
	};

	// ------ wenn Monster im ZS_Attack ------
	if (Npc_IsInState(self,ZS_MM_Attack))
	{	
	
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// ------ HACK: von Skelettmagier getroffene Skelette ignorieren Schaden ------
		if (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
		&& (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		{
			return;
		};
		
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			{
				Npc_SetTarget (self, other); //Ziel wechseln, wenn zum zweiten Mal getroffen
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	Npc_SetTarget		(self, other);
	B_ClearPerceptions	(self);
	AI_StartState		(self, ZS_MM_Attack, 0, "");
	return;
};


