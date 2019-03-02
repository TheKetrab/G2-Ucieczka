
// TODO: Kurgan chyba jest nie zrobiony ???

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
			CzasZakonczycWalkeZPowoduX = TRUE;
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
			CzasZakonczycWalkeZPowoduX = TRUE;
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
			CzasZakonczycWalkeZPowoduX = TRUE;
			Npc_ClearAIQueue(NASZ_113_Godar);
			B_Attack (NASZ_113_Godar,hero, AR_NONE, 0);
			Npc_ClearAIQueue(NASZ_114_Hokurn);
			B_Attack (NASZ_114_Hokurn,hero, AR_NONE, 0);
			PrintScreen	("WYGRANA", -1,-1, "font_old_20_white.tga",2);
			NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
			NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
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
	if (RethonKurganFightFinished  == TRUE) { secRethonKurganFightFinished += 1; };
	
	// cond
	if (RethonKurganBeginingOneTime == FALSE) {

		Print("BeginingOneTime");
		RethonKurganBeginingOneTime = TRUE;
		
		NASZ_115_Kurgan.attribute[ATR_STRENGTH] = 100;
		NASZ_109_Rethon.attribute[ATR_STRENGTH] = 100;

		Npc_ClearAIQueue (NASZ_115_Kurgan);
		Npc_ExchangeRoutine (NASZ_115_Kurgan, "Arena");
		Npc_ClearAIQueue (NASZ_109_Rethon);
		Npc_ExchangeRoutine (NASZ_109_Rethon, "Arena");
		
		Wld_SendTrigger("CAM_RETHON_KURGAN"); // TODO untrigger dopiero gdy skoncza walczyc plus kilka sekund, to chyba trzeba ustawic w spacerze, zeby nie robilo automatycznie untriggera
	};
	
	if (Npc_GetDistToWP(NASZ_109_Rethon,"NASZ_LOWCY_ARENA_01") < 700)
	&& (Npc_GetDistToWP(NASZ_115_Kurgan,"NASZ_LOWCY_ARENA_01") < 700)
	&& (RethonKurganAttackOneTime == FALSE)
	&& (RethonKurganFightIterator >= 7) // 7 sekund
	{	
	// TODO bogu spory problem!!! nie atakuja sie wgl... czemu?
		//Npc_ClearAIQueue (NASZ_115_Kurgan);
		B_Attack(NASZ_115_Kurgan, NASZ_109_Rethon, AR_NONE, 1);
		
		//Npc_ClearAIQueue (NASZ_109_Rethon);
		//B_Attack(NASZ_109_Rethon, NASZ_115_Kurgan, AR_NONE, 1);

		Print("RethonKurganAtakOneTime");
		RethonKurganAttackOneTime = TRUE;
		
	};
	
	
	// --- who won? ---
	if ((NASZ_109_Rethon.attribute[ATR_HITPOINTS] <= 1)
	 || (NASZ_115_Kurgan.attribute[ATR_HITPOINTS] <= 1))
	&& (RethonKurganFightFinished == FALSE)
	&& (RethonKurganFightIterator >= 10)
	{		
		Print("Who won?");

		RethonKurganFightFinished = TRUE;
		Npc_ExchangeRoutine (NASZ_115_Kurgan, "Start");
		Npc_ExchangeRoutine (NASZ_109_Rethon, "Start");
		
		if (NASZ_109_Rethon.attribute[ATR_HITPOINTS] <= 1) {
			RethonLostWithKurgan = TRUE;
		};
		
	};
	
	if (secRethonKurganFightFinished >= 3) {
		Print("secAfter");
		secRethonKurganFightFinished = 0;
		RethonKurganFightIterator = 0;
		Wld_SendUnTrigger("CAM_RETHON_KURGAN");
		ff_Remove(RethonKurganFight); // TODO ten remove chyba jest z³y!!!
	};
	
};
