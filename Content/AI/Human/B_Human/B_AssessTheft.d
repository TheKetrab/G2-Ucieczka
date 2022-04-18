
func int ThiefIgnore() {

	if (Npc_GetDistToWP(hero,"NASZ_IGNORE_01") < 200)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_02") < 200)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_03") < 200)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_04") < 200)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_05") < 200)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_06") < 800)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_07") < 300)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_08") < 500)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_09") < 500)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_10") < 500)
	|| (Npc_GetDistToWP(hero,"NASZ_IGNORE_11") < 500)
	{
		return TRUE;
	};

	return FALSE;
};




func int C_HeroCanThiefSomething(var c_npc reactor) {

	
	// jesli jest w jakichœ dziwnych miejscach, to mo¿e kraœæ
	if (ThiefIgnore()) {
		return true;
	};

	// jesli nie jest w zadnym terytorium obozowym do mozna
	if !(C_IsInLowcyTerritory() || C_IsInMysliwiTerritory() || C_IsInBandyciTerritory())
	{
		return true;
	};
	
	// zeby sie dalo rabowac w obozie bandytow po wyzwoleniu
	if (C_IsInBandyciTerritory() && KAPITEL>=3 && reactor.guild!=GIL_SLD)
	{
		return true;
	};

	// schowek ³owców na kilofy i pi³y
	if (npc_hasitems(hero,ItNa_Key_Keroloth)>=1)
	&& ((Npc_GetDistToWP(hero,"NASZ_LOWCY_MAGAZYN_1")<500)
	 || (Npc_GetDistToWP(hero,"NASZ_LOWCY_MAGAZYN_2")<500))
	{
		return true;
	};
	
	if (C_BodyStateContains(hero, BS_SNEAK))
	&& (!Npc_IsInState (reactor, ZS_ObservePlayer))
	{
		if((Wld_IsTime(05,00,22,00)) && (Npc_GetDistToNpc(reactor,hero) >= 700)) // jest dzien i 7 metrow
		{
			return true;
		}
		else if (Wld_IsTime(22,01,04,59)) && !Npc_CanSeeNpc(reactor,hero) // jest noc i nas nie widz¹
		{
			return true;
		};
	};
	
	return false;
};


func int C_IsPlant(var c_item itm)
{
	if (Hlp_GetInstanceID(itm) == ItPl_Weed)
	|| (Hlp_GetInstanceID(itm) == ItPl_Beet)
	|| (Hlp_GetInstanceID(itm) == ItPl_SwampHerb)
	|| (Hlp_GetInstanceID(itm) == ItPl_Mana_Herb_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Mana_Herb_02)
	|| (Hlp_GetInstanceID(itm) == ItPl_Mana_Herb_03)
	|| (Hlp_GetInstanceID(itm) == ItPl_Health_Herb_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Health_Herb_02)
	|| (Hlp_GetInstanceID(itm) == ItPl_Health_Herb_03)
	|| (Hlp_GetInstanceID(itm) == ItPl_Dex_Herb_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Strength_Herb_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Speed_Herb_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Mushroom_01)
	|| (Hlp_GetInstanceID(itm) == ItPl_Mushroom_02)
	|| (Hlp_GetInstanceID(itm) == ItPl_Blueplant)
	|| (Hlp_GetInstanceID(itm) == ItPl_Forestberry)
	|| (Hlp_GetInstanceID(itm) == ItPl_Planeberry)
	|| (Hlp_GetInstanceID(itm) == ItPl_Temp_Herb)
	|| (Hlp_GetInstanceID(itm) == ItPl_Perm_Herb)
	|| (Hlp_GetInstanceID(itm) == ItNa_ZabiKorzen)
	|| (Hlp_GetInstanceID(itm) == ItNa_Chmiel)
	|| (Hlp_GetInstanceID(itm) == ItNa_KopalnianyGrzyb)
	|| (Hlp_GetInstanceID(itm) == ItNa_Drzewny_Porost)
	
	{
		return true;
	};

	return false;
};


func int C_IsNeedInPlot(var c_item itm)
{
	if (Hlp_GetInstanceID(itm) == ItNa_RabonSakwa_MIS)
	|| (Hlp_GetInstanceID(itm) == ItNa_KufelPiwa)
	|| (Hlp_GetInstanceID(itm) == ItMi_OldCoin)
	|| (Hlp_GetInstanceID(itm) == ItMi_Coal)
	|| (Hlp_GetInstanceID(itm) == ItMi_GoldNugget_Addon)
	|| (Hlp_GetInstanceID(itm) == ItNa_Krysztal)
	|| (Hlp_GetInstanceID(itm) == ItMi_Gold)
	|| (Hlp_GetInstanceID(itm) == ItMi_Flask)
	|| (Hlp_GetInstanceID(itm) == ItNa_PaczkaZiela)
	|| (Hlp_GetInstanceID(itm) == ItNa_KsiegaReputacji)
	|| (Hlp_GetInstanceID(itm) == ItNa_KsiegaPotworow)
	|| (Hlp_GetInstanceID(itm) == ItNa_KsiegaOsiagniec)
	|| (Hlp_GetInstanceID(itm) == ItNa_KsiegaBosow)
	|| (Hlp_GetInstanceID(itm) == ItNA_RabonSakwa_MIS)
	|| (Hlp_GetInstanceID(itm) == ItWr_PradawnePismo_1)
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportLowcy)
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportMysliwi)
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportBandyci)
	|| (Hlp_GetInstanceID(itm) == ItRw_Bolt)
	|| (Hlp_GetInstanceID(itm) == ItRw_Arrow)
	
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportMysliwi)
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportLowcy)
	|| (Hlp_GetInstanceID(itm) == ItNa_TeleportBandyci)
	

	
	
	|| (Hlp_StrCmp(itm.visual,"ItKe_Key_01.3ds")) // <-- jesli jest kluczem
	|| (Hlp_StrCmp(itm.visual,"ItKe_Key_02.3ds")) // <-- jesli jest kluczem
	|| (Hlp_StrCmp(itm.visual,"ItKe_Key_03.3ds")) // <-- jesli jest kluczem
	
	
	{
		return true;
	};

	return false;
};






// ***********************************************************
// B_AssessTheft
// -------------
// wird durch Wahrnehmung PERC_ASSESSTHEFT angesprungen
// wir von ÜBERALL her aufgerufen (auch aus ZS_Attack)
// Wenn SC/NSC irgendein Item aufhebt in PERC_DIST_INTERMEDIAT
// ***********************************************************

func void B_AssessTheft ()
{
	// EXIT IF...
	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other)) 
	{
		return;
	};
	if(self.guild >16) {return;};
	if (npc_isdead(self)) { return; }; // jesli nie zaatakowali cie, a zabiles, to tym bardziej mozesz rabowac
	
	if(item.flags & ITEM_DROPPED) {return;};
	
	if (AssessTheftDisabled) { return; }; // item wstawiony przez insert (30s)
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	&& (!Npc_IsInState (self, ZS_ObservePlayer))
	&& (!Npc_CanSeeNpc(self,hero))
	{
		MEM_Info(ConcatStrings(self.name," > TheftCancel: Portal and Height"));
		return;
	};
	
	/*
	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Hlp_IsValidItem(item)) 
		&& (Npc_OwnedByNpc(item, self))
		{
			//weiter (kein Abbruch bei persönlichem Besitz)
		}
		else
		{
			return;
		};		
	};
*/
	// ------ Item gehörte mir nicht ------
	
	var oCNpc her; her = Hlp_GetNpc(hero);
	if(Hlp_Is_oCNpc(her.focus_vob)) {
		var c_npc oth; oth = MEM_PtrToInst(her.focus_vob);
		if(oth.guild > GIL_SEPERATOR_HUM) {
			MEM_Info(ConcatStrings(self.name," > TheftCancel: Focus"));
			return;
		};
	};
	
	if (C_HeroCanThiefSomething(self))
	{
		MEM_Info(ConcatStrings(self.name," > TheftCancel: CanThief"));
		return;
	};
		
	if (!C_IsTakenItemMyPossession (self, other, item))
	{
		MEM_Info(ConcatStrings(self.name," > TheftCancel: NotMyPossession"));
		return;
	};
	
	if (C_IsPlant(item))
	{
		MEM_Info(ConcatStrings(self.name," > TheftCancel: Plant"));
		return;
	};
	
	if (C_IsNeedInPlot(item))
	{
		MEM_Info(ConcatStrings(self.name," > TheftCancel: NeedInPlot"));
		return;
	};

	
	
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other)) // nie widzi gracza
	{
		
	
		if (Npc_IsInPlayersRoom (self)) // jest w tym samym pokoju -> atakuje
		{
			//troztdem gesehen!
		}
		else // w innym pokoju -> nie atakuje
		{
			MEM_Info(ConcatStrings(self.name," > TheftCancel: Cannot see NPC"));
			return;
		};
	};
	

	/*
	// ------ ignore THEFT ------
	if (!C_WantToAttackThief(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		if (C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		return;
	};
	*/
	
	// FUNC
	
	if(C_IsInLowcyTerritory()) { Thief_Counter_Lowcy += 1; };
	if(C_IsInMysliwiTerritory()) { Thief_Counter_Mysliwi += 1; };
	
	B_Attack (self, other, AR_Theft, 0);						//angreifen oder fliehen
	return;
};
