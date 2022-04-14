
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
	// Sila / Obrazenia (Kapitel to find) / Gdzie
	CreateInvItems (hero,ItNa_Projekt_Zmija, 1);				// 44/53 (Kap3 poczatek)   / skrzynia na pietrze u Ryzowego Ksiecia
	CreateInvItems (hero,ItNa_Projekt_CwiekowanaMaczuga, 1);	// 11/25 (Kap1 srodek)     / skrzynia w jaskini do ktorej idziesz z Philem
	CreateInvItems (hero,ItNa_Projekt_MieczNienawisci, 1);		// 51/44 (Kap2 koniec)     / skrzynia w domku w twierdzy
	CreateInvItems (hero,ItNa_Projekt_MieczSwiatla, 1);			// 72/66 (Kap4 poczatek)   / w skrzyni w poziemiach zamku
	CreateInvItems (hero,ItNa_Projekt_MieczWojenny, 1);			// 28/34 (Kap2 srodek)     / na beczkach w krypcie obok Cavalorna
	CreateInvItems (hero,ItNa_Projekt_MieczBojowy, 1);			// 24/26 (Kap2 poczatek)   / daje Hokurn za przyniesienie mu map
	CreateInvItems (hero,ItNa_Projekt_MieczSedziego, 1);		// 15/22 (Kap1 srodek)     / w jaskini z bossem Poln� Besti�
	CreateInvItems (hero,ItNa_Projekt_ChlopskiMiecz, 1);		// 7/14  (Kap1 poczatek)   / skrzynia w strzepku zawalonej wiezy (Gorn ma tam zloto)
	CreateInvItems (hero,ItNa_Projekt_DobryMiecz, 1);			// 30/35 (Kap2 srodek)     / w jaskini Perrota na stole alchemicznym
	CreateInvItems (hero,ItNa_Projekt_DobryDlugiMiecz, 1);		// 35/45 (Kap3 poczatek)   / w skrzyni w kopalni zaj�tej przez pe�zacze
	CreateInvItems (hero,ItNa_Projekt_RubinoweOstrze, 1);		// 50/50 (Kap3 srodek)     / w skrzyni w orkowym namiocie w obozie przed zamkiem
	CreateInvItems (hero,ItNa_Projekt_ElBastardo, 1);			// 65/65 (Kap4 zapalisada) / w skrzyni na pierwszym pietrze wiezy mgiel
	CreateInvItems (hero,ItNa_Projekt_Oskard, 1);				// 25/35 (Kap2 srodek)     / w skrzyni w krypcie obok g�rskiej fortecy
	CreateInvItems (hero,ItNa_Projekt_Inkwizytor, 1);			// 50/60 (Kap3 koniec)     / w skrzyni obok dziewi�ciu prze��cznik�w
	CreateInvItems (hero,ItNa_Projekt_RunaMocy, 1);				// 60/60 (Kap3 srodek)     / w skrzyni obok przelacznika w gorskiej twierdzy, ktory odsuwa regal z ksiazkami

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
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 35");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 45");
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
				Doc_PrintLines	( nDocID,  0, "Premia do walki broni� jednor�czn�: +7");
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
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 26");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");
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
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 28");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 34");
				Doc_PrintLines	( nDocID,  0, "Zasi�g broni: 100");
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
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 72");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 66");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 80");
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
				Doc_PrintLines	( nDocID,  0, "Miecz jednor�czny");
				Doc_PrintLines	( nDocID,  0, "Wymagana si�a: 44");
				Doc_PrintLines	( nDocID,  0, "Obra�enia: 53");
				Doc_PrintLine	( nDocID,  0, "Zasi�g broni: 85");
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

