func void TARCZA_OBOZ_WYPADOWY() {

	// TODO: jesli trafisz w tarczę, to +1 do łuków i kusz (czyli razem max +6)

	Print("Trafiony");
	
	if (Tabuk_Tarcza1 == TRUE)
	&& (Tabuk_Tarcza1_Wystrzelono <= 3)
	&& (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_GRUPA_TARCZA1") < 300)
	{
		Print("Trafiony TARCZA1");
		Tabuk_Tarcza1_Trafiono += 1;	
	};

	if (Tabuk_Tarcza2 == TRUE)
	&& (Tabuk_Tarcza2_Wystrzelono <= 3)
	&& (Npc_GetDistToWP(hero,"ROCKCAMP") < 300)
	{
		Print("Trafiony TARCZA2");
		Tabuk_Tarcza2_Trafiono += 1;
	};
	
};
