
// **********************************************
// . . . . . . . . . . Klucze . . . . . . . . . .
// **********************************************


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE Keys (C_Item)
{
	name 				=	"Klucze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_AllKeys;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_AllKeys ()
{
	CreateInvItems (hero,ItNa_KeyStraznik_Moc, 1);			
	CreateInvItems (hero,ItNa_KeyStraznik_Sila, 1);
	CreateInvItems (hero,ItNa_KeyStraznik_Odpornosc, 1);	
	CreateInvItems (hero,ItNa_KeyBron_Skrzynia, 1);			
	CreateInvItems (hero,ItNa_Key_Perrot, 1);			
	CreateInvItems (hero,ItNa_Key_Lens, 1);			
	CreateInvItems (hero,ItNa_Key_KorthPiwo, 1);			
	CreateInvItems (hero,ItNa_Key_Ratford, 1);			
	CreateInvItems (hero,ItNa_Key_Keroloth, 1);			
	CreateInvItems (hero,ItNa_Key_Louis, 1);			
	CreateInvItems (hero,ItNa_Key_Bandzior, 1);			
	CreateInvItems (hero,ItNa_Key_Ben, 1);			
	CreateInvItems (hero,ItNa_Key_WielkiDom, 1);			
	CreateInvItems (hero,ItNa_Key_Robotnik, 1);			
	CreateInvItems (hero,ItNa_Key_CatSan, 1);			

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KeyStraznik_Moc(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera drzwi do krypty.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KeyStraznik_Sila(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera drzwi do krypty.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KeyStraznik_Odpornosc(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera drzwi do krypty.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KeyBron_Skrzynia(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Klucz do skrzyni Brona.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Perrot(C_Item)
{
	name 				=	"Klucz Perrota";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera laboratorium Perrota.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Lens(C_Item)
{
	name 				=	"Klucz Lensa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_KorthPiwo(C_Item)
{
	name 				=	"Klucz do kufra z piwem";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Ratford(C_Item)
{
	name 				=	"Klucz do wiêzienia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera drzwi na szczycie wielkiego domu.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Keroloth(C_Item)
{
	name 				=	"Klucz do magazynu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Otwiera magazyn przy wejœciu do obozu ³owców orków.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Louis(C_Item)
{
	name 				=	"Klucz Louisa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Bandzior(C_Item)
{
	name 				=	"Klucz Bandziora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Znalaz³em go przy bandycie przed kopalni¹.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Ben(C_Item)
{
	name 				=	"Klucz Bena";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_WielkiDom(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Znaleziony w obozie myœliwych.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_Robotnik(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Klucz do piwnicy domu Kerolotha.";
	TEXT[3]				=   "";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Key_CatSan(C_Item)
{
	name 				=	"Stary klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Znalaz³em go w górskiej fortecy.";
	TEXT[3]				=   "Wygl¹da, jakby mia³ tysi¹c lat.";
	
};
