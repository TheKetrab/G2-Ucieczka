

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


func int HeroHasAllNewSkills() {

	return (
		WalkaTarcza == TRUE
	 && SzybkaNaukaTaught == TRUE
	 && level_regeneracji == 3
	 && LevelMiner >= 90
	 && level_zielarstwa == 2
	 );

};

func int HeroHasAllTrophySkills() {

	return (
		PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue]		== TRUE // Tabuk
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate]	== TRUE // Tabuk
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles]		== TRUE // Tabuk
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn]	== TRUE // Chris i Tabuk
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn]		== TRUE // Tabuk
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws]			== TRUE // Chris
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur]				== TRUE // Chris
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting]			== TRUE // Chris
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing]			== TRUE // Chris
	 && PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth]			== TRUE // Chris
	);
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
//var int Osiagniecie18OneTime;
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


var int achievement_skok_onetime;
func void ACHIEVEMENT_SKOK_SCRIPT_FUNC() {
	if (achievement_skok_onetime == FALSE) {
		achievement_skok_onetime = TRUE;
		AddAchievement(13,Acv13Title,Acv13Content);
	};
};

func void Check_OSIAGNIECIA() {

	if (Osiagniecie1OneTime == FALSE && PokonaneWszystkie_Liczba >= 1000)		{ Osiagniecie1OneTime = TRUE; AddAchievement(1,Acv1Title,Acv1Content); };		// 1
	if (Osiagniecie2OneTime == FALSE && LevelMiner >= 100)						{ Osiagniecie2OneTime = TRUE; AddAchievement(2,Acv2Title,Acv2Content); };		// 2
	if (Osiagniecie3OneTime == FALSE && PoznaneSekrety_Liczba >= 5)				{ Osiagniecie3OneTime = TRUE; AddAchievement(3,Acv3Title,Acv3Content);			// 3
																				  Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_SUCCESS);
																				  B_LogEntry (TOPIC_Gildia_Alchemikow,"Znam ju¿ wszystkie przepisy Gildii Alchemików. Wykorzystam ich sekrety. Z pewnoœci¹!"); };
	if (Osiagniecie4OneTime == FALSE && NauczoneZlodziejskie >= 4) 				{ Osiagniecie4OneTime = TRUE; AddAchievement(4,Acv4Title,Acv4Content); };		// 4
	if (Osiagniecie5OneTime == FALSE && JestesMistrzemAreny == TRUE)			{ Osiagniecie5OneTime = TRUE; AddAchievement(5,Acv5Title,Acv5Content); };		// 5
	if (Osiagniecie6OneTime == FALSE && npc_isdead(NASZ_009_Marcos)
									 && npc_isdead(NASZ_006_Renegat)
									 && npc_isdead(NASZ_011_Renegat)
									 && npc_isdead(NASZ_013_Renegat)
									 && npc_isdead(NASZ_014_Renegat))			{ Osiagniecie6OneTime = TRUE; AddAchievement(6,Acv6Title,Acv6Content); };		// 6
	  

	if (Osiagniecie7OneTime == FALSE && WszystkieGrobyAchievement >= 20)		{ Osiagniecie7OneTime = TRUE; AddAchievement(7,Acv7Title,Acv7Content); };		// 7
	if (Osiagniecie8OneTime == FALSE && wszyscy_orkowie_nie_zyja == TRUE)		{ Osiagniecie8OneTime = TRUE; AddAchievement(8,Acv8Title,Acv8Content); };		// 8
	if (Osiagniecie9OneTime == FALSE && ZabiteBossy >= 10)						{ Osiagniecie9OneTime = TRUE; AddAchievement(9,Acv9Title,Acv9Content); };		// 9
	if (Osiagniecie10OneTime == FALSE && ZabiteGiganty >= 7)					{ Osiagniecie10OneTime = TRUE; AddAchievement(10,Acv10Title,Acv10Content); };	// 10


	if (Osiagniecie11OneTime == FALSE && ZardzewialeMieczePodniesione >= 100)	{ Osiagniecie11OneTime = TRUE; AddAchievement(11,Acv11Title,Acv11Content); };	// 11
	if (Osiagniecie12OneTime == FALSE && hero.lp >= 50)							{ Osiagniecie12OneTime = TRUE; AddAchievement(12,Acv12Title,Acv12Content); };	// 12
	// 13 ---> Ustawiane w funkcji ACHIEVEMENT_SKOK_SCRIPT_FUNC																									// 13
	if (Osiagniecie14OneTime == FALSE && ZlamaneWytrychy >= 50)					{ Osiagniecie14OneTime = TRUE; AddAchievement(14,Acv14Title,Acv14Content); };	// 14
	if (Osiagniecie15OneTime == FALSE && WillUzyteZaklecia >= 30)				{ Osiagniecie15OneTime = TRUE; AddAchievement(15,Acv15Title,Acv15Content); };	// 15
	if (Osiagniecie16OneTime == FALSE && DivingTime >= 300)						{ Osiagniecie16OneTime = TRUE; AddAchievement(16,Acv16Title,Acv16Content); };	// 16
	if (Osiagniecie17OneTime == FALSE && EatenPlants >= 14)						{ Osiagniecie17OneTime = TRUE; AddAchievement(17,Acv17Title,Acv17Content); };	// 17 - h1,h2,h3,m1,m2,m3,dex,str,speed,blue,forber,plantber,temp,perm
	// 18 ---> Ustawiane w funkcji OnDamage.d / DMG_OnDmg																										// 18
	if (Osiagniecie19OneTime == FALSE && OdtrutkaEverUsed == TRUE)				{ Osiagniecie19OneTime = TRUE; AddAchievement(19,Acv19Title,Acv19Content); };	// 19
	// 20 ---> Ustawiane w funkcji Reputation.d / DodajReputacje																								// 20
	if (Osiagniecie21OneTime == FALSE && SleptHours >= 100)						{ Osiagniecie21OneTime = TRUE; AddAchievement(21,Acv21Title,Acv21Content); };	// 21
	if (Osiagniecie22OneTime == FALSE && InnosPrayInRow >= 3)					{ Osiagniecie22OneTime = TRUE; AddAchievement(22,Acv22Title,Acv22Content); };	// 22
	// 23 ---> Ustawiane w funkcji BonusPack.d / check_all_magnat																								// 23
	if (Osiagniecie24OneTime == FALSE && VST_Kilometers >= 50)					{ Osiagniecie24OneTime = TRUE; AddAchievement(24,Acv24Title,Acv24Content); };	// 24
	if (Osiagniecie25OneTime == FALSE && VST_Kilometers >= 100)					{ Osiagniecie25OneTime = TRUE; AddAchievement(25,Acv25Title,Acv25Content); };	// 25 
	if (Osiagniecie26OneTime == FALSE && zdeptane_chrzaszcze >= 10)				{ Osiagniecie26OneTime = TRUE; AddAchievement(26,Acv26Title,Acv26Content); };	// 26
	if (Osiagniecie27OneTime == FALSE && HeroHasAllNewSkills())					{ Osiagniecie27OneTime = TRUE; AddAchievement(27,Acv27Title,Acv27Content); };	// 27
	if (Osiagniecie28OneTime == FALSE && DrunkTrinken >= 30)					{ Osiagniecie28OneTime = TRUE; AddAchievement(28,Acv28Title,Acv28Content); };	// 28
	if (Osiagniecie29OneTime == FALSE && HeroHasAllTrophySkills())				{ Osiagniecie29OneTime = TRUE; AddAchievement(29,Acv29Title,Acv29Content); };	// 29
	// 30 ---> Ustawiane w funkcji KrolRabunku.d / CheckAllChests																								// 30

	

	// STOP INVOKING FUNCTION
	if (AchievementsCnt >= 30)
	{
		ff_remove(Check_OSIAGNIECIA);
	};

};

