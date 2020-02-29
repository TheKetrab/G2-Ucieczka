
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// OSIAGNIECIA STARE
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// 1. Zabij 1000 stworze�.
// 2. Sta� si� guru kopaczy.
// 3. Poznaj przepisy Gildii Alchemik�w.
// 4. Naucz si� wszystkich sztuczek z�odzejskich.
// 5. Zosta� mistrzem areny.
// 6. Wyzw�l kopalni� Marcosa.
// 7. U�wi�� wszystkie groby.
// 8. Przejmij ob�z na pla�y za palisad�.
// 9. Pokonaj wszystkie bossy.
// 10. Oczy�� p�askowy� gigant�w.

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// OSIAGNIECIA NOWE
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
const string Acv1Title   = "Zab�jca";
const string Acv1Content = "Zabi�e� 1000 stworze�";

const string Acv2Title   = "Guru kopaczy";
const string Acv2Content = "Wykopa�e� niemal wszystko w G�rniczej Dolinie";

const string Acv3Title   = "Alchemik";
const string Acv3Content = "Pozna�e� wszystkie sekrety Gildii Alchemik�w";

const string Acv4Title   = "Z�odziej";
const string Acv4Content = "Nauczy�e� si� wszystkich sztuczek z�odziejskich";

const string Acv5Title   = "Mistrz areny";
const string Acv5Content = "Pokona�e� wszystkich gladiator�w";

const string Acv6Title   = "M�ciciel";
const string Acv6Content = "Wyzwoli�e� kopalni� Marcosa";

const string Acv7Title   = "Przywo�ywacz duch�w";
const string Acv7Content = "Po�wi�ci�e� wszystkie groby";

const string Acv8Title   = "Okrob�jca";
const string Acv8Content = "Rozgromi�e� ob�z ork�w na pla�y";

const string Acv9Title   = "Achilles";
const string Acv9Content = "Pokona�e� wszystkich boss�w";

const string Acv10Title   = "Chwa�a i odwaga";
const string Acv10Content = "Oczy�ci�e� p�askowy� gigant�w";

const string Acv11Title   = "";
const string Acv11Content = "";

const string Acv12Title   = "";
const string Acv12Content = "";


// 1. Zabij 1000 stworze�.
// 2. Sta� si� guru kopaczy.
// 3. Poznaj przepisy Gildii Alchemik�w.
// 4. Naucz si� wszystkich sztuczek z�odzejskich.
// 5. Zosta� mistrzem areny.
// 6. Wyzw�l kopalni� Marcosa.
// 7. U�wi�� wszystkie groby.
// 8. Przejmij ob�z na pla�y za palisad�.
// 9. Pokonaj wszystkie bossy.
// 10. Oczy�� p�askowy� gigant�w.



// Zbieracz - zebra�e� 100 zardzewia�ych mieczy
//Oszcz�dzacz punkt�w nauki - miej 50 niewykorzystanych punkt�w nauki
// Mistrz nad mistrzami - 100% czegolwiek
// Otw�rz 100 skrzy�
// �amacz wytrych�w 
// Szcz�ciarz - otw�rz 5 skrzy� bez �amania wytrycha
// Magik - u�yj 10 r�nych czar�w
// Zjedz wszystkie zio�a
// Nurek - sp�d� 5 minut (w sumie) pod woda
// Rze�nik - zbierz 500 mi�s (mo�esz je zjada� , nie musza by� w ekwipunku (je�li podnosisz a iten nie ma flagi item dropped)
// Miej 1hp na koncie
// Miej na koncie skute (czyli ze kto� tobie) 50k hp
// Wypij odtrutk�
// Kup 100 butelek alkoholu 
// Prze�pij 100 godzin 
// Spl�druj domy kerolotga i gestatha
// M�dl si� do innosa przez 3 dni
// Wypij 30 butelek alkoholu
// Znajd� listy magnat�w (rozrzucone po zamku)
// Mistrz my�listwa - naucz si� wszystkich trofe�w
// Strzel 100razy z �uku lub kuszy
// Przejd� ilestam kilometr�w



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

func void Use_ItNa_KsiegaOsiagniec ()
{
	var int nDocID;

	nDocID = Doc_Create	();

	Doc_SetPages	( nDocID , 2 );

	Doc_SetPage 	( nDocID , 0, "Book_Red_L.tga" , 0	); 
	Doc_SetPage 	( nDocID , 1, "Book_Red_R.tga" , 0	); 

	Doc_SetMargins	( nDocID , 0,  275, 20, 30, 20, 1 	); // 0 -> margins are in pixels
	Doc_SetFont 	( nDocID , 0, FONT_BookHeadline	  	); // -1 -> all pages
	Doc_PrintLine	( nDocID , 0, ""					);
	Doc_PrintLines	( nDocID , 0, "Osi�gni�cia:"		);
	Doc_SetFont 	( nDocID , 0, FONT_Book	   			); // -1 -> all pages
	Doc_PrintLine	( nDocID , 0, ""					);

	var string Achievement;
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "1. Zabij 1000 stworze�.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(PokonaneWszystkie_Liczba));
	Achievement = ConcatStrings(Achievement,"/1000");
	if(PokonaneWszystkie_Liczba>=1000) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
				
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "2. Sta� si� guru kopaczy.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(LevelMiner));
	Achievement = ConcatStrings(Achievement,"/100 %");
	if(LevelMiner >= 100) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
	
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "3. Poznaj sekrety Gildii Alchemik�w.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(PoznaneSekrety_Liczba));
	Achievement = ConcatStrings(Achievement,"/5");
	if(PoznaneSekrety_Liczba >= 5) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
				
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "4. Naucz si� wszystkich sztuczek z�odziejskich.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(NauczoneZlodziejskie));
	Achievement = ConcatStrings(Achievement,"/4");
	if(NauczoneZlodziejskie >= 4) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "5. Zosta� mistrzem areny.");
	Achievement = "**";
	if(JestesMistrzemAreny == TRUE) { Achievement = ConcatStrings(Achievement," - zaliczone"); };
	//Achievement = ConcatStrings(Achievement,"zaliczone"); //tymczasowo

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "6. Wyzw�l kopalni� Marcosa.");
	Achievement = "**";
	if((npc_isdead (NASZ_009_Marcos)) && (npc_isdead (NASZ_006_Renegat)) && (npc_isdead (NASZ_011_Renegat)) && (npc_isdead (NASZ_013_Renegat)) && (npc_isdead (NASZ_014_Renegat))) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");


	// ----- ----- ----- ----- -----

	Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   );
	Doc_SetFont 	( nDocID , 1, FONT_BookHeadline	  	); // -1 -> all pages
	Doc_PrintLine	( nDocID , 1, ""					);
	Doc_PrintLines	( nDocID , 1, ""		);
	Doc_SetFont 	( nDocID , 1, FONT_Book	   			); // -1 -> all pages
	Doc_PrintLine	( nDocID , 1, ""					);

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "7. U�wi�� wszystkie groby.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(WszystkieGrobyAchievement));
	Achievement = ConcatStrings(Achievement,"/20");
	if(WszystkieGrobyAchievement >= 20) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "8. Przejmij ob�z na pla�y za palisad�.");
	Achievement = "**";
	if (wszyscy_orkowie_nie_zyja == TRUE) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "9. Pokonaj wszystkich boss�w.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(ZabiteBossy));
	Achievement = ConcatStrings(Achievement,"/10");
	if(ZabiteBossy >= 10) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "10. Oczy�� p�askowy� gigant�w.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(ZabiteGiganty));
	Achievement = ConcatStrings(Achievement,"/7");
	if(ZabiteGiganty >= 7) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");




	Doc_PrintLines	( nDocID,  1, " "					);


	Doc_Show		( nDocID );

	
	
		Doc_PrintLines	( nDocID,  1, " "					);


	Doc_Show		( nDocID );
};




// ***** ***** OSIAGNIECIA - TICKTOCK ***** *****
var int Osiagniecie1OneTime;
var int Osiagniecie2OneTime;
var int Osiagniecie3OneTime;
var int Osiagniecie4OneTime;
var int Osiagniecie5OneTime;
var int Osiagniecie6OneTime;
var int Osiagniecie7OneTime;
var int Osiagniecie8OneTime;
var int Osiagniecie9OneTime;
var int Osiagniecie10OneTime;


func void Check_OSIAGNIECIA() {

	//1
	if (PokonaneWszystkie_Liczba >= 1000)
	  && (Osiagniecie1OneTime == FALSE)
	{
		Osiagniecie1OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Zabi�e� 1000 stworze�!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//2
	if (LevelMiner >= 100)
	  && (Osiagniecie2OneTime == FALSE)
	{
		Osiagniecie2OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Sta�e� si� guru kopaczy", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//3
	if (PoznaneSekrety_Liczba >= 5)
	  && (Osiagniecie3OneTime == FALSE)
	{
		Osiagniecie3OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Pozna�e� wszystkie sekrety gildii alchemik�w!", -1,52, FONT_ScreenSmall,5);
		
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_SUCCESS);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Znam ju� wszystkie przepisy Gildii Alchemik�w. Wykorzystam ich sekrety. Z pewno�ci�!"); 

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	
	
	//4
	if (NauczoneZlodziejskie >= 4)
	  && (Osiagniecie4OneTime == FALSE)
	{
		Osiagniecie4OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Nauczy�e� si� wszystkich umiej�tno�ci z�odziejskich!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};		
	
	//5
	if (JestesMistrzemAreny == TRUE)
	  && (Osiagniecie5OneTime == FALSE)
	{
		Osiagniecie5OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Zosta�e� mistrzem areny!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};		
	
	//6
	if ((npc_isdead (NASZ_009_Marcos)) && (npc_isdead (NASZ_006_Renegat)) && (npc_isdead (NASZ_011_Renegat)) && (npc_isdead (NASZ_013_Renegat)) && (npc_isdead (NASZ_014_Renegat)))
	  && (Osiagniecie6OneTime == FALSE)
	{
		Osiagniecie6OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Wyzwoli�e� kopalni� Marcosa!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};

	//7
	if (WszystkieGrobyAchievement >= 20)
	  && (Osiagniecie7OneTime == FALSE)
	{
		Osiagniecie7OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("U�wi�ci�e� wszystkie groby!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//8
	if (wszyscy_orkowie_nie_zyja == TRUE)
	  && (Osiagniecie8OneTime == FALSE)
	{
		Osiagniecie8OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Przej��e� ob�z na pla�y za palisad�!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	

	//9
	if (ZabiteBossy >= 10)
	  && (Osiagniecie9OneTime == FALSE)
	{
		Osiagniecie9OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Pokona�e� wszystkich boss�w!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	

	//10
	if (ZabiteGiganty >= 7)
	  && (Osiagniecie10OneTime == FALSE)
	{
		Osiagniecie10OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Oczy�ci�e� p�askowy� gigant�w!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	
	
	if(Osiagniecie1OneTime && Osiagniecie2OneTime && Osiagniecie3OneTime && Osiagniecie4OneTime && Osiagniecie5OneTime && Osiagniecie6OneTime && Osiagniecie7OneTime && Osiagniecie8OneTime && Osiagniecie9OneTime && Osiagniecie10OneTime)
	{
		ff_remove(Check_OSIAGNIECIA);
	};

};