var int Kopalnia_Trucizna_Teleported;

func void Kopalnia_Trucizna()
{

	if (Kopalnia_Trucizna_Uzyte == TRUE) {
		
		if (Fade_Status == 1) // start
		{
			FadeScreen_Start(1);
		}
		
		else if (Fade_Status == 2) // pause
		{
			FadeScreen_Pause();
			Fade_Pause_Counter += 1;
			
			if (Fade_Pause_Counter == 100) {
				Npc_SwitchInventory_Kopalnia(hero);
				Npc_ClearAIQueue (hero);
				AI_Teleport    (hero, "NASZ_KOPALNIA_TRUP");
			};
			
			if (Fade_Pause_Counter >= 200) {
				Fade_Status = 3;
			};
		}
		
		else if (Fade_Status == 3) // end
		{
			Npc_ClearAIQueue (hero);
			AI_PlayAni	(hero, "S_VICTIM_SLE");
			FadeScreen_End(1);
		}

		else // disable
		{
			Npc_ClearAIQueue (hero);
			AI_PlayAniBS (hero,	"T_VICTIM_SLE_2_STAND", BS_STAND );
			Fade_Pause_Counter = 0;
			Kopalnia_Trucizna_Uzyte = FALSE;
			//Print("KONIEC !!");
			ff_remove(Kopalnia_Trucizna);
		};

	};


};



func void Duch_Modlitwa()
{
	//print("Duch_Modlitwa");

	if (Duch_Modlitwa_Start == TRUE) {
		
		if (Fade_Status == 1) // start
		{
			FadeScreen_Start(1);
		}
		
		else if (Fade_Status == 2) // pause
		{
			FadeScreen_Pause();
			Fade_Pause_Counter += 1;
			
			if (Fade_Pause_Counter == 100) {
				Wld_InsertNpc				(NASZ_026_DuchNowicjusza, hero.wp);
				Npc_RemoveInvItems(hero,ItNa_DuchSkull,1);
				Fade_Status = 3;

			};
		}
		
		else if (Fade_Status == 3) // end
		{
			FadeScreen_End(1);
		}

		else // disable
		{
			Npc_ClearAIQueue (hero);
			Fade_Pause_Counter = 0;
			Duch_Modlitwa_Start = FALSE;
			//Print("KONIEC !!");
			ff_remove(Duch_Modlitwa);
		};

	};


};











func void RenegaciSetTime()
{
// ***** ***** ***** ***** *****
	// RenegaciSetTime
	
	if (RenegaciSetTime_Go == TRUE) {
		
		if (Fade_Status == 1) // start
		{
			FadeScreen_Start(3);
		}
		
		else if (Fade_Status == 2) // pause
		{
			FadeScreen_Pause();
			Fade_Pause_Counter += 1;
			
			if (Fade_Pause_Counter == 50) {
				Wld_SetTime	(00,00);
				//Npc_ClearAIQueue (hero);
				//AI_Teleport    (hero, "NASZ_KOPALNIA_TRUP");
			};
			
			if (Fade_Pause_Counter >= 100) {
				Fade_Status = 3;
			};
		}
		
		else if (Fade_Status == 3) // end
		{
			Npc_ClearAIQueue (hero);
			FadeScreen_End(3); 
		}

		else // disable
		{
			Npc_ClearAIQueue (hero);
			Fade_Pause_Counter = 0;
			RenegaciSetTime_Go = FALSE;
			//Print("KONIEC !!");
			ff_remove(RenegaciSetTime);
		};

	};

};

func void WartaScaleTime()
{
	if (WillStajeNaWarcie == TRUE)
	{
		ScaleWorldTime(mkf (5));
	};
};

func void KillDemonPosag()
{
	if(WillIsGoingToKillDemonPosag == 1 && WillZniszczylDemonaOneTime == FALSE )
	{
		if (C_BodyStateContains(hero,BS_HIT) && Npc_GetDistToWP	(hero, "NASZ_DEMON_WP") < 150  && Npc_HasReadiedMeleeWeapon(hero))
		{
			var c_item itm; itm = Npc_GetReadiedWeapon(hero);
			if (bIsHammer(itm))
			{
				B_LogEntry (TOPIC_Erak_plagaciemnosci, "Kapliczka zosta³a zniszczona, a wraz z ni¹ zagro¿enie jakie depta³o nam po piêtach. Czym prêdzej wrócê do maga i opowiem mu o tym, co siê tutaj sta³o. Poza tym dziwiê siê, ¿e nie zaatakowa³ mnie ¿aden demon. Czy¿by mag siê myli³?");
				Migration_LowcyToZamek(); // migracja do zamku lowcow

				Wld_PlayEffect("spellFX_Fear",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("LASTDOOREVENT");
				Wld_SendTrigger ("DEMONPOSAG_MOVER_SCRIPT");
				WillZniszczylDemonaOneTime = TRUE;
				WillIsGoingToKillDemonPosag = 2;
				//Print("dziala");
				ff_remove(KillDemonPosag);
			};
		};
	};
};

func void KrysztalAdanosa()
{
	if (npc_knowsinfo (other, DIA_NASZ_403_Adanos_workB)) {
		
		if(Npc_GetDistToItem (hero, ItNa_KrysztalAdanosa) < 75)
		{
			Wld_RemoveItem (ItNa_KrysztalAdanosa);
			Createinvitems (hero, ItNa_KrysztalAdanosa, 1);
			Snd_Play ("Geldbeutel"); 
			//PrintScreen	("funkcja sie wykonala", -1,-1, "font_old_20_white.tga",3);
			ff_remove(KrysztalAdanosa);
		};
	};
};

func void TeleportOzywieniec()
{ // TODO -> skoro juz zbiiera pod woda, to mozna to wywalic
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_chodzmy)) {
		
		if(Npc_GetDistToItem (hero, ItNa_TeleportOzywieniec) < 75)
		{
			Wld_RemoveItem (ItNa_TeleportOzywieniec);
			Createinvitems (hero, ItNa_TeleportOzywieniec, 1);
			Snd_Play ("Geldbeutel"); 
			//PrintScreen	("funkcja sie wykonala", -1,-1, "font_old_20_white.tga",3);
			ff_remove(TeleportOzywieniec);
		};
	};
};

func void TickTock_Frame() {

	

	
		
	
	
	

	// ***** ***** ***** ***** *****

	// ***** ***** ***** ***** *****
	

	

	
/*	// BLOKOWANIE TARCZA
	// *** *** *** *** *** *** ***
	if (HeroDrankCheatPotion == FALSE)
	{
		if (C_BodyStateContains(hero,BS_PARADE)) && (WillTarczaUbrana == TRUE) && (hero.HitChance[NPC_TALENT_1H] >= 30)
		{
			hero.flags = 2;
		}
		else
		{
			hero.flags = 1;
		};
	};*/
	// *** *** *** *** *** *** ***
	
	// SKRADANIE
	// *** *** *** *** *** *** ***

	// *** *** *** *** *** *** ***

	
	
	
	
	
	
/*	// ****** Golem hearts ******
	if(Npc_GetActiveSpell(hero) == SPL_ICECUBE)
	{
		if(!Hero_UseGolemHeart)
		{
			var int ptr; ptr = Npc_GetSpellItem(hero);
			var c_item itm; itm = _^(ptr);
			if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(It_Heart_IceCube))
			{
				Hero_UseGolemHeart = true;
			};
		};
	}
	else
	{
		if(Hero_UseGolemHeart)
		{
			if(AmountOfUseIceCubeHeart_1 >= 4)
			{
				AmountOfUseIceCubeHeart_1 = 0;
			};
			Hero_UseGolemHeart = false;
		};
	};*/
	
	
	
	// ***** ***** *****
	// 		STRZALY
	// ***** ***** *****
		
	/*var C_Item RangedWeapon; RangedWeapon = Npc_GetReadiedWeapon(hero);

	if(NPC_HasReadiedRangedWeapon(hero))
	{
		if(!Hlp_IsValidHandle(MunitionName))
		{
			MunitionName = View_Create(0, 0, 8000, 8000);
			View_Open(MunitionName);
		};
	}
	else
	{
		if(Hlp_IsValidHandle(MunitionName))
		{
			View_Delete(MunitionName);
			MunitionName = 0;
		};
	};
	
	if(NPC_HasReadiedRangedWeapon(hero))
	&&(Hlp_IsValidHandle(MunitionName))
	{
		if(RangedWeapon.flags & ITEM_BOW)
		{
			if (BowMunition == FireArrow)
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz ogniste strza?y?", PF_FONT);
			}
			else if (BowMunition == IceArrow)
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz lodowe strza?y?", PF_FONT);
			}
			else if (BowMunition == SharpArrow)
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz ostre strza?y?", PF_FONT);
			}
			else
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz zwyk?e strza?y?", PF_FONT);
			};
		}
		else
		{
			if (CBowMunition == SharpBolt)
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz ostre be?ty", PF_FONT);
			}
			else
			{
				View_AddText(MunitionName, 700, 7000, "U?ywasz zwyk?e be?ty", PF_FONT);
			};
		};
	};*/


	
	
	
	
	
	
	
	
};