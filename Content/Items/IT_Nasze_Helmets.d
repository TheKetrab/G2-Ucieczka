const int INVCAM_ENTF_HELMET_STANDARD = 140;
const int INVCAM_X_HELMET_STANDARD    = 20;
const int INVCAM_Y_HELMET_STANDARD    = 25;

// **********************************************
// . . . . . . . . . . He³my . . . . . . . . . .
// **********************************************
//----- Helmet -----
INSTANCE Helmets (C_Item)
{
	name 				=	"All helmets :)";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_AllHelmets;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_AllHelmets ()
{
	CreateInvItems (hero,ITNA_KapturMysliwego, 1);		// Kap2			~4		200		sprzedaje hunt jesli jestes mysliwym
	CreateInvItems (hero,ITNA_Maska_Kruka, 1);			// Kap2			~5		300		u nieznanego na pó³ce
	CreateInvItems (hero,ITNA_HelmSniacego, 1);			// Kap5 bonus	~6		500		na koncu gry, okragly przelacznik, za krat¹ z pe³zaczami
	CreateInvItems (hero,ITNA_KolczugaRycerza, 1);		// Kap3			~9		500		do zebrania w misji 'helmy rycerzy'
	CreateInvItems (hero,ITNA_DjgHelmet, 1);			// Kap3			~9		500		kupuje siê razem ze zbroj¹ ³owcy orków
	CreateInvItems (hero,ITNA_RogatyHelm, 1);			// Kap3			~11		650		na prawo od CatSana - na pó³ce
	CreateInvItems (hero,ITNA_TwardyHelmWojownika, 1);	// Kap4			~13		800		na orkowej stra¿nicy obok tartaku za palisad¹
	CreateInvItems (hero,ITNA_HelmBarda, 1);			// Kap3			~14		900		na najwy¿szej wie¿y w NO
	CreateInvItems (hero,ITNA_DJG_ULTRA_HELMET, 1);		// Kap4			~16		1000	mozna kupic od Jana po misji ze zbroja
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_KapturMysliwego (C_Item)
{
	name = "Kaptur myœliwego";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "KapturMysliwego.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 200;
	material = MAT_LEATHER;

	protection[PROT_EDGE] = 4;
	protection[PROT_BLUNT] = 4;
	protection[PROT_POINT] = 2;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[5] = NAME_Value;		count[5] = value;
	
	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_Maska_Kruka (C_Item)
{
	name = "Maska Kruka";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "Maska.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 300;
	material = MAT_METAL;

	on_equip			=	Equip_ItNa_Maska_Kruka;
	on_unequip		=	Unequip_ItNa_Maska_Kruka;

	
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 4;
	protection[PROT_FIRE] = 4;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_HelmSniacego (C_Item)
{
	name = "He³m Œni¹cego";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "HelmSniacego.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 500;
	material = MAT_METAL;

	protection[PROT_EDGE] = 6;
	protection[PROT_BLUNT] = 6;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 7;
	protection[PROT_MAGIC] = 8;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_KolczugaRycerza (C_Item)
{
	name = "Kolczuga rycerza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "HelmRycerza.3ds"; 
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 500;
	material = MAT_METAL;

	protection[PROT_EDGE] = 9;
	protection[PROT_BLUNT] = 9;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 6;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DjgHelmet (C_Item)
{
	name = "He³m ³owcy orków";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "DJG_H_HELMET.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 500;
	material = MAT_METAL;

	protection[PROT_EDGE] = 9;
	protection[PROT_BLUNT] = 9;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 6;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_RogatyHelm (C_Item)
{
	name = "Rogaty he³m";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "RogatyHelm.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 650;
	material = MAT_METAL;

	protection[PROT_EDGE] = 11;
	protection[PROT_BLUNT] = 11;
	protection[PROT_POINT] = 9;
	protection[PROT_FIRE] = 7;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_TwardyHelmWojownika (C_Item)
{
	name = "Twardy he³m wojownika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "TwardyHelmWojownika.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 800;
	material = MAT_METAL;

	protection[PROT_EDGE] = 13;
	protection[PROT_BLUNT] = 13;
	protection[PROT_POINT] = 9;
	protection[PROT_FIRE] = 8;
	protection[PROT_MAGIC] = 3;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_HelmBarda (C_Item)
{
	name = "He³m barda";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "HelmBarda.3ds";
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 900;
	material = MAT_METAL;

	protection[PROT_EDGE] = 14;
	protection[PROT_BLUNT] = 14;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 6;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_ULTRA_HELMET (C_Item)
{
	name = "He³m z pancerza orka-elity";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	description = name;
	
	visual = "PAL_ORC_HELM_NEW.3ds"; 
	visual_skin = 0;
	wear = WEAR_HEAD;
	value = 1000;
	material = MAT_METAL;

	protection[PROT_EDGE] = 16;
	protection[PROT_BLUNT] = 16;
	protection[PROT_POINT] = 12;
	protection[PROT_FIRE] = 12;
	protection[PROT_MAGIC] = 10;

	text[0] = ""; 
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;		count[5] = value;

	INV_ZBIAS				= INVCAM_ENTF_HELMET_STANDARD;
	INV_ROTX				= INVCAM_X_HELMET_STANDARD;
	INV_ROTY				= INVCAM_Y_HELMET_STANDARD;
};
