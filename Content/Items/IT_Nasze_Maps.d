
// ********************************************
// . . . . . . . . . . Mapy . . . . . . . . . .
// ********************************************


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_Domenic (C_Item)
{
	name 		= "Mapa Domenica";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ItNa_Mapa_Domenic;

	description	= name;
	TEXT[0]		= "Na tej mapie Domenic zaznaczy³ drogê jak¹ przeszed³,";
	TEXT[1]		= "podczas eksploracji Górniczej Doliny.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
	func void Use_ItNa_Mapa_Domenic ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItNa_Mapa_Domenic);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_DOMENIC.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_GraveMission (C_Item)
{
	name 		= "Mapa grobów";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ItNa_Mapa_GraveMission;

	description	= name;
	TEXT[0]		= "Na mapie zaznaczono miejsca,";
	TEXT[1]		= "w których znajduj¹ siê groby.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
	func void Use_ItNa_Mapa_GraveMission ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItNa_Mapa_GraveMission);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_GRAVEMISSION.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****	
instance ItNa_Mapa_Adanos (C_Item)
{
	name 		= "Mapa do skarbu";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ItNa_Mapa_Adanos;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
var int OpenAdanosMapaOneTime;
	func void Use_ItNa_Mapa_Adanos ()
	{
		if (OpenAdanosMapaOneTime== FALSE)
		{
			OpenAdanosMapaOneTime = TRUE;
			B_LogEntry (TOPIC_bogowie_work, "Hmm... na mapie z wie¿y mgie³ jest zaznaczony plac wymian. Co tam znajdê?");
		};



		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_Adanos.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_Demonow (C_Item)
{
	name 		= "Mapa demonów";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ItNa_Mapa_Demonow;

	description	= name;
	TEXT[0]		= "Monastir nakreœli³ prawdopodobne miejsca";
	TEXT[1]		= "pojawienia siê stworzeñ Beliara.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
	func void Use_ItNa_Mapa_Demonow ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItNa_Mapa_Demonow);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_DEMON.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};
	
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_ObozWypadowy (C_Item)
{
	name 		= "Mapa Górniczej Doliny";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Mapa_ObozWypadowy;

	description	= name;
	TEXT[0]		= "Na tej mapie zaznaczono obóz wypadowy myœliwych.";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Mapa_ObozWypadowy()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItNa_Mapa_ObozWypadowy);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_GESTATH.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_Morska (C_Item)
{
	name 		= "Mapa morska";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 200;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Mapa_Morska;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Mapa_Morska()
	{


		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_LOUIS.tga", TRUE);  // TRUE = scale to fullscreen
//					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_Lens (C_Item)
{
	name 		= "Mapa";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 100;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Mapa_Lens;

	description	= name;
	TEXT[0]		= "Wydaje siê, ¿e 'X' ma coœ wspólnego";
	TEXT[1]		= "z kradzie¿¹ dokonan¹ na myœliwych.";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Mapa_Lens()
	{

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_LENS.tga", TRUE);  // TRUE = scale to fullscreen
//					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_NowyOboz (C_Item)
{
	name 		= "Plan Nowego Obozu";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 100;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_NowyOboz;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_NowyOboz()
	{


		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_NEWCAMP.tga", TRUE);  // TRUE = scale to fullscreen
//					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_ObozNaBagnie (C_Item)
{
	name 		= "Plan Obozu Na Bagnie";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 200;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ObozNaBagnie;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_ObozNaBagnie()
	{


		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_PSICAMP.tga", TRUE);  // TRUE = scale to fullscreen
//					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Mapa_Bracia (C_Item)
{
	name 		= "Mapa piêciu braci";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 200;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Mapa_Bracia;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Mapa_Bracia()
	{


		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "MAP_BROTHERS.tga", TRUE);  // TRUE = scale to fullscreen
//					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};
