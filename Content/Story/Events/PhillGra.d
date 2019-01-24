
func void B_PhillGraStartMusic()
{
   
	if(EngorRoutinePlayLute == TRUE) {

	   //Print("Raport: PhillGraStart");
	   //Wld_SendTrigger ("INEXTREMO_IE");
	   //Wld_SendUnTrigger ("MUSIC_NCI");

	   Wld_SendTrigger ("GUITAR_MUSIK");

	   PhillGraPlaying = TRUE;
	};
};

func void B_PhillGraStopMusic()
{
	if(EngorRoutinePlayLute == TRUE) {
	
		//Print("Raport: PhillGraStop");
	   Wld_SendUnTrigger ("GUITAR_MUSIK");

	   //Wld_SendUnTrigger ("INEXTREMO_IE");
	   Wld_SendTrigger ("MUSIC_NCI");

	   PhillGraPlaying = FALSE;
	};
};