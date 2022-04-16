
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
	CreateInvItems (hero,ItNa_Projekt_MieczSedziego, 1);		// 15/22 str 1h +6  (Kap1 srodek)     / w jaskini z bossem Poln� Besti�
	CreateInvItems (hero,ItNa_Projekt_MieczBojowy, 1);			// 24/31 str 1h +3  (Kap2 poczatek)   / daje Hokurn za przyniesienie mu map
	CreateInvItems (hero,ItNa_Projekt_Oskard, 1);				// 25/35 str 1h     (Kap2 srodek)     / w skrzyni w krypcie obok g�rskiej fortecy
	CreateInvItems (hero,ItNa_Projekt_MieczWojenny, 1);			// 48/52 dex 1h     (Kap2 srodek)     / na beczkach w krypcie obok Cavalorna
	CreateInvItems (hero,ItNa_Projekt_DobryMiecz, 1);			// 30/35 str 1h +4  (Kap2 srodek)     / w jaskini Perrota na stole alchemicznym
	CreateInvItems (hero,ItNa_Projekt_BulawaILancuch, 1);		// 45/45 str 1h		(Kap2 srodek)     / w jaskini z goblinami TODO
	CreateInvItems (hero,ItNa_Projekt_WielkaMaczeta, 1);		// 48/52 str 2h +2  (Kap2 srodek)     / w skrzyni w obozie bandyt�w TODO
	CreateInvItems (hero,ItNa_Projekt_MieczNienawisci, 1);		// 51/44 str 1h     (Kap2 koniec)     / skrzynia w domku w twierdzy
	CreateInvItems (hero,ItNa_Projekt_DobryDlugiMiecz, 1);		// 43/51 str 1h +6  (Kap3 poczatek)   / w skrzyni w kopalni zaj�tej przez pe�zacze
	CreateInvItems (hero,ItNa_Projekt_RunaMocy, 1);				// 60/60 str 2h     (Kap3 srodek)     / w skrzyni obok przelacznika w gorskiej twierdzy, ktory odsuwa regal z ksiazkami
	CreateInvItems (hero,ItNa_Projekt_RubinoweOstrze, 1);		// 50/50 str 1h +3  (Kap3 srodek)     / w skrzyni w orkowym namiocie w obozie przed zamkiem
	CreateInvItems (hero,ItNa_Projekt_Inkwizytor, 1);			// 50/60 str 1h +6  (Kap3 koniec)     / w skrzyni obok dziewi�ciu prze��cznik�w
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
	description			= 	"Projekt broni: Ch�opski miecz";
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
				Doc_PrintLines	( nDocID,  0, "Ch�opski miecz:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wyku� gor�cy pr�t na oko�o 30 centymetr�w. Z reszty pr�ta uformowa� poprzeczk� i stopi� razem w ogniu. Na ko�cu ostrze uformowa� w szpic.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 7");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 14");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 55");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "Uformowa� d�ugi szpiczasty koniec. Kling� ubi� na p�asko i raczej szeroko. R�koje�� drewniana.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 30");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 35");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 70");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +4");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Dobry d�ugi miecz";
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
				Doc_PrintLines	( nDocID,  0, "Dobry d�ugi miecz:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- sk�ra wilka");
				
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Ogromn� r�nic� mo�e wyczu� posiadacz, je�li r�koje�� owiniemy cie�kim sk�rzanym paskiem. Ostrze powinno mie� przynajmniej p� metra, by dobrze s�u�y� ka�demu stra�nikowi.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 43");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 51");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 90");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +6");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 2x w�giel");
				Doc_PrintLines	( nDocID,  0, "- per�a");
				Doc_PrintLines	( nDocID,  0, "- 2x bry�ka magicznej rudy");
				
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Si�a klejnotu dodaje charyzmy posiadaczowi. Aby dobrze go wykona�, nale�y rozdrobni� w�giel w drobny maczek, wetrze� proch w per�� i rud�, a nast�pnie wrzuci� to razem do ognia. W�giel si� wypali a klejnoty stopi�. Klinga powinna by� lekko pofa�dowana.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 50");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 50");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 70");				
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +3");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 10 bry�ek magicznej rudy");
				Doc_PrintLines	( nDocID,  0, "- akwamaryn");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Stalowy pr�t prze�ama� na p� i uformowa� w kolce, kt�re stopi� przy r�koje�ci razem z kling�. Ca�o�� pokry� magiczn� rud�, a we wn�trzu r�koje�ci zamocowa� akwamaryn.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 65");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 65");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");				
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +8");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- sk�ra dzika");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Kij owin�� dobrze nat�uszczon� sk�r� dzika, by przyleg�a i sklei�a si� z drewnem. Stal rozgrza� i uformowa� dwie p�aszczyzny, kt�re nast�pnie nale�y na�o�y� na siebie i uformowa� w maczug�.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 25");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 35");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 50");				
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- sk�ra cieniostwora");
				Doc_PrintLines	( nDocID,  0, "- pazury");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wyj�tkowo przyjemna w dotyku sk�ra cieniostwora powinna znale�� si� na kiju. Na jego ko�cu przypominaj�ca jajo g�owica z pofa�dowaniami. Ca�o�� zako�czona szpicem z pazura.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 50");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 60");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 60");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +6");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 8 bry�ek magicznej rudy");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- ska�a krystaliczna");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Uformowa� d�ugie ostrze z kilkoma kolcami u spodu. Do drewnianej r�koje�ci nale�y w�o�y� ska�� krystaliczn�, ostrze pokry� magiczn� rud�.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz dwur�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 60");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 60");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 120");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- pi�� lag");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "R�koje�� tej broni sk�ada si� z kilku kawa�k�w drewna, kt�re w przekroju przypominaj� pi�ciok�t. Dzi�ki temu uchwyt jest bardzo wygodny dla posiadacza. Do �rodka w�o�one jest ostrze, formowane na p�ask� i d�ug� lini�.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 24");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 31");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +3");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- k�y");
				Doc_PrintLines	( nDocID,  0, "- laga");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "K�y zwierz�t nie tylko s� dobrym materia�em do wyrobu przedmiot�w codziennego u�ytku. Mog� sprawdzi� si� r�wnie�, gdy chcemy, by ko�ce r�koje�ci by�y zab�jcze. Wystarczy umocowa� je na kiju i �ci�� nadmiar drewna.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� jednor�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zr�czno��: 48");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 52");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +5");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Miecz s�dziego";
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
				Doc_PrintLines	( nDocID,  0, "Miecz s�dziego:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");

				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "W�ska klinga �ci�ta na g�rze. Z czym innym nie wypada pokaza� si� arystokracie. Mo�na wzmocni� ostrze, przetapiaj�c go kilkukrotnie.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 15");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 22");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +6");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Miecz �wiat�a";
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
				Doc_PrintLines	( nDocID,  0, "Miecz �wiat�a:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- kwarc");
				Doc_PrintLines	( nDocID,  0, "- ska�a krystaliczna");
				Doc_PrintLines	( nDocID,  0, "- bry�ka rudy");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Stal rozgrzewamy w ogniu i stapiamy z kwarcem. Ska�� krystaliczn� nale�y uformowa� w p�kole i zbi� z bry�k� magicznej rudy tak, by odbija�y �wiat�o, gdy patrzymy w kryszta� na r�koje�ci.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� jednor�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zr�czno��: 90");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 75");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 80");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +10");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: �mija";
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
				Doc_PrintLines	( nDocID,  0, "�mija:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- dwa kawa�ki surowej stali");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "- dwie bry�ki z�ota");
				Doc_PrintLines	( nDocID,  0, "- per�a");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Rozgrzewamy stal i jedn� bry�k� z�ota, stapiamy pr�ty na jednym ko�cu. Pozosta�e ko�ce skr�camy w spiral� i ca�o�� montujemy w r�koje�� wykonan� z twardego drewna. Poz�acamy j� i montujemy per��. UWAGA - per�a nie ma tylko charakteru ozdobnego. Niesie za sob� dusz� tej broni...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� jednor�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana zr�czno��: 66");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 63");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 85");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +8");

				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: �wiekowana maczuga";
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
				Doc_PrintLines	( nDocID,  0, "�wiekowana maczuga:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- laga");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "W�a�nie wymy�li�em nowy rodzaj broni! Trzeba rozgrza� stalowy pr�t i zedrze� go no�em. Z pozosta�ej cz�ci nale�y uformowa� g�owic�. Ze zdartych opi�k�w trzeba sporz�dzi� kolce i powbija� je do reszty.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Tutaj tego nie sprzedam, ale mo�e uda si� pohandlowa� ze Szkodnikami z Nowego Obozu...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Darrion");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 11");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 25");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 85");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +3");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Miecz nienawi�ci";
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
				Doc_PrintLines	( nDocID,  0, "Miecz nienawi�ci:"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- surowa stal");
				Doc_PrintLines	( nDocID,  0, "- piwo");
				
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Dogadam si� ze Stonem. Wykuj� dla niego 10 mieczy, a on da je stra�nikom. Mam tylko nadziej�, �e Bloodwyn nie b�dzie si� miesza�. A, i za ka�dy miecz dostan� butelk� piwa!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Zanotuj� ten pomys�, bo jeszcze zapomn� i nici z ch�odnego trunku: Rozgrza� stal. Uformowa� ostrze i wyostrzy� g�owni�. Zostawi� na chwil� i ponownie ku� na wielkim ogniu. Sztych powinien by� t�py, �eby m�c zadawa� b�l, za to czubek bardzo ostry.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Piwo ju� jest moje! Troch� wypij�, a reszt� wymieni� na par� bry�ek.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 44");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 51");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +9");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 5x w�giel");
				Doc_PrintLines	( nDocID,  0, "- 1x k�y b�otnego w�a");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wiatr, wiatr, wiatr �apcie w �agle,");
				Doc_PrintLines	( nDocID,  0, "Cho� sztorm i wr�g na statek nasz czyha.");
				Doc_PrintLines	( nDocID,  0, "Szcz�cie to mit - stworzyli�my go sami,");
				Doc_PrintLines	( nDocID,  0, "Czarna bandera nad nami.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� dwur�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 48");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 52");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 105");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� dwur�czn�: +2");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Mia�d�ydeska";
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
				Doc_PrintLines	( nDocID,  0, "Mia�d�ydeska"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 2x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 1x srebrny naszyjnik");
				Doc_PrintLines	( nDocID,  0, "- 10x laga");
				Doc_PrintLines	( nDocID,  0, "- 5x rum (kowalowi si� przyda!)");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wtem fali cios zdruzgota� statek strasznie,");
				Doc_PrintLines	( nDocID,  0, "Pami�ta dobrze, kto prze�y� ten dzie�.");
				Doc_PrintLines	( nDocID,  0, "Za burt� rzu�cie, co wam krwi� zapachnie");
				Doc_PrintLines	( nDocID,  0, "I wierzcie, �e to nie najwy�sza z cen.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Rozerwijcie, kowalu, srebrny naszyjnik, by wy�o�y� nim trzon topora!");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� dwur�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 90");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 93");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 80");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� dwur�czn�: +4");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Bu�awa i �a�cuch";
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
				Doc_PrintLines	( nDocID,  0, "Bu�awa i �a�cuch"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 4x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 3x k�y");
				Doc_PrintLines	( nDocID,  0, "- 2x laga");
				Doc_PrintLines	( nDocID,  0, "- jakikolwiek srebrny przedmiot");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "K�y powinny stanowi� baz� g�owicy. Nast�pnie powinno si� j� pokry� stal�. Srebro roztopi� na d�ugi pr�t, kt�ry ma stanowi� podstaw� trzonu broni.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� jednor�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 45");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 45");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 60");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 10x bry�ka rudy");
				Doc_PrintLines	( nDocID,  0, "- 1x sk�ra b�otnego w�a");
				Doc_PrintLines	( nDocID,  0, "- 1x akwamaryn");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� z magicznej rudy jest znacznie twardsza od tej ze zwyk�ej stali. Dlatego jesli kowal nie mia� wcze�niej do czynienia z tym rodzajem mieczy, koniecznie b�dzie potrzebowa� przynajmniej dziesi�ciu bry�ek. Podczas wyk�uwania ostrza, nale�y wyk�u� po trzy charakterystyczne szpice z ka�dej strony. Uchwyt mo�na pokry� sk�r� b�otnego w�a. Stwierdzono, �e ma idealne tarcie i bro� le�y perfekcyjnie w d�oni.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� jednor�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 90");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 85");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +10");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
	description			= 	"Projekt broni: Ci�ki magiczny miecz dwur�czny";
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
				Doc_PrintLines	( nDocID,  0, "Ci�ki magiczny miecz dwur�czny"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "- 5x surowa stal");
				Doc_PrintLines	( nDocID,  0, "- 12x bry�ka rudy");
				Doc_PrintLines	( nDocID,  0, "- 1x sk�ra b�otnego w�a");
				Doc_PrintLines	( nDocID,  0, "- 2x akwamaryn");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Taka bro� zarezerwowana jest wy��cznie dla rycerzy kr�la. Wykuwanie jej bez zgody Rhobara jest �amaniem prawa.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Konieczne jest u�ycie sporej ilo�ci rudy, gdy� miecz jest do�� d�ugi. Do pokrycia r�koje�ci koniecznie nale�y u�y� sk�ry b�otnego w�a, aby miecz le�a� dobrze w d�oniach. Dzi�ki temu zmniejszymy prawdopodobie�stwo upuszczenia tej cholernie ci�kiej broni...");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� dwur�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 105");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 100");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 110");
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� dwur�czn�: +5");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "- 15x bry�ka z�ota");
				Doc_PrintLines	( nDocID,  0, "- 2x laga");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Wielki miecz to dwur�czny kuzyn miecza p�torar�cznego. Jest on troch� d�u�szy i ci�szy. Tylko prawdziwy osi�ek m�g�by dzier�y� t� bro� w jednej r�ce, dlatego wi�kszo�� woj�w pos�uguje si� nim obiema r�kami. R�koje�� nale�y poz�oci�.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Bro� dwur�czna");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 72");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 79");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 100");
				Doc_PrintLine	( nDocID,  0, "Premia do walki broni� dwur�czn�: +4");
				Doc_PrintLine	( nDocID,  0, "");

				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};
