// *****************
// B_MM_AssessDamage
// *****************

var int HeroHitSusanDialogCnt;
func void B_MM_AssessDamage ()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Ghost_Immortal)) // jesli uderzysz Susan
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero)) // i to ty uderzysz
	&& (HeroHitSusanDialogCnt < 4)
	{
		HeroHitSusanDialogCnt += 1;

		if (HeroHitSusanDialogCnt >= 4) {
			HeroSay_SusanImmortal();
		};
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


