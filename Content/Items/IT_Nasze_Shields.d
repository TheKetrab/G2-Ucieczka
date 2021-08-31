
// **********************************************
// . . . . . . . . . . Tarcze . . . . . . . . . .
// **********************************************

func void Equip_Shield()
{
	self.aivar[AIV_TARCZA] = true;
	if (Npc_IsPlayer(self)) {
	if (WalkaTarcza == TRUE)
	{
		B_AddFightSkill (self, TALENT_SHIELD, 0);
		//WillTarczaUbrana = TRUE;
		if (self.HitChance[NPC_TALENT_1H] >= 50)
		{
			Mdl_ApplyOverlayMds (self, "HUMANS_SHIELD.MDS");
		};
		
		if (Hlp_GetInstanceID(ItNa_TarczaMistrzowska) == Hlp_GetInstanceID(item)) {
			TarczaLowcyUbrana = TRUE;
		};
	};
	};
};

func void UnEquip_Shield()
{
	//WillTarczaUbrana = FALSE;
	self.aivar[AIV_TARCZA] = false;
	B_AddFightSkill (self, NPC_TALENT_1H, 0);
	Mdl_RemoveOverlayMDS (self, "HUMANS_SHIELD.MDS");

	// jesli sciagasz jakakolwiek tarcze, to na pewno sciagasz ta tarcze
	TarczaLowcyUbrana = FALSE;
};

//----- Shield -----
INSTANCE Shields (C_Item)
{
	name 				=	"All shields :)";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_AllShields;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_AllShields ()
{
															// SILA  |  BLUNT/EDGE  |  POINT  |  FIRE  |  MAGIC  |  koszt  |  gdzie znaleŸæ?
	CreateInvItems (hero,ItNa_DrewnianaTarcza1, 1);			// 11		2				1			-		-		10			£owcy
	CreateInvItems (hero,ItNa_DrewnianaTarcza2, 1);			// 12		2				2			-		-		10			£owcy
	CreateInvItems (hero,ItNa_DrewnianaTarcza3, 1);			// 11		1				1			-		-		12			£owcy
	CreateInvItems (hero,ItNa_DrewnianaTarcza4, 1);			// 14		2				3			-		-		18			£owcy
	CreateInvItems (hero,ItNa_Shield_Skora, 1);				// 8		5				4			-		-		25			Bandyci
	CreateInvItems (hero,ItNa_Shield_Nordmar, 1);			// 18		6				8			-		-		32			Johny do kupienia KAP1
	CreateInvItems (hero,ItNa_Shield_Metal1, 1);			// 21		6				6			3		-		26			Johny do kupienia KAP1
	CreateInvItems (hero,ItNa_Shield_Metal2, 1);			// 23		5				6			6		-		31			Johny do kupienia KAP1
	CreateInvItems (hero,ItNa_Shield_Rose, 1);				// 25		5				5			3		5		80			W tajnym zakamarku (las OC)
	CreateInvItems (hero,ItNa_TarczaLowcy, 1);				// 28		8				7			4		5		180			Johny do kupienia KAP2
	CreateInvItems (hero,ItNa_MalaPawez, 1);				// 26		7				6			3		6		370			Ma siê ni¹ biæ NASZ_301_Bandyta
	CreateInvItems (hero,ItNa_KutaTarcza, 1);				// 34		9				10			-		-		380			Pod rockcamp w jaskini z golemami
	CreateInvItems (hero,ItNa_StalowaTarczaLowcy, 1);		// 35		8				8			6		6		460			Johny do kupienia KAP3
	CreateInvItems (hero,ItNa_Shield_Poludnie, 1);			// 38		12				14			4		7		660			W kufrze w krypcie pod bandytami
	CreateInvItems (hero,ItNa_TarczaNajemnika, 1);			// 36		10				12			8		4		690			W twierdzy, wisi na œcianie w spalonym domku
	CreateInvItems (hero,ItNa_TarczaZBrazu, 1);				// 42		12				13			10		8		700			W Nowym Obozie, w skrzyni na górze drewnianej konstrukcji
	CreateInvItems (hero,ItNa_TarczaCzaszki, 1);			// 44		11				16			12		9		740			W górskiej fortecy w skrzyni na prawo od Cat-Sana
	CreateInvItems (hero,ItNa_TarczaRycerza, 1);			// 51		14				13			11		10		800			W podziemiach zamku w skrzyni
	CreateInvItems (hero,ItNa_TarczaZguby, 1);				// 53		15				12			12		13		830			W kufrze Y'Beriona
	CreateInvItems (hero,ItNa_Krolewska, 1);				// 59		18				12			14		18		875			W zamku nad ³ó¿kiem w komnacie, jak siê idzie na najwy¿sz¹ wie¿ê
	CreateInvItems (hero,ItNa_TarczaWilczegoRycerza, 1);	// 73		21				15			18		18		920			W obozie orków -> na prawym statku
	CreateInvItems (hero,ItNa_Shield_Paladin, 1);			// 62		22				14			13		24		910			Za palisad¹ ma mieæ przyjaciel martwy Rudolfa
	CreateInvItems (hero,ItNa_TarczaRuniczna, 1);			// 69		19				18			15		25		950			W kufrze na przeciwko Innosa
	CreateInvItems (hero,ItNa_TarczaMistrzowska, 1);		// 85		24				23			20		18		985			Jan j¹ dla nas zrobi w misji 'Komplet ³owcy'


};
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Metal1 (C_Item) 
{
    name		=	"Metalowa tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	26;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	6;
	protection [PROT_BLUNT]	=	6;
	protection [PROT_POINT]	=	5;
	protection [PROT_FIRE]	=	3;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	21;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"MetalShield1.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Metal2 (C_Item) 
{
    name		=	"Metalowa tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	31;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	5;
	protection [PROT_BLUNT]	=	5;
	protection [PROT_POINT]	=	6;
	protection [PROT_FIRE]	=	6;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	23;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"MetalShield2.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Paladin (C_Item) 
{
    name		=	"Tarcza paladyna";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	910;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	22;
	protection [PROT_BLUNT]	=	22;
	protection [PROT_POINT]	=	14;
	protection [PROT_FIRE]	=	13;
	protection [PROT_MAGIC]	=	24;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	62;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"PaladinShield.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Rose (C_Item) 
{
    name		=	"Ró¿ana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	80;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	5;
	protection [PROT_BLUNT]	=	5;
	protection [PROT_POINT]	=	5;
	protection [PROT_FIRE]	=	3;
	protection [PROT_MAGIC]	=	5;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	25;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"RozanaTarcza.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Poludnie (C_Item) 
{
    name		=	"Tarcza po³udniowców";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	660;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	12;
	protection [PROT_BLUNT]	=	12;
	protection [PROT_POINT]	=	14;
	protection [PROT_FIRE]	=	4;
	protection [PROT_MAGIC]	=	7;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	38;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaPoludniowcow1.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Skora (C_Item) 
{
    name		=	"Skórzana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	18;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	5;
	protection [PROT_BLUNT]	=	5;
	protection [PROT_POINT]	=	4;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	8;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"SkorzanaTarcza.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Shield_Nordmar (C_Item) 
{
    name		=	"Tarcza Nordmarczyka";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	32;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	6;
	protection [PROT_BLUNT]	=	6;
	protection [PROT_POINT]	=	8;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	18;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"NordmarShield1.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaCzaszki (C_Item) 
{
    name		=	"Tarcza czaszki";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	740;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	11;
	protection [PROT_BLUNT]	=	11;
	protection [PROT_POINT]	=	16;
	protection [PROT_FIRE]	=	12;
	protection [PROT_MAGIC]	=	9;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	44;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaCzaszki.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DrewnianaTarcza1 (C_Item) 
{
    name		=	"Drewniana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	10;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	2;
	protection [PROT_BLUNT]	=	2;
	protection [PROT_POINT]	=	1;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	11;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"DrewnianaTarcza1.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DrewnianaTarcza2 (C_Item) 
{
     name		=	"Drewniana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	10;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	2;
	protection [PROT_BLUNT]	=	2;
	protection [PROT_POINT]	=	2;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	12;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"DrewnianaTarcza2.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DrewnianaTarcza3 (C_Item) 
{
    name		=	"Drewniana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	12;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	1;
	protection [PROT_BLUNT]	=	1;
	protection [PROT_POINT]	=	1;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	11;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"DrewnianaTarcza3.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DrewnianaTarcza4 (C_Item) 
{
    name		=	"Drewniana tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	18;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	2;
	protection [PROT_BLUNT]	=	2;
	protection [PROT_POINT]	=	3;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	14;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"DrewnianaTarcza4.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaRuniczna (C_Item) 
{
    name		=	"Tarcza runiczna";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	950;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	19;
	protection [PROT_BLUNT]	=	19;
	protection [PROT_POINT]	=	18;
	protection [PROT_FIRE]	=	15;
	protection [PROT_MAGIC]	=	25;

	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	69;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaRuniczna.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaNajemnika (C_Item) 
{
    name		=	"Tarcza najemnika";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	690;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT]	=	10;
	protection [PROT_POINT]	=	12;
	protection [PROT_FIRE]	=	8;
	protection [PROT_MAGIC]	=	4;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	36;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaNajemnika.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaRycerza (C_Item) 
{
    name		=	"Tarcza rycerza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	800;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	14;
	protection [PROT_BLUNT]	=	14;
	protection [PROT_POINT]	=	13;
	protection [PROT_FIRE]	=	11;
	protection [PROT_MAGIC]	=	10;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	51;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaRycerza.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaZBrazu (C_Item) 
{
    name		=	"Tarcza z br¹zu";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	700;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	12;
	protection [PROT_BLUNT]	=	12;
	protection [PROT_POINT]	=	13;
	protection [PROT_FIRE]	=	10;
	protection [PROT_MAGIC]	=	8;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	42;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaZBrazu.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MalaPawez (C_Item) 
{
    name		=	"Ma³a pawê¿";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	370;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	7;
	protection [PROT_BLUNT]	=	7;
	protection [PROT_POINT]	=	6;
	protection [PROT_FIRE]	=	3;
	protection [PROT_MAGIC]	=	6;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	26;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"MalaPawez.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaLowcy (C_Item) 
{
    name		=	"Tarcza ³owcy";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	180;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	8;
	protection [PROT_BLUNT]	=	8;
	protection [PROT_POINT]	=	7;
	protection [PROT_FIRE]	=	4;
	protection [PROT_MAGIC]	=	5;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	28;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaLowcy.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_StalowaTarczaLowcy (C_Item) 
{
    name		=	"Stalowa tarcza ³owcy";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	460;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	8;
	protection [PROT_BLUNT]	=	8;
	protection [PROT_POINT]	=	8;
	protection [PROT_FIRE]	=	6;
	protection [PROT_MAGIC]	=	6;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	35;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"StalowaTarczaLowcy.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Krolewska (C_Item) 
{
    name		=	"Tarcza królewska";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	875;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	18;
	protection [PROT_BLUNT]	=	18;
	protection [PROT_POINT]	=	12;
	protection [PROT_FIRE]	=	14;
	protection [PROT_MAGIC]	=	18;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	59;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"Krolewska.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaWilczegoRycerza (C_Item) 
{
    name		=	"Tarcza wilczego rycerza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	920;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	21;
	protection [PROT_BLUNT]	=	21;
	protection [PROT_POINT]	=	15;
	protection [PROT_FIRE]	=	18;
	protection [PROT_MAGIC]	=	18;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	73;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaWilczegoRycerza.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KutaTarcza (C_Item) 
{
    name		=	"Kuta tarcza";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	380;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	9;
	protection [PROT_BLUNT]	=	9;
	protection [PROT_POINT]	=	10;
	protection [PROT_FIRE]	=	0;
	protection [PROT_MAGIC]	=	0;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	34;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"KutaTarcza.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaZguby (C_Item) 
{
    name		=	"Tarcza zguby";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	830;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT]	=	15;
	protection [PROT_POINT]	=	12;
	protection [PROT_FIRE]	=	12;
	protection [PROT_MAGIC]	=	13;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	53;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaZguby.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TarczaMistrzowska (C_Item) 
{
    name		=	"Tarcza mistrzowska";

    mainflag	=	ITEM_KAT_NF;
    flags		=	ITEM_SHIELD;
    value 		=	985;

    on_equip	=	Equip_Shield;
    on_unequip	=	UnEquip_Shield;

	protection [PROT_EDGE]	=	24;
	protection [PROT_BLUNT]	=	24;
	protection [PROT_POINT]	=	23;
	protection [PROT_FIRE]	=	20;
	protection [PROT_MAGIC]	=	19;

	
	cond_atr[2]		=	ATR_STRENGTH;
    cond_value[2]	=	85;
	TEXT[0]			= 	NAME_Str_needed;        
    COUNT[0]		=	cond_value[2];

    visual			=	"TarczaMistrzowska.3ds";
    material		=	MAT_METAL;

    description		=	name;

	TEXT[1]	=	NAME_Prot_Edge;		COUNT[1]	=	protection[PROT_EDGE];
    TEXT[2]	=	NAME_Prot_Point;	COUNT[2]	=	protection[PROT_POINT];
	TEXT[3]	=	NAME_Prot_Fire;		COUNT[3]	=	protection[PROT_FIRE];
	TEXT[4]	=	NAME_Prot_Magic;	COUNT[4]	=	protection[PROT_MAGIC];
	TEXT[5]	=	NAME_Value;			COUNT[5]	=	value;
};
