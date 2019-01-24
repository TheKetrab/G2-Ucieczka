// ******************************
// B_AyanOrc
// ******************************


var int secAyanOrc;
func void AyanOrcTimer() {

	secAyanOrc += 1;
	
	if (secAyanOrc == 3) {
		AI_UseMob (NASZ_229_Ayan, "TURNSWITCH", 1);
	};

	if (secAyanOrc == 9) {
		AI_UseMob (NASZ_229_Ayan, "TURNSWITCH", -1);
	};

	if (secAyanOrc == 7) {
		Wld_InsertItem(ItNa_Empty,"NASZ_OZYWIENIEC_08");
	};
		
	if (secAyanOrc == 8) {
		Wld_PlayEffect("FX_EarthQuake", ItNa_Empty, ItNa_Empty, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_INCOVATION_BLUE", ItNa_Empty, ItNa_Empty, 0, 0, 0, FALSE );
	};

	if (secAyanOrc == 9) {
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", ItNa_Empty, ItNa_Empty, 0, 0, 0, FALSE );
	};

	if (secAyanOrc == 11) {
		Wld_PlayEffect("spellFX_BELIARSRAGE", ItNa_Empty, ItNa_Empty, 0, 0, 0, FALSE);
	};

	
	
	if (secAyanOrc == 13) {
		Wld_RemoveItem(ItNa_Empty);
	};
	
	if (secAyanOrc == 15) {
		ff_Remove(AyanOrcTimer);
	};

















};























var int B_AYANORC_KOLOWROT_OneTime;
func void B_AYANORC_KOLOWROT_S1 ()
{
	if (B_AYANORC_KOLOWROT_OneTime == FALSE)
	{
		Wld_SendTrigger ("MOVER_INSIDE_ORC");
		B_AYANORC_KOLOWROT_OneTime = TRUE;
		WillOtworzylKolowrotOrc = TRUE;
		Wld_SendTrigger ("KAMERA_GR_KOLOWROT");
	};
};

var int B_AYANORC_GLAZ_OneTime;
func void B_AYANORC_GLAZ_S1 ()
{
	if (B_AYANORC_GLAZ_OneTime == FALSE)
	{
		Wld_SendTrigger ("MOVER_OUTSIDE_ORC");
		B_AYANORC_GLAZ_OneTime = TRUE;
		WillOtworzylGlazOrc = TRUE;
		
		AyanBiegnie = TRUE;
		Npc_ExchangeRoutine (NASZ_229_Ayan, "FollowGlaz");
	};
};

var int B_AYANORC_OKRAGLYAYAN_OneTime;
func void B_AYANORC_OKRAGLYAYAN_S1 ()
{
	if (B_AYANORC_OKRAGLYAYAN_OneTime == FALSE)
	{
		B_AYANORC_OKRAGLYAYAN_OneTime = TRUE;
		WillSprobowalPrzelacznikAyan = TRUE;
	};
};

var int B_AYANORC_OKRAGLYWILL_OneTime;
var int B_AYANORC_OKRAGLYWILL_SecondTime;
func void B_AYANORC_OKRAGLYWILL_S1 ()
{
	if (B_AYANORC_OKRAGLYWILL_OneTime == FALSE)
	{
		//AI_UseMob (NASZ_229_Ayan, "TURNSWITCH",-1); 
		B_AYANORC_OKRAGLYWILL_OneTime = TRUE;
		WillSprobowalPrzelacznikWill = TRUE;
	};

	if (B_AYANORC_OKRAGLYWILL_SecondTime == FALSE) && (WillIsGoingToSwitchWillPrzelacznik == TRUE)
	{
		Wld_SendTrigger ("KAMERA_LIFT");
		B_AYANORC_OKRAGLYWILL_SecondTime = TRUE;
		DwaPrzelacznikiOkej = TRUE;
		FF_ApplyOnceExt (AyanOrcTimer, 1000, -1); // 1 na sekunde
	};
};