
// SPACER: numCanBeActivated=int:-1
func void TARCZA_OBOZ_WYPADOWY() {
	
	if ((Tabuk_Tarcza1 == TRUE)
	&& (Tabuk_Tarcza1_Wystrzelono <= 3)
	&& (Npc_GetDistToWP(hero,"NASZ_MYSLIWI_GRUPA_TARCZA1") < 300))
	{
		Print("Trafiony!");
		Tabuk_Tarcza1_Trafiono += 1;	
	};

	if (Tabuk_Tarcza2 == TRUE)
	&& (Tabuk_Tarcza2_Wystrzelono <= 3)
	&& (Npc_GetDistToWP(hero,"ROCKCAMP") < 300)
	{
		Print("Trafiony!");
		Tabuk_Tarcza2_Trafiono += 1;
	};

};
