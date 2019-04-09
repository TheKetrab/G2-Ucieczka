// Ayan Kladka TickTock
// wykorzystywany, bo Ayan nie umie wyjsc po kladce, gdy jest follow player

func void AyanKladka_TickTock1s() {

	if (Npc_GetDistToWP(hero,"NASZ_OZYWIENIEC_32") < 500)
	|| (Npc_GetDistToWP(NASZ_229_Ayan,"NASZ_OZYWIENIEC_32") < 500)
	{
		B_StartOtherRoutine(NASZ_229_Ayan,"AyansLastGuide");
	};
};
