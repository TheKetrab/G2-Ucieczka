// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************
// Mana_:	Gibt an wieviel Manapunkte das Kraut beim Essen wiedergibt
// HP_:		Gibt an wieviel Lebenspunkte das Kraut beim Essen wiedergibt
// ************************************************************************************************

const int   Value_Weed				= 	0;		
const int	Value_Beet				=	3;		const int	HP_Beet				=	2;
const int	Value_SwampHerb			=	10;
 const int	Value_Mana_Herb_01		=	10;		const int	Mana_Mana_Herb_01	=	5;
 const int	Value_Mana_Herb_02		=	20;		const int	Mana_Mana_Herb_02	=	7;
 const int	Value_Mana_Herb_03		=	40;		const int	Mana_Mana_Herb_03	=	10;
 const int	Value_Health_Herb_01	=	20;		const int	HP_Health_Herb_01	=	6;
 const int	Value_Health_Herb_02	=	40;		const int	HP_Health_Herb_02	=	7;
 const int	Value_Health_Herb_03	=	60;		const int	HP_Health_Herb_03	=	10;
 const int	Value_Dex_Herb_01		=	250;
 const int	Value_Strength_Herb_01	=	500;
 const int	Value_Speed_Herb_01		=	100;	const int  Speed_Boost			= 15000; //15 Sekunden

const int	Value_Mushroom_01		=	10;		const int	HP_Mushroom_01		=	7;
const int	Value_Mushroom_02		=	30;		const int	HP_Mushroom_02		=	15;

const int	Value_Forestberry		=	10;		const int	HP_Forestberry		=	5;
const int	Value_Blueplant			=	10;		const int	HP_Blueplant		=	5;
												const int	Mana_Blueplant		=	5;
const int	Value_Planeberry		=	10;		const int	HP_Planeberry		=	5;

 const int	Value_Temp_Herb			=	100;		const int	HP_Temp_Herb		=	5;
 const int	Value_Perm_Herb			=	500;		const int	HP_Perm_Herb		=	5;

/******************************************************************************************/

INSTANCE ItPl_Weed(C_Item)
{	
	name 				=	"Chwasty";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weed;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Weed;
};

/******************************************************************************************/

INSTANCE ItPl_Beet (C_Item)
{	
	name 				=	"Rzepa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Beet;

	visual 				=	"ItPl_Beet.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Beet;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Beet;
};

func void Use_Beet ()
{			
	PercentHealSelf(HP_Beet,ATR_HITPOINTS);
};
/******************************************************************************************/	
INSTANCE ItPl_SwampHerb(C_Item)
{	
	name 				=	"Bagienne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_SwampHerb;

	visual 				=	"ItPl_SwampHerb.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_SwampHerb;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_SwampHerb;
};
	
	func void Use_SwampHerb ()
	{
		if (Npc_IsPlayer (self))
		{
			Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
		};
	};

/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_01(C_Item)
{	
	name 				=	"Ognista pokrzywa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_01;

	visual 				=	"ItPl_Mana_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_Mana;	
	COUNT[1]			= 	Mana_Mana_Herb_01*PlantSkill_Factor;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_01;
};
var int ManaHerb01Eaten;
	func void Use_Mana_Herb_01 ()
	{	
		if (Npc_IsPlayer(self) && ManaHerb01Eaten == FALSE) {
			ManaHerb01Eaten = TRUE;
			EatenPlants += 1;
		};
		//Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Mana_Herb_01*PlantSkill_Factor);
		PercentHealSelf(Mana_Mana_Herb_01,ATR_MANA);
	};
/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_02(C_Item)
{	
	name 				=	"Ogniste ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_02;

	visual 				=	"ItPl_Mana_Herb_02.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_02;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_Mana;	
	COUNT[1]			= 	Mana_Mana_Herb_02*PlantSkill_Factor;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_02;
};
var int ManaHerb02Eaten;
	func void Use_Mana_Herb_02 ()
	{	
		if (Npc_IsPlayer(self) && ManaHerb02Eaten == FALSE) {
			ManaHerb02Eaten = TRUE;
			EatenPlants += 1;
		};
	
		PercentHealSelf(Mana_Mana_Herb_02,ATR_MANA);
	};
/******************************************************************************************/
INSTANCE ItPl_Mana_Herb_03(C_Item)
{	
	name 				=	"Ognisty korzeñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mana_Herb_03;

	visual 				=	"ItPl_Mana_Herb_03.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mana_Herb_03;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_Mana;	
	COUNT[1]			= 	Mana_Mana_Herb_03*PlantSkill_Factor;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mana_Herb_03;
};
var int ManaHerb03Eaten;
	func void Use_Mana_Herb_03 ()
	{		
		if (Npc_IsPlayer(self) && ManaHerb03Eaten == FALSE) {
			ManaHerb03Eaten = TRUE;
			EatenPlants += 1;
		};
	
		PercentHealSelf(Mana_Mana_Herb_03,ATR_MANA);
	};
/******************************************************************************************/
INSTANCE ItPl_Health_Herb_01(C_Item)
{	
	name 				=	"Roœlina lecznicza";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_01;

	visual 				=	"ItPl_Health_Herb_01.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Health_Herb_01*PlantSkill_Factor;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_01;
};
var int HealthHerb01Eaten;
	func void Use_Health_Herb_01 ()
	{		
		if (Npc_IsPlayer(self) && HealthHerb01Eaten == FALSE) {
			HealthHerb01Eaten = TRUE;
			EatenPlants += 1;
		};
	
		PercentHealSelf(HP_Health_Herb_01,ATR_HITPOINTS);
	};
/******************************************************************************************/
INSTANCE ItPl_Health_Herb_02(C_Item)
{	
	name 				=	"Ziele lecznicze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_02;

	visual 				=	"ItPl_Health_Herb_02.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_02;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			=	HP_Health_Herb_02*PlantSkill_Factor;
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Health_Herb_02;
};
var int HealthHerb02Eaten;
	func void Use_Health_Herb_02 ()
	{			
		if (Npc_IsPlayer(self) && HealthHerb02Eaten == FALSE) {
			HealthHerb02Eaten = TRUE;
			EatenPlants += 1;
		};
	
		PercentHealSelf(HP_Health_Herb_02,ATR_HITPOINTS);
	};

/******************************************************************************************/
INSTANCE ItPl_Health_Herb_03(C_Item)
{	
	name 				=	"Korzeñ leczniczy";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Health_Herb_03;

	visual 				=	"ItPl_Health_Herb_03.3DS";

	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Health_Herb_03;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Health_Herb_03*PlantSkill_Factor;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Health_Herb_03;
};
var int HealthHerb03Eaten;
	func void Use_Health_Herb_03 ()
	{		
		if (Npc_IsPlayer(self) && HealthHerb03Eaten == FALSE) {
			HealthHerb03Eaten = TRUE;
			EatenPlants += 1;
		};
	
		PercentHealSelf(HP_Health_Herb_03,ATR_HITPOINTS);
	};


/******************************************************************************************/
INSTANCE ItPl_Dex_Herb_01(C_Item)
{	
	name 				=	"Goblinie jagody";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Dex_Herb_01;

	visual 				=	"ItPl_Dex_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Dex_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[0]				= 	"Zjedzenie kilku sztuk skutkuje wzrostem zrêcznoœci.";				

	//TEXT[1]				= 	NAME_Bonus_Dex;
	//COUNT[1]			= 	1;	
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Dex_Herb_01;
};

var int ZmiennaDexPlant;
var int DexHerbEaten;
FUNC VOID USE_Dex_Herb_01 ()
{	
	if (Npc_IsPlayer(self) && DexHerbEaten == FALSE) {
		DexHerbEaten = TRUE;
		EatenPlants += 1;
	};

	if (Npc_IsPlayer (self))
	{
		ZmiennaDexPlant = ZmiennaDexPlant + 1;

		if (ZmiennaDexPlant == 3)  
		{
			B_RaiseAttribute	(self, ATR_DEXTERITY, 1, FALSE);
			Snd_Play	("LevelUp");
			ZmiennaDexPlant = 0;
		};
	};
};

/******************************************************************************************/
INSTANCE ItPl_Strength_Herb_01(C_Item)
{	
	name 				=	"Smoczy korzeñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Strength_Herb_01;

	visual 				=	"ItPl_Strength_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Strength_Herb_01;
	scemeName			=	"FOOD";

	description			= 	name;

	TEXT[0]				= 	"Zjedzenie kilku sztuk skutkuje wzrostem si³y.";				

	//TEXT[1]				= 	NAME_Bonus_Str;				
	//COUNT[1]			= 	1;

	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Strength_Herb_01;
};

var int ZmiennaStrPlant;
var int StrHerbEaten;
FUNC VOID USE_Strength_Herb_01 ()
{
	if (Npc_IsPlayer(self) && StrHerbEaten == FALSE) {
		StrHerbEaten = TRUE;
		EatenPlants += 1;
	};

	if (Npc_IsPlayer (self))
	{
		ZmiennaStrPlant = ZmiennaStrPlant + 1;

		if (ZmiennaStrPlant == 3)  
		{
			B_RaiseAttribute	(self, ATR_STRENGTH, 1, FALSE);
			Snd_Play	("LevelUp");
			ZmiennaStrPlant = 0;
		};
	};
};
	
/******************************************************************************************/
INSTANCE ItPl_Speed_Herb_01(C_Item)
{	
	name 				=	"Zêbate ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Speed_Herb_01;

	visual 				=	"ItPl_Speed_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Speed_Herb_01;      
	scemeName			=	"FOOD";

	TEXT[3]				= 	NAME_Sec_Duration;		
    COUNT[3]			= 	Speed_Boost /1000;   
	
	description			= 	name;
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Speed_Herb_01;
 
	   
};  
var int SpeedHerbEaten;
	func void Use_Speed_Herb_01 ()                                               
	{		
		if (Npc_IsPlayer(self) && SpeedHerbEaten == FALSE) {
			SpeedHerbEaten = TRUE;
			EatenPlants += 1;
		};
	
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Speed_Boost);   
	};	
  	
  	
  	  
/******************************************************************************************/
INSTANCE ItPl_Mushroom_01(C_Item)
{	
	name 				=	"Piekielnik";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_01;

	visual 				=	"ItPl_Mushroom_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Mushroom_01;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mushroom_01;
};

	func void Use_Mushroom_01 ()
	{			
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_01);
		PercentHealSelf(HP_Mushroom_01,ATR_HITPOINTS);
		if (Npc_IsPlayer (self))
		{
			Dunkelpilz_Bonus = Dunkelpilz_Bonus + 1;
			
			if (Dunkelpilz_Bonus == 50)  
			{
				B_RaiseAttribute	(self, ATR_MANA_MAX, 5, FALSE);
				Npc_ChangeAttribute	(self, ATR_MANA, 5);
				Snd_Play	("LevelUp");
				Dunkelpilz_Bonus = 0;
			};
		};
	};
/******************************************************************************************/
INSTANCE ItPl_Mushroom_02(C_Item)
{	
	name 				=	"Du¿y grzyb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_02;

	visual 				=	"ItPl_Mushroom_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_02;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Mushroom_02;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	Value_Mushroom_02;
};

	func void Use_Mushroom_02 ()
	{			
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_02);
		PercentHealSelf(HP_Mushroom_02,ATR_HITPOINTS);
	};
/******************************************************************************************/
INSTANCE ItPl_Blueplant(C_Item)
{	
	name 				=	"Niebieski bez";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Blueplant;

	visual 				=	"ItPl_Blueplant.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Blueplant;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Blueplant;
	TEXT[2]				= 	NAME_Bonus_Mana;		
	COUNT[2]			= 	Mana_Blueplant;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Blueplant;
};
var int BlueplantEaten;
	func void Use_Blueplant ()
	{		
		if (Npc_IsPlayer(self) && BlueplantEaten == FALSE) {
			BlueplantEaten = TRUE;
			EatenPlants += 1;
		};
	
		//Npc_ChangeAttribute	(self,	ATR_MANA,	    Mana_Blueplant);
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Blueplant);
		PercentHealSelf(HP_Blueplant,ATR_HITPOINTS);
		PercentHealSelf(Mana_Blueplant,ATR_MANA);
	};
/******************************************************************************************/
INSTANCE ItPl_Forestberry (C_Item)
{	
	name 				=	"Leœna jagoda";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Forestberry;
	
	visual 				=	"ItPl_Forestberry.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Forestberry;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Forestberry;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Forestberry;

};
var int ForestberryEaten;
	FUNC VOID Use_Forestberry()
	{
		if (Npc_IsPlayer(self) && ForestberryEaten == FALSE) {
			ForestberryEaten = TRUE;
			EatenPlants += 1;
		};
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Forestberry);
		PercentHealSelf(HP_Forestberry,ATR_HITPOINTS);
		
	};
/******************************************************************************************/
INSTANCE ItPl_Planeberry (C_Item)
{	
	name 				=	"Polna jagoda";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Planeberry;
	
	visual 				=	"ItPl_Planeberry.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Planeberry;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Planeberry;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Planeberry;

};
var int PlantberryEaten;
	FUNC VOID Use_Planeberry()
	{
		if (Npc_IsPlayer(self) && PlantberryEaten == FALSE) {
			PlantberryEaten = TRUE;
			EatenPlants += 1;
		};
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Planeberry);
		PercentHealSelf(HP_Planeberry,ATR_HITPOINTS);
	};
/******************************************************************************************/


//******************************************************************************************
//		Pflanze zum brauen von temporären und permanten Tränken
//******************************************************************************************


INSTANCE ItPl_Temp_Herb(C_Item)
{	
	name 				=	"Rdest polny";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Temp_Herb;

	visual 				=	"ItPl_Temp_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Temp_Herb;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Temp_Herb;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Temp_Herb;
};
var int TempHerbEaten;
	FUNC VOID Use_Temp_Herb()
	{
		if (Npc_IsPlayer(self) && TempHerbEaten == FALSE) {
			TempHerbEaten = TRUE;
			EatenPlants += 1;
		};
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Temp_Herb);
		PercentHealSelf(HP_Temp_Herb,ATR_HITPOINTS);
	};


INSTANCE ItPl_Perm_Herb(C_Item)
{	
	name 				=	"Szczaw królewski";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;	

	value 				=	Value_Perm_Herb;

	visual 				=	"ItPl_Perm_Herb.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Perm_Herb;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Perm_Herb;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Perm_Herb;
};
var int PermHerbEaten;
	FUNC VOID Use_Perm_Herb()
	{
		if (Npc_IsPlayer(self) && PermHerbEaten == FALSE) {
			PermHerbEaten = TRUE;
			EatenPlants += 1;
		};
		//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Perm_Herb);
		PercentHealSelf(HP_Perm_Herb,ATR_HITPOINTS);
	};

