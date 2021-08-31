
// **********************************************
// . . . . . . . . . Przepisy . . . . . . . . .
// **********************************************

// W ca�ej GD mo�emy znale�� przepisy na dziwne potrawy.
// Ugotuje je dla nas Snaf, je�li przyniesiemy odpowiednie
// sk�adniki. Zjedzenie ka�dej takiej 'dziwnej potrawy'
// odnawia punkty �ycia, a przy pierwszym takim spo�yciu
// dodaje jaki� bonus permanentnie.

const int EXP_SPECIAL_DISH = 100;

var int SerowyGulaszOneTime;
var int ZupaZGrzybowKopalnianychOneTime;
var int ZupaZOrkowegoPrzepisuOneTime;
var int UdziecZDzikaPoLowieckuOneTime;
var int ZupaMlecznaOneTime;
var int ZupaGrzybowaOneTime;
var int ZupaZDuzychGrzybowOneTime;
var int ZupaJarzynowaZJagodamiOneTime;
var int ZupaSerowaOneTime;
var int PrzysmakMysliwychOneTime;
var int KompotOwocowyOneTime;
var int ZupaRybnaOneTime;
var int GulaszMiesnyOneTime;
var int PotrawkaZeScierwojadaOneTime;
var int ZupaPiwnaOneTime;

func void Eat_Special_Dish(var int dishId, var c_npc slf) {

	if (dishId == ItNa_SerowyGulasz) {
		if (SerowyGulaszOneTime == FALSE) {
			SerowyGulaszOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_MANA_MAX, 1);
			Npc_ChangeAttribute	(slf, ATR_MANA, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};
	}
	
	else if (dishId == ItNa_ZupaZGrzybowKopalnianych) {
		if (ZupaZGrzybowKopalnianychOneTime == FALSE) {
			ZupaZGrzybowKopalnianychOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_DEXTERITY, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};	
	}
		
	else if (dishId == ItNa_ZupaZOrkowegoPrzepisu) {
		if (ZupaZOrkowegoPrzepisuOneTime == FALSE) {
			ZupaZOrkowegoPrzepisuOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_STRENGTH, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};	
	}
	
	else if (dishId == ItNa_UdziecZDzikaPoLowiecku) {
		if (UdziecZDzikaPoLowieckuOneTime == FALSE) {
			UdziecZDzikaPoLowieckuOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_DEXTERITY, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};	
	}
	
	else if (dishId == ItNa_ZupaMleczna) {
		if (ZupaMlecznaOneTime == FALSE) {
			ZupaMlecznaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_MANA_MAX, 1);
			Npc_ChangeAttribute	(slf, ATR_MANA, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_ZupaGrzybowa) {
		if (ZupaGrzybowaOneTime == FALSE) {
			ZupaGrzybowaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_DEXTERITY, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_ZupaZDuzychGrzybow) {
		if (ZupaZDuzychGrzybowOneTime == FALSE) {
			ZupaZDuzychGrzybowOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_STRENGTH, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_ZupaJarzynowaZJagodami) {
		if (ZupaJarzynowaZJagodamiOneTime == FALSE) {
			ZupaJarzynowaZJagodamiOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_STRENGTH, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_ZupaSerowa) {
		if (ZupaSerowaOneTime == FALSE) {
			ZupaSerowaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_STRENGTH, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_PrzysmakMysliwych) {
		if (PrzysmakMysliwychOneTime == FALSE) {
			PrzysmakMysliwychOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_DEXTERITY, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_KompotOwocowy) {
		if (KompotOwocowyOneTime == FALSE) {
			KompotOwocowyOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_MANA_MAX, 1);
			Npc_ChangeAttribute	(slf, ATR_MANA, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItFo_FishSoup) {
		if (ZupaRybnaOneTime == FALSE) {
			ZupaRybnaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_MANA_MAX, 1);
			Npc_ChangeAttribute	(slf, ATR_MANA, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}

	else if (dishId == ItNa_GulaszMiesny) {
		if (GulaszMiesnyOneTime == FALSE) {
			GulaszMiesnyOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_STRENGTH, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_PotrawkaZeScierwojada) {
		if (PotrawkaZeScierwojadaOneTime == FALSE) {
			PotrawkaZeScierwojadaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_DEXTERITY, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else if (dishId == ItNa_ZupaPiwna) {
		if (ZupaPiwnaOneTime == FALSE) {
			ZupaPiwnaOneTime = TRUE;
			B_RaiseAttribute	(slf, ATR_MANA_MAX, 1);
			Npc_ChangeAttribute	(slf, ATR_MANA, 1);
			B_GivePlayerXP(EXP_SPECIAL_DISH);
		};		
	}
	
	else { // ERROR !!
		Print("Error! Unknown dishId in function Eat_Special_Dish");
	};


};



INSTANCE Receptures (C_Item)
{
	name 				=	"Przepisy na potrawy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_AllReceptures;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_AllReceptures ()
{
	// --------------------------------------------------------------- | GDZIE ?											| CO DODAJE POTRAWA ?
	CreateInvItems (hero,ItNa_Przepis_SerowyGulasz, 1);				// | na p�ce w kuchni Gomeza/Garonda					| +1 MANA
	CreateInvItems (hero,ItNa_Przepis_ZupaZGrzybowKopalnianych, 1);	// | w skrzyni w kopalni z Draalem						| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_Orkowy1, 1);					// | za palisada w orkowym obozie na plazy w namiocie	| ---
	CreateInvItems (hero,ItNa_Przepis_Orkowy2, 1);					// | przet�umaczy go Rudolf								| +1 STR
	CreateInvItems (hero,ItNa_Przepis_UdziecZDzikaPoLowiecku, 1);	// | daje Gerold w nagrod� za misj� 'g��d'				| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_ZupaMleczna, 1);				// | w kufrze Udara										| +1 MANA
	CreateInvItems (hero,ItNa_Przepis_ZupaGrzybowa, 1);				// | w kufrze Louisa									| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_ZupaZDuzychGrzybow, 1);		// | ma j� du�y goblin z misji z przepisem dla Snafa	| +1 STR
	CreateInvItems (hero,ItNa_Przepis_ZupaJarzynowaZJagodami, 1);	// | w kufrze tam gdzie siedzi Cipher i Rod w G2		| +1 STR
	CreateInvItems (hero,ItNa_Przepis_ZupaSerowa, 1);				// | w kufrze w jaskini Phill-gobliny					| +1 STR
	CreateInvItems (hero,ItNa_Przepis_PrzysmakMysliwych, 1);		// | daje go Aran za misj� 'Towarzystwo'				| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_KompotOwocowy, 1);			// | w skrzyni u bandyt�w								| +1 MANA
	CreateInvItems (hero,ItNa_Przepis_ZupaRybna, 1);				// | sprzedaje Danny									| +1 MANA (ItFo_FishSoup)
	CreateInvItems (hero,ItNa_Przepis_GulaszMiesny, 1);				// | w skrzyni w obozie wypadowym						| +1 STR
	CreateInvItems (hero,ItNa_Przepis_PotrawkaZeScierwojada, 1);	// | ma w ekwipunku Drax								| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_ZupaPiwna, 1);				// | w skrzyni Jeremiasza								| +1 MANA
	// --------------------------------------------------------------- | --------------------------------------------------	| Razem: +5 Mana, +5 Dex, +5 Str
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_SerowyGulasz (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_SerowyGulasz;
	scemeName			=	"MAP";
	description			= 	"Przepis na serowy gulasz";
};
func void Use_Przepis_SerowyGulasz ()
{   
	var int Przepis_SerowyGulasz_OneTime;
	if (Przepis_SerowyGulasz_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_SerowyGulasz_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Serowy gulasz");
				Doc_PrintLines	( nDocID,  0, "Bonus: mana +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Aby wykona� potraw�, potrzebne b�d� nam cztery kawa�ki sera, dwie polne jagody, mleko, wod�, jab�ko, a tak�e kilka kropel wina. ");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Do kocio�ka wlewamy mleko i oczekujemy, a� to si� zagotuje. Nast�pnie wrzucamy do niego rozdrobnione kawa�ki sera i oczekujemy, a� ca�o�� utworzy jednolit�, kleist� i pachn�c� form�. Odstawiamy potraw� na kilka minut. Potem dodajemy kilka kropel wina i wywar z jag�d wymieszany z wod� i sol�. Na ko�cu wrzucamy jeszcze kawa�ki jab�ka. ");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Smacznego!");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaZGrzybowKopalnianych (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaZGrzybowKopalnianych;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� z grzyb�w kopalnianych";
};
func void Use_Przepis_ZupaZGrzybowKopalnianych ()
{   
	var int Przepis_ZupaZGrzybowKopalnianych_OneTime;
	if (Przepis_ZupaZGrzybowKopalnianych_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaZGrzybowKopalnianych_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Przepis na zup� z grzyb�w kopalnianych");
				Doc_PrintLines	( nDocID,  0, "Bonus: zr�czno�� +1");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Gotowanie zupy z grzyb�w kopalnianych jest wskazane dla kucharzy z du�ym do�wiadczeniem. Aby j� ugotowa� potrzebujemy sze�� grzyb�w kopalnianych, chleb, cztery korzenie lecznicze, ��d�o krwiopijcy.");
				Doc_PrintLines	( nDocID,  0, "Przygotowywanie potrawy zaczynamy od dok�adnego odci�cia kapeluszy grzyba od jego trzonka, a tak�e usuni�cia najczarniejszych blaszek, w kt�rych znajduje si� �miertelna toksyna. Kroimy je na drobne kawa�eczki i wrzucamy do miseczki, gdzie ugniatamy je z owocami korzeni leczniczych (ma to na celu wzmocni� organizm jedz�cego). Do utworzonej mieszaniny dodajemy pokrojone kawa�ki chleba i skrapiamy to spreparowan� toksyn� z ��d�a krwiopijcy.");
				Doc_PrintLines	( nDocID,  0, "Tak utworzon� potraw� zostawiamy na kilka godzin aby toksyny z grzyb�w zd��y�y wyparowa�, po wszystkim mo�emy zje�� danie. Uwaga! Z racji z�ego wp�ywu grzyb�w na organizm nie zaleca si� spo�ywania tej potrawy wi�cej ni� raz na p� roku.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_Orkowy1 (C_Item)
{
	name 				=	"Przepis";
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;
	value 				=	0;
	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_Orkowy1;
	scemeName			=	"MAP";
	description			= 	"Przepis w orkowym j�zyku";
};

var int PrzepisOrkowyRunning;
var int PrzepisOrkowyZnamTresc;
var int PrzepisOrkowyOneTime;
func void Use_Przepis_Orkowy1 ()
{
	if (PrzepisOrkowyOneTime == FALSE) {
		PrzepisOrkowyOneTime = TRUE;
		PrzepisOrkowyRunning = TRUE;
		Log_CreateTopic (TOPIC_orkowy_przepis, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_orkowy_przepis, LOG_RUNNING);
		B_LogEntry (TOPIC_orkowy_przepis,"W orkowym obozie na pla�y znalaz�em kartk� wygl�daj�c� na jaki� przepis. By� mo�e kt�ry� z rycerzy potrafi go przet�umaczy�...?"); 
	};
	
	B_Say (self, self, "$CANTREADTHIS");
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_Orkowy2 (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_Orkowy2;
	scemeName			=	"MAP";
	description			= 	"Przet�umaczony orkowy przepis";
};

func void Use_Przepis_Orkowy2 ()
{   
	var int Przepis_Orkowy2_OneTime;
	if (Przepis_Orkowy2_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_Orkowy2_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Orkowa zupa");
				Doc_PrintLines	( nDocID,  0, "Bonus: si�a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 3x surowe mi�so");
				Doc_PrintLines	( nDocID,  0, "- 5x mi�so chrz�szcza");
				Doc_PrintLines	( nDocID,  0, "- dwa jab�ka");
				Doc_PrintLines	( nDocID,  0, "- gin");
				Doc_PrintLines	( nDocID,  0, "- �oso�");
				Doc_PrintLines	( nDocID,  0, "- sma�ony du�y grzyb");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wypatroszy� ryb�. Wszystkie o�ci powrzuca� do garnka i zala� ginem. Gotowa� d�ugo. Doda� mocno usma�onego grzyba i dalej gotowa�. Odcedzi� powsta�y wywar, nast�pnie doda� reszt� sk�adnik�w i miesza�.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "(powa�nie, nie jedz tego...)");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_UdziecZDzikaPoLowiecku (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_UdziecZDzikaPoLowiecku;
	scemeName			=	"MAP";
	description			= 	"Przepis na udziec z dzika po �owiecku";
};

func void Use_Przepis_UdziecZDzikaPoLowiecku ()
{   
	var int Przepis_UdziecZDzikaPoLowiecku_OneTime;
	if (Przepis_UdziecZDzikaPoLowiecku_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_UdziecZDzikaPoLowiecku_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Udziec z dzika po �owiecku");
				Doc_PrintLines	( nDocID,  0, "Bonus: zr�czno�� +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Oczyszczone ze �ci�gien i resztek sk�ry 6 kawa�k�w mi�sa z dzika pieczemy nad ro�nem, do momentu a� stanie si� dostatecznie chrupkie i soczyste. Nast�pnie kroimy je w kosteczk� i wrzucamy do utworzonego wcze�niej bulionu na bazie zi� i chmielu. Po oko�o dw�ch godzinach mo�emy wla� ca�o�� do miski.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaMleczna (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaMleczna;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� mleczn�";
};

func void Use_Przepis_ZupaMleczna ()
{   
	var int Przepis_ZupaMleczna_OneTime;
	if (Przepis_ZupaMleczna_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaMleczna_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa mleczna");
				Doc_PrintLines	( nDocID,  0, "Bonus: mana +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Do gotuj�cego si� mleka wrzucamy kawa�ki chleba i gotujemy tak przez 15 minut. Nast�pnie dorzucamy do ca�o�ci po dwie sztuki le�nych i polnych jag�d zamieszanych z cukrem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaGrzybowa (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaGrzybowa;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� grzybow�";
};

func void Use_Przepis_ZupaGrzybowa ()
{   
	var int Przepis_ZupaGrzybowa_OneTime;
	if (Przepis_ZupaGrzybowa_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaGrzybowa_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa grzybowa");
				Doc_PrintLines	( nDocID,  0, "Bonus: zr�czno�� +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Na samym pocz�tku nale�y pokroi� pi�� piekielnik�w i wrzuci� je do garnka, by zacz�y si� gotowa�. W czasie dziesi�ciu minut, kiedy wszystko b�dzie si� gotowa�, wystarczy wrzuci� do wywaru li�cie z dw�ch ro�lin niebieskiego bzu i zamiesza�. Po ugotowaniu dodajemy kawa�ki chleba i pieczonego mi�sa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaZDuzychGrzybow (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaZDuzychGrzybow;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� z du�ych grzyb�w";
};

func void Use_Przepis_ZupaZDuzychGrzybow ()
{   
	var int Przepis_ZupaZDuzychGrzybow_OneTime;
	if (Przepis_ZupaZDuzychGrzybow_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaZDuzychGrzybow_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa z du�ych grzyb�w");
				Doc_PrintLines	( nDocID,  0, "Bonus: si�a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "W garnku umie�ci� mi�so z siedmiu chrz�szczy. Wla� dwa litry wody wymieszanej z po�ow� butelki wina, a nast�pnie gotowa� na wolnym ogniu do momentu wrzenia. Kiedy wywar zacznie si� gotowa�, wrzucamy do niego pokrojone kapelusze i trzonki trzech du�ych grzyb�w. Po po�owie godziny wszystko powinno by� gotowe do jedzenia.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaJarzynowaZJagodami (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaJarzynowaZJagodami;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� jarzynow� z jagodami";
};

func void Use_Przepis_ZupaJarzynowaZJagodami ()
{   
	var int Przepis_ZupaJarzynowaZJagodami_OneTime;
	if (Przepis_ZupaJarzynowaZJagodami_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaJarzynowaZJagodami_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa jarzynowa z jagodami");
				Doc_PrintLines	( nDocID,  0, "Bonus: si�a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "W garnku na ginie i mleku zeszkli� pokrojone na kawa�ki li�cie z dw�ch sztuk zi� leczniczych i dw�ch ognistych pokrzyw. Doda� pokrojone w drobn� kostk� kawa�ki rzepy i gotowa� do momentu wrzenia. Na samym ko�cu dorzucamy do wszystkiego kilka ugniecionych jag�d. Dwie polne i dwie le�ne powinny wystarczy�.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaSerowa (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaSerowa;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� serow�";
};

func void Use_Przepis_ZupaSerowa ()
{   
	var int Przepis_ZupaSerowa_OneTime;
	if (Przepis_ZupaSerowa_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaSerowa_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa serowa"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: si�a +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Do garnka pe�nego wywaru powsta�ego w wyniku gotowania mleka wrzucamy trzy ca�e sery i mieszamy do momentu, a� ca�o�� utworzy jedn�, ci�gn�c� si� konsystencj�. Do poprawy smaku jak i zapachu wystarczy doda� piwo, kt�re zr�wnowa�y smak. Podawaj z kawa�kami chleba.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_PrzysmakMysliwych (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_PrzysmakMysliwych;
	scemeName			=	"MAP";
	description			= 	"Przepis na 'przysmak my�liwych'";
};

func void Use_Przepis_PrzysmakMysliwych ()
{   
	var int Przepis_PrzysmakMysliwych_OneTime;
	if (Przepis_PrzysmakMysliwych_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_PrzysmakMysliwych_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "'Przysmak my�liwych'");
				Doc_PrintLines	( nDocID,  0, "Bonus: zr�czno�� +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Na patelni� wrzuci� pi�� kawa�k�w mi�sa, sma�y� i polewa� powoli winem, by je uszlachetni�. W mi�dzyczasie pokroi� 3 jab�ka i usma�y� je razem z mi�sem na patelni. Ca�o�� wrzuci� do miski i przyprawi� czerwonym pieprzem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_KompotOwocowy (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_KompotOwocowy;
	scemeName			=	"MAP";
	description			= 	"Przepis na kompot owocowy";
};

func void Use_Przepis_KompotOwocowy ()
{   
	var int Przepis_KompotOwocowy_OneTime;
	if (Przepis_KompotOwocowy_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_KompotOwocowy_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Kompot owocowy");
				Doc_PrintLines	( nDocID,  0, "Bonus: mana +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Do garnka wlewamy zawarto�� dw�ch butelek wody i gotujemy a� do momentu wrzenia. Nast�pnie dorzucamy do wszystkiego pokrojone 2 jab�ka i po 3 polne i 3 le�ne jagody, kt�re �wcze�nie zgnietli�my i pozbawili�my pestek. Kiedy sok z owoc�w wymiesza si� z wod�, dodajemy cukru i rozlewamy do butelek.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaRybna (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	25;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]			= 	value;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaRybna;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� rybn�";
};

func void Use_Przepis_ZupaRybna ()
{   
	var int Przepis_ZupaRybna_OneTime;
	if (Przepis_ZupaRybna_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaRybna_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa rybna"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: mana +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Do garnka wrzucamy dwa korzenie lecznicze i dodajemy do niej dwie ryby, kt�re po oko�o dziesi�ciu minutach powinny oddawa� sw�j specyficzny zapach. Ro�liny powinny po pewnym czasie zneutralizowa� nieprzyjemn� wo� i nada� daniu nowy posmak. Ca�o�� mo�na zje�� z chlebem i winem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_GulaszMiesny (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_GulaszMiesny;
	scemeName			=	"MAP";
	description			= 	"Przepis na gulasz mi�sny";
};

func void Use_Przepis_GulaszMiesny ()
{   
	var int Przepis_GulaszMiesny_OneTime;
	if (Przepis_GulaszMiesny_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_GulaszMiesny_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Gulasz mi�sny"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: si�a +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Aby przyrz�dzi� gulasz potrzebujemy 5 kawa�k�w mi�sa, 2 piekielniki, a tak�e rzep�. Oczywi�cie usma�one mi�so kroimy na kawa�ki i wrzucamy do utworzonego w wyniku gotowania wywaru z rzepy. Ca�o�� dusimy oko�o godziny i wzbogacamy we wcze�niej pokrojone i oczyszczone grzyby.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_PotrawkaZeScierwojada (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_PotrawkaZeScierwojada;
	scemeName			=	"MAP";
	description			= 	"Przepis na potrawk� ze �cierwojada";
};

func void Use_Przepis_PotrawkaZeScierwojada ()
{   
	var int Przepis_PotrawkaZeScierwojada_OneTime;
	if (Przepis_PotrawkaZeScierwojada_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_PotrawkaZeScierwojada_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Potrawka ze �cierwojada"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: zr�czno�� +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Przed przyst�pieniem do gotowania oczyszczamy 4 kawa�ki surowego mi�sa �cierwojada ze �ci�gien i marynujemy je w wywarze z gotowanego piwa. Po dniu oczekiwania mo�emy wyci�gn�� mi�so z marynaty i rozpocz�� dalsze przygotowania. Ca�o�� gotujemy razem z warzywami");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Przepis_ZupaPiwna (C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Przepis_ZupaPiwna;
	scemeName			=	"MAP";
	description			= 	"Przepis na zup� piwn�";
};

func void Use_Przepis_ZupaPiwna ()
{   
	var int Przepis_ZupaPiwna_OneTime;
	if (Przepis_ZupaPiwna_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Przepis_ZupaPiwna_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Zupa piwna:"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: mana +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "3 sztuki surowego mi�sa podsma�any na garnku o grubym dnie, a� stanie si� wystarczaj�co chrupi�ce. Wyjmujemy mi�so pozostawiaj�c w garnku wytopiony t�uszcz i sma�ymy na nim posiekan� kie�bas�. Wszystko wrzucamy do piwa i gotujemy na wolnym ogniu. Nale�y u�y� przynajmniej 4 butelki piwa. Po godzinie ca�o�� powinna by� ju� gotowa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};



// **********************************************
// . . . . . . . . . Potrawy . . . . . . . . .
// **********************************************

INSTANCE ItNa_SerowyGulasz (C_Item)
{	
	name 				=	"Serowy gulasz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ItNa_SerowyGulasz;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Stew;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ItNa_SerowyGulasz()
{
	Eat_Special_Dish(ItNa_SerowyGulasz,self);
	PercentHealSelf(HP_Stew,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaZGrzybowKopalnianych (C_Item)
{	
	name 				=	"Zupa z grzyb�w kopalnianych";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ItNa_ZupaZGrzybowKopalnianych;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

FUNC VOID Use_ItNa_ZupaZGrzybowKopalnianych()
{
	Eat_Special_Dish(ItNa_ZupaZGrzybowKopalnianych,self);
	PercentHealSelf(HP_FishSoup,ATR_HITPOINTS);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GulaszMiesny (C_Item)
{	
	name 				=	"Gulasz mi�sny";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_GulaszMiesny;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

FUNC VOID Use_GulaszMiesny()
{
	Eat_Special_Dish(ItNa_GulaszMiesny,self);
	PercentHealSelf(HP_FishSoup,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PotrawkaZeScierwojada (C_Item)
{	
	name 				=	"Potrawka ze �cierwojada";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_PotrawkaZeScierwojada;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

FUNC VOID Use_PotrawkaZeScierwojada()
{
	Eat_Special_Dish(ItNa_PotrawkaZeScierwojada,self);
	PercentHealSelf(HP_FishSoup,ATR_HITPOINTS);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaPiwna (C_Item)
{	
	name 				=	"Zupa piwna";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ZupaPiwna;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

FUNC VOID Use_ZupaPiwna()
{
	Eat_Special_Dish(ItNa_ZupaPiwna,self);
	PercentHealSelf(HP_FishSoup,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaZOrkowegoPrzepisu (C_Item)
{	
	name 				=	"Zupa z orkowego przepisu";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ItNa_ZupaZOrkowegoPrzepisu;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

FUNC VOID Use_ItNa_ZupaZOrkowegoPrzepisu()
{
	Eat_Special_Dish(ItNa_ZupaZOrkowegoPrzepisu,self);

	if (PrzepisOrkowyRunning == TRUE) {

		B_GivePlayerXP (800);
		B_LogEntry (TOPIC_orkowy_przepis, "Zjad�em t� obrzydliw� zup�. Nigdy wi�cej! Dalej mnie skr�ca, jak pomy�l� o jej smaku.");
		Log_SetTopicStatus (TOPIC_orkowy_przepis, LOG_SUCCESS);
		PrzepisOrkowyRunning = FALSE;
	};

	//Buff_Apply(self, Poison1HP);
	Poison1HPStart();
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_UdziecZDzikaPoLowiecku (C_Item)
{	
	name 				=	"Udziec z dzika po �owiecku";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bacon;
	
	visual 				=	"ItFo_Bacon.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_UdziecZDzikaPoLowiecku;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Bacon;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bacon;

};
FUNC VOID Use_UdziecZDzikaPoLowiecku()
{
	Eat_Special_Dish(ItNa_UdziecZDzikaPoLowiecku,self);
	PercentHealSelf(HP_Bacon,ATR_HITPOINTS);	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaZDuzychGrzybow (C_Item)
{	
	name 				=	"Zupa z du�ych grzyb�w";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ZupaZDuzychGrzybow;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ZupaZDuzychGrzybow()
{
	Eat_Special_Dish(ItNa_ZupaZDuzychGrzybow,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaJarzynowaZJagodami (C_Item)
{	
	name 				=	"Zupa jarzynowa z jagodami";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ZupaJarzynowaZJagodami;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ZupaJarzynowaZJagodami()
{
	Eat_Special_Dish(ItNa_ZupaJarzynowaZJagodami,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaSerowa (C_Item)
{	
	name 				=	"Zupa serowa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ZupaSerowa;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ZupaSerowa()
{
	Eat_Special_Dish(ItNa_ZupaSerowa,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PrzysmakMysliwych (C_Item)
{	
	name 				=	"Przysmak my�liwych";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_PrzysmakMysliwych;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_PrzysmakMysliwych()
{
	Eat_Special_Dish(ItNa_PrzysmakMysliwych,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KompotOwocowy (C_Item)
{	
	name 				=	"Kompot owocowy";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_KompotOwocowy;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_KompotOwocowy()
{
	Eat_Special_Dish(ItNa_KompotOwocowy,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaMleczna (C_Item)
{	
	name 				=	"Zupa mleczna";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ZupaMleczna;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ZupaMleczna()
{
	Eat_Special_Dish(ItNa_ZupaMleczna,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZupaGrzybowa (C_Item)
{	
	name 				=	"Zupa grzybowa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ItNa_ZupaGrzybowa;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 25;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ItNa_ZupaGrzybowa()
{
	Eat_Special_Dish(ItNa_ZupaGrzybowa,self);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	25);
	PercentHealSelf(15,ATR_HITPOINTS);
};
