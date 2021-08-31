
// **********************************************
// . . . . . . . . . Przepisy . . . . . . . . .
// **********************************************

// W ca³ej GD mo¿emy znaleŸæ przepisy na dziwne potrawy.
// Ugotuje je dla nas Snaf, jeœli przyniesiemy odpowiednie
// sk³adniki. Zjedzenie ka¿dej takiej 'dziwnej potrawy'
// odnawia punkty ¿ycia, a przy pierwszym takim spo¿yciu
// dodaje jakiœ bonus permanentnie.

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
	CreateInvItems (hero,ItNa_Przepis_SerowyGulasz, 1);				// | na pó³ce w kuchni Gomeza/Garonda					| +1 MANA
	CreateInvItems (hero,ItNa_Przepis_ZupaZGrzybowKopalnianych, 1);	// | w skrzyni w kopalni z Draalem						| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_Orkowy1, 1);					// | za palisada w orkowym obozie na plazy w namiocie	| ---
	CreateInvItems (hero,ItNa_Przepis_Orkowy2, 1);					// | przet³umaczy go Rudolf								| +1 STR
	CreateInvItems (hero,ItNa_Przepis_UdziecZDzikaPoLowiecku, 1);	// | daje Gerold w nagrodê za misjê 'g³ód'				| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_ZupaMleczna, 1);				// | w kufrze Udara										| +1 MANA
	CreateInvItems (hero,ItNa_Przepis_ZupaGrzybowa, 1);				// | w kufrze Louisa									| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_ZupaZDuzychGrzybow, 1);		// | ma j¹ du¿y goblin z misji z przepisem dla Snafa	| +1 STR
	CreateInvItems (hero,ItNa_Przepis_ZupaJarzynowaZJagodami, 1);	// | w kufrze tam gdzie siedzi Cipher i Rod w G2		| +1 STR
	CreateInvItems (hero,ItNa_Przepis_ZupaSerowa, 1);				// | w kufrze w jaskini Phill-gobliny					| +1 STR
	CreateInvItems (hero,ItNa_Przepis_PrzysmakMysliwych, 1);		// | daje go Aran za misjê 'Towarzystwo'				| +1 DEX
	CreateInvItems (hero,ItNa_Przepis_KompotOwocowy, 1);			// | w skrzyni u bandytów								| +1 MANA
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
				Doc_PrintLines	( nDocID,  0, "Aby wykonaæ potrawê, potrzebne bêd¹ nam cztery kawa³ki sera, dwie polne jagody, mleko, wodê, jab³ko, a tak¿e kilka kropel wina. ");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Do kocio³ka wlewamy mleko i oczekujemy, a¿ to siê zagotuje. Nastêpnie wrzucamy do niego rozdrobnione kawa³ki sera i oczekujemy, a¿ ca³oœæ utworzy jednolit¹, kleist¹ i pachn¹c¹ formê. Odstawiamy potrawê na kilka minut. Potem dodajemy kilka kropel wina i wywar z jagód wymieszany z wod¹ i sol¹. Na koñcu wrzucamy jeszcze kawa³ki jab³ka. ");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Smacznego!");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê z grzybów kopalnianych";
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
				Doc_PrintLines	( nDocID,  0, "Przepis na zupê z grzybów kopalnianych");
				Doc_PrintLines	( nDocID,  0, "Bonus: zrêcznoœæ +1");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Gotowanie zupy z grzybów kopalnianych jest wskazane dla kucharzy z du¿ym doœwiadczeniem. Aby j¹ ugotowaæ potrzebujemy szeœæ grzybów kopalnianych, chleb, cztery korzenie lecznicze, ¿¹d³o krwiopijcy.");
				Doc_PrintLines	( nDocID,  0, "Przygotowywanie potrawy zaczynamy od dok³adnego odciêcia kapeluszy grzyba od jego trzonka, a tak¿e usuniêcia najczarniejszych blaszek, w których znajduje siê œmiertelna toksyna. Kroimy je na drobne kawa³eczki i wrzucamy do miseczki, gdzie ugniatamy je z owocami korzeni leczniczych (ma to na celu wzmocniæ organizm jedz¹cego). Do utworzonej mieszaniny dodajemy pokrojone kawa³ki chleba i skrapiamy to spreparowan¹ toksyn¹ z ¿¹d³a krwiopijcy.");
				Doc_PrintLines	( nDocID,  0, "Tak utworzon¹ potrawê zostawiamy na kilka godzin aby toksyny z grzybów zd¹¿y³y wyparowaæ, po wszystkim mo¿emy zjeœæ danie. Uwaga! Z racji z³ego wp³ywu grzybów na organizm nie zaleca siê spo¿ywania tej potrawy wiêcej ni¿ raz na pó³ roku.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis w orkowym jêzyku";
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
		B_LogEntry (TOPIC_orkowy_przepis,"W orkowym obozie na pla¿y znalaz³em kartkê wygl¹daj¹c¹ na jakiœ przepis. Byæ mo¿e któryœ z rycerzy potrafi go przet³umaczyæ...?"); 
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
	description			= 	"Przet³umaczony orkowy przepis";
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
				Doc_PrintLines	( nDocID,  0, "Bonus: si³a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 3x surowe miêso");
				Doc_PrintLines	( nDocID,  0, "- 5x miêso chrz¹szcza");
				Doc_PrintLines	( nDocID,  0, "- dwa jab³ka");
				Doc_PrintLines	( nDocID,  0, "- gin");
				Doc_PrintLines	( nDocID,  0, "- ³osoœ");
				Doc_PrintLines	( nDocID,  0, "- sma¿ony du¿y grzyb");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wypatroszyæ rybê. Wszystkie oœci powrzucaæ do garnka i zalaæ ginem. Gotowaæ d³ugo. Dodaæ mocno usma¿onego grzyba i dalej gotowaæ. Odcedziæ powsta³y wywar, nastêpnie dodaæ resztê sk³adników i mieszaæ.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "(powa¿nie, nie jedz tego...)");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na udziec z dzika po ³owiecku";
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
				Doc_PrintLines	( nDocID,  0, "Udziec z dzika po ³owiecku");
				Doc_PrintLines	( nDocID,  0, "Bonus: zrêcznoœæ +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Oczyszczone ze œciêgien i resztek skóry 6 kawa³ków miêsa z dzika pieczemy nad ro¿nem, do momentu a¿ stanie siê dostatecznie chrupkie i soczyste. Nastêpnie kroimy je w kosteczkê i wrzucamy do utworzonego wczeœniej bulionu na bazie zió³ i chmielu. Po oko³o dwóch godzinach mo¿emy wlaæ ca³oœæ do miski.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê mleczn¹";
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
				Doc_PrintLines	( nDocID,  0, "Do gotuj¹cego siê mleka wrzucamy kawa³ki chleba i gotujemy tak przez 15 minut. Nastêpnie dorzucamy do ca³oœci po dwie sztuki leœnych i polnych jagód zamieszanych z cukrem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê grzybow¹";
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
				Doc_PrintLines	( nDocID,  0, "Bonus: zrêcznoœæ +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Na samym pocz¹tku nale¿y pokroiæ piêæ piekielników i wrzuciæ je do garnka, by zaczê³y siê gotowaæ. W czasie dziesiêciu minut, kiedy wszystko bêdzie siê gotowaæ, wystarczy wrzuciæ do wywaru liœcie z dwóch roœlin niebieskiego bzu i zamieszaæ. Po ugotowaniu dodajemy kawa³ki chleba i pieczonego miêsa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê z du¿ych grzybów";
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
				Doc_PrintLines	( nDocID,  0, "Zupa z du¿ych grzybów");
				Doc_PrintLines	( nDocID,  0, "Bonus: si³a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "W garnku umieœciæ miêso z siedmiu chrz¹szczy. Wlaæ dwa litry wody wymieszanej z po³ow¹ butelki wina, a nastêpnie gotowaæ na wolnym ogniu do momentu wrzenia. Kiedy wywar zacznie siê gotowaæ, wrzucamy do niego pokrojone kapelusze i trzonki trzech du¿ych grzybów. Po po³owie godziny wszystko powinno byæ gotowe do jedzenia.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê jarzynow¹ z jagodami";
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
				Doc_PrintLines	( nDocID,  0, "Bonus: si³a +1");
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "W garnku na ginie i mleku zeszkliæ pokrojone na kawa³ki liœcie z dwóch sztuk zió³ leczniczych i dwóch ognistych pokrzyw. Dodaæ pokrojone w drobn¹ kostkê kawa³ki rzepy i gotowaæ do momentu wrzenia. Na samym koñcu dorzucamy do wszystkiego kilka ugniecionych jagód. Dwie polne i dwie leœne powinny wystarczyæ.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê serow¹";
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
				Doc_PrintLines	( nDocID,  0, "Bonus: si³a +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Do garnka pe³nego wywaru powsta³ego w wyniku gotowania mleka wrzucamy trzy ca³e sery i mieszamy do momentu, a¿ ca³oœæ utworzy jedn¹, ci¹gn¹c¹ siê konsystencjê. Do poprawy smaku jak i zapachu wystarczy dodaæ piwo, które zrównowa¿y smak. Podawaj z kawa³kami chleba.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na 'przysmak myœliwych'";
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
				Doc_PrintLines	( nDocID,  0, "'Przysmak myœliwych'");
				Doc_PrintLines	( nDocID,  0, "Bonus: zrêcznoœæ +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Na patelniê wrzuciæ piêæ kawa³ków miêsa, sma¿yæ i polewaæ powoli winem, by je uszlachetniæ. W miêdzyczasie pokroiæ 3 jab³ka i usma¿yæ je razem z miêsem na patelni. Ca³oœæ wrzuciæ do miski i przyprawiæ czerwonym pieprzem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "Do garnka wlewamy zawartoœæ dwóch butelek wody i gotujemy a¿ do momentu wrzenia. Nastêpnie dorzucamy do wszystkiego pokrojone 2 jab³ka i po 3 polne i 3 leœne jagody, które ówczeœnie zgnietliœmy i pozbawiliœmy pestek. Kiedy sok z owoców wymiesza siê z wod¹, dodajemy cukru i rozlewamy do butelek.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê rybn¹";
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
				Doc_PrintLines	( nDocID,  0, "Do garnka wrzucamy dwa korzenie lecznicze i dodajemy do niej dwie ryby, które po oko³o dziesiêciu minutach powinny oddawaæ swój specyficzny zapach. Roœliny powinny po pewnym czasie zneutralizowaæ nieprzyjemn¹ woñ i nadaæ daniu nowy posmak. Ca³oœæ mo¿na zjeœæ z chlebem i winem.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na gulasz miêsny";
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
				Doc_PrintLines	( nDocID,  0, "Gulasz miêsny"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: si³a +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Aby przyrz¹dziæ gulasz potrzebujemy 5 kawa³ków miêsa, 2 piekielniki, a tak¿e rzepê. Oczywiœcie usma¿one miêso kroimy na kawa³ki i wrzucamy do utworzonego w wyniku gotowania wywaru z rzepy. Ca³oœæ dusimy oko³o godziny i wzbogacamy we wczeœniej pokrojone i oczyszczone grzyby.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na potrawkê ze œcierwojada";
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
				Doc_PrintLines	( nDocID,  0, "Potrawka ze œcierwojada"	);
				Doc_PrintLines	( nDocID,  0, "Bonus: zrêcznoœæ +1");

				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Przed przyst¹pieniem do gotowania oczyszczamy 4 kawa³ki surowego miêsa œcierwojada ze œciêgien i marynujemy je w wywarze z gotowanego piwa. Po dniu oczekiwania mo¿emy wyci¹gn¹æ miêso z marynaty i rozpocz¹æ dalsze przygotowania. Ca³oœæ gotujemy razem z warzywami");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	description			= 	"Przepis na zupê piwn¹";
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
				Doc_PrintLines	( nDocID,  0, "3 sztuki surowego miêsa podsma¿any na garnku o grubym dnie, a¿ stanie siê wystarczaj¹co chrupi¹ce. Wyjmujemy miêso pozostawiaj¹c w garnku wytopiony t³uszcz i sma¿ymy na nim posiekan¹ kie³basê. Wszystko wrzucamy do piwa i gotujemy na wolnym ogniu. Nale¿y u¿yæ przynajmniej 4 butelki piwa. Po godzinie ca³oœæ powinna byæ ju¿ gotowa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
	name 				=	"Zupa z grzybów kopalnianych";

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
	name 				=	"Gulasz miêsny";

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
	name 				=	"Potrawka ze œcierwojada";

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
		B_LogEntry (TOPIC_orkowy_przepis, "Zjad³em tê obrzydliw¹ zupê. Nigdy wiêcej! Dalej mnie skrêca, jak pomyœlê o jej smaku.");
		Log_SetTopicStatus (TOPIC_orkowy_przepis, LOG_SUCCESS);
		PrzepisOrkowyRunning = FALSE;
	};

	//Buff_Apply(self, Poison1HP);
	Poison1HPStart();
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_UdziecZDzikaPoLowiecku (C_Item)
{	
	name 				=	"Udziec z dzika po ³owiecku";

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
	name 				=	"Zupa z du¿ych grzybów";

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
	name 				=	"Przysmak myœliwych";

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
