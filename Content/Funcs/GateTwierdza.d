// obslugiwanie bramy w Twierdzy


var int WillUsedWheelTwierdza;
FUNC VOID TwierdzaAtak ()
{
	Print("Duza funkcja");
	
	//KOLOWROTEK
	if (TwierdzaAtakReady == TRUE) {
	
		/*
		NASZ_319_Niewolnik.guild = GIL_FRIENDLY_ORC;
		NASZ_320_Niewolnik.guild = GIL_FRIENDLY_ORC;
		NASZ_321_Niewolnik.guild = GIL_FRIENDLY_ORC;
		NASZ_325_Grimes.guild = GIL_FRIENDLY_ORC;		
		NASZ_216_Aran.guild = GIL_FRIENDLY_ORC;
		NASZ_116_Kjorn.guild = GIL_FRIENDLY_ORC;
		NASZ_117_Fed.guild = GIL_FRIENDLY_ORC;
		NASZ_118_Ferros.guild = GIL_FRIENDLY_ORC;
		NASZ_112_Peter.guild = GIL_FRIENDLY_ORC;
		NASZ_101_Korth.guild = GIL_FRIENDLY_ORC;		
		NASZ_103_Johny.guild = GIL_FRIENDLY_ORC;
			
		Npc_SetTrueGuild (NASZ_319_Niewolnik, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_320_Niewolnik, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_321_Niewolnik, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_325_Grimes, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_216_Aran, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_116_Kjorn, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_117_Fed, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_118_Ferros, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_112_Peter, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_101_Korth, GIL_FRIENDLY_ORC);
		Npc_SetTrueGuild (NASZ_103_Johny, GIL_FRIENDLY_ORC);
		*/

		OrcScout_TwierdzaA.guild = GIL_ORC;
		OrcScout_TwierdzaB.guild = GIL_ORC;
		OrcWarrior_TwierdzaA.guild = GIL_ORC;
		OrcWarrior_TwierdzaB.guild = GIL_ORC;
		OrcWarrior_TwierdzaC.guild = GIL_ORC;
		OrcWarrior_TwierdzaD.guild = GIL_ORC;
		OrcWarrior_TwierdzaE.guild = GIL_ORC;
		OrcWarrior_TwierdzaF.guild = GIL_ORC;
		OrcWarrior_TwierdzaG.guild = GIL_ORC;
		OrcWarrior_TwierdzaH.guild = GIL_ORC;
		OrcWarrior_TwierdzaI.guild = GIL_ORC;
		OrcElite_TwierdzaA.guild = GIL_ORC;
		OrcElite_TwierdzaB.guild = GIL_ORC;
		OrcElite_TwierdzaC.guild = GIL_ORC;

		Npc_SetTrueGuild (OrcScout_TwierdzaA, GIL_ORC);
		Npc_SetTrueGuild (OrcScout_TwierdzaB, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaA, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaB, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaC, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaD, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaE, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaF, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaG, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaH, GIL_ORC);
		Npc_SetTrueGuild (OrcWarrior_TwierdzaI, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_TwierdzaA, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_TwierdzaB, GIL_ORC);
		Npc_SetTrueGuild (OrcElite_TwierdzaC, GIL_ORC);


		TwierdzaAtakReady = FALSE;
		WillUsedWheelTwierdza = TRUE;
	};
};




func int GateTwierdza_Opened() {
	return GateTwierdzaOpened;
};

func void GateTwierdza_Open() { // otworz brame

	//Print("Gate Open");
	
	if (GateTwierdza_Opened() == FALSE) { // jesli jest zamknieta
		Wld_SendTrigger ("BRAMA_TWIERDZA_SKRYPT");
	};
	
	GateTwierdzaOpened = TRUE;
};

func void GateTwierdza_Close() { //zamknij brame

	//Print("Gate Close");
	
	if (GateTwierdza_Opened() == TRUE) { // jesli jest otwarta
		Wld_SendTrigger ("BRAMA_TWIERDZA_SKRYPT");
	};
	
	GateTwierdzaOpened = FALSE;
};



//**************************************************
func void BRAMATWIERDZAKOLOWROT_S1 ()
{
	
	if (GateTwierdza_Opened() == FALSE) {
		GateTwierdza_Open();
	}
	else if (GateTwierdza_Opened() == TRUE) {
		GateTwierdza_Close();
	};
	
	TwierdzaAtak();
};