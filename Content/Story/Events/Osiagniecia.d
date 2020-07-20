

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
	Doc_PrintLines   ( nDocID,  0, "2. Stañ siê guru kopaczy.");
	Achievement = "**";
	Achievement = ConcatStrings(Achievement,IntToString(LevelMiner));
	Achievement = ConcatStrings(Achievement,"/100 %");
	if(LevelMiner >= 100) { Achievement = ConcatStrings(Achievement," - zaliczone"); };

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
	Doc_PrintLines   ( nDocID,  1, "9. Pokonaj wszystkich bossów.");
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
var int Osiagniecie11OneTime;
var int Osiagniecie12OneTime;
var int Osiagniecie13OneTime;
var int Osiagniecie14OneTime;
var int Osiagniecie15OneTime;
var int Osiagniecie16OneTime;
var int Osiagniecie17OneTime;
var int Osiagniecie18OneTime;
var int Osiagniecie19OneTime;
var int Osiagniecie20OneTime;
var int Osiagniecie21OneTime;
var int Osiagniecie22OneTime;
var int Osiagniecie23OneTime;
var int Osiagniecie24OneTime;
var int Osiagniecie25OneTime;
var int Osiagniecie26OneTime;
var int Osiagniecie27OneTime;
var int Osiagniecie28OneTime;
var int Osiagniecie29OneTime;
var int Osiagniecie30OneTime;


func void Check_OSIAGNIECIA() {

	if (Osiagniecie1OneTime == FALSE && PokonaneWszystkie_Liczba >= 1000)		{ Osiagniecie1OneTime = TRUE; AddAchievement(Acv1Title,Acv1Content); };		// 1
	if (Osiagniecie2OneTime == FALSE && LevelMiner >= 100)						{ Osiagniecie2OneTime = TRUE; AddAchievement(Acv2Title,Acv2Content); };		// 2
	if (Osiagniecie3OneTime == FALSE && PoznaneSekrety_Liczba >= 5)				{ Osiagniecie3OneTime = TRUE; AddAchievement(Acv3Title,Acv3Content);		// 3
																				  Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_SUCCESS);
																				  B_LogEntry (TOPIC_Gildia_Alchemikow,"Znam ju¿ wszystkie przepisy Gildii Alchemików. Wykorzystam ich sekrety. Z pewnoœci¹!"); };
	if (Osiagniecie4OneTime == FALSE && NauczoneZlodziejskie >= 4) 				{ Osiagniecie4OneTime = TRUE; AddAchievement(Acv4Title,Acv4Content); };		// 4
	if (Osiagniecie5OneTime == FALSE && JestesMistrzemAreny == TRUE)			{ Osiagniecie5OneTime = TRUE; AddAchievement(Acv5Title,Acv5Content); };		// 5
	if (Osiagniecie6OneTime == FALSE && npc_isdead(NASZ_009_Marcos)
									 && npc_isdead(NASZ_006_Renegat)
									 && npc_isdead(NASZ_011_Renegat)
									 && npc_isdead(NASZ_013_Renegat)
									 && npc_isdead(NASZ_014_Renegat))			{ Osiagniecie6OneTime = TRUE; AddAchievement(Acv6Title,Acv6Content); };		// 6
	  

	if (Osiagniecie7OneTime == FALSE && WszystkieGrobyAchievement >= 20)		{ Osiagniecie7OneTime = TRUE; AddAchievement(Acv7Title,Acv7Content); };		// 7
	if (Osiagniecie8OneTime == FALSE && wszyscy_orkowie_nie_zyja == TRUE)		{ Osiagniecie8OneTime = TRUE; AddAchievement(Acv8Title,Acv8Content); };		// 8
	if (Osiagniecie9OneTime == FALSE && ZabiteBossy >= 10)						{ Osiagniecie9OneTime = TRUE; AddAchievement(Acv9Title,Acv9Content); };		// 9
	if (Osiagniecie10OneTime == FALSE && ZabiteGiganty >= 7)					{ Osiagniecie10OneTime = TRUE; AddAchievement(Acv10Title,Acv10Content); };	// 10


	if (Osiagniecie11OneTime == FALSE && ZardzewialeMieczePodniesione >= 100)	{ Osiagniecie11OneTime = TRUE; AddAchievement(Acv11Title,Acv11Content); };	// 11
	if (Osiagniecie12OneTime == FALSE && hero.lp >= 50)							{ Osiagniecie12OneTime = TRUE; AddAchievement(Acv12Title,Acv12Content); };	// 12
	if (Osiagniecie13OneTime == FALSE)											{ Osiagniecie13OneTime = TRUE; AddAchievement(Acv13Title,Acv13Content); };	// 13 // TODO
	if (Osiagniecie14OneTime == FALSE && ZlamaneWytrychy >= 50)					{ Osiagniecie14OneTime = TRUE; AddAchievement(Acv14Title,Acv14Content); };	// 14
	if (Osiagniecie15OneTime == FALSE && WillUzyteZaklecia >= 30)				{ Osiagniecie15OneTime = TRUE; AddAchievement(Acv15Title,Acv15Content); };	// 15
	if (Osiagniecie16OneTime == FALSE && DivingTime >= 300)						{ Osiagniecie16OneTime = TRUE; AddAchievement(Acv16Title,Acv16Content); };	// 16
	if (Osiagniecie17OneTime == FALSE)											{ Osiagniecie17OneTime = TRUE; AddAchievement(Acv17Title,Acv17Content); };	// 17 // TODO
	if (Osiagniecie18OneTime == FALSE)											{ Osiagniecie18OneTime = TRUE; AddAchievement(Acv18Title,Acv18Content); };	// 18
	if (Osiagniecie19OneTime == FALSE && OdtrutkaEverUsed == TRUE)				{ Osiagniecie19OneTime = TRUE; AddAchievement(Acv19Title,Acv19Content); };	// 19
	if (Osiagniecie20OneTime == FALSE)											{ Osiagniecie20OneTime = TRUE; AddAchievement(Acv20Title,Acv20Content); };	// 20 TODO
	if (Osiagniecie21OneTime == FALSE)											{ Osiagniecie21OneTime = TRUE; AddAchievement(Acv21Title,Acv21Content); };	// 21 TODO
	if (Osiagniecie22OneTime == FALSE)											{ Osiagniecie22OneTime = TRUE; AddAchievement(Acv22Title,Acv22Content); };	// 22 TODO
	if (Osiagniecie23OneTime == FALSE)											{ Osiagniecie23OneTime = TRUE; AddAchievement(Acv23Title,Acv23Content); };	// 23 TODO
	if (Osiagniecie24OneTime == FALSE)											{ Osiagniecie24OneTime = TRUE; AddAchievement(Acv24Title,Acv24Content); };	// 24 // TODO
	if (Osiagniecie25OneTime == FALSE && VST_Kilometers >= 100)					{ Osiagniecie25OneTime = TRUE; AddAchievement(Acv25Title,Acv25Content); };	// 25 
	if (Osiagniecie26OneTime == FALSE)											{ Osiagniecie26OneTime = TRUE; AddAchievement(Acv26Title,Acv26Content); };	// 26 // TODO
	if (Osiagniecie27OneTime == FALSE)											{ Osiagniecie27OneTime = TRUE; AddAchievement(Acv27Title,Acv27Content); };	// 27 // TODO
	if (Osiagniecie28OneTime == FALSE)											{ Osiagniecie28OneTime = TRUE; AddAchievement(Acv28Title,Acv28Content); };	// 28 // TODO
	if (Osiagniecie29OneTime == FALSE)											{ Osiagniecie29OneTime = TRUE; AddAchievement(Acv29Title,Acv29Content); };	// 29 // TODO 
	if (Osiagniecie30OneTime == FALSE)											{ Osiagniecie30OneTime = TRUE; AddAchievement(Acv30Title,Acv30Content); };	// 30 // TODO

	

	// STOP INVOKING FUNCTION
	if (AchievementsCnt >= 30)
	{
		ff_remove(Check_OSIAGNIECIA);
	};

};