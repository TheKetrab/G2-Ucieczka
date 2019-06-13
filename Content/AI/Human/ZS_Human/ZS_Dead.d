// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgeführt
// wird auch vom Spieler ausgeführt
// *****************************************
var int Boss1Killed;
var int Boss2Killed;
var int Boss3Killed;
var int Boss4Killed;
var int Boss5Killed;
var int Boss6Killed;
var int Boss7Killed;
var int Boss8Killed;
var int Boss9Killed;
var int Boss10Killed;

var int OzywieniecKilledOneTime;
var int Psikusy_SheepKiller_Counter;



func void ZS_Dead ()
{	
	if (MissionPlaskowyzRunning == TRUE
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Black_Plaskowyz)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BlackGobboGigant1)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BlackGobboGigant2)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BlackGobboGigant3)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Harpy_Gigant)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcBiterGigant1)
	|| Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcBiterGigant2))
	{
		if	(npc_isdead (Troll_Black_Plaskowyz))
		&& (npc_isdead (BlackGobboGigant1))
		&& (npc_isdead (BlackGobboGigant2))
		&& (npc_isdead (BlackGobboGigant3))
		&& (npc_isdead (Harpy_Gigant))
		&& (npc_isdead (OrcBiterGigant1))
		&& (npc_isdead (OrcBiterGigant2))
		{
			B_LogEntry (TOPIC_Goth_plaskowyz, "Zabi³em wszystkich gigantów.");
		};
	}
	
	//if(self.guild == GIL_GOBBO)
	//{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Warrior_Kivo))
		{
			Npc_RemoveInvItems			(self, ItMw_Orkschlaechter, Npc_HasItems(self,ItMw_Orkschlaechter));
		};
	//};
	
	if(self.aivar[AIV_PARTYMEMBER]==TRUE){ Druzyna(self,0); };
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( other.aivar[AIV_PARTYMEMBER]==TRUE && self.aivar[AIV_VictoryXPGiven] == FALSE )
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY / StanDruzyny);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	if ( Npc_IsPlayer(other) && self.aivar[AIV_VictoryXPGiven] == FALSE )					
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	if (C_NpcIsHero (other))
	{
		PokonaneWszystkie_Liczba = PokonaneWszystkie_Liczba + 1;
	};

/*	// ------ Greg ------
	if C_IAmCanyonRazor (self) == TRUE
	{
		CanyonRazorBodyCount = CanyonRazorBodyCount +1;
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			B_CountCanyonRazor ();
		};
	};
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	// ------ DiegoOW ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		
		// ------ STORY ------
		
		// ------ Dunkle Seite der Macht -------
		
		if (C_DropUnconscious())
			{
				MadKillerCount = (MadKillerCount + 1); 
			};		
		
		// ------ Fester------
		if (self.guild == GIL_GIANT_BUG)
		&& (MIS_Fester_KillBugs == LOG_RUNNING)
		{
			Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
		};
		// ----- Alligator Jack -----
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Swamprat) 
		&& (MIS_KrokoJagd == LOG_Running)
		{
			AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled +1;
		};
		
		
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Ramon) 
		{
			Player_HasTalkedToBanditCamp = TRUE;
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Franco)
		{
			if  (MIS_HlpLogan == LOG_RUNNING)
			{
				MIS_HlpLogan = LOG_OBSOLETE;
			}; 
			if  (MIS_HlpEdgor == LOG_RUNNING)
			{
				MIS_HlpEdgor = LOG_OBSOLETE;
			};
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Fortuno)
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
		};
	};
		
		//------Addon Garaz Minecrawler Höhle------egal wer tötet----
		if  Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Goldminecrawler)
		{
			if (Minecrawler_Killed >= 9)
			&& (Bloodwyn_Spawn == FALSE)
			{	
				AI_Teleport (Bloodwyn,"ADW_MINE_TO_MC_03");
				B_StartOtherRoutine (Bloodwyn,"MINE");
				B_GivePlayerXP (XP_Addon_Bloodywyn);
				Bloodwyn_Spawn = TRUE;
			}
			else
			{
				Minecrawler_Killed = (Minecrawler_Killed + 1);
			
			};
		};
		
*/	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abhängig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;


	
	
	

	
//od polowy juz nie dziala nie wiem czemu

	if (self.aivar[AIV_MM_REAL_ID] == ID_MEATBUG){ PokonaneMeatbug_Liczba = PokonaneMeatbug_Liczba + 1; };
	if (self.guild == GIL_MINECRAWLER){ PokonaneMinecrawler_Liczba = PokonaneMinecrawler_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT){ PokonaneMolerat_Liczba = PokonaneMolerat_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) || (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON){ PokonaneScavenger_Liczba = PokonaneScavenger_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON){ PokonaneShadowbeast_Liczba = PokonaneShadowbeast_Liczba + 1; };
	if (self.guild == GIL_SKELETON) || (self.guild == GIL_SKELETON_MAGE){ PokonaneSkeleton_Liczba = PokonaneSkeleton_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER){ PokonaneSnapper_Liczba = PokonaneSnapper_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK){ PokonaneSwampShark_Liczba = PokonaneSwampShark_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (self.aivar[AIV_MM_REAL_ID] == ID_TROLL){ PokonaneTroll_Liczba = PokonaneTroll_Liczba + 1; };
	if (self.aivar[ID_WARG] == ID_SNAPPER){ PokonaneWarg_Liczba = PokonaneWarg_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_WOLF){ PokonaneWolf_Liczba = PokonaneWolf_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == 100){ PokonaneBlackWolf_Liczba = PokonaneBlackWolf_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE){ PokonaneZombie_Liczba = PokonaneZombie_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE){ PokonaneOrcElite_Liczba = PokonaneOrcElite_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ORCSCOUT){ PokonaneOrcScout_Liczba = PokonaneOrcScout_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN){ PokonaneOrcShaman_Liczba = PokonaneOrcShaman_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR){ PokonaneOrcWarrior_Liczba = PokonaneOrcWarrior_Liczba + 1; };

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Giant_Bug_Boss))
	&& (Boss1Killed == FALSE)
	{
		Boss1Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Wisp_Boss))
	&& (Boss2Killed == FALSE)
	{
		Boss2Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Skeleton_Lord_Garrel))
	&& (Boss3Killed == FALSE)
	{
		Boss3Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_409_Nieznany))
	&& (Boss4Killed == FALSE)
	{
		Boss4Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Kamashi))
	&& (Boss5Killed == FALSE)
	{
		Boss5Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (MinecrawlerWarrior_Boss))
	&& (Boss6Killed == FALSE)
	{
		Boss6Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Ozywieniec))
	&& (OzywieniecKilledOneTime == FALSE)
	&& (Boss7Killed == FALSE)
	{
		OzywieniecKilledOneTime = TRUE;
		Boss7Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (PanCieniostworow))
	&& (Boss8Killed == FALSE)
	{
		Boss8Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_430_StaryTrup))
	&& (Boss9Killed == FALSE)
	{
		Boss9Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Nasz_Potwor))
	&& (Boss10Killed == FALSE)
	{
		Boss10Killed = TRUE;
		ZabiteBossy = ZabiteBossy + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Troll_Black_Plaskowyz))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (BlackGobboGigant1))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (BlackGobboGigant2))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (BlackGobboGigant3))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Harpy_Gigant))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (OrcBiterGigant1))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (OrcBiterGigant2))
	{
		ZabiteGiganty = ZabiteGiganty + 1;
	};
	
	// ----- NASZE -----
	

	var int ork_zabity;

	if (self.guild==GIL_ORC) && (Npc_GetDistToWP(self,"NASZ_ZAPALISADA_SCIEZKA_9")<=7500)
	{
		ork_zabity += 1;
		if(ork_zabity >= 40)
		{
			wszyscy_orkowie_nie_zyja = true;
		};
	};
	
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON))
    {
        Npc_RemoveInvItems(self,ItMw_1h_Bau_Mace,Npc_HasItems(self,ItMw_1h_Bau_Mace));
        Npc_RemoveInvItems(self,ItMw_1h_Misc_Sword,Npc_HasItems(self,ItMw_1h_Misc_Sword));
        Npc_RemoveInvItems(self,ItMw_1h_Misc_Axe,Npc_HasItems(self,ItMw_1h_Misc_Axe));
    };
	
	
	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_306_Perrot))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_315_Bandzior))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_316_Carry))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_317_Bandzior))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_318_Gobby))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_326_Domenic))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_327_Danny)))
	 && (npc_knowsinfo (other, DIA_NASZ_201_Erak_WorkBDT))
	{
		PrintS_Ext(ConcatStrings("Pozosta³o bandytów: ",IntToString(7-BanditKilled(FALSE))), RGBA(255,255,255,0));
	};
	
	
	
	
		//POKONANE POTWORY
	if (self.aivar[AIV_MM_REAL_ID] == ID_Bloodhound){ PokonaneBloodhound_Liczba = PokonaneBloodhound_Liczba + 1; };
	if (self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON){ PokonaneGobbo_Liczba = PokonaneGobbo_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) { PokonaneIceWolf_Liczba = PokonaneIceWolf_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_Keiler){ PokonaneKeiler_Liczba = PokonaneKeiler_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER){ PokonaneOrcBiter_Liczba = PokonaneOrcBiter_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_RAZOR){ PokonaneRazor_Liczba = PokonaneRazor_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE){ PokonaneSwampDrone_Liczba = PokonaneSwampDrone_Liczba + 1; };
	if (self.guild == GIL_SWAMPGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_STONEGOLEM){ PokonaneGolem_Liczba = PokonaneGolem_Liczba + 1; };
	if (self.guild == GIL_Giant_Rat) || (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT){ PokonaneRat_Liczba = PokonaneRat_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY){ PokonaneBloodfly_Liczba = PokonaneBloodfly_Liczba + 1; };
	if (self.guild == GIL_DEMON){ PokonaneDemon_Liczba = PokonaneDemon_Liczba + 1; };
	if (self.guild == GIL_DRACONIAN){ PokonaneDraconian_Liczba = PokonaneDraconian_Liczba + 1; };
	if (self.guild == GIL_WARAN){ PokonaneWaran_Liczba = PokonaneWaran_Liczba + 1; };
	if (self.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER){ PokonaneDragonSnapper_Liczba = PokonaneDragonSnapper_Liczba + 1; };
	if (self.guild == GIL_HARPY){ PokonaneHarpy_Liczba = PokonaneHarpy_Liczba + 1; };
	if (self.guild == GIL_LURKER){ PokonaneLurker_Liczba = PokonaneLurker_Liczba + 1; };	
	
	
	if (Hlp_GetInstanceID (hero) == Hlp_GetInstanceID (StoneGolem))
	&& (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (StoneGolem))
	&& (Golem_MIS_Running == TRUE)
	{
		Golem_MIS_Killed = TRUE;
		B_LogEntry (TOPIC_Keroloth_golem, "Pokona³em kamiennego golema niebêd¹c w ludzkiej skórze. Pora powiadomiæ Kerolotha.");
		Golem_MIS_Running = FALSE;
	};
	
	
	
	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (DragonSnapperWarta1))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (DragonSnapperWarta2)))
	{
		if ((npc_isdead (DragonSnapperWarta1)) && (npc_isdead (DragonSnapperWarta2))) {
			B_StartOtherRoutine (NASZ_205_Mysliwy, "Kap3");
			WillIsGoingToTalkToMysliwy = TRUE;
		};

	};

	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (DragonSnapperWarta4))
	{
		WillZabilPrzywodceStada = TRUE;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (BestiaSwiatynna)) && (Npc_GetDistToWP(hero,"NASZ_JEHEN_QUEST_12")<1000)
	{
		B_LogEntry (TOPIC_Jehen_zagubiony, "To by³o koszmarne starcie. Dobrze, ¿e wyszed³em z tego ca³o. Zabieram ³uski i uciekam st¹d czym prêdzej!");
	};
	
	// ----- JEHEN
	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NiespokojnyScierwojad1))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NiespokojnyScierwojad2))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NiespokojnyScierwojad3)))
	{
		if ((npc_isdead (NiespokojnyScierwojad1))
		 && (npc_isdead (NiespokojnyScierwojad2))
		 && (npc_isdead (NiespokojnyScierwojad3))) {
			B_StartOtherRoutine (NASZ_232_Jehen, "GuideBackToCamp");
		};
	};
	// ----- ----- -----
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_550_Straznik))
	{
		DoForSphere(ZabijWojownikow);
		HeroSay_OrcCity_Portal();
		
		// otiweraja sie kraty
		Wld_SendTrigger ("MOVER_ORCCITY_30");
		Wld_SendTrigger ("MOVER_ORCCITY_31");
		Wld_SendTrigger ("MOVER_ORCCITY_32");
		Wld_SendTrigger ("MOVER_ORCCITY_33");
		Wld_SendTrigger ("MOVER_ORCCITY_34");
		Wld_SendTrigger ("MOVER_ORCCITY_35");
	
		B_GivePlayerXP (1000);
		Log_SetTopicStatus (TOPIC_OrcCity_In, LOG_SUCCESS);
		B_LogEntry (TOPIC_OrcCity_In, "Droga do portalu jest bezpieczna. Monastir i inni powinni uciec z Górniczej Doliny, jeœli tylko rozsadz¹ g³az, który zablokowa³ przejœcie. Tutaj swoj¹ misjê wype³ni³em. Przede mn¹ nowe krainy.");

		HeroCanFinish = TRUE;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_212_Drax))
	{
		if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema)) {
			DodajReputacje (2, REP_MYSLIWI);
			B_LogEntry (TOPIC_Drax_ucieczka, "Zabi³em Draxa. Chocia¿ jeden ju¿ nie musi cierpieæ w tej Górniczej Dolinie.");
			Log_SetTopicStatus (TOPIC_Drax_ucieczka, LOG_SUCCESS);
		};

	};

	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_305_Rabon))
	{
		B_LogEntry (TOPIC_Rabon_sakwa, "Zabi³em Rabona. Frut powinien dowiedzieæ siê o ca³ej sprawie.");
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_301_Bandzior))
	&& (Npc_IsDead(NASZ_302_Bandzior))
	{
		WillRabujeZbrojeBandytow(NASZ_301_Bandzior);
	};

	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_302_Bandzior))
	&& (Npc_IsDead(NASZ_301_Bandzior))
	{
		WillRabujeZbrojeBandytow(NASZ_302_Bandzior);
	};
	
	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Ugosh))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Kamashi)))
	{
		if ((npc_isdead (Ugosh)) && (npc_isdead (Kamashi))) {
			WODZOWIE_KILLED = TRUE;
		};

	};
	
	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_415_SlugaBeliara))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_416_SlugaBeliara))
		|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_417_SlugaBeliara)))
	{
		if ((npc_isdead (NASZ_415_SlugaBeliara)) && (npc_isdead (NASZ_416_SlugaBeliara)) && (npc_isdead (NASZ_417_SlugaBeliara))) {
			Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_1_SCRIPT");
			Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_2_SCRIPT");
		};

	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_410_PallumBo))
	{
		if (npc_isdead (NASZ_410_PallumBo)) {
			
			if (KAPITEL == 2) { B_LogEntry (TOPIC_VanGan_zemsta, "Pallum-Bo pad³ trupem."); };
		};

	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_102_Lens))
	{
		B_LogEntry (TOPIC_Goth_kradziez, "Mapa doprowadzi³a mnie do miejsca, gdzie spotka³em z³odzieja, z którym szybko siê rozprawi³em.");
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (OrcScoutHerszt))
	{
		Migration_GoToShamanHerszt();
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (OrcShamanHerszt))
	{
		Migration_GoToDowodca();
	};

	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Shadowbeast_Skeleton_XardasOld)) && (WojownikCieniaPrzyzywaNumer == 1)
	{
		AI_PlayAni (NASZ_429_WojownikCienia,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",  NASZ_429_WojownikCienia, NASZ_429_WojownikCienia, 0, 0, 0, FALSE );
		WojownikCieniaPrzyzywa = TRUE;
		//ff_applyonceext(SecRitualXardasOld,1000,-1);
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Draconian_XardasOld)) && (WojownikCieniaPrzyzywaNumer == 2)
	{
		AI_PlayAni (NASZ_429_WojownikCienia,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",  NASZ_429_WojownikCienia, NASZ_429_WojownikCienia, 0, 0, 0, FALSE );
		WojownikCieniaPrzyzywa = TRUE;
		//ff_applyonceext(SecRitualXardasOld,1000,-1);
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Dragon_Swamp_XardasOld)) && (WojownikCieniaPrzyzywaNumer == 3)
	{
		HeroMozeWchodzicXardasOld = TRUE;
		WojownikCieniaMozeWalczyc = TRUE;
		
		B_StartOtherRoutine (NASZ_431_ZombieXardasOld01,"After");
		
		NASZ_429_WojownikCienia.guild = GIL_ZOMBIE;
		Npc_SetTrueGuild (NASZ_429_WojownikCienia, GIL_ZOMBIE);
		B_Attack (NASZ_429_WojownikCienia, other, AR_KILL, 1);
		
		NASZ_431_ZombieXardasOld01.guild = GIL_ZOMBIE;
		Npc_SetTrueGuild (NASZ_431_ZombieXardasOld01, GIL_ZOMBIE);
		B_Attack (NASZ_431_ZombieXardasOld01, other, AR_KILL, 1);
		
		
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_429_WojownikCienia))
	{
		Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_2_SCRIPT");
		
		Wld_PlayEffect("SPELLFX_massdeath",  NASZ_429_WojownikCienia, NASZ_429_WojownikCienia, 0, 0, 0, FALSE );

		ZombieKillCounter = 1;
		
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Nasz_Potwor))
	{
		PotworZabity = TRUE;
		Wld_PlayEffect("SPELLFX_incovation_orange",  Nasz_Potwor, Nasz_Potwor, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  Nasz_Potwor, Nasz_Potwor, 0, 0, 0, FALSE );


	};

	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_028_Kazmin))
	{
		Log_SetTopicStatus (TOPIC_Zlo, LOG_SUCCESS);
	
		Log_SetTopicStatus (TOPIC_Erak_plagaciemnosci, LOG_SUCCESS);
		B_LogEntry (TOPIC_Erak_plagaciemnosci, "Uœmierci³em demona. Teraz nieumarli nie powinni ju¿ straszyæ w Górniczej Dolinie.");
		MissionPlagaCiemnosciFinished = TRUE;
	};
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Skeleton_Lord))
	&& (FinalBattleStarted == TRUE)
	{
		// zmienna sie zwieksza o 2, gdy on przyzywa,
		// a zmniejsza o 1, gdy ty zabijasz
		WojownicyCieniaPrzyzwani -= 1;
	};
	
	
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (OrcShaman_Ur_Shak))
	{
		AI_Teleport	(NASZ_412_CatSan, "OW_ROCKDRAGON_06");
		B_StartOtherRoutine (NASZ_412_CatSan,"UrShack");
		AI_GotoNpc	(NASZ_412_CatSan, hero);
	};
	
	// ***** PSIKUSY *****
	if (Npc_GetDistToWP	(self, "NASZ_BANDYCI_OBOZ_15") <=5000)
	&& (self.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
	&& (MIS_Psikusy_Ready > 0)
	{
		Psikusy_SheepKiller_Counter = Psikusy_SheepKiller_Counter + 1;

		if(Psikusy_SheepKiller_Counter >= 2) {
			B_LogEntry (TOPIC_Gestath_psikus, "No, doœæ tego ubijania owiec.");
			MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
		};
	};
	
	
	// --- monk mission
	if (MonkWolfMissionReady == TRUE)
	&& (self.guild == GIL_WOLF)
	{
		if (C_NpcIsHero (other)) {
			HeroWolfKiller += 1;
			HeroSayWolfCounter();
		}
		else if(Hlp_GetInstanceID (other) == NASZ_307_Monk) {
			MonkWolfKiller += 1;
			MonkSayWolfCounter();
		};
	};
	
	if (C_NpcIsHero (other))
	&&	((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Orc_Keroloth_A))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Orc_Keroloth_B)))
	{
		WillZabilWygnanca = WillZabilWygnanca + 1;
	};
	
	if (C_NpcIsHero (other))
	&&	((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin6))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin7))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin8))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin9))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin10))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin11))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin12))
	||	(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (goblin13)))
	{
		WillZabilGoblinaKerolotha = WillZabilGoblinaKerolotha + 1;
	};
	
	//QUEST BELIARA
	if (BeliarPraca3 == TRUE) && (ZabilesDlaBeliara == FALSE) && (C_NpcIsHero (other))

	&& ((self.aivar[AIV_MM_REAL_ID] == ID_SHEEP) // jesli jest owca
	
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_101_Korth))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_103_Johny))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_104_Engor))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_105_Straznik))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_106_Jan))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_107_Brutus))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_108_Lowca))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_109_Rethon))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_110_Keroloth))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_111_Gerold))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_112_Peter))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_113_Godar))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_114_Hokurn))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_115_Kurgan))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_116_Kjorn))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_117_Fed))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_118_Ferros))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_119_Udar))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_120_Phill))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_121_Straznik))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_122_Daniel))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_123_Lowca))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_124_Bron))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_125_Silas))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_126_Robotnik))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_127_Jeremiasz))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_201_Erak))
	// || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_202_Tival)) usuniety z gry
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_203_Tabuk))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_204_Vick))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_205_Mysliwy))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_206_Mysliwy))
	// || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_207_Mysliwy)) usuniety z gry
	// || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_208_Mysliwy)) usuniety z gry
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_209_Mysliwy))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_210_Mysliwy))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_211_Hunt))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_212_Drax))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_214_Goth))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_215_Kivo))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_216_Aran))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_217_Louis))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_218_Ammann))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_219_Dick))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_220_Kirgo))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_221_Benito))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_222_Cappel))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_223_Ratford))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_224_Dobar))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_225_Wrzod))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_226_Snaf))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_227_Vachut))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_228_Chris))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_229_Ayan))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_230_Dymoondo))
	|| (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (NASZ_231_Ted)))
	{
		B_LogEntry (TOPIC_bogowie_work, "Zabi³em niewinn¹ istotê...");
		Wld_PlayEffect("spellFX_Fear",  hero, hero, 0, 0, 0, FALSE );
		BeliarPraca3 = FALSE;
		ZabilesDlaBeliara = TRUE;
	};
	
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		B_DragonKillCounter (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
