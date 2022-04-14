// *************************
// unbenutzte Item - Visuals
// *************************

//ItMw_2H_Sword_Sleeper_01	// Uriziel ungeladen
//ItMw_2H_Sword_Sleeper_02	// Uriziel geladen

//ItMw_2H_Axe_Old_03		// alter Richter
//ItMw_2H_Axe_Old_01		// alte Streitaxt

//ItMw_1H_Sword_Broad_01 	// Breitschwert 1h
//ItMw_1H_Sword_Long_03		// Hassbringer
//ItMw_1H_Sword_05			// Kriegsschwert
//ItMw_1H_Sword_04			// Kampfschwert
//ItMw_1H_Sword_02			// Richtschwert
//ItMw_2H_Staff_02			// Richtstab
//ItMw_2H_Staff_01			// Kampfstab
//ItMw_1H_Scythe_01			// Schnitter
//ItMw_1H_Sword_Short_02	// Bauernwehr
//ItMw_1H_Sword_Short_01	// Kurzschwert

//ItMw_1H_Poker_01			// Sch�rhaken

// *****************************************************
// Waffen in der Welt (ab Kapitel 1)
// ---------------------------------
// Hier alle Waffen, die bei mortal-NSCs 
// oder in die Welt objektiert zu finden sind
// Alle haben sehr geringen Wert
// Alle k�nnen (theoretisch) in Kapitel 1 erlangt werden
// *****************************************************
INSTANCE ItMw_1h_Vlk_Dagger (C_Item)
{	
	name 				=	"Sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKDolch;

	damageTotal  		= 	5;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_01 (C_Item)
{	
	name 				=	"Pogrzebacz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Schuerhaken;

	damageTotal  		= 	5;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schuerhaken;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"Itmw_005_1h_poker_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Bau_Axe (C_Item)
{	
	name 				=	"Sierp";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_BauAxe;

	damageTotal  		= 	7;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_BauAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"Itmw_007_1h_sickle_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Mace (C_Item)
{	
	name 				=	"Laska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_VLKMace;

	damageTotal  		= 	8;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_VLKMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"Itmw_008_1h_pole_01.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_03 (C_Item)
{	
	name 				=	"Pa�ka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Belegnagel;

	damageTotal  		= 	8;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Belegnagel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_008_1h_mace_light_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Bau_Mace (C_Item)
{	
	name 				=	"Laga";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_BauMace;

	damageTotal  		= 	6;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_BauMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"ItMw_010_1h_Club_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Axe (C_Item)
{	
	name 				=	"Top�r";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	40;

	damageTotal  		= 	10;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"Itmw_010_1h_vlk_hatchet_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_04 (C_Item)
{	
	name 				=	"M�ot kowalski";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	10;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword1 (C_Item)
{	
	name 				=	"Kr�tki miecz stra�y";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword1;

	damageTotal  		= 	10;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword1;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_010_1h_Sword_short_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Nagelknueppel (C_Item)
{	
	name 				=	"Maczuga z kolcami";  //f�r Banditen

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelknueppel;

	damageTotal  		= 	12;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelknueppel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_012_1h_Nailmace_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Sword_L_03 (C_Item)
{	
	name 				=	"N� na wilki";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	100;

	damageTotal  		= 	12;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsklinge;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword2 (C_Item)
{	
	name 				=	"Kiepski kr�tki miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword2;

	damageTotal  		= 	12;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Sense (C_Item)
{	
	name 				=	"Ma�a kosa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sense;

	damageTotal  		= 	12;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sense;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_012_1h_Scythe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Sword (C_Item)
{	
	name 				=	"Miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	250;

	damageTotal  		= 	13;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Nov_Mace (C_Item)
{	
	name 				=	"Pika bojowa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_NovMace;

	damageTotal  		= 	20;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_NovMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	15;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Bau_Axe (C_Item)
{	
	name 				=	"Top�r drwala";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Bau2hAxt;

	damageTotal  		= 	20;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Bau2hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	25;
	visual 				=	"ItMw_020_2h_Axe_Lumberjack_01.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2H_Axe_L_01 (C_Item) 
{    
    name                 =    "Kilof";
    
    mainflag             =     ITEM_KAT_NF;
    flags                 =     ITEM_2HD_AXE;
    
    material             =    MAT_METAL;

    value                 =    50;

    damageTotal            =     2;
    damagetype            =    DAM_EDGE;
    range                =      Range_Spitzhacke;        

    cond_atr[2]           =     ATR_STRENGTH;
    cond_value[2]          =     5;
    visual                 =    "ItMw_020_2h_Pickaxe_01.3DS";

    description            = name;
    //TEXT[2]            = NAME_Damage;                    COUNT[2]    = damageTotal;
    //TEXT[3]             = NAME_Str_needed;                COUNT[3]    = cond_value[2];
    //TEXT[4]             = NAME_TwoHanded;
    TEXT[5]                = NAME_Value;                    COUNT[5]    = value;
};
// *****************************************************
INSTANCE ItMw_1h_MISC_Sword (C_Item) 
{	
	name 				=	"Zardzewia�y kr�tki miecz";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscSword;

	damageTotal  		= 	15;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscSword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_020_1h_sword_old_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Misc_Axe (C_Item)
{	
	name 				=	"Zardzewia�y top�r";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscAxe;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	25;
	visual 				=	"ItMw_025_2h_Misc_Axe_old_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2H_Sword_M_01 (C_Item) 
{	
	name 				=	"Zardzewia�y miecz dwur�czny"; //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Misc2hSword;

	damageTotal			= 	25;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Misc2hSword;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	visual 				=	"ItMw_025_2h_Sword_old_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Mil_Sword (C_Item)
{	
	name 				=	"Kiepski szeroki miecz";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MilSchwert;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MilSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"Itmw_025_1h_Mil_Sword_broad_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Axe (C_Item)
{	
	name 				=	"Kiepski tasak";  //S�LDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hAxt;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_025_1h_sld_axe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Sword (C_Item)
{	
	name 				=	"Kiepski miecz";  //S�LDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_025_1h_sld_sword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ****** folgende Waffen sind eigentlich zu gut f�r Kapitel 1, NSCs sind aber noch VIEL zu stark ******
INSTANCE ItMw_2h_Sld_Axe (C_Item)
{	
	name 				=	"Kiepski top�r bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hAxe;

	damageTotal  		= 	35;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	40;
	visual 				=	"ItMw_035_2h_sld_axe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Sld_Sword (C_Item)
{	
	name 				=	"Kiepski miecz dwur�czny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	35;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	40;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Pal_Sword (C_Item)
{	
	name 				=	"Miecz paladyna";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalSchwert;

	damageTotal  		= 	30;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_030_1h_PAL_Sword_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Pal_Sword (C_Item)
{	
	name 				=	"Miecz dwur�czny paladyna";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal  		= 	40;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalZweihaender;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	40;
	visual 				=	"ItMw_040_2h_PAL_Sword_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ************************************
// Ork- und Echsenmenschenwaffen
// -----------------------------
// ACHTUNG: Orkwaffen k�nnen auch schon 
// in Kapitel 1 erlangt werden!
// ************************************
INSTANCE ItMw_2H_OrcAxe_01 (C_Item)
{	
	name 				=	"Krush Pach";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_01;

	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   40;
	visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_02 (C_Item)
{	
	name 				=	"Krush UrRok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_02;

	damageTotal			= 	35;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_02;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	45;
	visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_03 (C_Item)
{	
	name 				=	"Krush Agash";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_03;

	damageTotal			= 	45;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_03;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   60;
	visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_04 (C_Item)
{	
	name 				=	"Krush BrokDar";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_04;

	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_04;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   70;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_01 (C_Item) // *** f�r Drakonier!!! ***
{	
	name 				=	"Krush Varrok"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert;

	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_02 (C_Item) // *** f�r Orcritter!!! ***
{	
	name 				=	"Orkowy miecz wojenny"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert_01;

	damageTotal			= 	45;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert_01;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/

// *******************
// Kapitel 1 - H�ndler
// *******************
INSTANCE ItMw_ShortSword3 (C_Item)
{	
	name 				=	"Kr�tki miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	200;

	damageTotal  		= 	16;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_016_1h_Sword_short_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule (C_Item)
{	
	name 				=	"Pa�ka z kolcami";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule;

	damageTotal  		= 	18;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword4 (C_Item)
{	
	name 				=	"Wilczy kie�";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	100;

	damageTotal  		= 	20;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword4;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_020_1h_Sword_short_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegskeule (C_Item)
{	
	name 				=	"Pa�ka bojowa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegskeule;

	damageTotal  		= 	22;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Kriegskeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_022_1h_mace_war_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Richtstab (C_Item)
{	
	name 				=	"Kostur s�dziego";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Richtstab;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Richtstab;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_025_2h_Staff_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword5 (C_Item)
{	
	name 				=	"Dobry kr�tki miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword5;

	damageTotal  		= 	19;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	14;
	visual 				=	"ItMw_025_1h_Sword_short_05.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer1 (C_Item) 
{	
	name 				=	"M�ot wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer1;

	damageTotal			= 	28;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Kriegshammer1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_028_1h_warhammer_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Hellebarde (C_Item) 
{	
	name 				=	"Halabarda";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Hellebarde;

	damageTotal			= 	28;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Hellebarde;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	visual 				=	"itmw_028_2h_halberd_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule2 (C_Item)
{	
	name 				=	"Ci�ka pa�ka z kolcami";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule2;

	damageTotal  		= 	27;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	26;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schiffsaxt (C_Item)
{	
	name 				=	"Top�r marynarski";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schiffsaxt;

	damageTotal  		= 	30;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schiffsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	25;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Piratensaebel (C_Item)
{	
	name 				=	"Piracki kordelas";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	30;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert (C_Item)
{	
	name 				=	"Kiepski d�ugi miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	30;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ****************************
// Schmieden Kapitel 1 (Common)
// ****************************
INSTANCE ItMw_1H_Common_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	23;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 2 - H�ndler
// *******************
INSTANCE ItMw_Stabkeule (C_Item) 
{	
	name 				=	"Bu�awa drzewcowa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Stabkeule;

	damageTotal			= 	32;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Stabkeule;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	visual 				=	"ItMw_032_2h_staff_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender1 (C_Item) 
{	
	name 				=	"Lekki miecz dwur�czny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	460;

	damageTotal			= 	32;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Steinbrecher (C_Item)
{	
	name 				=	"Oskard";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Steinbrecher;

	damageTotal  		= 	35;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Steinbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	25;
	visual 				=	"ItMw_035_1h_mace_war_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Spicker (C_Item)
{	
	name 				=	"R�biczerep";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Spicker;

	damageTotal  		= 	35;
	damagetype 			=	DAM_BLUNT;	//Point Schaden f�hrt direkt zum Tod!!
	range    			=  	Range_Spicker;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_035_1h_mace_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt1 (C_Item) 
{	
	name 				=	"Lekki top�r bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt1;

	damageTotal			= 	35;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Streitaxt1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_035_2h_Axe_light_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert1 (C_Item)
{	
	name 				=	"Dobry miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	35;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert2 (C_Item)
{	
	name 				=	"D�ugi miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert2;

	damageTotal  		= 	37;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	27;
	visual 				=	"ItMw_037_1h_sword_long_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Doppelaxt (C_Item) 
{	
	name 				=	"Top�r obosieczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	750;

	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Doppelaxt;		

	on_equip		=	Equip_ItMw_Doppelaxt;
	on_unequip		=	UnEquip_ItMw_Doppelaxt;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;
	visual 				=	"ItMw_040_1h_Axe_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};

FUNC VOID Equip_ItMw_Doppelaxt()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, 5);
	};
};

FUNC VOID UnEquip_ItMw_Doppelaxt()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, -5);
	};
};

/********************************************************************************/
INSTANCE ItMw_Bartaxt (C_Item) 
{	
	name 				=	"Wielki top�r";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Bartaxt;

	damageTotal			= 	40;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Bartaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"ItMw_040_1h_axe_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Morgenstern (C_Item)
{	
	name 				=	"Bu�awa i �a�cuch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Morgenstern;

	damageTotal  		= 	45;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Morgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	45;
	visual 				=	"ItMW_045_1h_mace_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert3 (C_Item)
{	
	name 				=	"Kiepski miecz p�torar�czny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert3;

	damageTotal  		= 	45;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	45;
	visual 				=	"ItMw_045_1h_Sword_Bastard_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert4 (C_Item)
{	
	name 				=	"Dobry d�ugi miecz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	45;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	35;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 2
// *******************
INSTANCE ItMw_1H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_1;
	
	damageTotal			= 	Damage_Special_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_1;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_1;
	visual 				=	"ItMw_045_1h_Sword_smith_02.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_1;

	damageTotal			= 	Damage_Special_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_1;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_1;
	visual 				=	"ItMw_050_2h_Sword_smith_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 3 - H�ndler
// *******************
INSTANCE ItMw_Rapier (C_Item) 
{	
	name 				=	"Rapier";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1300;

	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rapier;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_DEXTERITY;  //!!!
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_050_1h_Sword_Rapier_01.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rubinklinge (C_Item) 
{	
	name 				=	"Rubinowe ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitkolben (C_Item)
{	
	name 				=	"Bu�awa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitkolben;

	damageTotal  		= 	50;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Streitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	45;
	visual 				=	"ItMw_050_1h_mace_war_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender2 (C_Item) 
{	
	name 				=	"Miecz dwur�czny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender2;	

	on_equip			=	Equip_2H_04;
	on_unequip			=	UnEquip_2H_04;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_055_2h_sword_light_05.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_04;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Runenschwert (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	55;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rabenschnabel (C_Item)
{	
	name 				=	"Kruczy Dzi�b";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal  		= 	58;
	damagetype 			=	DAM_BLUNT; // dzia�a na golemy
	range    			=  	Range_Rabenschnabel;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	50;
	visual 				=	"ItMw_058_1h_warhammer_02.3DS";

	description			= name;
	TEXT[0]				= "M�ot dla silnych my�liwych ze specjalnym k�ujcem.";
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2]				= NAME_Range;					COUNT[2]	= range;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert5 (C_Item)
{	
	name 				=	"Dobry miecz p�torar�czny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert5;

	damageTotal  		= 	58;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_058_1h_Sword_Bastard_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Inquisitor (C_Item)
{	
	name 				=	"Inkwizytor";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Inquisitor;

	damageTotal  		= 	60;
	damagetype 			=	DAM_EDGE;	//!!!
	range    			=  	Range_Inquisitor;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"ItMw_060_1h_mace_war_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt2 (C_Item)
{	
	name 				=	"Top�r bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt2;

	damageTotal  		= 	60;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Streitaxt2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_060_2h_axe_heavy_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender3 (C_Item)
{	
	name 				=	"Runa mocy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender3;

	damageTotal  		= 	60;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_060_2h_sword_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 3
// *******************
INSTANCE ItMw_1H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_2;

	damageTotal			= 	53;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_2;

	damageTotal			= 	76;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_2;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_070_2h_Sword_smith_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 4 - H�ndler
// *******************
INSTANCE ItMw_ElBastardo (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	65;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer2 (C_Item)
{	
	name 				=	"Ci�ki m�ot wojenny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer2;

	damageTotal  		= 	65;
	damagetype 			=	DAM_BLUNT;	
	range    			=  	Range_Kriegshammer2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 				=	"ItMw_065_1h_warhammer_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Meisterdegen (C_Item)
{	
	name 				=	"Miecz mistrzowski";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2000;

	damageTotal  		= 	65;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Meisterdegen;
	
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Dex_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Folteraxt (C_Item)
{	
	name 				=	"Katowski top�r";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Folteraxt;

	damageTotal  		= 	65;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Folteraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_065_2h_greataxe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Orkschlaechter (C_Item)
{	
	name 				=	"Orkowa Zguba";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschlaechter;

	damageTotal  		= 	65;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Orkschlaechter;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_065_1h_sword_bastard_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender4 (C_Item)
{	
	name 				=	"Ci�ki miecz dwur�czny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender4;

	damageTotal  		= 	70;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender4;		

	on_equip			=	Equip_2H_06;
	on_unequip			=	UnEquip_2H_06;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 				=	"ItMw_068_2h_sword_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schlachtaxt (C_Item)
{	
	name 				=	"Top�r wojenny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtaxt;

	damageTotal  		= 	70;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Schlachtaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Krummschwert (C_Item)
{	
	name 				=	"Kordelas";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Scimitar;

	damageTotal  		= 	63;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Scimitar;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Barbarenstreitaxt (C_Item)
{	
	name 				=	"Barbarzy�ski top�r bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Barbarenstreitaxt;

	damageTotal  		= 	75;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Barbarenstreitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	75;
	visual 				=	"ItMw_075_2h_axe_heavy_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Sturmbringer (C_Item)		//Joly: tr�gt None_101_Mario_DI, aber erst auf der Dracheninsel
{	
	name 				=	"Ostrze Burzy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sturmbringer;

	damageTotal  		= 	75;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sturmbringer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_075_2h_sword_heavy_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 4
// *******************
INSTANCE ItMw_1H_Special_03 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_03;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_3;

	damageTotal			= 	64;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_3;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_075_1h_sword_smith_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_03 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_03;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_3;

	damageTotal			= 	82;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_3;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_090_2h_sword_smith_04.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 5 - H�ndler
// *******************
INSTANCE ItMw_Berserkeraxt (C_Item)//Joly:Auf Dracheninsel beim Schwarzmagiernovizen
{	
	name 				=	"Top�r berserkera";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkeraxt;

	damageTotal  		= 	80;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Berserkeraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	80;
	visual 				=	"ItMw_080_2h_axe_heavy_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Drachenschneide (C_Item) 
{	
	name 				=	"Smocza Zguba";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Drachenschneide;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Drachenschneide;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"itMw_080_2h_sword_heavy_04.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 5
// *******************
INSTANCE ItMw_1H_Special_04 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_04;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_4;

	damageTotal			= 	87;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_4;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"ItMw_090_1h_sword_smith_05.3DS";

	description			= name;
	
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_04  (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_04;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_4;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	visual 				=	"ItMw_110_2h_sword_smith_05.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ************************
// Gesegnete Paladin-Waffen
// ************************
INSTANCE ItMw_1H_Blessed_01 (C_Item) 
{	
	name 				=	"Kiepskie ostrze magiczne";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_1;

	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_02 (C_Item) 
{	
	name 				=	"B�ogos�awione ostrze magiczne";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_03 (C_Item) 
{	
	name 				=	"Gniew Innosa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_3;

	damageTotal			= 	83;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_01 (C_Item) 
{	
	name 				=	"Kiepskie ostrze magiczne";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_1;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_02 (C_Item) 
{	
	name 				=	"Miecz Zakonu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_2;

	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_03 (C_Item) 
{	
	name 				=	"�wi�ty Kat";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[2]	= cond_value[2];
	TEXT[3]				= NAME_Range;					COUNT[3]	= range;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

