func void PierscienieWiernosciFinish() {

	B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda³em wszystkie pierœcienie.");
	Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
	B_GivePlayerXP (700);
	DodajReputacje(4,REP_MYSLIWI);
	
	// zamiana zwyklego itemu na prawdziwy pierscien
	Npc_RemoveInvItems(hero,ItNa_Wiernosc,1);
	CreateInvItems(hero,ItNa_Ring_Wiernosc,1);
};