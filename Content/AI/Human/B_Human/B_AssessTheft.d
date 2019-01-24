func int C_HeroCanThiefSomething(var c_npc reactor) {

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
	&& (Npc_GetDistToWP(hero,"NASZ_LOWCY_MAGAZYN_1")<200)
	&& (Npc_GetDistToWP(hero,"NASZ_LOWCY_MAGAZYN_2")<200)

	{
		return true;
	};
	
	if (C_BodyStateContains(hero, BS_SNEAK))
	&& (((Wld_IsTime(21,00,00,00) || Wld_IsTime(00,00,04,00))
	  && (Npc_GetDistToNpc(reactor,hero) >= 700)) // jest noc i 7 metrow
	 || ((Wld_IsTime(04,00,21,00)) && (Npc_GetDistToNpc(reactor,hero) >= 2000))) // jest dzien i 20 metrow
	{
		return true;
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
	
	/*
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	{
		return;
	};
	*/
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
			return;
		};
	};
	
	if (C_HeroCanThiefSomething(self))
	{
		return;
	};
		
	if (!C_IsTakenItemMyPossession (self, other, item))
	{
		return;
	};
	
	if (C_IsPlant(item))
	{
		return;
	};
	
	if (C_IsNeedInPlot(item))
	{
		return;
	};
	
	/*
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		if (Npc_IsInPlayersRoom (self))
		&& ( (Npc_IsInState(self, ZS_ObservePlayer)) || (Npc_IsInState(self, ZS_ClearRoom)) )
		{
			//troztdem gesehen!
		}
		else
		{
			return;
		};
	};
	*/

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
