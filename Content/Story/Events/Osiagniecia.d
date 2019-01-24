
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// OSIAGNIECIA
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// 1. Zabij 1000 stworzeñ.
// 2. Zbierz 7500 sztuk z³ota.
// 3. Poznaj przepisy Gildii Alchemików.
// 4. Naucz siê wszystkich sztuczek z³odzejskich.
// 5. Zostañ mistrzem areny.
// 6. Wyzwól kopalniê Marcosa.
// 7. Uœwiêæ wszystkie groby.
// 8. Przejmij obóz na pla¿y za palisad¹.
// 9. Pokonaj wszystkie bossy.
// 10. Oczyœæ p³askowy¿ gigantów.
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
	Doc_PrintLines	( nDocID , 0, "Osi¹gniêcia:"		);
	Doc_SetFont 	( nDocID , 0, FONT_Book	   			); // -1 -> all pages
	Doc_PrintLine	( nDocID , 0, ""					);

	var string Achievement;
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "1. Zabij 1000 stworzeñ.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(PokonaneWszystkie_Liczba));
	Achievement = ConcatStrings(Achievement,"/1000");
	if(PokonaneWszystkie_Liczba>=1000) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
				
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "2. Zbierz 7500 szt. z³ota.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(npc_hasitems (hero, ItMi_Gold)));
	Achievement = ConcatStrings(Achievement,"/7500");
	if(npc_hasitems (hero, ItMi_Gold)>=7500) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
	
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "3. Poznaj sekrety Gildii Alchemików.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(PoznaneSekrety_Liczba));
	Achievement = ConcatStrings(Achievement,"/5");
	if(PoznaneSekrety_Liczba >= 5) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");
				
	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "4. Naucz siê wszystkich sztuczek z³odziejskich.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(NauczoneZlodziejskie));
	Achievement = ConcatStrings(Achievement,"/4");
	if(NauczoneZlodziejskie >= 4) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "5. Zostañ mistrzem areny.");
	Achievement = "**";
	if(JestesMistrzemAreny == TRUE) { Achievement = ConcatStrings(Achievement," - zaliczone"); };
	//Achievement = ConcatStrings(Achievement,"zaliczone"); //tymczasowo

	Doc_PrintLines   ( nDocID,  0, Achievement);
	Doc_PrintLine    ( nDocID,  0, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  0, "6. Wyzwól kopalniê Marcosa.");
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
	Doc_PrintLines   ( nDocID,  1, "7. Uœwiêæ wszystkie groby.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(WszystkieGrobyAchievement));
	Achievement = ConcatStrings(Achievement,"/20");
	if(WszystkieGrobyAchievement >= 20) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "8. Przejmij obóz na pla¿y za palisad¹.");
	Achievement = "**";
	if (wszyscy_orkowie_nie_zyja == TRUE) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "9. Pokonaj wszystkie bossy.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(ZabiteBossy));
	Achievement = ConcatStrings(Achievement,"/10");
	if(ZabiteBossy >= 10) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

	Doc_PrintLines   ( nDocID,  1, Achievement);
	Doc_PrintLine    ( nDocID,  1, "");

	// ----- ----- ----- ----- -----
	Doc_PrintLines   ( nDocID,  1, "10. Oczyœæ p³askowy¿ gigantów.");
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
		PrintScreen	("Zabi³eœ 1000 stworzeñ!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//2
	if (npc_hasitems (hero, ItMi_Gold) >= 7500)
	  && (Osiagniecie2OneTime == FALSE)
	{
		Osiagniecie2OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Zebra³eœ 7,5 tysi¹ca szt. z³ota!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//3
	if (PoznaneSekrety_Liczba >= 5)
	  && (Osiagniecie3OneTime == FALSE)
	{
		Osiagniecie3OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Pozna³eœ wszystkie sekrety gildii alchemików!", -1,52, FONT_ScreenSmall,5);
		
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_SUCCESS);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Znam ju¿ wszystkie przepisy Gildii Alchemików. Wykorzystam ich sekrety. Z pewnoœci¹!"); 

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	
	
	//4
	if (NauczoneZlodziejskie >= 4)
	  && (Osiagniecie4OneTime == FALSE)
	{
		Osiagniecie4OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Nauczy³eœ siê wszystkich umiejêtnoœci z³odziejskich!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};		
	
	//5
	if (JestesMistrzemAreny == TRUE)
	  && (Osiagniecie5OneTime == FALSE)
	{
		Osiagniecie5OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Zosta³eœ mistrzem areny!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};		
	
	//6
	if ((npc_isdead (NASZ_009_Marcos)) && (npc_isdead (NASZ_006_Renegat)) && (npc_isdead (NASZ_011_Renegat)) && (npc_isdead (NASZ_013_Renegat)) && (npc_isdead (NASZ_014_Renegat)))
	  && (Osiagniecie6OneTime == FALSE)
	{
		Osiagniecie6OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Wyzwoli³eœ kopalniê Marcosa!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};

	//7
	if (WszystkieGrobyAchievement >= 20)
	  && (Osiagniecie7OneTime == FALSE)
	{
		Osiagniecie7OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Uœwiêci³eœ wszystkie groby!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};
	
	//8
	if (wszyscy_orkowie_nie_zyja == TRUE)
	  && (Osiagniecie8OneTime == FALSE)
	{
		Osiagniecie8OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Przej¹³eœ obóz na pla¿y za palisad¹!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	

	//9
	if (ZabiteBossy >= 10)
	  && (Osiagniecie9OneTime == FALSE)
	{
		Osiagniecie9OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Pokona³eœ wszystkie bossy!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	

	//10
	if (ZabiteGiganty >= 7)
	  && (Osiagniecie10OneTime == FALSE)
	{
		Osiagniecie10OneTime = TRUE;
		PrintScreen	("PN + 2", -1,-1, "font_old_20_white.tga",5);
		PrintScreen	("Oczyœci³eœ p³askowy¿ gigantów!", -1,52, FONT_ScreenSmall,5);

		Snd_Play ("SFX_INNOSEYE");
		hero.lp = hero.lp + 2;
	};	
	
	if(Osiagniecie1OneTime && Osiagniecie2OneTime && Osiagniecie3OneTime && Osiagniecie4OneTime && Osiagniecie5OneTime && Osiagniecie6OneTime && Osiagniecie7OneTime && Osiagniecie8OneTime && Osiagniecie9OneTime && Osiagniecie10OneTime)
	{
		ff_remove(Check_OSIAGNIECIA);
	};

};