var int SikaDalejRdyOneTime;
var int MieczRunicznyLogOneTime;
var int MapaNOOneTime;
var int MapaOBOneTime;
var int PierwszyFragmentZwojuOneTime;
var int Wszystkie8FragmentowOneTime;
var int GateMysliwiTicks;

func void SikaDalej()
{
	if TimeIsUp(2,-1,LowcaSikaZaplaconeDay,-1) && (SikaDalejRdy == TRUE) && (SikaDalejRdyOneTime == FALSE)
	{
		SikaDalejRdyOneTime = TRUE;
		Npc_ExchangeRoutine (NASZ_108_Lowca, "PreStart");
		LowcaSika = TRUE;
		ff_remove(SikaDalej);
	};

};

//*****************************
//	Tworzenie broni gladiatorom
//*****************************
func void TworzenieBroniGladiatorom()
{
	if  (npc_knowsinfo (hero, DIA_NASZ_213_Gestath_keroloth))
	{

		Createinvitems (NASZ_109_Rethon, ItNa_Djg_Weapon_H, 1);
		AI_EquipBestMeleeWeapon	(NASZ_109_Rethon);
	
		Createinvitems (NASZ_112_Peter, ItNa_Djg_Weapon_L, 1);
		AI_EquipBestMeleeWeapon	(NASZ_112_Peter);

		Createinvitems (NASZ_113_Godar, ItNa_Djg_Weapon_M, 1);
		AI_EquipBestMeleeWeapon	(NASZ_113_Godar);

		Createinvitems (NASZ_114_Hokurn, ItNa_Djg_Weapon_M, 1);
		AI_EquipBestMeleeWeapon	(NASZ_114_Hokurn);

		Createinvitems (NASZ_115_Kurgan, ItNa_Djg_Weapon_H, 1);
		AI_EquipBestMeleeWeapon	(NASZ_115_Kurgan);

		Createinvitems (NASZ_116_Kjorn, ItNa_Djg_Weapon_L, 1);
		AI_EquipBestMeleeWeapon	(NASZ_116_Kjorn);

		Createinvitems (NASZ_117_Fed, ItNa_Djg_Weapon_L, 1);
		AI_EquipBestMeleeWeapon	(NASZ_117_Fed);

		Createinvitems (NASZ_118_Ferros, ItNa_Djg_Weapon_M, 1);
		AI_EquipBestMeleeWeapon	(NASZ_118_Ferros);

		ff_Remove(TworzenieBroniGladiatorom);
	};

};


// TICK TOCK 5 secs
func void TickTock_5s() {

	// ***** ***** BRAMA U MYSLIWYCH ***** *****
	// jesli jest noc to ma byc zamknieta (lub jest rozdzial 4)
	if (Wld_IsTime(21,30,00,00) || Wld_IsTime (00,00,06,30))
	|| (GateMysliwi_KapitelToCloseForDay())
	{
	
		if (GateMysliwiTicks >= 2) // czyli max przez 10s brama jest w nocy otwarta
		&& (!GateMysliwi_Moving()) // i nie jest w stanie otwierania sie
		{
			GateMysliwi_Close();
			GateMysliwiTicks = 0;
		}
	
		else {
			GateMysliwiTicks = GateMysliwiTicks + 1;
		};
	
	}
	
	// jesli jest dzien, to ma byc otwarta
	else {
	
		if (GateMysliwi_OpenedFirstTime() == TRUE) // jesli brame otworzyl ci Goth
		&& (GateMysliwi_KapitelToCloseForDay() == FALSE) { // i jeszcze nie jest kap4
			GateMysliwi_Open();
		};
	
	};
	// ***** ***** ***** ***** ***** ***** *****
	
	if (npc_hasitems (hero, ItNa_MieczRuniczny) >=1) && (MieczRunicznyLogOneTime == FALSE) {
		Log_CreateTopic (TOPIC_MieczRuniczny, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_MieczRuniczny, LOG_RUNNING);
		B_LogEntry (TOPIC_MieczRuniczny, "Na bagnach znalaz³em dziwny orê¿. Na klindze widaæ kryszta³, który jest ukruszony. Keroloth powinien rzuciæ na to okiem. W koñcu przebywa³ wœród paladynów... Mo¿e bêdzie wiedzia³ coœ o tym mieczu.");
		MieczRunicznyLogOneTime = TRUE;
	};

	if (npc_hasitems (hero, ItNa_Mapa_ObozNaBagnie) >=1) && (MapaOBOneTime == FALSE) && (MIS_HOKURN_READY == TRUE) {
		B_LogEntry (TOPIC_Hokurn_mapy, "Znalaz³em plan Obozu Bractwa.");
		MapaOBOneTime = TRUE;
	};

	if (npc_hasitems (hero, ItNa_Mapa_NowyOboz) >=1) && (MapaNOOneTime == FALSE) && (MIS_HOKURN_READY == TRUE) {
		B_LogEntry (TOPIC_Hokurn_mapy, "Znalaz³em plan Nowego Obozu.");
		MapaNOOneTime = TRUE;
	};

	
	if (npc_hasitems (hero, ItNa_FragmentZwoju) >=1)
	&& (PierwszyFragmentZwojuOneTime == FALSE) 
	&& (npc_knowsinfo(hero,DIA_NASZ_024_BaalOrun_Droga)) 
	{
		B_LogEntry (TOPIC_Droga, "Znalaz³em na bagnach jakiœ kawa³ek papieru. Wygl¹da na fragment zwoju z magicznym zaklêciem. Skoro ten nale¿a³ kiedyœ do któregoœ z Baalów i znalaz³em go w takim miejscu, to wydaje mi siê, ¿e mo¿e wszyscy pochowali to w swoich chatach?");
		PierwszyFragmentZwojuOneTime = TRUE;
	};	

	if (npc_hasitems (hero, ItNa_FragmentZwoju) >=8)
	&& (Wszystkie8FragmentowOneTime == FALSE)
	&& (npc_knowsinfo(hero,DIA_NASZ_024_BaalOrun_Droga)) {
		
		B_LogEntry (TOPIC_Droga, "Uda³o mi siê skompletowaæ wszystkie kawa³ki.");
		Wszystkie8FragmentowOneTime = TRUE;
	};

	//*******************
	//	Orkowe Obozy
	//*******************

	if (OrkowyObozKlif == FALSE) && (npc_isdead (OrcWarrior_Roam_ObozKlif)) && (npc_isdead (OrcWarrior_Rest_ObozKlif)) && (npc_isdead (OrcShaman_Sit_ObozKlif)) {
	OrkowyObozKlif = TRUE;
	PrintScreen	("Wyeliminowano orkowy obóz.", -1,-1, "font_old_20_white.tga",3);
	B_LogEntry (TOPIC_Rethon_orkowie, "Obóz na klifie za wie¿¹ Xardasa wyeliminowany.");
	OrkoweObozyRozwalone = OrkoweObozyRozwalone + 1;
	};

	if (OrkowyObozPalisade == FALSE) && (npc_isdead (OrcWarrior_Roam_ObozPalisade)) && (npc_isdead (OrcWarrior_Rest_ObozPalisade)) && (npc_isdead (OrcShaman_Sit_ObozPalisade)) {
	OrkowyObozPalisade = TRUE;
	PrintScreen	("Wyeliminowano orkowy obóz.", -1,-1, "font_old_20_white.tga",3);
	B_LogEntry (TOPIC_Rethon_orkowie, "Obóz obok palisady wyeliminowany.");
	OrkoweObozyRozwalone = OrkoweObozyRozwalone + 1;
	};

	if (OrkowyObozLasOC == FALSE) && (npc_isdead (OrcWarrior_Roam_ObozLasOC)) && (npc_isdead (OrcWarrior_Rest_ObozLasOC)) && (npc_isdead (OrcShaman_Sit_ObozLasOC)) {
	OrkowyObozLasOC = TRUE;
	PrintScreen	("Wyeliminowano orkowy obóz.", -1,-1, "font_old_20_white.tga",3);
	B_LogEntry (TOPIC_Rethon_orkowie, "Obóz w lesie miêdzy palisad¹ a zamkiem wyeliminowany.");
	OrkoweObozyRozwalone = OrkoweObozyRozwalone + 1;
	};
	
	if (OrkowyObozZamek == FALSE) && (npc_isdead (OrcWarrior_Roam_ObozZamek)) && (npc_isdead (OrcWarrior_Rest_ObozZamek)) && (npc_isdead (OrcShaman_Sit_ObozZamek)) {
	OrkowyObozZamek = TRUE;
	PrintScreen	("Wyeliminowano orkowy obóz.", -1,-1, "font_old_20_white.tga",3);
	B_LogEntry (TOPIC_Rethon_orkowie, "Obóz w lesie w okolicy zamku wyeliminowany.");
	OrkoweObozyRozwalone = OrkoweObozyRozwalone + 1;
	};
	
	if (OrkowyObozKopalnia == FALSE) && (npc_isdead (OrcWarrior_Roam_ObozKopalnia)) && (npc_isdead (OrcWarrior_Rest_ObozKopalnia)) && (npc_isdead (OrcShaman_Sit_ObozKopalnia)) {
	OrkowyObozKopalnia = TRUE;
	PrintScreen	("Wyeliminowano orkowy obóz.", -1,-1, "font_old_20_white.tga",3);
	B_LogEntry (TOPIC_Rethon_orkowie, "Obóz nad kopalni¹ wyeliminowany.");
	OrkoweObozyRozwalone = OrkoweObozyRozwalone + 1;
	};
	

	if (Npc_GetDistToWP	(NASZ_016_Netbek, "NASZ_ZAPALISADA_SAMOBOJSTWO") < 2000)
	{
		B_KillNPC(NASZ_016_Netbek);
	};

};