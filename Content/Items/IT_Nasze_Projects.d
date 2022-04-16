
// **********************************************
// . . . . . . . . . Projekty . . . . . . . . .
// **********************************************

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE Projects (C_Item)
{
	name 				=	"Projekty broni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_AllProjects;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_AllProjects ()
{
	// Str(Dex) / Damage [str/dex] [1h/2h] [bonus] (Kapitel to find) / Where

	CreateInvItems (hero,ItNa_Projekt_ChlopskiMiecz, 1);		// 7/14  str 1h     (Kap1 poczatek)   / skrzynia w strzepku zawalonej wiezy (Gorn ma tam zloto)
	CreateInvItems (hero,ItNa_Projekt_CwiekowanaMaczuga, 1);	// 11/25 str 1h +3  (Kap1 srodek)     / skrzynia w jaskini do ktorej idziesz z Philem
	CreateInvItems (hero,ItNa_Projekt_MieczSedziego, 1);		// 15/22 str 1h +6  (Kap1 srodek)     / w jaskini z bossem Poln¹ Besti¹
	CreateInvItems (hero,ItNa_Projekt_MieczBojowy, 1);			// 24/31 str 1h +3  (Kap2 poczatek)   / daje Hokurn za przyniesienie mu map
	CreateInvItems (hero,ItNa_Projekt_Oskard, 1);				// 25/35 str 1h     (Kap2 srodek)     / w skrzyni w krypcie obok górskiej fortecy
	CreateInvItems (hero,ItNa_Projekt_MieczWojenny, 1);			// 48/52 dex 1h     (Kap2 srodek)     / na beczkach w krypcie obok Cavalorna
	CreateInvItems (hero,ItNa_Projekt_DobryMiecz, 1);			// 30/35 str 1h +4  (Kap2 srodek)     / w jaskini Perrota na stole alchemicznym
	CreateInvItems (hero,ItNa_Projekt_BulawaILancuch, 1);		// 45/45 str 1h		(Kap2 srodek)     / w jaskini z goblinami TODO
	CreateInvItems (hero,ItNa_Projekt_WielkaMaczeta, 1);		// 48/52 str 2h +2  (Kap2 srodek)     / w skrzyni w obozie bandytów TODO
	CreateInvItems (hero,ItNa_Projekt_MieczNienawisci, 1);		// 51/44 str 1h     (Kap2 koniec)     / skrzynia w domku w twierdzy
	CreateInvItems (hero,ItNa_Projekt_DobryDlugiMiecz, 1);		// 43/51 str 1h +6  (Kap3 poczatek)   / w skrzyni w kopalni zajêtej przez pe³zacze
	CreateInvItems (hero,ItNa_Projekt_RunaMocy, 1);				// 60/60 str 2h     (Kap3 srodek)     / w skrzyni obok przelacznika w gorskiej twierdzy, ktory odsuwa regal z ksiazkami
	CreateInvItems (hero,ItNa_Projekt_RubinoweOstrze, 1);		// 50/50 str 1h +3  (Kap3 srodek)     / w skrzyni w orkowym namiocie w obozie przed zamkiem
	CreateInvItems (hero,ItNa_Projekt_Inkwizytor, 1);			// 50/60 str 1h +6  (Kap3 koniec)     / w skrzyni obok dziewiêciu prze³¹czników
	CreateInvItems (hero,ItNa_Projekt_Zmija, 1);				// 66/63 dex 1h +8  (Kap3 poczatek)   / skrzynia na pietrze u Ryzowego Ksiecia
	CreateInvItems (hero,ItNa_Projekt_WielkiMiecz, 1);			// 72/79 str 2h +4  (Kap4 poczatek)   / daje Udar po wykonaniu zadania 'Wojna'
	CreateInvItems (hero,ItNa_Projekt_MieczSwiatla, 1);			// 90/75 dex 1h +10 (Kap4 poczatek)   / w skrzyni w podziemiach zamku
	CreateInvItems (hero,ItNa_Projekt_ElBastardo, 1);			// 65/65 str 1h +8  (Kap4 zapalisada) / w skrzyni na pierwszym pietrze wiezy mgiel
	CreateInvItems (hero,ItNa_Projekt_Miazdzydeska, 1);			// 90/93 str 2h +4  (Kap4 zapalisada) / w skrzyni w orkowym obozie na plazy TODO
	CreateInvItems (hero,ItNa_Projekt_MagiczneOstrzeBojowe, 1);	// 90/85 str 1h +10 (Kap4 zapalisada) / w skrzyni na srodku magicznego lasu za palisada TODO
	CreateInvItems (hero,ItNa_Projekt_CiezkiMagiczny2h, 1);		// 105/100str2h +5  (Kap4 zapalisada) / w skrzyni u YBeriona TODO

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_ChlopskiMiecz (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_ChlopskiMiecz;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Ch³opski miecz";
};
func void Use_Projekt_ChlopskiMiecz ()
{   
	var int Projekt_ChlopskiMiecz_OneTime;
	if (Projekt_ChlopskiMiecz_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_ChlopskiMiecz_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Ch³opski miecz:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wykuæ gor¹cy prêt na oko³o 30 centymetrów. Z reszty prêta uformowaæ poprzeczkê i stopiæ razem w ogniu. Na koñcu ostrze uformowaæ w szpic.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 7");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 14");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 55");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_DobryMiecz (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_DobryMiecz;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Dobry miecz";
};
func void Use_Projekt_DobryMiecz ()
{   
	var int Projekt_DobryMiecz_OneTime;
	if (Projekt_DobryMiecz_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_DobryMiecz_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Dobry miecz:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Uformowaæ d³ugi szpiczasty koniec. Klingê ubiæ na p³asko i raczej szeroko. Rêkojeœæ drewniana.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 30");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 35");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 70");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +4");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_DobryDlugiMiecz (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_DobryDlugiMiecz;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Dobry d³ugi miecz";
};
func void Use_Projekt_DobryDlugiMiecz ()
{   
	var int Projekt_DobryDlugiMiecz_OneTime;
	if (Projekt_DobryDlugiMiecz_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_DobryDlugiMiecz_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Dobry d³ugi miecz:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- skóra wilka");
				
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Ogromn¹ ró¿nicê mo¿e wyczuæ posiadacz, jeœli rêkojeœæ owiniemy cieñkim skórzanym paskiem. Ostrze powinno mieæ przynajmniej pó³ metra, by dobrze s³u¿yæ ka¿demu stra¿nikowi.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 43");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 51");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 90");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +6");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_RubinoweOstrze (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_RubinoweOstrze;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Rubinowe ostrze";
};
func void Use_Projekt_RubinoweOstrze ()
{   
	var int Projekt_RubinoweOstrze_OneTime;
	if (Projekt_RubinoweOstrze_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_RubinoweOstrze_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Rubinowe ostrze:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 2x wêgiel");
				Doc_PrintLines	( nDocID,  0, "- per³a");
				Doc_PrintLines	( nDocID,  0, "- 2x bry³ka magicznej rudy");
				
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Si³a klejnotu dodaje charyzmy posiadaczowi. Aby dobrze go wykonaæ, nale¿y rozdrobniæ wêgiel w drobny maczek, wetrzeæ proch w per³ê i rudê, a nastêpnie wrzuciæ to razem do ognia. Wêgiel siê wypali a klejnoty stopi¹. Klinga powinna byæ lekko pofa³dowana.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 50");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 50");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 70");				
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +3");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_ElBastardo (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_ElBastardo;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: El Bastardo";
};
func void Use_Projekt_ElBastardo ()
{   
	var int Projekt_ElBastardo_OneTime;
	if (Projekt_ElBastardo_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_ElBastardo_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "El Bastardo:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 10 bry³ek magicznej rudy");
				Doc_PrintLines	( nDocID,  0, "- akwamaryn");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Stalowy prêt prze³amaæ na pó³ i uformowaæ w kolce, które stopiæ przy rêkojeœci razem z kling¹. Ca³oœæ pokryæ magiczn¹ rud¹, a we wnêtrzu rêkojeœci zamocowaæ akwamaryn.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 65");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 65");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 100");				
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +8");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_Oskard (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_Oskard;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Oskard";
};
func void Use_Projekt_Oskard ()
{   
	var int Projekt_Oskard_OneTime;
	if (Projekt_Oskard_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_Oskard_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Oskard:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- skóra dzika");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Kij owin¹æ dobrze nat³uszczon¹ skór¹ dzika, by przyleg³a i sklei³a siê z drewnem. Stal rozgrzaæ i uformowaæ dwie p³aszczyzny, które nastêpnie nale¿y na³o¿yæ na siebie i uformowaæ w maczugê.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 25");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 35");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 50");				
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_Inkwizytor (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_Inkwizytor;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Inkwizytor";
};
func void Use_Projekt_Inkwizytor ()
{   
	var int Projekt_Inkwizytor_OneTime;
	if (Projekt_Inkwizytor_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_Inkwizytor_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Inkwizytor:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- skóra cieniostwora");
				Doc_PrintLines	( nDocID,  0, "- pazury");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wyj¹tkowo przyjemna w dotyku skóra cieniostwora powinna znaleŸæ siê na kiju. Na jego koñcu przypominaj¹ca jajo g³owica z pofa³dowaniami. Ca³oœæ zakoñczona szpicem z pazura.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 50");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 60");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 60");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +6");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_RunaMocy (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_RunaMocy;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Runa mocy";
};
func void Use_Projekt_RunaMocy ()
{   
	var int Projekt_RunaMocy_OneTime;
	if (Projekt_RunaMocy_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_RunaMocy_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Runa mocy:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 4x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 8 bry³ek magicznej rudy");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- ska³a krystaliczna");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Uformowaæ d³ugie ostrze z kilkoma kolcami u spodu. Do drewnianej rêkojeœci nale¿y w³o¿yæ ska³ê krystaliczn¹, ostrze pokryæ magiczn¹ rud¹.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz dwurêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 60");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 60");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 120");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MieczBojowy (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MieczBojowy;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Miecz bojowy";
};
func void Use_Projekt_MieczBojowy ()
{   
	var int Projekt_MieczBojowy_OneTime;
	if (Projekt_MieczBojowy_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MieczBojowy_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Miecz bojowy:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- piêæ lag");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Rêkojeœæ tej broni sk³ada siê z kilku kawa³ków drewna, które w przekroju przypominaj¹ piêciok¹t. Dziêki temu uchwyt jest bardzo wygodny dla posiadacza. Do œrodka w³o¿one jest ostrze, formowane na p³ask¹ i d³ug¹ liniê.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 24");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 31");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +3");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MieczWojenny (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MieczWojenny;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Miecz wojenny";
};
func void Use_Projekt_MieczWojenny ()
{   
	var int Projekt_MieczWojenny_OneTime;
	if (Projekt_MieczWojenny_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MieczWojenny_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Miecz wojenny:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- k³y");
				Doc_PrintLines	( nDocID,  0, "- laga");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "K³y zwierz¹t nie tylko s¹ dobrym materia³em do wyrobu przedmiotów codziennego u¿ytku. Mog¹ sprawdziæ siê równie¿, gdy chcemy, by koñce rêkojeœci by³y zabójcze. Wystarczy umocowaæ je na kiju i œci¹æ nadmiar drewna.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ jednorêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zrêcznoœæ: 48");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 52");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +5");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MieczSedziego (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MieczSedziego;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Miecz sêdziego";
};
func void Use_Projekt_MieczSedziego ()
{   
	var int Projekt_MieczSedziego_OneTime;
	if (Projekt_MieczSedziego_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MieczSedziego_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Miecz sêdziego:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");

				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "W¹ska klinga œciêta na górze. Z czym innym nie wypada pokazaæ siê arystokracie. Mo¿na wzmocniæ ostrze, przetapiaj¹c go kilkukrotnie.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 15");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 22");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +6");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MieczSwiatla (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MieczSwiatla;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Miecz œwiat³a";
};
func void Use_Projekt_MieczSwiatla ()
{   
	var int Projekt_MieczSwiatla_OneTime;
	if (Projekt_MieczSwiatla_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MieczSwiatla_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Miecz œwiat³a:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- kwarc");
				Doc_PrintLines	( nDocID,  0, "- ska³a krystaliczna");
				Doc_PrintLines	( nDocID,  0, "- bry³ka rudy");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Stal rozgrzewamy w ogniu i stapiamy z kwarcem. Ska³ê krystaliczn¹ nale¿y uformowaæ w pó³kole i zbiæ z bry³k¹ magicznej rudy tak, by odbija³y œwiat³o, gdy patrzymy w kryszta³ na rêkojeœci.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ jednorêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zrêcznoœæ: 90");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 75");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 80");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +10");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_Zmija (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_Zmija;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: ¯mija";
};
func void Use_Projekt_Zmija ()
{   
	var int Projekt_Zmija_OneTime;
	if (Projekt_Zmija_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_Zmija_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "¯mija:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- dwa kawa³ki surowej stali");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- dwie bry³ki z³ota");
				Doc_PrintLines	( nDocID,  0, "- per³a");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Rozgrzewamy stal i jedn¹ bry³kê z³ota, stapiamy prêty na jednym koñcu. Pozosta³e koñce skrêcamy w spiralê i ca³oœæ montujemy w rêkojeœæ wykonan¹ z twardego drewna. Poz³acamy j¹ i montujemy per³ê. UWAGA - per³a nie ma tylko charakteru ozdobnego. Niesie za sob¹ duszê tej broni...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ jednorêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zrêcznoœæ: 66");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 63");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 85");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +8");

				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_CwiekowanaMaczuga (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_CwiekowanaMaczuga;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Æwiekowana maczuga";
};
func void Use_Projekt_CwiekowanaMaczuga ()
{   
	var int Projekt_CwiekowanaMaczuga_OneTime;
	if (Projekt_CwiekowanaMaczuga_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_CwiekowanaMaczuga_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Æwiekowana maczuga:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "W³aœnie wymyœli³em nowy rodzaj broni! Trzeba rozgrzaæ stalowy prêt i zedrzeæ go no¿em. Z pozosta³ej czêœci nale¿y uformowaæ g³owicê. Ze zdartych opi³ków trzeba sporz¹dziæ kolce i powbijaæ je do reszty.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Tutaj tego nie sprzedam, ale mo¿e uda siê pohandlowaæ ze Szkodnikami z Nowego Obozu...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Darrion");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 11");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 25");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 85");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +3");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MieczNienawisci (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MieczNienawisci;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Miecz nienawiœci";
};
var int Projekt_MieczNienawisci_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_MieczNienawisci ()
{   
	if (Projekt_MieczNienawisci_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MieczNienawisci_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Miecz nienawiœci:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- piwo");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Dogadam siê ze Stonem. Wykujê dla niego 10 mieczy, a on da je stra¿nikom. Mam tylko nadziejê, ¿e Bloodwyn nie bêdzie siê miesza³. A, i za ka¿dy miecz dostanê butelkê piwa!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Zanotujê ten pomys³, bo jeszcze zapomnê i nici z ch³odnego trunku: Rozgrzaæ stal. Uformowaæ ostrze i wyostrzyæ g³owniê. Zostawiæ na chwilê i ponownie kuæ na wielkim ogniu. Sztych powinien byæ têpy, ¿eby móc zadawaæ ból, za to czubek bardzo ostry.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Piwo ju¿ jest moje! Trochê wypijê, a resztê wymieniê na parê bry³ek.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednorêczny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 44");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 51");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +9");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_WielkaMaczeta (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_WielkaMaczeta;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Wielka maczeta";
};
var int Projekt_WielkaMaczeta_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_WielkaMaczeta ()
{   
	if (Projekt_WielkaMaczeta_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_WielkaMaczeta_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Wielka maczeta"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 5x wêgiel");
				Doc_PrintLines	( nDocID,  0, "- 1x k³y b³otnego wê¿a");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wiatr, wiatr, wiatr ³apcie w ¿agle,");
				Doc_PrintLines	( nDocID,  0, "Choæ sztorm i wróg na statek nasz czyha.");
				Doc_PrintLines	( nDocID,  0, "Szczêœcie to mit - stworzyliœmy go sami,");
				Doc_PrintLines	( nDocID,  0, "Czarna bandera nad nami.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ dwurêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 48");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 52");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 105");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ dwurêczn¹: +2");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_Miazdzydeska (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_Miazdzydeska;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Mia¿d¿ydeska";
};
var int Projekt_Miazdzydeska_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_Miazdzydeska ()
{   
	if (Projekt_Miazdzydeska_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_Miazdzydeska_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Mia¿d¿ydeska"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 1x srebrny naszyjnik");
				Doc_PrintLines	( nDocID,  0, "- 10x laga");
				Doc_PrintLines	( nDocID,  0, "- 5x rum (kowalowi siê przyda!)");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wtem fali cios zdruzgota³ statek strasznie,");
				Doc_PrintLines	( nDocID,  0, "Pamiêta dobrze, kto prze¿y³ ten dzieñ.");
				Doc_PrintLines	( nDocID,  0, "Za burtê rzuæcie, co wam krwi¹ zapachnie");
				Doc_PrintLines	( nDocID,  0, "I wierzcie, ¿e to nie najwy¿sza z cen.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Rozerwijcie, kowalu, srebrny naszyjnik, by wy³o¿yæ nim trzon topora!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ dwurêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 90");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 93");
				Doc_PrintLines	( nDocID,  0, "Zasiêg broni: 80");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ dwurêczn¹: +4");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_BulawaILancuch (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_BulawaILancuch;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Bu³awa i ³añcuch";
};
var int Projekt_BulawaILancuch_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_BulawaILancuch ()
{   
	if (Projekt_BulawaILancuch_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_BulawaILancuch_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Bu³awa i ³añcuch"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 4x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 3x k³y");
				Doc_PrintLines	( nDocID,  0, "- 2x laga");
				Doc_PrintLines	( nDocID,  0, "- jakikolwiek srebrny przedmiot");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "K³y powinny stanowiæ bazê g³owicy. Nastêpnie powinno siê j¹ pokryæ stal¹. Srebro roztopiæ na d³ugi prêt, który ma stanowiæ podstawê trzonu broni.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ jednorêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 45");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 45");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 60");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_MagiczneOstrzeBojowe (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_MagiczneOstrzeBojowe;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Magiczne ostrze bojowe";
};
var int Projekt_MagiczneOstrzeBojowe_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_MagiczneOstrzeBojowe ()
{   
	if (Projekt_MagiczneOstrzeBojowe_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_MagiczneOstrzeBojowe_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Magiczne ostrze bojowe"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 3x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 10x bry³ka rudy");
				Doc_PrintLines	( nDocID,  0, "- 1x skóra b³otnego wê¿a");
				Doc_PrintLines	( nDocID,  0, "- 1x akwamaryn");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ z magicznej rudy jest znacznie twardsza od tej ze zwyk³ej stali. Dlatego jesli kowal nie mia³ wczeœniej do czynienia z tym rodzajem mieczy, koniecznie bêdzie potrzebowa³ przynajmniej dziesiêciu bry³ek. Podczas wyk³uwania ostrza, nale¿y wyk³uæ po trzy charakterystyczne szpice z ka¿dej strony. Uchwyt mo¿na pokryæ skór¹ b³otnego wê¿a. Stwierdzono, ¿e ma idealne tarcie i broñ le¿y perfekcyjnie w d³oni.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ jednorêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 90");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 85");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ jednorêczn¹: +10");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_CiezkiMagiczny2h (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_CiezkiMagiczny2h;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Ciê¿ki magiczny miecz dwurêczny";
};
var int Projekt_CiezkiMagiczny2h_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_CiezkiMagiczny2h ()
{   
	if (Projekt_CiezkiMagiczny2h_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_CiezkiMagiczny2h_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Ciê¿ki magiczny miecz dwurêczny"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 5x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 12x bry³ka rudy");
				Doc_PrintLines	( nDocID,  0, "- 1x skóra b³otnego wê¿a");
				Doc_PrintLines	( nDocID,  0, "- 2x akwamaryn");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Taka broñ zarezerwowana jest wy³¹cznie dla rycerzy króla. Wykuwanie jej bez zgody Rhobara jest ³amaniem prawa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Konieczne jest u¿ycie sporej iloœci rudy, gdy¿ miecz jest doœæ d³ugi. Do pokrycia rêkojeœci koniecznie nale¿y u¿yæ skóry b³otnego wê¿a, aby miecz le¿a³ dobrze w d³oniach. Dziêki temu zmniejszymy prawdopodobieñstwo upuszczenia tej cholernie ciê¿kiej broni...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ dwurêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 105");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 100");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 110");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni¹ dwurêczn¹: +5");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Projekt_WielkiMiecz (C_Item)
{
	name 				=	"Projekt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Projekt_WielkiMiecz;
	scemeName			=	"MAP";
	description			= 	"Projekt broni: Wielki miecz";
};
var int Projekt_WielkiMiecz_OneTime; // musi byc globalnie - bo Jan
func void Use_Projekt_WielkiMiecz ()
{   
	if (Projekt_WielkiMiecz_OneTime==FALSE) {
		B_GivePlayerXP(25);
		Projekt_WielkiMiecz_OneTime = TRUE;
	};
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Wielki miecz"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 3x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 15x bry³ka z³ota");
				Doc_PrintLines	( nDocID,  0, "- 2x laga");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wielki miecz to dwurêczny kuzyn miecza pó³torarêcznego. Jest on trochê d³u¿szy i ciê¿szy. Tylko prawdziwy osi³ek móg³by dzier¿yæ tê broñ w jednej rêce, dlatego wiêkszoœæ wojów pos³uguje siê nim obiema rêkami. Rêkojeœæ nale¿y poz³ociæ.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Broñ dwurêczna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si³a: 72");
				Doc_PrintLines	( nDocID,  0, "Obra¿enia: 79");
				Doc_PrintLine	( nDocID,  0, "Zasiêg broni: 100");
				Doc_PrintLine	( nDocID,  0, "Premia do walki broni¹ dwurêczn¹: +4");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
				Doc_Show		( nDocID );
};
