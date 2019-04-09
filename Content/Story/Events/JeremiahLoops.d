// ***** ***** ***** ***** *****
// 		Jeremiah Loops
// ***** ***** ***** ***** *****

var int Jeremiasz_AlmostDead_NextTo_OneTime;
var int JeremiahIllnessSec;

func void JeremiahAlmostDead_TickTock1s() {

	// TODO jeremiasz ma miec taka rutyne ze spi i sie go nie da zbudzic, zagadac ani nic
	if (Jeremiasz_AlmostDead == TRUE)
	&& (Jeremiasz_AlmostDead_NextTo_OneTime == FALSE)
	&& (Npc_GetDistToNpc (hero, NASZ_127_Jeremiasz) < 300)
	&& !(Wld_IsTime(00,00,06,00)) // nie jest noc - czyli spi przez dzien
	{
		HeroKnowsAboutJeremiahsIllness = 1;
		Jeremiasz_AlmostDead_NextTo_OneTime = TRUE;
		B_LogEntry (TOPIC_Jeremiasz_lek, "Cholera, Jeremiasz le¿y w ³ó¿ku i nie wygl¹da zbyt dobrze. Mo¿e coœ mu siê sta³o? Muszê zapytaæ Kirgo, czy Jeremiaszowi nic nie grozi.");
	};
	
	
	if (HeroKnowsAboutJeremiahsIllness == 2)
	&& (npc_hasitems(hero,ItFo_Addon_Pfeffer_01) >= 1)
	&& (Npc_GetDistToNpc (hero, NASZ_127_Jeremiasz) < 300)
	{
		AI_RunToNPC(hero,NASZ_127_Jeremiasz);
		AI_Wait(hero, 2);
		AI_PlayAni (hero, "T_PLUNDER");
		Npc_RemoveInvItems(hero,ItFo_Addon_Pfeffer_01,1);
		HeroKnowsAboutJeremiahsIllness = 3;
	};
	
	if (HeroKnowsAboutJeremiahsIllness == 3) {

		JeremiahIllnessSec += 1;
		
		if (JeremiahIllnessSec >= 8) {
			JeremiahIllnessSec = 0;
			HeroKnowsAboutJeremiahsIllness = 4;
		};
	};
	
	if (HeroKnowsAboutJeremiahsIllness == 4) {
		Npc_ExchangeRoutine(NASZ_127_Jeremiasz,"Start");
		ff_remove(JeremiahAlmostDead_TickTock1s);
	};
};