// obslugiwanie bramy u Mysliwych

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
	};
	
	GateMysliwiOpened = TRUE;
};

func void GateMysliwi_Close() { //zamknij brame

	//Print("Gate Close");
	
	if (GateMysliwi_Opened() == TRUE) { // jesli jest otwarta
		Wld_SendTrigger ("BRAMA_MYSLIWI");
	};
	
	GateMysliwiOpened = FALSE;
};

func void GateMysliwi_HeroIsComming() {

	//Print("Gate HeroIsComming");

	if (GateMysliwi_Opened() == FALSE) // jesli jest zamknieta
	&& (GateMysliwi_OpenedFirstTime() == TRUE) { // i jesli gadales juz z gothem

		GateMysliwi_Open();
	
		// + hero wo�a
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