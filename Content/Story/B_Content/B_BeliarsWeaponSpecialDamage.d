
func void B_BeliarsWeaponSpecialDamage (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	/*Bogu: to chyba nie potrzebne if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandy;
		DamageRandy = Hlp_Random (100);

		if (C_ScHasReadiedBeliarsWeapon())
		&& (DamageRandy <= BeliarDamageChance) 
			{
				if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) //beim untoten Drachen nimmt der SC Schaden
				{
					Wld_PlayEffect("spellFX_BELIARSRAGE", oth, oth, 0, 0, 0, FALSE );
					B_MagicHurtNpc (slf, oth, 100); 
				}
				else if (slf.flags != NPC_FLAG_IMMORTAL)
				{
					Wld_PlayEffect("spellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE );
					B_MagicHurtNpc (oth, slf, 100);  			
				};
				//Ambient Pfx
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );
			};
	
		if (C_ScHasReadiedBeliarsWeapon())
		&& (DamageRandy <= 50) // Effekt
		{
				//Ambient Pfx
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );
		};
	};
	*/
	//Miecz Runiczny
	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandyRuniczny;
		DamageRandyRuniczny = Hlp_Random (100);

		if (mocMieczRuniczny > 0) {
		
		
		
		if (C_ScHasReadiedMieczRuniczny())
		&& (DamageRandyRuniczny > 80)
		{
		mocMieczRuniczny = mocMieczRuniczny - 1;
		
			if (mocMieczRuniczny == 0) { PrintScreen ("Kryszta³ w mieczu straci³ swoj¹ moc", -1,-1, "font_old_20_white.tga",2); }
			else if (mocMieczRuniczny == 5) { PrintScreen ("Kryszta³ w mieczu traci blask...", -1,-1, "font_old_20_white.tga",2); }; 
		
		
			if (MieczRunicznyUbrany == 1) {
				//AI_StartState		(slf, ZS_Pyro, 0, "");
				Wld_PlayEffect ("spellFX_RingRitual1", slf, slf, 0, 0, 0, FALSE);
				B_MagicHurtNpc (oth, slf, 95);
			};
			if (MieczRunicznyUbrany == 2) {
				Wld_PlayEffect ("spellFX_IceCube", slf, slf, 0, 0, 0, FALSE);
				Wld_PlayEffect ("spellFX_IceCube_COLLIDE", slf, slf, 0, 0, 0, FALSE);
				Wld_PlayEffect ("spellFX_Icespell_COLLIDEDYNFX", slf, slf, 0, 0, 0, FALSE);
				AI_StartState		(slf, ZS_MagicFreeze, 0, "");
				B_MagicHurtNpc (oth, slf, 65); //115 Schaden reicht genau für einen Lurker.
			};
			if (MieczRunicznyUbrany == 3) {
				Wld_PlayEffect ("spellFX_Whirlwind_COLLIDE", slf, slf, 0, 0, 0, FALSE);
				AI_StartState		(slf, ZS_Whirlwind, 0, "");
				B_MagicHurtNpc (oth, slf, 65); //115 Schaden reicht genau für einen Lurker.
			};
		};
		
		};
	};

	//Strzaly
	/*
	if (Npc_HasReadiedRangedWeapon(hero))
	&& (Hlp_GetInstanceID (oth) == Hlp_GetInstanceID (hero))
	{
		var C_ITEM Weapon;	
		Weapon = Npc_GetReadiedWeapon (oth);

			if (SpecialArrow == 1)
			{
				Wld_PlayEffect ("spellFX_RingRitual1", slf, slf, 0, 0, 0, FALSE);
				B_MagicHurtNpc (oth, slf, 95);
			};
			
			if (SpecialArrow == 2)
			{
				B_MagicHurtNpc (oth, slf, 45);
			};
			
			if (SpecialArrow == 3)
			{
				Wld_PlayEffect ("spellFX_IceCube", slf, slf, 0, 0, 0, FALSE);
				Wld_PlayEffect ("spellFX_IceCube_COLLIDE", slf, slf, 0, 0, 0, FALSE);
				Wld_PlayEffect ("spellFX_Icespell_COLLIDEDYNFX", slf, slf, 0, 0, 0, FALSE);
				AI_StartState		(slf, ZS_MagicFreeze, 0, "");
				B_MagicHurtNpc (oth, slf, 65); //115 Schaden reicht genau für einen Lurker.
			};
		};
	*/

};
