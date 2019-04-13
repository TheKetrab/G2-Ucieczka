func void B_FullStop(var c_npc npc)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_FullStop");
	Npc_ClearAIQueue(npc);
	AI_StandupQuick(npc);
};

func void KillZombiesXardasOld1()
{
	B_FullStop(NASZ_431_ZombieXardasOld01);
	B_FullStop(NASZ_432_ZombieXardasOld02);
	B_FullStop(NASZ_433_ZombieXardasOld03);
	B_FullStop(NASZ_434_ZombieXardasOld04);
	B_KillNpc(NASZ_431_ZombieXardasOld01);
	B_KillNpc(NASZ_432_ZombieXardasOld02);
	B_KillNpc(NASZ_433_ZombieXardasOld03);
	B_KillNpc(NASZ_434_ZombieXardasOld04);
	
	ZombieKillCounter = ZombieKillCounter + 1;
	


/*	AI_StartState (NASZ_431_ZombieXardasOld01, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_432_ZombieXardasOld02, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_433_ZombieXardasOld03, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_434_ZombieXardasOld04, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_435_ZombieXardasOld05, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_436_ZombieXardasOld06, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_437_ZombieXardasOld07, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_438_ZombieXardasOld08, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_439_ZombieXardasOld09, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_440_ZombieXardasOld10, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_441_ZombieXardasOld11, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_442_ZombieXardasOld12, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_443_ZombieXardasOld13, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_444_ZombieXardasOld14, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_445_ZombieXardasOld15, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_446_ZombieXardasOld16, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_447_ZombieXardasOld17, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_448_ZombieXardasOld18, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_449_ZombieXardasOld19, ZS_Oswojenie, 0, "");
	AI_StartState (NASZ_450_ZombieXardasOld20, ZS_Oswojenie, 0, ""); */
};

func void KillZombiesXardasOld2()
{
	B_FullStop(NASZ_435_ZombieXardasOld05);
	B_FullStop(NASZ_436_ZombieXardasOld06);
	B_FullStop(NASZ_437_ZombieXardasOld07);
	B_FullStop(NASZ_438_ZombieXardasOld08);
	B_KillNpc(NASZ_435_ZombieXardasOld05);
	B_KillNpc(NASZ_436_ZombieXardasOld06);
	B_KillNpc(NASZ_437_ZombieXardasOld07);
	B_KillNpc(NASZ_438_ZombieXardasOld08);
	
	ZombieKillCounter = ZombieKillCounter + 1;
};

func void KillZombiesXardasOld3()
{
	B_FullStop(NASZ_439_ZombieXardasOld09);
	B_FullStop(NASZ_440_ZombieXardasOld10);
	B_FullStop(NASZ_441_ZombieXardasOld11);
	B_FullStop(NASZ_442_ZombieXardasOld12);
	B_KillNpc(NASZ_439_ZombieXardasOld09);
	B_KillNpc(NASZ_440_ZombieXardasOld10);
	B_KillNpc(NASZ_441_ZombieXardasOld11);
	B_KillNpc(NASZ_442_ZombieXardasOld12);
	
	ZombieKillCounter = ZombieKillCounter + 1;
};

func void KillZombiesXardasOld4()
{
	B_FullStop(NASZ_443_ZombieXardasOld13);
	B_FullStop(NASZ_444_ZombieXardasOld14);
	B_FullStop(NASZ_445_ZombieXardasOld15);
	B_FullStop(NASZ_446_ZombieXardasOld16);
	B_KillNpc(NASZ_443_ZombieXardasOld13);
	B_KillNpc(NASZ_444_ZombieXardasOld14);
	B_KillNpc(NASZ_445_ZombieXardasOld15);
	B_KillNpc(NASZ_446_ZombieXardasOld16);
	
	ZombieKillCounter = ZombieKillCounter + 1;
};

func void KillZombiesXardasOld5()
{
	B_FullStop(NASZ_447_ZombieXardasOld17);
	B_FullStop(NASZ_448_ZombieXardasOld18);
	B_FullStop(NASZ_449_ZombieXardasOld19);
	B_FullStop(NASZ_450_ZombieXardasOld20);
	B_KillNpc(NASZ_447_ZombieXardasOld17);
	B_KillNpc(NASZ_448_ZombieXardasOld18);
	B_KillNpc(NASZ_449_ZombieXardasOld19);
	B_KillNpc(NASZ_450_ZombieXardasOld20);
	
	ZombieKillCounter = 0;
};