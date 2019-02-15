func int C_NpcIsBandit(var c_npc slf) {
	if ((slf.id >= 301) && (slf.id <= 318))
	|| (slf.id == 326) // domenic
	|| (slf.id == 327) // danny

	{
		return TRUE;
	};
	
	return FALSE;
};


// Funkcje miejsca
func int C_IsInLowcyTerritory() {

	if (Npc_GetDistToWP(hero,"NASZ_LOWCY_CMENTARZ_03") < 1500)
	|| (Npc_GetDistToWP(hero,"NASZ_LOWCY_CMENTARZ_02") < 600)
	{
		return false;
	};
	

	if (Npc_GetDistToWP(hero,"NASZ_LOWCY_DOL_15") < 1500)
	|| (Npc_GetDistToWP(hero,"NASZ_LOWCY_ARENA_01") < 3000)
	|| (Npc_GetDistToWP(hero,"NASZ_LOWCY_DOL_25") < 5000)
	|| (Npc_GetDistToWP(hero,"NASZ_LOWCY_GORA_04") < 2000)
	|| (Npc_GetDistToWP(hero,"NASZ_LOWCY_DOM_03") < 2000)
	// ----- outside -----
	|| (Npc_GetDistToWP(hero,"NASZ_MIECZ_4") < 1000) // Miecz
	
	{
		return true;
	};

	return false;
};

func int C_IsInMysliwiTerritory() {
	if (Npc_GetDistToWP(hero,"LOCATION_01_06") < 1500) // Aran
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_DOL_16") < 3000)
	|| (Npc_GetDistToWP(hero,"LOCATION_02_06") < 1500) // Gestath
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_DOL_04") < 1500) // Cappel
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_GORA_16") < 3000) // Spanie
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_BALKON_04") < 2000)
	// ----- outside -----
	|| (Npc_GetDistToWP(hero,"SPAWN_TALL_PATH_BANDITOS2_02_04") < 2000) // Vachut
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_POZA_2") < 1000) // Dymoondo
	|| (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_GRUPA_02") < 2500) // Oboz wypadowy	

	{
		return true;
	};

	return false;
};

func int C_IsInBandyciTerritory() {
	if (
	   (Npc_GetDistToWP(hero,"NASZ_BANDYCI_OBOZ_06") < 2000)
	|| (Npc_GetDistToWP(hero,"NASZ_BANDYCI_OBOZ_17") < 3000)
	|| (Npc_GetDistToWP(hero,"OW_PATH_033_TO_CAVE5") < 1500)
	|| (Npc_GetDistToWP(hero,"NASZ_BANDYCI_TRON_03") < 1000)
	// ----- outside -----
	|| (Npc_GetDistToWP(hero,"NASZ_BANDYCI_WODOSPAD_01") < 1000) // Gobby
	|| (Npc_GetDistToWP(hero,"OW_DJG_WATCH_STONEHENGE_01") < 1000) // Carry
	|| (Npc_GetDistToWP(hero,"NASZ_BANDYCI_RYBY_L") < 2500) // Danny
	)
	// i nie jest w:
	&& !((Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_1") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_2") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_3") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_4") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_5") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_6") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_7") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_8") < 500)
	   ||(Npc_GetDistToWP(hero,"NASZ_BANDYCI_SECRET_9") < 500))
	
	{
		return true;
	};

	return false;
};

func int C_IsInKopalniaTerritory() {
	if (Npc_GetDistToWP(hero,"OW_PATH_266") < 2000)
	{
		return true;
	};

	return false;
};
