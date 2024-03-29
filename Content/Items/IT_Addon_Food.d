

/******************************************************************************************/
//	RUM																	//
/******************************************************************************************/

CONST int Value_Rum = 30;
CONST int Mana_Rum  = 10;

const int Value_Grog = 10;
const int HP_Grog	 = 4;

const int Value_SchnellerHering	= 30;	

const int Value_LousHammer = 30;
const int Mana_LousHammer = 1;

const int Value_SchlafHammer = 60;

const int Value_FireStew = 180;
const int STR_FireStew	= 1;
const int HP_FireStew	= 5;
const int STR_MeatSoup	= 1;

const int Value_Shellflesh	= 60;
const int HP_Shellflesh		= 4;
//---------------------------------------------------------------------
//	Muschelfleisch
//---------------------------------------------------------------------
INSTANCE ItFo_Addon_Shellflesh (C_Item)
{
	name 				=	"Ostryga";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shellflesh;

	visual 				=	"ItAt_Meatbugflesh.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Shellflesh;

	description			= 	name;
	TEXT[0]				= 	"Soczysta ostryga";
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = HP_Shellflesh;
	TEXT[2]				= 	"Smaczna nawet na surowo";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Shellflesh()
	{
		 PercentHealSelf(HP_Shellflesh,ATR_HITPOINTS);
	};

//-----------------------------
INSTANCE ItFo_Addon_Rum(C_Item)
{
	name 			=	"Rum";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRum;
	scemeName		=	"POTIONFAST";

	description		= 	"Bia�y rum";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Rum;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

	FUNC VOID UseRum()
	{
		if (Npc_IsPlayer(self)) {
			DrunkTrinken += 1;
		};
		
		Npc_ChangeAttribute(self,ATR_MANA,Mana_Rum);
	};

//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Addon_Grog(C_Item)
{
	name 			=	"Grog";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseGrog;
	scemeName		=	"POTIONFAST";

	description		= 	"Grog prawdziwego marynarza";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;

};

	FUNC VOID UseGrog()
	{
		if (Npc_IsPlayer(self)) {
			DrunkTrinken += 1;
		};
	
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
		PercentHealSelf(HP_Grog,ATR_HITPOINTS);
	};	
//-----------------------------
//	Lou's Hammer (mit Manaessenz)
//-----------------------------

var int Hammer_Once;	//damit der Magier sich nicht f�r 30 Gold superviel MANA kauft!!

INSTANCE ItFo_Addon_LousHammer (C_Item)
{
	name 			=	"M�ot Lou";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLouHammer;
	scemeName		=	"POTIONFAST";

	description		= 	"M�ot Lou";
	
	TEXT[1]			= 	"Efekt           ???";				
	
	
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_LousHammer;

};

	FUNC VOID UseLouHammer()
	{
		if Hammer_Once == FALSE
		{
			B_RaiseAttribute (self,	ATR_MANA_MAX, Mana_LousHammer,FALSE);
			Hammer_Once = TRUE;
		};	
	};
//-------------------------------------------------------
//	Lou's doppelter Hammer (Schlafhammer)
//--------------------------------------------------------
INSTANCE ItFo_Addon_SchlafHammer (C_Item)
{
	name 			=	"Podw�jny M�ot";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_SchlafHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchlafHammer;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	
	TEXT[1]			= 	"Pokona nawet najtwardszego pijaka...";				

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchlafHammer;

};

	FUNC VOID UseSchlafHammer()
	{
		if (self.attribute[ATR_HITPOINTS] > 2)
		{
			self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS]/2);
		};
	};
	
	
//#############################################
//			Schneller Hering
//#############################################
	
INSTANCE ItFo_Addon_SchnellerHering(C_Item)
{
	name 			=	"Szybki �led�";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Schnellerhering;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchnellerHering;
	scemeName		=	"POTION";

	description		= 	name;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchnellerHering;

};

	FUNC VOID UseSchnellerHering()
	{
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
		if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
		{
			//AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
			//AI_Wait (self ,2);
			//AI_PlayAni (self, "T_HEASHOOT_2_STAND");
			//Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 120000);		//2min
		};	
		//Player_KnowsSchnellerHering = TRUE;
	};	
//-------------------------------------------------------
//------------- Pfeffer  -----------------------
//-------------------------------------------------------
INSTANCE ItFo_Addon_Pfeffer_01	(C_Item)
{
	name 				=	"Torebka pieprzu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";

	material 			=	MAT_LEATHER;
		
	description			= 	"Ziarna czerwonego pieprzu";
	
	TEXT[0]				= 	"z Wysp Po�udniowych.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"UWAGA OSTRE!";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------
// Feuergeschnetzeltes mit hammer schnaps
//-------------------------------------------------------
INSTANCE ItFo_Addon_FireStew (C_Item)
{	
	name 				=	"Ognisty gulasz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FireStew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FireStew;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_Str;		COUNT[1]	= STR_FireStew;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FireStew;

};

	FUNC VOID Use_FireStew()
	{
		B_RaiseAttribute 	(self,	ATR_STRENGTH,	STR_FireStew,FALSE);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	HP_FireStew);
		
		PrintScreen ("St�rke und Lebensenergie gesteigert!", -1, 34, FONT_ScreenSmall,2); 
	};
//-------------------------------------------------------
// Fleischsuppe
//-------------------------------------------------------
INSTANCE ItFo_Addon_Meatsoup (C_Item)
{	
	name 				=	"Gulasz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatSoup;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_STR;		COUNT[1]	= STR_MeatSoup;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FishSoup;

};

	FUNC VOID Use_MeatSoup()
	{
		var string ConcatText;
		ConcatText = ConcatStrings (NAME_Bonus_Str, IntToString (STR_MeatSoup));
		B_RaiseAttribute (self,	ATR_STRENGTH, STR_MeatSoup, FALSE);
		PrintScreen (ConcatText, -1, 34, FONT_ScreenSmall,2); 
	};
	
	
	
	
