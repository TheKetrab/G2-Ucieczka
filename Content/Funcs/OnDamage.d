var int HeroPreviousHP;
var int UrShakHitCnt;


func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg) { 

	if(!victimPtr || !attackerPtr) { return dmg;}; 

	Var c_npc slf; slf = _^(attackerPtr);
	var c_npc oth; oth = _^(victimPtr);
	
	if(!slf || !oth) {Print(G2U_error_attack);};

	// TROLL SPECIAL ATTACK
	if (Npc_IsPlayer(slf) && oth.guild == GIL_TROLL) { BeginInvoke_TrollSpecialAttack(victimPtr); };
	if (Npc_IsPlayer(oth) && slf.guild == GIL_TROLL) { EndInvoke_TrollSpecialAttack(); };
	
	var C_ITEM ReadiedWeapon; ReadiedWeapon = Npc_GetReadiedWeapon(slf);

	if(oth.flags == 2 || oth.flags ==6) {dmg = 0; return dmg;};
	if (oth.aivar[AIV_TARCZA]  == TRUE)
	{
		if (C_BodyStateContains(oth,BS_PARADE)) && Npc_CanSeeNpc(oth,slf) &&  (oth.HitChance[NPC_TALENT_1H] >= 30)
		{ dmg = 0; return dmg; };
	};
	
	// PLAYER ATTACKER DAMAGE
	if (Npc_IsPlayer(slf))
	{
		var int FightSkill; FightSkill = Hlp_Random(99);
		
		if(Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			dmg = 0;
			
			if(ReadiedWeapon.flags & (ITEM_SWD | ITEM_AXE))
			{
				if((FightSkill >= 0) && (FightSkill <= ((slf.HitChance[NPC_TALENT_1H]) - 1)))
				{
					if(ReadiedWeapon.damagetype & DAM_FLY) // miecz runiczny C
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_FLY];
					};
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_BLUNT];
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_EDGE];
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_FIRE];
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_MAGIC];
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_POINT];
					};
				}
				else
				{
					if(ReadiedWeapon.damagetype & DAM_FLY) // miecz runiczny C
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_FLY])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_BLUNT])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_EDGE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_FIRE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_MAGIC])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_POINT])/10);
					};
				};
			}
			else
			{
				if((FightSkill >= 0) && (FightSkill <= ((slf.HitChance[NPC_TALENT_2H]) - 1)))
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_BLUNT];
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_EDGE];
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_FIRE];
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_MAGIC];
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_DEXTERITY] + (ReadiedWeapon.damageTotal) - oth.protection[PROT_POINT];
					};
				}
				else
				{
					if(ReadiedWeapon.damagetype & DAM_BLUNT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_BLUNT])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_EDGE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_EDGE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_FIRE)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_FIRE])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_MAGIC)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_MAGIC])/10);
					};
					if(ReadiedWeapon.damagetype & DAM_POINT)
					{
						dmg += (((slf.attribute[ATR_STRENGTH])/10) - 1) + (((slf.attribute[ATR_DEXTERITY])/10) - 1) + ((ReadiedWeapon.damageTotal)/10) - ((oth.protection[PROT_POINT])/10);
					};
				};
			};
			
			if (dmg <= 4)
			{
				dmg = 5;
			};
			
		}
		else if(Npc_IsInFightMode(slf, FMODE_FAR))
		{

			if(dmg >= 1)
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW)
				{
					if (ReadiedWeapon.munition  == ItNa_OgnistaStrzala)
					{
						if((30 - (oth.protection[PROT_MAGIC])) <= 0)
						{
							MunitionDMG = 0;
						}
						else
						{
							MunitionDMG = (30 - (oth.protection[PROT_MAGIC]));
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + (ReadiedWeapon.damageTotal) - (oth.protection[PROT_POINT]) + MunitionDMG;
						Wld_PlayEffect ("spellFX_RingRitual1", oth, oth, 0, 0, 0, FALSE);
					}
					else if (ReadiedWeapon.munition  == ItNa_LodowaStrzala)
					{
						if((30 - (oth.protection[PROT_MAGIC])) <= 0)
						{
							MunitionDMG = 0;
						}
						else
						{
							MunitionDMG = (30 - (oth.protection[PROT_MAGIC]));
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + (ReadiedWeapon.damageTotal) - (oth.protection[PROT_POINT]) + MunitionDMG;
						
						Wld_PlayEffect ("SPELLFX_ICELANCE_COLLIDEFX", oth, oth, 0, 0, 0, FALSE);
						Wld_PlayEffect ("SPELLFX_WHIRLWIND_COLLIDE", oth, oth, 0, 0, 0, FALSE);
						
						if (!Npc_IsInState (oth, ZS_MagicFreeze))
						{
							Wld_PlayEffect ("SPELLFX_ICESPELL_SENDPERCEPTION", oth, oth, 0, 0, 0, FALSE);
							Npc_ClearAIQueue	(oth);
							B_ClearPerceptions	(oth);
							AI_StartState		(oth, ZS_MagicFreeze, 0, "");
						};
					}
					else
					{
						if (ReadiedWeapon.munition  == ItNa_OstraStrzala)
						{
							MunitionDMG = 10;
						}
						else if (ReadiedWeapon.munition  == NormalArrow)
						{
							MunitionDMG = 0;
						};
						
						dmg = (slf.attribute[ATR_DEXTERITY]) + ((ReadiedWeapon.damageTotal) + MunitionDMG) - (oth.protection[PROT_POINT]);
					};
				}
				else
				{
					if (ReadiedWeapon.munition  == SharpBolt)
					{
						MunitionDMG = 10;
					}
					else if (ReadiedWeapon.munition  == NormalBolt)
					{
						MunitionDMG = 0;
					};
					
					dmg = (slf.attribute[ATR_STRENGTH]) + ((ReadiedWeapon.damageTotal) + MunitionDMG) - (oth.protection[PROT_POINT]);
				};
				
				if (dmg <= 4)
				{
					dmg = 5;
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{	
				var C_Spell spl; spl = GFA_GetActiveSpellInst(slf);// _^(Npc_GetSelectedSpell(slf));
				if(!spl) {return dmg = 0;};
	
				if(C_NpcIsUndead(oth) && spl.damage_per_level == SPL_Damage_DESTROYUNDEAD  && !C_NpcIsBoss(oth))
				{

					dmg = oth.attribute[0];
					dmg = DiffCalcDmg(dmg);
					return dmg;
				};
				
				/*if(slf.aivar[AIV_SpellLevel])
				{
					dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - oth.protection[PROT_MAGIC]); 
				}
				else
				{
					dmg = spl.damage_per_level - oth.protection[PROT_MAGIC];
				};*/
				if(Npc_UseFireSpell(slf))
				{
					// PROT -> 2/3 fire + 1/3 magic
					if(slf.aivar[AIV_SpellLevel])
					{
						dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - (2*oth.protection[PROT_FIRE]/3) - (oth.protection[PROT_MAGIC]/3));
					}
					else
					{
						dmg = (spl.damage_per_level - (2*oth.protection[PROT_FIRE]/3) - (oth.protection[PROT_MAGIC]/3));
					};
					
				}
				else if(Npc_UseWaterSpell(slf))
				{
					if(slf.aivar[AIV_SpellLevel])
					{
						dmg = ((spl.damage_per_level*slf.aivar[AIV_SpellLevel]) - oth.protection[PROT_MAGIC] +(slf.attribute[ATR_MANA_MAX]/20)+(slf.attribute[ATR_HITPOINTS_MAX]/50)) ; 
					}
					else
					{
						dmg = (spl.damage_per_level - oth.protection[PROT_MAGIC]+(slf.attribute[ATR_MANA_MAX]/20)+(slf.attribute[ATR_HITPOINTS_MAX]/50));
					};
				
				};	
		};
	};
	
	
	// DAMAGE CALCULATED
	// --> apply modifiers
	//var c_npc ur; ur = Hlp_GetNpc(NASZ_453_UrShak);
	//if(attackerPtr == _@(ur))
	//urshak
	if(slf.id == 453)
	{
		dmg *= 2;
		if (UrShakHitCnt >= 5) {
			StartFlyDamage (oth, 5, 10, 5, 10);
			dmg *= 2;
			
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  oth, oth, 0, 0, 0, FALSE );

			UrShakHitCnt = 0;
		};
		
		dmg = DiffCalcDmgAll(dmg,slf);

		UrShakHitCnt += 1;
		return dmg;
	}
	else if(oth.id == 453)
	{	
		dmg = DiffCalcDmgAll(dmg,slf);
		
		//dmg = ClampHeroDamageToUrshak(oth,dmg);
		//return dmg;
		
		
		MEM_PushInstParam(oth);
		MEM_PushIntParam(dmg);
		MEM_CallByString("ClampHeroDamageToUrshak");
		dmg = MEM_PopIntResult();
		return dmg;

		
	};
		
	// ofiara jest golem
	if (oth.guild == GIL_STONEGOLEM || oth.guild == GIL_SUMMONED_GOLEM)
	{
		// atakujacy to golem
		if (slf.guild == GIL_STONEGOLEM || slf.guild == GIL_SUMMONED_GOLEM)
		{
			// DO NOTHING
		}
	
		else
		{
			// hero zadaje obrazenia tylko jesli ma mlot
			if (Npc_IsPlayer(slf))
			{
				if (Npc_IsInFightMode(slf, FMODE_MELEE)) {
					if (ReadiedWeapon.damagetype & DAM_BLUNT) {
						// do nothing, it's ok
					} else { dmg = 0; return dmg; };
				}
				
				else if (Npc_IsInFightMode(slf, FMODE_FIST)) {
					dmg = slf.attribute[ATR_STRENGTH] / 10;
				}
				
				else {
					dmg = 0; return dmg;
				};
			
			}
			
			// inni zadaja bardzo male obrazenia
			else {
				if (oth.guild == GIL_SUMMONED_GOLEM) { dmg = dmg / 5; }
				else if (slf.guild < GIL_SEPERATOR_HUM) { dmg = dmg / 20; }
				else { dmg = dmg / 10; };
			};
		};
		
		dmg = DiffCalcDmgAll(dmg,slf);
		return dmg;
	};
	
	
	if (oth.guild == GIL_ICEGOLEM)
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			if(Hlp_GetInstanceID(ReadiedWeapon) != Hlp_GetInstanceID(ItNa_MieczRunicznyA))
			{
				dmg = 0;
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			if(ReadiedWeapon.flags & ITEM_BOW) && (ReadiedWeapon.munition == ItNa_OgnistaStrzala)
			{
				dmg = slf.attribute[ATR_MANA_MAX] + (slf.attribute[5]*10)/100 ;
				dmg = DiffCalcDmgAll(dmg,slf);
				return dmg;
			}
			else
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW) && (ReadiedWeapon.munition  == ItNa_LodowaStrzala)
				{
					if((oth.attribute[ATR_HITPOINTS] + 60) >= oth.attribute[ATR_HITPOINTS_MAX])
					{
						oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
					}
					else
					{
						oth.attribute[ATR_HITPOINTS] += 60;
					};
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{
			if (Npc_UseWaterSpell(slf))
			{
					dmg = ((dmg - ((slf.attribute[ATR_MANA_MAX])/2))*2) + ((slf.attribute[ATR_MANA_MAX])/2);
				
				if((oth.attribute[ATR_HITPOINTS] + dmg) >= oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] += dmg;
				};
				
				dmg = 0;
			}
			else if (!Npc_UseFireSpell(slf))
			{
				dmg = 0;
			};
		};
	}
	else if (oth.guild == GIL_FIREGOLEM)
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE))
		{
			if(Hlp_GetInstanceID(ReadiedWeapon) != Hlp_GetInstanceID(ItNa_MieczRunicznyB))
			{
				dmg = 0;
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			if(ReadiedWeapon.flags & ITEM_BOW) && (ReadiedWeapon.munition  == ItNa_LodowaStrzala)
			{
				dmg = slf.attribute[ATR_MANA_MAX] + (slf.attribute[5]*10)/100 ;
				dmg = DiffCalcDmgAll(dmg,slf);
				return dmg;
			}
			else
			{
				dmg = 0;
				
				if(ReadiedWeapon.flags & ITEM_BOW) && (ReadiedWeapon.munition  == ItNa_OgnistaStrzala)
				{
					if((oth.attribute[ATR_HITPOINTS] + 60) >= oth.attribute[ATR_HITPOINTS_MAX])
					{
						oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
					}
					else
					{
						oth.attribute[ATR_HITPOINTS] += 60;
					};
				};
			};
		}
		else if (Npc_IsInFightMode(slf, FMODE_MAGIC))
		{
			if (Npc_UseFireSpell(slf))
			{
				//if(attackerPtr == MEM_ReadInt(_hero))
				//{
					dmg = ((dmg - ((slf.attribute[ATR_MANA_MAX])/2))*2) + ((slf.attribute[ATR_MANA_MAX])/2);
				//}
				//else
				//{
				//	dmg = dmg*2;
				//};
				
				if((oth.attribute[ATR_HITPOINTS] + dmg) >= oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				}
				else
				{
					oth.attribute[ATR_HITPOINTS] += dmg;
				};
				
				dmg = 0;
			}
			else if (!Npc_UseWaterSpell(slf))
			{
				dmg = 0;
			};
		};
	};
	
	// PRZEWRACANIE
	if(victimPtr && attackerPtr && Hlp_IsValidNpc(oth) &&  Npc_IsPlayer(oth) &&dmg)
	{
			var int fallAniActive; fallAniActive = AniIsActive(oth, "T_FALLB_2_FALLENB");
			
			if(slf.guild == gil_snapper && !fallAniActive)
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(250);

				if(slf.aivar[AIV_RandomDmg] <=16 || slf.aivar[AIV_RandomDmg] >=236) && (PierscienGrubegoMysliwegoUbrany == FALSE)
				{	
					//AI_WaitMS(hero,100);
					AI_PlayAni(oth,"T_FALLB_2_FALLENB");
					AI_Wait(oth,1);
					dmg += (oth.attribute[1]*7)/100;
					dmg = DiffCalcDmgAll(dmg,slf);
					return dmg;
				};
			
			}
			else if (slf.guild == GIL_ZOMBIE && !fallAniActive)
			{
				if (attackerPtr == _@(Ozywieniec))
				{
					StartFlyDamage (oth, 5, 10, 5, 10);
					dmg = DiffCalcDmgAll(dmg,slf);
					return dmg;
				};
				
				slf.aivar[AIV_RandomDmg] = hlp_random(150);
				
				if(slf.aivar[AIV_RandomDmg] <=34 || slf.aivar[AIV_RandomDmg] >=130) && (PierscienGrubegoMysliwegoUbrany == FALSE)
					{	
						AI_WaitMS(hero,500);
						AI_PlayAni(oth,"T_FALLB_2_FALLENB");
						//AI_Wait(oth,1);
						dmg += (oth.attribute[1]*10)/100;
						dmg = DiffCalcDmgAll(dmg,slf);
						return dmg;
					};
			
			}
			//else if (attackerPtr == _@(Ozywieniec))
			//{
				//if(Npc_IsInFightMode (oth, FMODE_NONE) && Npc_GetBodyState (oth) < 13)
				//{
					//AI_PlayAni(oth,"T_FALLB_2_FALLENB");
				
				//}
				//else
				//{
					//StartFlyDamage (oth, 5, 10, 5, 10);
				//};
			//}
			else if (slf.guild == GIL_GIANT_BUG && !fallAniActive)
			{
					slf.aivar[AIV_RandomDmg] = hlp_random(200);
					if (slf.aivar[AIV_RandomDmg] <=34 || slf.aivar[AIV_RandomDmg] >=190) && (PierscienGrubegoMysliwegoUbrany == FALSE)
					{	
						//AI_WaitMS(hero,100);
						AI_PlayAni(oth,"T_FALLB_2_FALLENB");
						AI_Wait(oth,1);
						dmg += (oth.attribute[1]*5)/100;
						dmg = DiffCalcDmgAll(dmg,slf);
						return dmg;
					};
			
			}			
			else if (slf.guild == GIL_MINECRAWLER && !fallAniActive)
			{
					if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(200);
						if (slf.aivar[AIV_RandomDmg] >=34 && slf.aivar[AIV_RandomDmg] <=69) && (PierscienGrubegoMysliwegoUbrany == FALSE)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*2)/100;
							dmg = DiffCalcDmgAll(dmg,slf);
							return dmg;
						};
					
					}
					else if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(169);
						if (slf.aivar[AIV_RandomDmg] <=24 || slf.aivar[AIV_RandomDmg] >=150) && (PierscienGrubegoMysliwegoUbrany == FALSE)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*4)/100;
							dmg = DiffCalcDmgAll(dmg,slf);
							return dmg;
						};
					
					}
					else if(slf.aivar[AIV_MM_REAL_ID] == 	ID_BLATTCRAWLER)
					{
						slf.aivar[AIV_RandomDmg] = hlp_random(189);
						if (slf.aivar[AIV_RandomDmg] <=22 || slf.aivar[AIV_RandomDmg] >=170) && (PierscienGrubegoMysliwegoUbrany == FALSE)
						{	
							//AI_WaitMS(hero,100);
							AI_PlayAni(oth,"T_FALLB_2_FALLENB");
							AI_Wait(oth,1);
							dmg += (oth.attribute[1]*3)/100;
							dmg = DiffCalcDmgAll(dmg,slf);
							return dmg;
						};
					};
			};
			
		dmg = DiffCalcDmgAll(dmg,slf);
		
		// ----- ----- TRUCIZNA ----- -----
		if (Npc_IsPlayer(oth) && PierscienAsasynaUbrany == FALSE) {
			
			if (slf.aivar[AIV_POISON] == POISON_1) // 10% szansy
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(100);
				if (slf.aivar[AIV_RandomDmg] < 10 && WillZatruty < 1)
				{
					Poison1HPStart();
				};
			}
			
			else if (slf.aivar[AIV_POISON] == POISON_2) // 20% szansy
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(100);
				if (slf.aivar[AIV_RandomDmg] < 20 && WillZatruty < 2)
				{
					Poison5HPStart();
				};
			}
			
			else if (slf.aivar[AIV_POISON] == POISON_3) // 30% sznasy
			{
				slf.aivar[AIV_RandomDmg] = hlp_random(100);
				if (slf.aivar[AIV_RandomDmg] < 30 && WillZatruty < 3)
				{
					Poison10HPStart();
				};
			};
		};
		
		if(attackerPtr == _@(Wisp_Boss))
		{
			
			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				Wld_PlayEffect("spellFX_DESTROYUNDEAD",  hero, hero, 0, 0, 0, FALSE );
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];
		
		};

		
	}
	else
	{
		dmg = DiffCalcDmgAll(dmg,slf);
	};
	


	// ACHIEVEMENT
	if (Npc_IsPlayer(oth) && Osiagniecie18OneTime == FALSE) {
		if (oth.attribute[ATR_HITPOINTS] - dmg == 1) {
			ff_applyonceext(Acv18Delay,1000,-1);
		};
	};

	return dmg;
};

var int Acv18DelayTimer;
func void Acv18Delay() {

	// 0s
	if (Acv18DelayTimer == FALSE) {
		Acv18DelayTimer = TRUE;
		return;
	};

	// 1s -> jesli jakis npc czlowiek uderzyl hero, to ma 1hp i lezy na ziemi -> czyli dlatego warunek !instate ZS_Unconscious
	if (!Npc_IsInState(hero,ZS_Unconscious) && (hero.attribute[ATR_HITPOINTS] == 1)) {
		Osiagniecie18OneTime = TRUE;
		AddAchievement(18,Acv18Title,Acv18Content);
	};

	Acv18DelayTimer = FALSE;
	ff_remove(Acv18Delay);
};
	
func void _DMG_OnDmg() {

	EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI);

};
func void InitDamage() {
	const int dmg = 0;
	if (dmg) { return; };
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg);
	dmg = 1;
};
