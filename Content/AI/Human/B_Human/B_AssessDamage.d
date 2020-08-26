// ****************************************************************
// B_AssessDamage
// --------------
// wird durchWahrnehmung PERC_AssessDamage ÜBERALL her aufgerufen
// (also auch aus ZS_Attack, AR kann sich allerdings NICHT ändern!)
// ****************************************************************

var int PrawdopodobienstwoZatrucia;
var int HeroPreviousHP;
func void B_Hero_AssessDamage()
{

/*// TRUCIZNA 1
	if (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))
	|| (C_BodyStateContains(OrcBiterWsciekly01,BS_HIT))

	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT))
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT))
	|| (C_BodyStateContains(SwampratWsciekly01,BS_HIT))

	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(BloodflyWsciekly01,BS_HIT)) //dodany

	|| (C_BodyStateContains(MinecrawlerWarriorWsciekly1,BS_HIT)) //dodany
	|| (C_BodyStateContains(MinecrawlerWarriorWsciekly1,BS_HIT)) //dodany
	|| (C_BodyStateContains(MinecrawlerWarriorWsciekly1,BS_HIT)) //dodany
	|| (C_BodyStateContains(MinecrawlerWarriorWsciekly1,BS_HIT)) //dodany
	|| (C_BodyStateContains(MinecrawlerWarriorWsciekly1,BS_HIT)) 

	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))
	|| (C_BodyStateContains(WaranWsciekly01,BS_HIT))

	{

		PrawdopodobienstwoZatrucia = Hlp_Random (10);
		if (PrawdopodobienstwoZatrucia <= 3) {

			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				TruciznaFunction1();
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];
	
		};
	};
	
// TRUCIZNA 2
	if (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT)) //dodany
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))
	|| (C_BodyStateContains(Giant_Rat_Huge01,BS_HIT))

	|| (C_BodyStateContains(SwampDroneWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampDroneWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampDroneWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampDroneWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(SwampDroneWsciekly01,BS_HIT)) //dodany

	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT)) //dodany
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT))
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT))
	|| (C_BodyStateContains(Topielec_Wsciekly_A,BS_HIT))

	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(TrollWsciekly01,BS_HIT)) //dodany

	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany
	|| (C_BodyStateContains(WscieklyWilk1,BS_HIT)) //dodany

	{

		PrawdopodobienstwoZatrucia = Hlp_Random (10);
		if (PrawdopodobienstwoZatrucia <= 5) {

			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				TruciznaFunction2();
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];
	
		};
	};

	
// TRUCIZNA 3
	if (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT))
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT))
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT))
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT))
	|| (C_BodyStateContains(WildBloodfly01,BS_HIT))

	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany
	|| (C_BodyStateContains(GroznyJaszczurWsciekly01,BS_HIT)) //dodany


	{

		PrawdopodobienstwoZatrucia = Hlp_Random (10);
		if (PrawdopodobienstwoZatrucia <= 8) {

			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				TruciznaFunction3();
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];
	
		};
	};*/
	
	
	
// Ognik
/*	if (C_BodyStateContains(Wisp_Boss,BS_HIT))
		{

			if (hero.attribute[ATR_HITPOINTS] < HeroPreviousHP)
			{
				Wld_PlayEffect("spellFX_DESTROYUNDEAD",  hero, hero, 0, 0, 0, FALSE );
			};

			HeroPreviousHP = hero.attribute[ATR_HITPOINTS];

	};*/
};






func void B_AssessDamage ()
{


	if( C_ScHasReadiedMieczRuniczny())
	{
		B_BeliarsWeaponSpecialDamage (other, self);
	};
	
	
	if (Npc_IsPlayer (other)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NASZ_119_Udar)) && (Npc_HasReadiedRangedWeapon(hero) == TRUE) && (KuszaLowcyUbrana == TRUE)
	{
		PrintScreen	("Strzeli³eœ w Udara.", -1,-1, "font_old_20_white.tga",5);
		WillStrzelilWUdara = TRUE;
		return;
	};
	
	
	
	// AIVARS

	if (self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	
	if self.aivar [AIV_EnemyOverride] == TRUE
	{

	};
	// ------ Wenn NSC im ZS_Attack ------
	if (Npc_IsInState(self,ZS_Attack))
	{
		// EXIT IF...
		
		// ------ Freunde ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
		
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			// ------ NEUER Angreifer ist NPC ODER zum zweiten MAl (von Hero) getroffen ------
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			|| (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) 
			{
				Npc_SetTarget (self, other); //Ziel wechseln
			}
			else //NEUER Angreifer ist hero und trifft zum ersten mal
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// EXIT IF
	
	// ------ NSC ist ENEMY ----- 
	if (B_AssessEnemy())
	{
		return;
	};
	
	// ------ Egill/Enim NSCs (Story-Angreifer) ------
	if (!Npc_IsPlayer(other))
	&& (other.aivar[AIV_ATTACKREASON] == AR_NONE)
	{
		B_Attack (self, other, AR_NONE, 0);		//angreifen oder fliehen
		return;
	};
		
	// ------ Spieler hat mit NK-Waffe angegriffen ------
	if (Npc_IsInFightMode (other, FMODE_MELEE))
	|| (Npc_IsInFightMode (other, FMODE_FIST))
	|| (Npc_IsInFightMode (other, FMODE_NONE)) //oder Waffe wieder weggesteckt (nicht ermittelbar)
	{
		// ------ NSC ist freundlich ODER npctype_friend ------
		if (Npc_GetAttitude (self, other) == ATT_FRIENDLY)
		|| ( (self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other) )
		{
			// ------- nur wenn ich zum ERSTEN Mal geschlagen werde -------
			if (!Npc_IsInState(self, ZS_ReactToDamage))
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);							//schaltet alle Wahrnehmungen ab - so kann keine später priorisierte diesen Stateaufruf verhindern (s. z.B. AssessFightSound + AssessDamage)
				AI_StartState		(self, ZS_ReactToDamage, 0, "");
				return;												//im unterern B_Attack wird ein ClearQueue aufgerufen, der den AI_StartState direkt wieder aus der queue löscht
																	// - sicherheithalber bei allen AI_StartState-Aufrufen return anfügen
			};
		};
	};	
	
	// FUNC
	
	B_Attack (self, other, AR_ReactToDamage, 0);		//angreifen oder fliehen
	return;
};
