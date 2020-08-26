
func int NpcBreakArenaLaw(var c_npc slf) {

	if (Npc_GetDistToWP	(slf, "NASZ_LOWCY_ARENA_01") >=1000)
	|| (Npc_IsInFightMode(slf, FMODE_FAR))
	|| (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		return true;
	};
	
	return false;
};

func int HeroIsLeavingArena() {

	if (Npc_GetDistToWP (hero, "NASZ_LOWCY_ARENA_01") >=650)
	&& (Npc_GetDistToWP (hero, "NASZ_LOWCY_ARENA_20") >= 100) // zeby obejmowalo arene, jesli jest przy tym wp, to jest ok 
	&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 1000)
	&& (Arena_Opuszczasz_Raz == FALSE)
	{
		return true;
	};
	
	return false;
};

func void ARENA ()
{

	//Fed
	if (FED_WALCZY == TRUE) && !(NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		if (HeroIsLeavingArena()) {
			PrintScreen	("Opuszczasz arenê...", -1,-1, "font_old_20_white.tga",2);
			Arena_Opuszczasz_Raz = TRUE;
		};
		
		if (NpcBreakArenaLaw(hero))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_117_Fed);
			B_Attack (NASZ_117_Fed,hero, AR_NONE, 0);
			PrintScreen	("PRZEGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		};

		if (NpcBreakArenaLaw(NASZ_117_Fed))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_117_Fed);
			B_Attack (NASZ_117_Fed,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
		
	};

	//Kjorn
	if (KJORN_WALCZY == TRUE) && !(NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		if (HeroIsLeavingArena()) {
			PrintScreen	("Opuszczasz arenê...", -1,-1, "font_old_20_white.tga",2);
			Arena_Opuszczasz_Raz = TRUE;
		};
		
		if (NpcBreakArenaLaw(hero))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_116_Kjorn);
			B_Attack (NASZ_116_Kjorn,hero, AR_NONE, 0);
			PrintScreen	("PRZEGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		};

		if (NpcBreakArenaLaw(NASZ_116_Kjorn))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_116_Kjorn);
			B_Attack (NASZ_116_Kjorn,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
	};
	
	//Ferros
	if (FERROS_WALCZY == TRUE) && !(NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		if (HeroIsLeavingArena()) {
			PrintScreen	("Opuszczasz arenê...", -1,-1, "font_old_20_white.tga",2);
			Arena_Opuszczasz_Raz = TRUE;
		};
		
		if (NpcBreakArenaLaw(hero))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_118_Ferros);
			B_Attack (NASZ_118_Ferros,hero, AR_NONE, 0);
			PrintScreen	("PRZEGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		};

		if (NpcBreakArenaLaw(NASZ_118_Ferros))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_118_Ferros);
			B_Attack (NASZ_118_Ferros,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
	};
	
	//Godar & Hokurn
	if (GODARHOKURN_WALCZY == TRUE) && !(NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && !(NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		if (HeroIsLeavingArena()) {
			PrintScreen	("Opuszczasz arenê...", -1,-1, "font_old_20_white.tga",2);
			Arena_Opuszczasz_Raz = TRUE;
		};
		
		if (NpcBreakArenaLaw(hero))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduXGODAR = TRUE;
			CzasZakonczycWalkeZPowoduXHOKURN = TRUE;

			Npc_ClearAIQueue(NASZ_113_Godar);
			B_Attack (NASZ_113_Godar,hero, AR_NONE, 0);
			Npc_ClearAIQueue(NASZ_114_Hokurn);
			B_Attack (NASZ_114_Hokurn,hero, AR_NONE, 0);
			PrintScreen	("PRZEGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
			NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		};

		if (NpcBreakArenaLaw(NASZ_113_Godar))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduXGODAR = TRUE;
			CzasZakonczycWalkeZPowoduXHOKURN = TRUE;

			Npc_ClearAIQueue(NASZ_113_Godar);
			B_Attack (NASZ_113_Godar,hero, AR_NONE, 0);
			Npc_ClearAIQueue(NASZ_114_Hokurn);
			B_Attack (NASZ_114_Hokurn,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
			NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
		
		if (NpcBreakArenaLaw(NASZ_114_Hokurn))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduXGODAR = TRUE;
			CzasZakonczycWalkeZPowoduXHOKURN = TRUE;

			Npc_ClearAIQueue(NASZ_113_Godar);
			B_Attack (NASZ_113_Godar,hero, AR_NONE, 0);
			Npc_ClearAIQueue(NASZ_114_Hokurn);
			B_Attack (NASZ_114_Hokurn,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
			NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
	};
	
	
	//Kurgan
	if (KURGAN_WALCZY == TRUE) && !(NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		if (HeroIsLeavingArena()) {
			PrintScreen	("Opuszczasz arenê...", -1,-1, "font_old_20_white.tga",2);
			Arena_Opuszczasz_Raz = TRUE;
		};
		
		if (NpcBreakArenaLaw(hero))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_115_Kurgan);
			B_Attack (NASZ_115_Kurgan,hero, AR_NONE, 0);
			PrintScreen	("PRZEGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		};

		if (NpcBreakArenaLaw(NASZ_115_Kurgan))
		&& (Arena_Przegrana_Raz == FALSE)
		{
			Arena_Przegrana_Raz = TRUE;
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_115_Kurgan);
			B_Attack (NASZ_115_Kurgan,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		};
	};
	
	
};


var int secRethonKurganFightFinished;
var int RethonKurganFightFinished;
var int RethonKurganBeginingOneTime;
var int RethonKurganAttackOneTime;
var int RethonKurganFightIterator;
func void RethonKurganFight() {

	RethonKurganFightIterator += 1;

	// incrementation
	if (RethonKurganFightFinished == TRUE) { secRethonKurganFightFinished += 1; };
	

	// cond
	if (RethonKurganFightIterator >= 1 && RethonKurganBeginingOneTime == FALSE) {

		//Print("BeginingOneTime");
		RethonKurganBeginingOneTime = TRUE;
		Npc_ClearAIQueue(NASZ_115_Kurgan);
		Npc_ClearAIQueue(NASZ_109_Rethon);
		
		NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 100;
		NASZ_109_Rethon.attribute[ATR_STRENGTH] = 100;


		Npc_ExchangeRoutine (NASZ_115_Kurgan, "KurganRethonArena");
		Npc_ExchangeRoutine (NASZ_109_Rethon, "Arena");
		
		Wld_SendTrigger("CAM_RETHON_KURGAN");
	};
	
	if (Npc_GetDistToWP(NASZ_109_Rethon,"NASZ_LOWCY_ARENA_01") < 700)
	&& (Npc_GetDistToWP(NASZ_115_Kurgan,"NASZ_LOWCY_ARENA_01") < 700)
	&& (RethonKurganAttackOneTime == FALSE)
	&& (RethonKurganFightIterator >= 6) // 6 sekund
	{	
		// FIX UCIECZKA 1.1 - w petli ZS_Attack_Loop, lowcy nie widzieli othera (other byl null)
		// W funkcji ZS_Attack jest uzycie B_ValidateOther, gdzie odtwarza sie othera korzystajac
		// z aivara AIV_LASTTARGET
	
		var c_npc kurgan; kurgan = Hlp_GetNpc(NASZ_115_Kurgan);
		var c_npc rethon; rethon = Hlp_GetNpc(NASZ_109_Rethon);
		kurgan.aivar[AIV_LASTTARGET] = NASZ_109_Rethon;
		rethon.aivar[AIV_LASTTARGET] = NASZ_115_Kurgan;
	
		B_Attack(kurgan, rethon, AR_NONE, 1);
		B_Attack(rethon, kurgan, AR_NONE, 1);

		//Print("RethonKurganAtakOneTime");
		RethonKurganAttackOneTime = TRUE;
		
	};
	
	
	// --- who won? ---
	if ((NASZ_109_Rethon.attribute[ATR_HITPOINTS] <= 1)
	 || (NASZ_115_Kurgan.attribute[ATR_HITPOINTS] <= 1))
	&& (RethonKurganFightFinished == FALSE)
	&& (RethonKurganFightIterator >= 10)
	{		
	
		//Print("Who won?");

		RethonKurganFightFinished = TRUE;
		Npc_ExchangeRoutine (NASZ_115_Kurgan, "Start");
		Npc_ExchangeRoutine (NASZ_109_Rethon, "Start");
		
		if (NASZ_109_Rethon.attribute[ATR_HITPOINTS] <= 1) {
			RethonLostWithKurgan = TRUE;
		};
		
	};
	
	if (secRethonKurganFightFinished >= 10) {
		//Print("secAfter");
		secRethonKurganFightFinished = 0;
		RethonKurganFightIterator = 0;
		Wld_SendUnTrigger("CAM_RETHON_KURGAN"); // - wy³¹czenie kamery
		ff_Remove(RethonKurganFight);
	};
	
};
