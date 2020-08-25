// obslugiwanie bramy u Mysliwych

// --- funkcje publiczne: ---
// GateMysliwi_Opened()
// GateMysliwi_Open()
// GateMysliwi_Close()
// GateMysliwi_Moving() // 5s trigger moving



var int GateMysliwiMovingTimerVar;
var int GateMysliwiMoving;
func void GateMysliwiMovingTimer() {

	GateMysliwiMovingTimerVar += 1;
	if (GateMysliwiMovingTimerVar == 5) {
		ff_remove(GateMysliwiMovingTimer);
		GateMysliwiMoving = FALSE;
	};
};

func int GateMysliwi_Moving() {
	return GateMysliwiMoving;
};

func int GateMysliwi_OpenedFirstTime() {
	return GateMysliwiOpenedFirstTime;
};

func int GateMysliwi_KapitelToCloseForDay() {
	return (KAPITEL >= 4);
};

func int GateMysliwi_Opened() {
	return GateMysliwiOpened;
};

func void GateMysliwi_Open() { // otworz brame

	//Print("Gate Open");
	
	if (GateMysliwi_Opened() == FALSE) { // jesli jest zamknieta
		Wld_SendTrigger ("BRAMA_MYSLIWI");
		GateMysliwiMoving = TRUE;
		GateMysliwiMovingTimerVar = 0;
		ff_applyonceext(GateMysliwiMovingTimer,1000,-1);
	};
	
	GateMysliwiOpened = TRUE;
};

func void GateMysliwi_Close() { //zamknij brame

	//Print("Gate Close");
	
	if (GateMysliwi_Opened() == TRUE) { // jesli jest otwarta
		Wld_SendTrigger ("BRAMA_MYSLIWI");
		GateMysliwiMoving = TRUE;
		GateMysliwiMovingTimerVar = 0;
		ff_applyonceext(GateMysliwiMovingTimer,1000,-1);
	};
	
	GateMysliwiOpened = FALSE;
};

func void GateMysliwi_HeroIsComming() {

	//Print("Gate HeroIsComming");

	if (Npc_IsPlayer(self)) // trigger wywolywany przez hero
	&& (GateMysliwi_Opened() == FALSE) // jesli jest zamknieta
	&& (GateMysliwi_OpenedFirstTime() == TRUE) { // i jesli gadales juz z gothem

		GateMysliwi_Open();
	
		// + hero wo³a
		HeroSay_OpenGate();
	
	};

};




//**************************************************
func void BRAMAMYSLIWIPRZELACZNIK_S1 ()
{
	if (GateMysliwi_Opened() == FALSE) {
		GateMysliwi_Open();
	};
	if (GateMysliwi_Opened() == TRUE) {
		GateMysliwi_Close();
	};
};