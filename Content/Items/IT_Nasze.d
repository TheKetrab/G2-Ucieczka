
// **********************************************
// . . . . . . . . . . Funkcje . . . . . . . . . .
// **********************************************


var int Kirgo_Oszust;
var int Rabon_Sakwa;


func int Wld_GetTimeHour()
{
    var int h;
    h = divf(MEM_WorldTimer.worldTime, mkf(4167));
    h = divf(h, mkf(60));
    return truncf(h);
}; 

//by Avallach
func void Npc_SwitchInventoryLoop (var c_npc npc, var int category)
{
        //print(ConcatStrings("Czyszczenie eq: ", npc.name));
        var int amount;
        amount = Npc_GetInvItemBySlot (npc, category, 0);
        //print(ConcatStrings(item.name, IntToString(amount)));
        if (amount>0)
        {
                NPC_RemoveInvItems (npc, Hlp_GetInstanceID (item), amount);
				Mob_CreateItems ("SKRZYNIA_ORCCITY", Hlp_GetInstanceID (item), amount);
                Npc_SwitchInventoryLoop(npc, category);
        }
        else if (category < INV_CAT_MAX-1)
        {
                //print(ConcatStrings("Zmiana kategorii na: ", IntToString(category+1)));
                Npc_SwitchInventoryLoop(npc, category+1);
        };
};

func void Npc_SwitchInventoryLoop_Kopalnia (var c_npc npc, var int category)
{
        //print(ConcatStrings("Czyszczenie eq: ", npc.name));
        var int amount;
        amount = Npc_GetInvItemBySlot (npc, category, 0);
        //print(ConcatStrings(item.name, IntToString(amount)));
        if (amount>0)
        {
                NPC_RemoveInvItems (npc, Hlp_GetInstanceID (item), amount);
				Mob_CreateItems ("CHEST_KOPALNIA", Hlp_GetInstanceID (item), amount);
                Npc_SwitchInventoryLoop_Kopalnia(npc, category);
        }
        else if (category < INV_CAT_MAX-1)
        {
                //print(ConcatStrings("Zmiana kategorii na: ", IntToString(category+1)));
                Npc_SwitchInventoryLoop_Kopalnia(npc, category+1);
        };
};

func int Inv_IsEmpty(var c_npc _slf)
{
	var oCNpc slf; slf = hlp_getnpc(_slf);
	var zCListSort l; l = _^(slf.inventory2_oCItemContainer_contents);
	var c_item itm; itm = _^(l.next);
	var int i; i = 0;
	var int j; j = 0;
	if(itm.mainflag & ITEM_KAT_ARMOR || itm.flags & item_active)
	{
		i+=1;
	}
	else
	{
		j+=1;
	
	};
	
	while(l.next);
		l = _^(l.next);
		itm = _^(l.next);
		if(itm.mainflag & ITEM_KAT_ARMOR || itm.flags & item_active)
		{
			i+=1;
		}
		else
		{
			j+=1;
		};
		
	end;

	if(!j && i) 
	{
		return true;
	};
	
	return false;
};

func void Npc_AssessThieft_S(var int victimPtr, var int thieftPtr)
{
	const int oCNpc__AssessThieft_S = 7718608;
	CALL_PtrParam(thieftPtr); 
	CALL__Thiscall(victimPtr,oCNpc__AssessThieft_S);
};

func void Loot_NothingThere()
{
	var int rnd; rnd = Hlp_Random (100);
	
	if (rnd <= 40)	
	{	
		Print(PRINT_NOTHINGTOGET);
		B_Say_Overlay (hero, hero, "$NOTHINGTOGET");	
	}
	else if (rnd <= 80)	
	{	
		Print(PRINT_NOTHINGTOGET02);
		B_Say_Overlay (hero, hero, "$NOTHINGTOGET02");	
	}
	else if (rnd <= 99)	
	{	
		Print(PRINT_NOTHINGTOGET03);
		B_Say_Overlay (hero, hero, "$NOTHINGTOGET03");	
	};
};

FUNC void QuickLoot (var C_NPC slf, var C_NPC oth){
    var int amount;
    var int itmID; 
    var int i; i = 0;
	var string txt;
	var int txtFix; txtFix = 0;

	
	var int loop; loop = MEM_StackPos.position;
   
   //na wszelki wypadek + mo�na to te� u�y� dla innych npc
	var int isOthPlayer; isOthPlayer = Npc_IsPlayer(oth);
	if (i < INV_CAT_MAX)
    {
        var int slotNr;    slotNr = 0;
        var int inLoop;    inLoop = MEM_StackPos.position;
        amount = NPC_GetInvItemBySlot(slf, i, slotNr);
        itmID = Hlp_GetInstanceID(Item);
		
		if (amount > 0)
        {			
			if (item.mainflag & ITEM_KAT_ARMOR || item.flags & item_active)
			{
				slotNr += 1;
				MEM_StackPos.position = inLoop;
			};
			
			if(isOthPlayer)
			{
				txt = ConcatStrings("Spl�drowa�e�: ",slf.name);
				
				if(!txtFix)
				{		
					PrintS_Ext(txt, RGBA(255,255,255,0));
					txtFix = true;

					var int heroPtr; heroPtr = MEM_ReadInt(_hero);
					var int victimPtr; victimPtr = _@(slf);
					Npc_AssessThieft_S(victimPtr,heroPtr);
				};
					
				
				txt = item.name;
				txt = ConcatStrings(txt, ", ");
				txt = ConcatStrings(txt, IntToString(amount));
				txt = ConcatStrings(txt, " szt.");
				PrintS_Ext(txt, RGBA(255,255,255,0));
			};
		
			CreateInvItems (oth, itmID, amount);
            Npc_RemoveInvItems (slf, itmID, amount);
            MEM_StackPos.position = inLoop;
			
        };
		//TODO:  czy to zostawi� lub usun�� hooka i przenis� na d�?? / bogu 
		if(i>=8 && !amount && !txtFix)
		{
			//Loot_NothingThere();
			var int rnd; rnd = Hlp_Random (100);
	
			if (rnd <= 40)	
			{	
				Print(PRINT_NOTHINGTOGET);
				B_Say_Overlay (hero, hero, "$NOTHINGTOGET");	
			}
			else if (rnd <= 80)	
			{	
				Print(PRINT_NOTHINGTOGET02);
				B_Say_Overlay (hero, hero, "$NOTHINGTOGET02");	
			}
			else if (rnd <= 99)	
			{	
				Print(PRINT_NOTHINGTOGET03);
				B_Say_Overlay (hero, hero, "$NOTHINGTOGET03");	
			};
		};
		i += 1;
        MEM_StackPos.position = loop;
    };
	
	/*
	if(!amount && !txtFix && isOthPlayer)
	{		
		Loot_NothingThere();
	};	*/
};


func void Npc_SwitchInventory (var c_npc npc)
{
        Npc_SwitchInventoryLoop(npc, 0);
};

func void Npc_SwitchInventory_Kopalnia (var c_npc npc)
{
        Npc_SwitchInventoryLoop_Kopalnia(npc, 0);
};

func void Equip_Item(var C_NPC slf, var int Item) 
{
    if (!Npc_HasItems (slf, Item)) 
    {
        CreateInvItems (slf, Item, 1);
    };

    CALL_PtrParam(MEM_InstToPtr(Item));
    CALL__thiscall(MEM_InstToPtr(slf), 7545792);
};

func void Unequip_Item(var C_NPC slf, var int Item) 
{
    CALL_PtrParam(MEM_InstToPtr(Item));
    CALL__thiscall(MEM_InstToPtr(slf), 7546560);
};

func void UleczIch(var c_npc slf)
{
    if(slf.aivar[AIV_PARTYMEMBER]==TRUE)
    {
		slf.attribute[ATR_HITPOINTS] =  slf.attribute[ATR_HITPOINTS_MAX]; // FIX Ucieczka 1.1 -> leczy na maxa
		//Npc_ChangeAttribute	(slf,ATR_HITPOINTS, +500);
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  slf, slf, 0, 0, 0, FALSE );
	};
};

func void ZabijWojownikow(var c_npc slf)
{
    if(slf.aivar[AIV_MM_REAL_ID]==ID_SKELETON)
    {
		B_KillNpc(slf);
	};
};

func void ADANOS_TRIGER ()
{
	if (ADANOS_JUMP == TRUE) {
		//PrintScreen	("Skok Done", -1,-1, FONT_ScreenSmall,3);
		AI_Teleport		(hero, "OW_ICEDRAGON_15");
		ADANOS_JUMP = FALSE;
		ADANOS_JUMP_DONE = TRUE;
	};
};

func void KOLCE_KLASZTOR ()
{
	B_KillNpc(self);
};



func void TARCZASTRZELECKA_TRIGER ()
{
	var int IloscTrafionychStrzalWTarcze;

	if(Npc_HasReadiedRangedWeapon(hero))
	{
	 	IloscTrafionychStrzalWTarcze = IloscTrafionychStrzalWTarcze + 1;
		
		if (IloscTrafionychStrzalWTarcze == 1)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("�uki i kusze: +1",-1,-1,FONT_Screen,2);
		};
		
		if (IloscTrafionychStrzalWTarcze == 3)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("�uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 7)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("�uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 15)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("�uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 31)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("�uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
	};

};

var int WillBylZapalisada;
func void TRIGGER_INORC ()
{
	// UWAGA: ten trigger Spacerowy chyba nie dzia�a,
	// taka sama funkcja jest wywo�ywana w ticktocku 1s
	Will_Zapalisada();
	WillBylZapalisada = TRUE;
};

func void XARDAS_TRIGER_1 ()
{
	B_KillNpc(self);
};

var int XardasTriger2OneTime;
func void XARDAS_TRIGER_2 ()
{
	if (XardasTriger2OneTime == FALSE) {

		
		AI_PlayAni (NASZ_429_WojownikCienia,"T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear",  NASZ_429_WojownikCienia, NASZ_429_WojownikCienia, 0, 0, 0, FALSE );
		Wld_SendTrigger ("XARDAS_OLD_MOVER_KRATA_2_SCRIPT");
		WojownikCieniaPrzyzywa = TRUE;
		ff_applyonceext(SecRitualXardasOld,1000,-1);
		XardasTriger2OneTime = TRUE;
	};
};

/*func void FINISH_TRIGGER ()
{
	if (KoniecGryOk == TRUE) {
		PrintScreen	("KONIEC GRY", -1,-1, FONT_ScreenSmall,3);
	};
};*/

func void FINISH ()
{
	if (HeroCanFinish) {
		//PrintScreen	("KONIEC GRY", -1,-1, "font_old_20_white.tga",2);
		PlayVideo ("G2UCIECZKAOUTRO.BIK");
		PlayVideo ("G2UCIECZKACREDITS.BIK");
		ExitSession ();
	};
};

func void WILL_SAY_END ()
{


};

var int StrzalZLukuOneTime;
func void STRZAL_Z_LUKU_SCRIPT ()
{
	if (StrzalZLukuOneTime == FALSE)
	{
		StrzalZLukuOneTime = TRUE;
		B_StartOtherRoutine (NASZ_019_Teshinoo, "GoToYou");
		B_LogEntry (TOPIC_OrcCity_In, "Dobra, otworzy�em kraty. A przede mn� co� jak... orkowe miasto.");
	};

	Wld_SendTrigger ("MOVER_ORCCITY_06");
	Wld_SendTrigger ("MOVER_ORCCITY_07");
};



/*func void TruciznaFunction1 ()
{
	if (WillZatruty < 1) {
		WillZatruty = 1;
		//PrintScreen	("zatruty 1", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta�e� otruty!", -1,-1, "font_old_20_white.tga",2);
		Snd_Play ("TRUCIZNA");
	};
};

func void TruciznaFunction2 ()
{
	if (WillZatruty < 2) {
		WillZatruty = 2;
		//PrintScreen	("zatruty 2", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta�e� otruty!", -1,-1, "font_old_20_white.tga",2);
		Snd_Play ("TRUCIZNA");
	};
};

func void TruciznaFunction3 ()
{
	if (WillZatruty < 3) {
		WillZatruty = 2;
		//PrintScreen	("zatruty 3", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta�e� otruty!", -1,-1, "font_old_20_white.tga",2);
		Snd_Play ("TRUCIZNA");
	};
};*/

func void B_EquipItem(var c_npc slf,var int instID)
{
	if(!Npc_GetInvItem(slf,instID))
	{
		return;
	};

};

func void B_UnequipMeleeWeapon(var c_npc slf)
{
	var c_item meleeweap;
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
	 	meleeweap = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		meleeweap = Npc_GetEquippedMeleeWeapon(slf);	
	};
	
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
		AI_RemoveWeapon(slf);	
	};
	var int itmID;var int itmAMOUNT;
	var c_item rangedWEAP;
	if(Npc_HasReadiedRangedWeapon(slf))
	{
	 	rangedWEAP = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		rangedWEAP = Npc_GetEquippedRangedWeapon(slf);	
	};
	itmID = Hlp_GetInstanceID(rangedWEAP);
	if(itmID)
	{
		AI_UnequipWeapons(slf);	
		B_EquipItem(slf,itmID);	
	};	
};


func void B_UnequipRangedWeapon(var c_npc slf)
{
	var c_item rangedWEAP;
	if(Npc_HasReadiedRangedWeapon(slf))
	{
	 	rangedWEAP = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		rangedWEAP = Npc_GetEquippedRangedWeapon(slf);	
	};
	
	if(Npc_HasReadiedRangedWeapon(slf))
	{
		AI_RemoveWeapon(slf);	
	};
	var int itmID;var int itmAMOUNT;
	var c_item meleeweap;
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
	 	meleeweap = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		meleeweap = Npc_GetEquippedMeleeWeapon(slf);	
	};	
	itmID = Hlp_GetInstanceID(meleeweap);
	if(itmID)
	{
		AI_UnequipWeapons(slf);	
		B_EquipItem(slf,itmID);	
	};	
};


// ******************************************************
INSTANCE ItNa_Wiernosc (C_Item)
{
	name 				=	"Pier�cie� Wierno�ci";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	0;

	visual 				=	"ItMi_SilverRing.3DS";
	material 			=	MAT_METAL;

	on_equip			=	Equip_ItNa_Wiernosc;
	on_unequip			=	UnEquip_ItNa_Wiernosc;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
};

func void Equip_ItNa_Wiernosc() {

	if (self.guild == GIL_OUT) { 	
		Wld_PlayEffect("Spellfx_Lightstar_Orange",  self, self, 0, 0, 0, FALSE ); 
		// �uki +5
		self.HitChance[NPC_TALENT_BOW] +=5;
	};
};

func void UnEquip_ItNa_Wiernosc() {

	if (self.guild == GIL_OUT) {
		// �uki -5
		self.HitChance[NPC_TALENT_BOW] -=5;
	};
};



// *******************
// Wiarolomca
// *******************

INSTANCE ItNa_Pierscien_Glodu(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	0;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Pierscien_Glodu;
	on_unequip			=	UnEquip_ItNa_Pierscien_Glodu;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Pier�cie� g�odu";
	
	TEXT[0]				= "Wykuty z nieznanego materia�u, w chwili kiedy za�o�ysz";
	TEXT[1]				= "go na d�o�, wyczuwasz wok� siebie tajemnicz� aur�,";
	TEXT[2]				= "kt�ra muska twoj� dusz�.";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
		
	INV_ZBIAS			= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

// ******************************************************
INSTANCE ItNa_Pierscien_Zarazy(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	0;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Pierscien_Zarazy;
	on_unequip			=	UnEquip_ItNa_Pierscien_Zarazy;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Pier�cie� zarazy";
	
	TEXT[0]				= "Materia�, z kt�rego zosta� stworzony, pozostaje";
	TEXT[1]				= "dla ciebie zagadk�. Je�eli odwa�ysz si� za�o�y� go";
	TEXT[2]				= "na d�o�, zaczniesz odczuwa� lekki dyskomfort,";
	TEXT[3]				= "tak jakby toczy�a ci� jaka� choroba.";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
		
	INV_ZBIAS			= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

// ******************************************************
INSTANCE  ItNa_Amulet_Wojny(C_Item)
{
	name 					=	NAME_Amulett;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_AMULET;

	value 					=	0;

	visual 					=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Amulet_Wojny;
	on_unequip			=	UnEquip_ItNa_Amulet_Wojny;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Amulet wojny";
	
	TEXT[0]				= "Ci�ki w dotyku, kiedy go nosisz czujesz si� tak jakby";
	TEXT[1]				= "zawieszono ci kamie� na szyi. Zdaje si�, �e straci�e�";
	TEXT[2]				= "cz�� witalnych si� w zamian za inne korzy�ci...";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
	INV_ZBIAS			= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

// ******************************************************
INSTANCE  ItNa_Pas_Smierci (C_Item)
{
	name 				=	NAME_Addon_Belt;

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_BELT|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Belt_10.3ds";

	visual_skin 		=	0;
	material 			=	MAT_METAL;
	on_equip			=	Equip_ItNa_Pas_Smierci;
	on_unequip		=	Unequip_ItNa_Pas_Smierci;

	description		=  "Pas �mierci";

	TEXT[0]			=	"Wystarczy z�apa� go w d�onie, aby odczu� lodowaty";			
	TEXT[1]			=	"oddech chwytaj�cy tw� dusz� w obj�cia. Odczuwasz";
	TEXT[2]			= "niepok�j, tak jakby kto� przeszed� po twoim grobie.";

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx			= INVCAM_ENTF_MISC2_STANDARD;
	
};

// *******************
// Magnat
// *******************

INSTANCE ItNa_Pierscien_Arto(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	0;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Pierscien_Arto;
	on_unequip			=	UnEquip_ItNa_Pierscien_Arto;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Pier�cie� Arto";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
		
	INV_ZBIAS			= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

// ******************************************************
INSTANCE ItNa_Pierscien_Blizny(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	0;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Pierscien_Blizny;
	on_unequip			=	UnEquip_ItNa_Pierscien_Blizny;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Pier�cie� Blizny";
	
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
		
	INV_ZBIAS			= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

// ******************************************************
INSTANCE  ItNa_Amulet_Gomeza(C_Item)
{
	name 					=	NAME_Amulett;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_AMULET;

	value 					=	0;

	visual 					=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Amulet_Gomeza;
	on_unequip			=	UnEquip_ItNa_Amulet_Gomeza;

	wear						= 	WEAR_EFFECT;
	effect					=	"SPELLFX_ITEMGLIMMER"; 

	description			= "Amulet Gomeza";
		

	TEXT[2]				= NAME_ADDON_BONUS_1H;			COUNT[2]	= 5;
	TEXT[3]				= NAME_ADDON_BONUS_2H;			COUNT[3]	= 5;

		
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
	INV_ZBIAS			= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

// ******************************************************
INSTANCE  ItNa_Pas_Bartholo (C_Item)
{
	name 				=	NAME_Addon_Belt;

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_BELT|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Belt_10.3ds";

	visual_skin 		=	0;
	material 			=	MAT_METAL;
	on_equip			=	Equip_ItNa_Pas_Bartholo;
	on_unequip		=	Unequip_ItNa_Pas_Bartholo;

	description		=  "Pas Bartholo";

	
	TEXT[2]			= NAME_Bonus_HP;		COUNT[2]		= 5;	
	TEXT[3] 		= NAME_Bonus_Mana;		COUNT[3]		= 5;
	

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx			= INVCAM_ENTF_MISC2_STANDARD;
	
};



// *******************
// Duch Kurgana 
// *******************
/*INSTANCE ItNa_KurganGhost (C_ITEM)
{	
	name 		=	"Duch Kurgana";
	mainflag 	=	ITEM_KAT_DOCS;
	flags 		=	ITEM_MISSION;
	value 		=	250;
	visual 		=	"ItWr_Scroll_01.3DS";	
	material 	=	MAT_LEATHER;
	on_state[0]	=	UseKurganGhost;
	scemeName	=	"MAP";
	description	=	name;
	Text[0]		=	"Przywo�uje ducha Kurgana.";
};

func void UseKurganGhost ()
{
	AI_PlayAni (self,"T_PRACTICEMAGIC4");
	Wld_InsertNpc 	(NASZ_401_Kurgan, "ADW_ANCIENTGHOST");
	Wld_PlayEffect("spellFX_Maya_Ghost",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Snd_Play ("MFX_GhostVoice"); 
	Snd_Play ("MFX_Firestorm_Cast"); 
	Snd_Play ("MFX_Lightning_Origin");
};
*/

/*******************************************************************************************/
INSTANCE ItNa_KurganDuch (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
//	flags 				=	ITEM_MULTI;
	flags 		=	ITEM_MISSION;
	value 				=	100;

	visual				=	"ItSc_Firerain.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonKurgan;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;
	on_state[0]			=	UseKurganGhost;
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	"Przyzwanie Ducha Kurgana";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
		
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

func void UseKurganGhost ()
{
/*	AI_PlayAni (self,"T_PRACTICEMAGIC4");
	Wld_InsertNpc 	(NASZ_401_Kurgan, "ADW_ANCIENTGHOST");
	Wld_PlayEffect("spellFX_Maya_Ghost",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Snd_Play ("MFX_GhostVoice"); 
	Snd_Play ("MFX_Firestorm_Cast"); 
	Snd_Play ("MFX_Lightning_Origin");
*/
};



// **********************************************
// . . . . . . . . . . Bronie . . . . . . . . . .
// **********************************************

INSTANCE ItNa_OstrzeLowcy (C_Item)
{	
	name 		=	"Ostrze �owcy";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_AXE;				//flaga
	material 	=	MAT_METAL;				//materia�

	value 		=	1000;					//warto��

	on_equip	=	Equip_ItNa_OstrzeLowcy;
	on_unequip	=	UnEquip_ItNa_OstrzeLowcy;
	
	damageTotal  	= 	80;					//obra�enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra�e�
	range    	=  	120;					//zasi�g

	cond_atr[2]   	=	ATR_STRENGTH;				//si�a/zr�czno��
	cond_value[2]  	=	80;					//ile potrzeba
	visual 		=	"ItMw_065_1h_sword_bastard_03.3DS";	//wygl�d

	description	= name;
	TEXT[2]		= NAME_Damage;		COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;	COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;		COUNT[5]	= value;
};

FUNC VOID Equip_ItNa_OstrzeLowcy()
{
 	if Npc_IsPlayer (self)
	{ 
		OstrzeLowcyUbrane = TRUE;
	};
};

FUNC VOID UnEquip_ItNa_OstrzeLowcy()
{
 	if Npc_IsPlayer (self)
	{ 
		OstrzeLowcyUbrane = FALSE;
	};
};

INSTANCE ItNa_ShaBaNakk (C_Item)
{	
	name 				=	"ShaBaNakk";				//nazwa

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	65;

	damageTotal			=   25;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	11;
	visual 				=	"itmw_magestaff_normal_2h_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItNa_MalaMaczuga (C_Item)
{	
	name 				=	"Ma�a maczuga";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Windknecht;

	damageTotal  		= 	17;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Windknecht;		
		
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	5;
	visual 				=	"ItMW_Club_1H_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItNa_Maczuga (C_Item)
{	
	name 				=	"Maczuga";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Sturmknecht;

	damageTotal  		= 	26;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Sturmknecht;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	14;
	visual 				=	"ItMW_Club_2H_01.3DS";

	description			= 	name;
	
	TEXT[2]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



INSTANCE ItNa_MieczSwiatla (C_Item)
{	
	name 		=	"Miecz �wiat�a";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_SWD;				//flaga
	material 	=	MAT_METAL;				//materia�

	value 		=	700;					//warto��

	damageTotal = 	66;					//obra�enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra�e�
	range    	=  	100;					//zasi�g

	cond_atr[2]   	=	ATR_STRENGTH;				//si�a/zr�czno��
	cond_value[2]  	=	72;					//ile potrzeba
	visual 		=	"ItNa_MieczSwiatla.3DS";	//wygl�d

	description	= name;
	TEXT[0]		= "Niewiarygodnie cie�kie ostrze pokryte jest �wiec�c� substancj�.";
	TEXT[2]		= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItNa_Zmija (C_Item)
{	
	name 		=	"�mija";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_SWD;				//flaga
	material 	=	MAT_METAL;				//materia�

	value 		=	700;					//warto��

	damageTotal = 	53;					//obra�enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra�e�
	range    	=  	100;					//zasi�g

	cond_atr[2]   	=	ATR_STRENGTH;				//si�a/zr�czno��
	cond_value[2]  	=	44;					//ile potrzeba
	visual 		=	"ItNa_Zmija.3DS";	//wygl�d

	description	= name;
	TEXT[0]		= "";
	TEXT[2]		= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_02 (C_Item)
{	
	name 		=	"�wiekowana maczuga";				//nazwa

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	65;

	damageTotal			=   25;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	11;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_Old_03 (C_Item)
{	
	name 				=	"Stary s�dzia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1880;//940;//478
	
	damageTotal			= 	44;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"ItMw_2H_Axe_Old_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_Old_01 (C_Item)
{	
	name 				=	"Stary top�r bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1800;//900;//454
	
	damageTotal			= 	41;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	36;
	visual 				=	"ItMw_2H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_Long_03 (C_Item)
{	
	name 				=	"Miecz nienawi�ci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;//400;//196

	damageTotal			= 	44;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	on_equip			=	Equip_1H_09;
	on_unequip			=	UnEquip_1H_09;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	51;
	visual 				=	"ItMw_1H_Sword_Long_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_09;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_05 (C_Item)
{	
	name 				=	"Miecz wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	472;//236;//118

	damageTotal			= 	34;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;
	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_04 (C_Item)
{	
	name 				=	"Miecz bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	111;

	damageTotal			= 	26;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	24;
	visual 				=	"ItMw_1H_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



INSTANCE ItMw_1H_Sword_02 (C_Item)
{	
	name 				=	"Miecz s�dziego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	97;

	damageTotal			= 	22;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItMw_1H_Sword_Short_02 (C_Item)
{	
	name 				=	"Ch�opski miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	64;//32;

	damageTotal			= 	14;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	7;
	visual 				=	"ItMw_1H_Sword_Short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Kostur_UrShaka (C_Item)
{	
	name 				=	"Kostur Ur-Shaka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal  			= 	10;
	damagetype 			=	DAM_POINT;
	range    			=  	10;		
	
	cond_atr[2]   			=	ATR_STRENGTH;
	cond_value[2]  			=	1;
	visual 				=	"ItMW_MageStaff_Good_2H_01.3DS"; 
	//effect				=	"SPELLFX_UNDEAD_DRAGON";

	on_equip			=	Equip_ItNa_UrShack;
	on_unequip			=	UnEquip_ItNa_UrShack;

	description			= 	"Kostur Ur-Shaka";

	TEXT[2]				= NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;			COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;				COUNT[5]	= value;
};


FUNC VOID Equip_ItNa_UrShack()
{
	/*if Npc_IsPlayer (self)
	{
		WillHasEquippedKostur = TRUE;
		ff_applyonceext(ZamekFunc,1000,-1);
	};	*/		
};
FUNC VOID UnEquip_ItNa_UrShack()
{
	/*if Npc_IsPlayer (self)
	{
		WillHasEquippedKostur = FALSE;
		ff_remove(ZamekFunc);
	};	*/		
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_RytualneOstrze (C_Item)
{	
	name 		=	"Rytualne ostrze";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_SWD;				//flaga
	material 	=	MAT_METAL;				//materia�

	value 		=	700;					//warto��

	damageTotal = 	53;					//obra�enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra�e�
	range    	=  	100;					//zasi�g

	cond_atr[2]   	=	ATR_STRENGTH;				//si�a/zr�czno��
	cond_value[2]  	=	44;					//ile potrzeba
	visual 		=	"ItNa_Zmija.3DS";	//wygl�d

	description	= name;
	TEXT[0]		= "";
	TEXT[2]		= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;			COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_RekaTrolla (C_Item)
{	
	name 				=	"R�ka Trolla";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Barbarenstreitaxt;

	damageTotal  		= 	180;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Barbarenstreitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	180;
	visual 				=	"ItMw_075_2h_axe_heavy_04.3DS";

	description			= name;
	TEXT[0]				= "Ta bro� nie zosta�a wykuta dla cz�owieka.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= 300;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DJG_Crossbow(C_Item)
{
	name 				=	"Kusza �owcy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_MilArmbrust;

	damageTotal			= 	Damage_MilArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_MilArmbrust;
	visual 				=	"ItRw_Mil_Crossbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DJG_CrossbowH (C_Item)
{
	name 				=	"Ci�ka kusza �owcy";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal			= 	Damage_Armbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Armbrust;
	visual 				=	"ItRw_Crossbow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KuszaLowcy (C_Item)
{
	name 				=	"Kusza �owcy ork�w";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Drachenjaegerarmbrust;

	on_equip			=	Equip_ItNa_KuszaLowcy;
	on_unequip			=	UnEquip_ItNa_KuszaLowcy;

	damageTotal			= 	90;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItRw_Crossbow_H_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_ItNa_KuszaLowcy()
{
 	if Npc_IsPlayer (self)
	{ 
		KuszaLowcyUbrana = TRUE;
	};
};

FUNC VOID UnEquip_ItNa_KuszaLowcy()
{
 	if Npc_IsPlayer (self)
	{ 
		KuszaLowcyUbrana = FALSE;
	};
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_BAN_Crossbow(C_Item)
{
	name 				=	"Kusza bandyty";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	400;

	damageTotal			= 	55;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItRw_Crossbow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Kusza_Domenic(C_Item)
{
	name 				=	"Kusza Domenica";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Armbrust;

	damageTotal			= 	50;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"ItRw_Crossbow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_OrkowaKusza(C_Item)
{
	name 				=	"Orkowa kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal			= 	40;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	visual 				=	"ItRw_Crossbow_M_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_SmiercPradawnych  (C_Item) 
{	
	name 				=	"�mier� Pradawnych";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_4;

	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	visual 				=	"ItMw_110_2h_sword_smith_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZabojcaPradawnych (C_Item)
{
	name 				=	"Zab�jca Pradawnych";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Buchenbogen;

	damageTotal			=	120;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	95;
	visual 				=	"ItRw_Bow_M_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Djg_Weapon_L (C_Item)
{	
	name 				=	"Miecz �owcy"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	21;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_025_1h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Djg_Weapon_M (C_Item)
{	
	name 				=	"Rami� �owcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal  		= 	43;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	44;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Djg_Weapon_H (C_Item)
{	
	name 				=	"Dwur�czniak �owcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	650;

	damageTotal  		= 	57;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_068_2h_sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Out_Weapon_H (C_Item)
{	
	name 				=	"Top�r my�liwego";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	43;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	45;
	visual 				=	"ItMw_040_1h_axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Out_Weapon_S (C_Item)
{	
	name 				=	"My�liwski rozpruwacz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal  		= 	55;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	58;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Ban_Weapon_H (C_Item)
{	
	name 				=	"Ci�ki miecz bandyty";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR2hSword;

	damageTotal  		= 	38;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	41;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Ban_Weapon_M (C_Item) 
{	
	name 				=	"Miecz bandyty";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;
	
	damageTotal			= 	26;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	visual 				=	"ItMw_045_1h_Sword_smith_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Jaszczur_WP (C_Item) //
{	
	name 				=	"Jaszczurzy miecz wojenny"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert_01;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert_01;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	100;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZlotySztylet (C_Item)
{	
	name 				=	"Z�oty sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;

	damageTotal  		= 	35;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	15;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MieczRuniczny (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	material 			=	MAT_METAL;
	
	value 				=	500;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= "Pozbawione blasku ostrze.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MieczRunicznyKeroloth (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	200;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= "";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MieczRunicznyA (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	61;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	//effect				= 	"SPELLFX_FIRESWORD";
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= "Zadaje obra�enia od ognia.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItNa_MieczRunicznyB (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	61;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	//effect				= 	"MFX_PALLIGHT_ORIGIN";
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";


	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= "Zadaje obra�enia od zimna.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItNa_MieczRunicznyC (C_Item)
{	
	name 				=	"Miecz runiczny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	61;
	damageType				= DAM_FLY;
	range    			=  	Range_Runenschwert;		

	//effect = "spellfx_fireswordblack";
	//effect				= 	"MFX_WHIRLWIND_INIT";
	effect				=	"SPELLFX_WEAKGLIMMER";

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	65;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[1]				= "Zadaje obra�enia od wiatru.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CatSan_Sword (C_Item) 
{	
	name 				=	"Ostrze Gildii San";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	68;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;	

	effect				=	"SPELLFX_MAGESTAFF3";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Smyk (C_Item) 
{	
	name 				=	"Smyk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	47;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	44;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Kosmyk (C_Item) 
{	
	name 				=	"Kosmyk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	38;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	cond_atr[2]   		= 	ATR_DEXTERITY;  
	cond_value[2]  		= 	27;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MieczSusan (C_Item) 
{	
	name 				=	"G�os Susan";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4500;

	damageTotal			= 	73;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	

	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	76;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];

	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};




// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GrzechSzakala (C_Item) 
{	
	name 				=	"Grzech Szakala";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	4500;

	damageTotal			= 	73;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	

	on_equip		=	Equip_ItNa_GrzechSzakala;
	on_unequip		=	UnEquip_ItNa_GrzechSzakala;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	76;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= 10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_ItNa_GrzechSzakala()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, 10);
	};
};

FUNC VOID UnEquip_ItNa_GrzechSzakala()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, -10);
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Szabla (C_Item)
{	
	name 				=	"Szabla";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal  		= 	42;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	31;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_StaryPykacz (C_Item)
{	
	name 				=	"Stary pykacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;

	damageTotal  		= 	52;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalSchwert;		

	on_equip		=	Equip_ItNa_StaryPykacz;
	on_unequip		=	UnEquip_ItNa_StaryPykacz;

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	66;
	visual 				=	"ItMw_030_1h_PAL_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= 15;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_ItNa_StaryPykacz()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, 15);
	};
};

FUNC VOID UnEquip_ItNa_StaryPykacz()
{
 	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_1H, -15);
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Rozpruwacz (C_Item)
{	
	name 				=	"Rozpruwacz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal  		= 	49;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	48;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_SolidnaKlinga (C_Item)
{	
	name 				=	"Solidna klinga";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal  		= 	26;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		
	
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	18;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Klujec (C_Item)
{	
	name 				=	"K�ujec";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	200;

	damageTotal  		= 	21;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	8;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_OstryMiecz (C_Item) 
{	
	name 				=	"Ostry Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1700;

	damageTotal			= 	52;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	43;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_NiewyostrzonyMiecz (C_Item) 
{	
	name 				=	"Niewyostrzony miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	14;

	damageTotal  		= 	15;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscSword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	13;
	visual 				=	"ItMw_020_1h_sword_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_JezykTopielcaSword (C_Item)
{	
	name 				=	"J�zyk topielca";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	21;

	damageTotal  		= 	16;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MilSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	14;
	visual 				=	"Itmw_025_1h_Mil_Sword_broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItNa_MlotOrkow (C_Item)
{	
	name 				=	"Krush Karrok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_01;

	damageTotal			= 	35;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Orkaxt_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   40;
	visual 				=	"itmw_2h_orcmace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Ring_Wiernosc(C_Item)
{
	name 					=	"Pier�cie� wierno�ci";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge02;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_Ring_Wiernosc;
	on_unequip				=	UnEquip_ItNa_Ring_Wiernosc;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= name;
	
	TEXT[0] = "M�j pier�cie� wierno�ci.";
	
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

FUNC VOID Equip_ItNa_Ring_Wiernosc()
{
	self.protection [PROT_EDGE] 		+=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		+=  Ri_ProtEdge02;
};

FUNC VOID UnEquip_ItNa_Ring_Wiernosc()
{
	self.protection [PROT_EDGE] 		-=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		-=  Ri_ProtEdge02;
};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PierscienGrubegoMysliwego(C_Item) //Im Alten Lager
{
	name 					=	"Pier�cie� grubego my�liwego";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_PierscienGrubegoMysliwego;
	on_unequip				=	UnEquip_ItNa_PierscienGrubegoMysliwego;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= name;
	
	TEXT[0] = "Pier�cie� uodparnia posiadacza na przewr�cenie";
	TEXT[1] = "przez z�bacze, pe�zacze i inne potwory.";
		
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

var int PierscienGrubegoMysliwegoUbrany;
FUNC VOID Equip_ItNa_PierscienGrubegoMysliwego()
{
	PierscienGrubegoMysliwegoUbrany = TRUE;
};

FUNC VOID UnEquip_ItNa_PierscienGrubegoMysliwego()
{
	PierscienGrubegoMysliwegoUbrany = FALSE;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PierscienAsasyna(C_Item) //Im Alten Lager
{
	name 					=	"Pier�cie� Asasyna";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItNa_PierscienAsasyna;
	on_unequip				=	UnEquip_ItNa_PierscienAsasyna;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= name;
	
	TEXT[0] = "Pier�cie� uodparnia posiadacza na otrucie przez potwory.";
		
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

var int PierscienAsasynaUbrany;
FUNC VOID Equip_ItNa_PierscienAsasyna()
{
	PierscienAsasynaUbrany = TRUE;
};

FUNC VOID UnEquip_ItNa_PierscienAsasyna()
{
	PierscienAsasynaUbrany = FALSE;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_Artefakt_Sila (C_ITEM)
{
	name 				=	"Kawa�ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du�ego, ozdobnego pier�cienia.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_Artefakt_Moc (C_ITEM)
{
	name 				=	"Kawa�ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du�ego, ozdobnego pier�cienia.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_Artefakt_Odpornosc (C_ITEM)
{
	name 				=	"Kawa�ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du�ego, ozdobnego pier�cienia.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Artefakt_Caly (C_Item)
{
	name 				=	"Artefakt";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_PortalRing_01.3DS"; 
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT	[0]			=	"Klucz do niedost�pnego klifu.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC3_STANDARD;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItRi_Str_Mud(C_Item)
{
    name                     =    NAME_Ring;

    mainflag                 =    ITEM_KAT_MAGIC;
    flags                     =    ITEM_RING;

    value                     =    Value_Ri_Strg02;

    visual                     =    "ItRi_Str_02.3ds";

    visual_skin             =    0;
    material                 =    MAT_METAL;
    on_equip                =    Equip_ItRi_Str_02;
    on_unequip                =    UnEquip_ItRi_Str_02;

    wear            =     WEAR_EFFECT;
    effect            =    "SPELLFX_ITEMGLIMMER"; 

    description                = "Pier�cie� si�y";
    
    TEXT[2]                    = NAME_Bonus_Str;
    COUNT[2]                = Ri_Strg02;
    TEXT[3]                    = "Nagrawerowano na nim symbol Mag�w ognia.";
    TEXT[5]                    = NAME_Value;
    COUNT[5]                = value;
        
    INV_ZBIAS                = INVCAM_ENTF_RING_STANDARD;
    INV_ROTZ                = INVCAM_Z_RING_STANDARD;
    INV_ROTX                = INVCAM_X_RING_STANDARD;
    
};
 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_OkoSwiata(C_Item)
{
	name 			=	"Oko �wiata";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_OkoSwiata;
	on_unequip		=	UnEquip_ItNa_OkoSwiata;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Oko �wiata";
	
	TEXT[2]			= "Ten amulet czyni posiadacza silniejszym,";
	TEXT[3]			= "zr�czniejszym i m�drzejszym.";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItNa_OkoSwiata()
	{

		Npc_ChangeAttribute(self,ATR_STRENGTH,+ 10);
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ 10);
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;

		
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",  self, self, 0, 0, 0, FALSE );
		
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
		Snd_Play ("MFX_FIRERAIN_INVEST"); 
	};

	FUNC VOID UnEquip_ItNa_OkoSwiata()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- 10);
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- 10);
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
		if (self.attribute[ATR_MANA] > (10))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_AmuletKrzywegoOgnika (C_Item)  
{
	name 			=	"Amulet krzywego ognika";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	400;

	visual 			=	"ItAm_Mana_01.3ds";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_WEAKGLIMMER_BLUE"; 

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_AmuletKrzywegoOgnika;
	on_unequip		=	UnEquip_AmuletKrzywegoOgnika;

	description		=  name;

	TEXT[0]			= "Przyzwie ognika tylko jeden raz.";

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

var int Equip_AmuletKrzywegoOgnika_OneTime;

FUNC VOID Equip_AmuletKrzywegoOgnika()
{
	if (Equip_AmuletKrzywegoOgnika_OneTime == FALSE)
	{
		Equip_AmuletKrzywegoOgnika_OneTime = TRUE;

		var C_NPC DetWsp;
		DetWsp = Hlp_GetNpc (Wisp_Helper);
		AI_Teleport (DetWsp, "TOT");
		Wld_SpawnNpcRange	(self,	Wisp_Helper,	1,	500);
 		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  Wisp_Helper, Wisp_Helper, 0, 0, 0, FALSE );
		Snd_Play ("MFX_Transform_Cast");
	};
};

FUNC VOID UnEquip_AmuletKrzywegoOgnika()
{
		
	var C_NPC DetWsp;
	DetWsp = Hlp_GetNpc (Wisp_Helper);

	if (Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play ("WSP_Dead_A1");
	};

	AI_Teleport (DetWsp, "TOT");
	B_RemoveNpc (DetWsp);
	AI_Teleport (DetWsp, "TOT");
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_HuntAmulet(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	300;

	visual 			=	"ItAm_Strg_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_HuntAmulet;
	on_unequip		=	UnEquip_ItNa_HuntAmulet;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Oko my�liwego";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 10;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItNa_HuntAmulet()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ 10);
	};

	FUNC VOID UnEquip_ItNa_HuntAmulet()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- 10);
	};

	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_AmuletZRudy(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_MANA;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Addon_MANA;
	on_unequip		=	UnEquip_ItAm_Addon_MANA;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Nale�a� do pi�ciu braci";

	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= MA_Amulett_Solo_Bonus;
	
	TEXT[3]			= "";
	TEXT[4]			= "";
	 
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};


// **********************************************
// . . . . . . . . . . Pisma . . . . . . . . . .
// **********************************************


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaReputacji (C_ITEM)
{
	name 					=	"Ksi�ga statystyk I";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi��ka pokazuj�ca status";
	TEXT[3] 				=  "reputacji w obozach.";

	on_state[0]				=	Use_ItNa_KsiegaReputacji;
};

FUNC VOID Use_ItNa_KsiegaReputacji()
{		
	var int nDocID;

var string REP1; REP1 = "*u �owc�w ork�w: ";		   REP1 = ConcatStrings(REP1,IntToString(rep_lowcy_s));
var string REP2; REP2 = "*u my�liwych: ";		   REP2 = ConcatStrings(REP2,IntToString(rep_mysliwi_s));
var string REP3; REP3 = "*u bandyt�w: ";		   REP3 = ConcatStrings(REP3,IntToString(rep_bandyci_s));

	nDocID = 	Doc_Create		()			  ;								
				Doc_SetPages	( nDocID,  2 );                        
				Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
				Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLine	( nDocID,  0, ""	);
				Doc_PrintLines	( nDocID,  0, "Reputacja:"	);
				Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);

				Doc_PrintLine    ( nDocID,  0, "");
				Doc_PrintLine    ( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, REP1);
				Doc_PrintLine    ( nDocID,  0, "");
				Doc_PrintLine    ( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, REP2);
				Doc_PrintLine    ( nDocID,  0, "");
				Doc_PrintLine    ( nDocID,  0, "");
				if (WillKnowBanditReputation == TRUE)
				{
					Doc_PrintLines   ( nDocID,  0, REP3);
				};
				Doc_PrintLine    ( nDocID,  0, "");



				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""	);
				Doc_PrintLines	( nDocID,  1, "Ranga:"					);
				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""	);
				Doc_PrintLine	( nDocID,  1, ""	);

				var string StatusReputacji;
				if (rep_lowcy_s) >= 0  { StatusReputacji = "***NIKT"; };
				if (rep_lowcy_s) >= 10 { StatusReputacji = "***POMOCNIK"; };
				if (rep_lowcy_s) >= 25 { StatusReputacji = "***KOMPAN"; };
				if (rep_lowcy_s) >= 50 { StatusReputacji = "***ZAUFANY"; };				
				if (rep_lowcy_s) >= 75 { StatusReputacji = "***PRZYJACIEL"; };
				if (rep_lowcy_s) >= 90 { StatusReputacji = "***BRAT"; };

				Doc_PrintLines   ( nDocID,  1, StatusReputacji);
				Doc_PrintLine   ( nDocID,  1, "");
				Doc_PrintLine    ( nDocID,  1, "");

				if (rep_mysliwi_s) >= 0  { StatusReputacji = "***NIKT"; };
				if (rep_mysliwi_s) >= 10 { StatusReputacji = "***POMOCNIK"; };
				if (rep_mysliwi_s) >= 25 { StatusReputacji = "***KOMPAN"; };
				if (rep_mysliwi_s) >= 50 { StatusReputacji = "***ZAUFANY"; };				
				if (rep_mysliwi_s) >= 75 { StatusReputacji = "***PRZYJACIEL"; };
				if (rep_mysliwi_s) >= 90 { StatusReputacji = "***BRAT"; };

				Doc_PrintLines   ( nDocID,  1, StatusReputacji);
				Doc_PrintLine   ( nDocID,  1, "");
				Doc_PrintLine	( nDocID,  1, ""	);	

				if (WillKnowBanditReputation == TRUE)
				{
					if (rep_bandyci_s) >= 0  { StatusReputacji = "***NIKT"; };
					if (rep_bandyci_s) >= 10 { StatusReputacji = "***POMOCNIK"; };
					if (rep_bandyci_s) >= 25 { StatusReputacji = "***KOMPAN"; };
					if (rep_bandyci_s) >= 50 { StatusReputacji = "***ZAUFANY"; };				
					if (rep_bandyci_s) >= 75 { StatusReputacji = "***PRZYJACIEL"; };
					if (rep_bandyci_s) >= 90 { StatusReputacji = "***BRAT"; };

					Doc_PrintLines   ( nDocID,  1, StatusReputacji);
					Doc_PrintLine   ( nDocID,  1, "");
				};
				
				Doc_PrintLines	( nDocID,  1, " "					);


				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaPotworow (C_ITEM)
{
	name 					=	"Ksi�ga statystyk II";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi��ka pokazuj�ca ilo��";
	TEXT[3] 				=  "pokonanych przeze mnie potwor�w.";

	on_state[0]				=	Use_ItNa_KsiegaPotworow;
};

FUNC VOID Use_ItNa_KsiegaPotworow()
{		
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								
				Doc_SetPages	( nDocID,  2 );                        
				Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
				Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Pokonane potwory:"	);
				Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);

				var string PokonaneGobbo; PokonaneGobbo = "Gobliny: "; PokonaneGobbo = ConcatStrings(PokonaneGobbo,IntToString(PokonaneGobbo_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneGobbo);
				var string PokonaneRat; PokonaneRat = "Szczury: "; PokonaneRat = ConcatStrings(PokonaneRat,IntToString(PokonaneRat_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneRat);
				var string PokonaneLurker; PokonaneLurker = "Topielce: "; PokonaneLurker = ConcatStrings(PokonaneLurker,IntToString(PokonaneLurker_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneLurker);
				var string PokonaneKeiler; PokonaneKeiler = "Dziki: "; PokonaneKeiler = ConcatStrings(PokonaneKeiler,IntToString(PokonaneKeiler_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneKeiler);
				var string PokonaneWolf; PokonaneWolf = "Wilki: "; PokonaneWolf = ConcatStrings(PokonaneWolf,IntToString(PokonaneWolf_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneWolf);
				var string PokonaneBlackWolf; PokonaneBlackWolf = "Czarne wilki: "; PokonaneBlackWolf = ConcatStrings(PokonaneBlackWolf,IntToString(PokonaneBlackWolf_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneBlackWolf);
				var string PokonaneIceWolf; PokonaneIceWolf = "Lodowe wilki: "; PokonaneIceWolf = ConcatStrings(PokonaneIceWolf,IntToString(PokonaneIceWolf_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneIceWolf);
				var string PokonaneWarg; PokonaneWarg = "Wargi: "; PokonaneWarg = ConcatStrings(PokonaneWarg,IntToString(PokonaneWarg_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneWarg);
				var string PokonaneMolerat; PokonaneMolerat = "Kretoszczury: "; PokonaneMolerat = ConcatStrings(PokonaneMolerat,IntToString(PokonaneMolerat_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneMolerat);
				var string PokonaneScavenger; PokonaneScavenger = "�cierwojady: "; PokonaneScavenger = ConcatStrings(PokonaneScavenger,IntToString(PokonaneScavenger_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneScavenger);
				var string PokonaneMeatbug; PokonaneMeatbug = "Chrz�szcze: "; PokonaneMeatbug = ConcatStrings(PokonaneMeatbug,IntToString(PokonaneMeatbug_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneMeatbug);
				var string PokonaneMinecrawler; PokonaneMinecrawler = "Pe�zacze: "; PokonaneMinecrawler = ConcatStrings(PokonaneMinecrawler,IntToString(PokonaneMinecrawler_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneMinecrawler);
				var string PokonaneBloodfly; PokonaneBloodfly = "Krwiopijce: "; PokonaneBloodfly = ConcatStrings(PokonaneBloodfly,IntToString(PokonaneBloodfly_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneBloodfly);
				var string PokonaneSwampDrone; PokonaneSwampDrone = "Bagienne trutnie: "; PokonaneSwampDrone = ConcatStrings(PokonaneSwampDrone,IntToString(PokonaneSwampDrone_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSwampDrone);
				var string PokonaneWaran; PokonaneWaran = "Jaszczury: "; PokonaneWaran = ConcatStrings(PokonaneWaran,IntToString(PokonaneWaran_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneWaran);
				var string PokonaneShadowbeast; PokonaneShadowbeast = "Cieniostwory: "; PokonaneShadowbeast = ConcatStrings(PokonaneShadowbeast,IntToString(PokonaneShadowbeast_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneShadowbeast);
				var string PokonaneSwampShark; PokonaneSwampShark = "W�e b�otne: "; PokonaneSwampShark = ConcatStrings(PokonaneSwampShark,IntToString(PokonaneSwampShark_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSwampShark);
				var string PokonaneTroll; PokonaneTroll = "Trolle: "; PokonaneTroll = ConcatStrings(PokonaneTroll,IntToString(PokonaneTroll_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneTroll);
				var string PokonaneSnapper; PokonaneSnapper = "Z�bacze: "; PokonaneSnapper = ConcatStrings(PokonaneSnapper,IntToString(PokonaneSnapper_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSnapper);


				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				var string PokonaneDragonSnapper; PokonaneDragonSnapper = "Smocze z�bacze: "; PokonaneDragonSnapper = ConcatStrings(PokonaneDragonSnapper,IntToString(PokonaneDragonSnapper_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneDragonSnapper);

				var string PokonaneBloodhound; PokonaneBloodhound = "Ogary: "; PokonaneBloodhound = ConcatStrings(PokonaneBloodhound,IntToString(PokonaneBloodhound_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneBloodhound);
				var string PokonaneOrcBiter; PokonaneOrcBiter = "K�sacze: "; PokonaneOrcBiter = ConcatStrings(PokonaneOrcBiter,IntToString(PokonaneOrcBiter_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneOrcBiter);
				var string PokonaneRazor; PokonaneRazor = "Brzytwiaki: "; PokonaneRazor = ConcatStrings(PokonaneRazor,IntToString(PokonaneRazor_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneRazor);
				var string PokonaneGolem; PokonaneGolem = "Golemy: "; PokonaneGolem = ConcatStrings(PokonaneGolem,IntToString(PokonaneGolem_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneGolem);
				var string PokonaneDemon; PokonaneDemon = "Demony: "; PokonaneDemon = ConcatStrings(PokonaneDemon,IntToString(PokonaneDemon_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneDemon);
				var string PokonaneHarpy; PokonaneHarpy = "Harpie: "; PokonaneHarpy = ConcatStrings(PokonaneHarpy,IntToString(PokonaneHarpy_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneHarpy);
				var string PokonaneZombie; PokonaneZombie = "Zombie: "; PokonaneZombie = ConcatStrings(PokonaneZombie,IntToString(PokonaneZombie_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneZombie);
				var string PokonaneSkeleton; PokonaneSkeleton = "Szkielety: "; PokonaneSkeleton = ConcatStrings(PokonaneSkeleton,IntToString(PokonaneSkeleton_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneSkeleton);
				
				Doc_PrintLine   ( nDocID,  1, "");

				Doc_PrintLine   ( nDocID,  1, "");

				var string PokonaneDraconian; PokonaneDraconian = "Jaszczuroludzie: "; PokonaneDraconian = ConcatStrings(PokonaneDraconian,IntToString(PokonaneDraconian_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneDraconian);
				var string PokonaneOrcElite; PokonaneOrcElite = "Orkowie elici: "; PokonaneOrcElite = ConcatStrings(PokonaneOrcElite,IntToString(PokonaneOrcElite_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneOrcElite);
				var string PokonaneOrcWarrior; PokonaneOrcWarrior = "Orkowie wojownicy: "; PokonaneOrcWarrior = ConcatStrings(PokonaneOrcWarrior,IntToString(PokonaneOrcWarrior_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneOrcWarrior);
				var string PokonaneOrcShaman; PokonaneOrcShaman = "Orkowie szamani: "; PokonaneOrcShaman = ConcatStrings(PokonaneOrcShaman,IntToString(PokonaneOrcShaman_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneOrcShaman);
				var string PokonaneOrcScout; PokonaneOrcScout = "Orkowie zwiadowcy: "; PokonaneOrcScout = ConcatStrings(PokonaneOrcScout,IntToString(PokonaneOrcScout_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneOrcScout);


				Doc_PrintLines	( nDocID,  1, " "					);


				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaOsiagniec (C_ITEM)
{
	name 					=	"Ksi�ga statystyk III";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi��ka pokazuj�ca moje osi�gni�cia.";
	TEXT[3] 				=  "";

	on_state[0]				=	Use_ItNa_KsiegaOsiagniec;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaBosow (C_ITEM)
{
	name 					=	"Ksi�ga statystyk IV";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi��ka zawieraj�ca opis";
	TEXT[3] 				=  "lokalizacji wszystkich boss�w.";

	on_state[0]				=	Use_ItNa_KsiegaBosow;
};

FUNC VOID Use_ItNa_KsiegaBosow()
{		
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								
				Doc_SetPages	( nDocID,  2 );                        
				Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
				Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLines	( nDocID,  0, "Bossy:"	);
				Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);

				var string BossStatus;
				Doc_PrintLines   ( nDocID,  0, "1. Du�a polna bestia: w jaskini obok starej bramy na terytoria ork�w.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss1Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonana"); } else { BossStatus = ConcatStrings(BossStatus,"�ywa"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "2. Krzywy ognik: po drugiej stronie niezamarzni�tego jeziora obok Nowego Obozu.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss2Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);
				
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "3. Pan cienia, Garrel: dawne le�e smoka bagiennego.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss3Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");			
				Doc_PrintLines   ( nDocID,  0, "4. Nieznany: prowadzi do niego teleport na 'niedost�pnym klifie'.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss4Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "5. Kamashi: centralna jaskinia w Nowym Obozie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss5Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);


				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages

				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
			
				Doc_PrintLines   ( nDocID,  1, "6. Samiec pe�zaczy: w opuszczonej kopalni obok wie�y Xardasa.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss6Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");				
				Doc_PrintLines   ( nDocID,  1, "7. O�ywieniec: stra�nik pot�nego zwoju w zapomnianej dolinie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss7Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "8. Pan cieniostwor�w: w jaskini przed Obozem na Bagnie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss8Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "9. Stary trup: szkielet �ucznik w Wie�y Mgie�.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss9Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "10. Kulompus: stra�nik skrzyni w skrytce na prze��czy. Kolce broni�ce dost�pu do ko�owrotu mo�na zdezaktywowa� czterema przyciskami w okolicy.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss10Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"�ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLines	( nDocID,  1, " "					);


				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaZmiennych (C_ITEM)
{
	name 					=	"Ksi�ga statystyk V";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi��ka pokazuj�ca stan r�nych";
	TEXT[3] 				=  "zmiennych.";

	on_state[0]				=	Use_ItNa_KsiegaZmiennych;
};

FUNC VOID Use_ItNa_KsiegaZmiennych()
{		
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								
				Doc_SetPages	( nDocID,  2 );                        
				Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
				Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, ""	);
				Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);

				var string run; run = "Przebieg�e�: ";
				run = ConcatStrings(run,IntToString(VST_Kilometers));
				run = ConcatStrings(run," km, ");
				run = ConcatStrings(run,IntToString(VST_Meters));
				run = ConcatStrings(run," m");
				
				Doc_PrintLines   ( nDocID,  0, run);
				Doc_PrintLine   ( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Czas pod wod�: ",IntToString(DivingTime)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Podniesione zardzewia�e miecze: ",IntToString(ZardzewialeMieczePodniesione)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Z�amane wytrychy: ",IntToString(ZlamaneWytrychy)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("U�yte r�ne zakl�cia: ",IntToString(WillUzyteZaklecia)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Zjedzone r�ne ro�liny: ",IntToString(EatenPlants)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Przespane godziny: ",IntToString(SleptHours)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Wypite butelki alkoholu: ",IntToString(DrunkTrinken)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Zdeptane chrz�szcze: ",IntToString(zdeptane_chrzaszcze)));

				
				Doc_Show		( nDocID );
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

// wlasciciel 'n' napisa� przepis 'n+1'
//            | w�a�ciciel	| gdzie?								| przepis na:	
// Uroboros 1 | Dairick		| nad kopalni�							| ---
// Uroboros 2 | Hyglas		| pod mostem pod rockcamp				| Cie� cieniostwora
// Uroboros 3 | Karrok		| na szczycie wodospadow (najpierw		| Lekarstwo uspokajaj�ce
//							  tp za jeziorkiem xardasa)				| 
// Uroboros 4 | Imonez		| w orkowej swiatyni (bagienny smok)	| Ryk smoka
// Uroboros 5 | Kalom		| na pietrze wiezy mgiel				| Zmora gwardzisty
// Uroboros 6 | ---			| w jaskini Cor Kaloma					| Krople duszy


//
//
//
// kto napisal strone L
// |kto napisal strone R
// ||
// vv
// 12 13 24 35 45 55
// LR|LR|LR|LR|LR|LR
// -- -- -- -- -- --
// 1  2  3  4  5  5
// ^
// kto ukryl ksiege




INSTANCE ItNa_Uroboros1 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros I";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros1;
};

var int Use_Uroboros1_OneTime;
func void Use_Uroboros1 ()
{   
 	if (Use_Uroboros1_OneTime == FALSE)
 	{
	 	Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Znalaz�em jak�� star� ksi�g�. Autor napisa�, �e pi�ciu mistrz�w alchemii spisa�o swoje autorskie przepisy. Na nast�pnej stronie widnieje wskaz�wka..."); 
		Use_Uroboros1_OneTime = TRUE;
		B_Add_Uroboros_Exp();
	};	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_RUroboros1.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Jestem wi�niem w Kolonii Karnej. Zosta�em tu wrzucony za otrucie kr�la. Ju� jako m�okos zg��bia�em tajniki alchemii, a jest to sztuka umo�liwiaj�ca przetrwanie. By�o nas pi�ciu takich 'mistrz�w alchemii'. Ka�dy z nas powierzy� sw�j przepis kolejnemu, aby kiedy� pojawi� si� kto�, kto zbierze wszystkie i stanie si� naszym nast�pc�.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "~Dairick");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   );
					Doc_PrintLine	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Kirim tada Oija'K!");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Mistrz Hyglas");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros2 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros II";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros2;
};

var int Use_Uroboros2_OneTime;
func void Use_Uroboros2 ()
{   
 	if (Use_Uroboros2_OneTime == FALSE)
 	{
		Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Mam przepis na mikstur� znacznie wzmacniaj�c� zr�czno��! Oraz nast�pn� wskaz�wk�..."); 
		Use_Uroboros2_OneTime = TRUE;
		WillKnowUroboros2 = TRUE;
		PoznaneSekrety_Liczba = PoznaneSekrety_Liczba + 1;
		B_Add_Uroboros_Exp();
	};	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_RUroboros2.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "By� pewien my�liwy, kt�ry polowa� specjalnie dla mnie i przynosi� mi trofea. Za�yczy� sobie, bym uwarzy� co�, co wzmocni jego zr�czno��. Sprosta�em pro�bie.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Cie� cieniostwora:");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "-6 ro�lin leczniczych");
					Doc_PrintLines	( nDocID,  0, "-goblinie jagody");
					Doc_PrintLines	( nDocID,  0, "-rdest polny");
					Doc_PrintLines	( nDocID,  0, "-r�g cieniostwora");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Dairick");

					
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "A czym�e jest mapa, kt�ra prowadzi donik�d?"					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "~Pan Karrok");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros3 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros III";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros3;
};

var int Use_Uroboros3_OneTime;
func void Use_Uroboros3 ()
{   
 	if (Use_Uroboros3_OneTime == FALSE)
 	{
		Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Kolejna ksi�ga podaje przepis na lekarstwo uspokajaj�ce, mocniejsze ni� bagienne ziele."); 
		Use_Uroboros3_OneTime = TRUE;
		WillKnowUroboros3 = TRUE;
		PoznaneSekrety_Liczba = PoznaneSekrety_Liczba + 1;
		B_Add_Uroboros_Exp();
	};	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Min�o ju� kilka lat, odk�d przeprowadzam testy na ludziach. Mawiaj�, �e nie ma nic lepszego na uspokojenie od bagiennego ziela. Myl� si� - m�j Pan, aby m�c torturowa� go�c�w wrog�w, musia� ich uspokaja�.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Lekarstwo uspokajaj�ce:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-2 �abie korzenie");
					Doc_PrintLines	( nDocID,  0, "-10 piekielnik�w");
					Doc_PrintLines	( nDocID,  0, "-z�bate ziele");
					Doc_PrintLines	( nDocID,  0, "-siarka");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Mistrz Hyglas");
	
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "A czy p�jdziesz za mn� do orkowej �wi�tyni? 'Tej w centrum G�rniczej Doliny? Tak, p�jd�' - powiedzia�em, ale z przekonaniem, �e ju� nigdy stamt�d nie wr�c�."	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Imonez");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros4 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros IV";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros4;
};

var int Use_Uroboros4_OneTime;
func void Use_Uroboros4 ()
{   
 	if (Use_Uroboros4_OneTime == FALSE)
 	{
		Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksi�ga czwarta podaje przepis na 'ryk smoka'."); 
		Use_Uroboros4_OneTime = TRUE;
		WillKnowUroboros4 = TRUE;
		PoznaneSekrety_Liczba = PoznaneSekrety_Liczba + 1;
		B_Add_Uroboros_Exp();
	};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zanim smoki wygin�y, paladyni poucinali im j�zyki. Robili z nich mikstury, kt�re czyni�y ich silniejszymi. Mimo �e smok�w ju� nie ma, to uda�o mi si� uwarzy� co�, co chocia� na chwil� podnosi poziom si�y. Chocia� robi si� j� z ognistego jaszczura, to w�a�nie...");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ryk smoka:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-ogniste ziele");
					Doc_PrintLines	( nDocID,  0, "-3 du�e grzyby");
					Doc_PrintLines	( nDocID,  0, "-j�zyk ognistego jaszczura");
					Doc_PrintLines	( nDocID,  0, "-w�giel");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Pan Karrok");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "Wszed�em mi�dzy mg�y. Rzuci�em ksi��k� w g�r�."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Kalom");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros5 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros V";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros5;
};
var int Use_Uroboros5_OneTime;
func void Use_Uroboros5 ()
{   
 	if (Use_Uroboros5_OneTime == FALSE)

 	{

		Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksi�ga pi�ta podaje przepis na 'zmor� gwardzisty'."); 
		Use_Uroboros5_OneTime = TRUE;
		WillKnowUroboros5 = TRUE;
		PoznaneSekrety_Liczba = PoznaneSekrety_Liczba + 1;
		B_Add_Uroboros_Exp();
		
	};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pami�tam nakaz kr�la o wzmo�eniu stra�y. Wszystkim z�odziejom �y�o si� trudniej. Znalaz�em jednak spos�b na pomoc moim znajomym.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zmora gwardzisty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-goblinie jagody");
					Doc_PrintLines	( nDocID,  0, "-2 rdesty polne");
					Doc_PrintLines	( nDocID,  0, "-bry�ka z�ota");
					Doc_PrintLines	( nDocID,  0, "-smo�a");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Imonez");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "Jedno wielkie bagno."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "~Kalom");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros6 (C_ITEM) 
{	
	name 					=	"Stara ksi�ga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros VI";
	TEXT	[0]				=	"Wygl�da, jakby mia�a si� rozlecie�.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Uroboros6;
};

var int Use_Uroboros6_OneTime;
func void Use_Uroboros6 ()
{   
 	if (Use_Uroboros6_OneTime == FALSE)

 	{

		Log_CreateTopic (TOPIC_Gildia_Alchemikow, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Gildia_Alchemikow, LOG_RUNNING);
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksi�ga sz�sta podaje przepis na 'krople duszy'."); 
		Use_Uroboros6_OneTime = TRUE;
		WillKnowUroboros6 = TRUE;
		PoznaneSekrety_Liczba = PoznaneSekrety_Liczba + 1;
		B_Add_Uroboros_Exp();
	};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Uroboros");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "A czy ty wiesz, jak nie umrze�?");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Krople duszy:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-per�a");
					Doc_PrintLines	( nDocID,  0, "-rum");
					Doc_PrintLines	( nDocID,  0, "-rdest polny");
					Doc_PrintLines	( nDocID,  0, "-bry�ka rudy");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Kalom");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "Nic nigdy si� nie ko�czy. Jako ostatni z wielkich alchemik�w czuj� si� najwi�kszy z nich. Teraz, jako najpot�niejszy guru w Bractwie, s�awi� mnie tytu�em:"					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Cor Kalom");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaXardasOld (C_ITEM) 
{	
	name 					=	"Almanach mocy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_ItNa_KsiegaXardasOld;
};

var int ItNa_KsiegaXardasOldFirstTime;
FUNC VOID Use_ItNa_KsiegaXardasOld ()
{   	 
	if (ItNa_KsiegaXardasOldFirstTime == FALSE)
	{
		B_LogEntry (TOPIC_bogowie_work, "Chyba znalaz�em ksi�g�, o kt�r� chodzi�o Beliarowi. S� tu jakie� dziwne s�owa...");
		WillKnowXardasOldBook = TRUE;
	};
	
	ItNa_KsiegaXardasOldFirstTime = TRUE;
		
	var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_MAGE_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_MAGE_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_SetFont 	( nDocID,  0, "Font_20_Book_Hi.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "KARA K'TA KRUSHAK");
					Doc_PrintLines	( nDocID,  0, "");		
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);										
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "");
					
					Doc_Show		( nDocID );

	
};


/*
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_HowToEscape		(C_Item)
{
	name 				=	"Zabrudzone zapiski";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_HowToEscape;
	scemeName			=	"MAP";
	description			=  	name;

	
};
var int Use_HowToEscape_OneTime;
func void Use_HowToEscape ()
{   
	//Wld_SendTrigger ("UCIECZKA_Z_KOPALNI");
 	if (Use_HowToEscape_OneTime == FALSE)

 	{
		B_LogEntry (TOPIC_kopalnia,"W obozie przed kopalni�, za kapliczk� Beliara znalaz�em jakie� zapiski o sposobie ucieczki."); 
		Use_HowToEscape_OneTime = TRUE;
	};

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "Chyba w ko�cu wykombinowa�em jak st�d uciec!");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Mam kilka pomys��w:");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Mo�na otworzy� bram� do lasu - potrzeba jednak jakiego� smaru...");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Wydaje mi si�, �e przez bram� w stron� Nowego Obozu");
				Doc_PrintLines	(nDocID,  0, "mo�na si� wydosta�, u�ywaj�c przemiany w chrz�szcza. Tylko sk�d ja to do cholery wezm�?");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Oceni�em wysoko�� tych desek nad wej�ciem do kopalni");
				Doc_PrintLines	(nDocID,  0, "i my�l�, �e jestem w stanie na nie skoczy�.");
				Doc_PrintLines	(nDocID,  0, "P�niej chyba zdo�am wdrapa� si� na g�r� po ska�ach. St�d widz� tam jakie� krzewy.");
				Doc_PrintLines	(nDocID,  0, "Je�eli tylko mnie nie zauwa��, to mam szans� si� st�d wydosta�, nie ko�cz�c ze strza�� we �bie.");

				Doc_Show		(nDocID);
		
};
*/


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_HowToEscape		(C_Item)
{	
	name 					=	"Dziennik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Dziennik";
	TEXT	[0]				=	"Bardzo zabrudzony.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_HowToEscape;
};

var int Use_HowToEscape_OneTime;
FUNC VOID Use_HowToEscape()
{   
	//Wld_SendTrigger ("UCIECZKA_Z_KOPALNI");
	if (Use_HowToEscape_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_kopalnia,"W obozie przed kopalni�, za kapliczk� Beliara, znalaz�em jakie� zapiski o sposobie ucieczki."); 
		Use_HowToEscape_OneTime = TRUE;
	};
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);	
					Doc_PrintLine	( nDocID,  0, "28.04"					);										
					Doc_PrintLines	( nDocID,  0, "Zamkn�li mnie. Prowadz� jakie� nielegalne wydobycie rudy...");
					Doc_PrintLine	( nDocID,  0, ""		);
					Doc_PrintLine	( nDocID,  0, "05.05"		);
					Doc_PrintLines	( nDocID,  0, "Mo�na otworzy� bram� do lasu - potrzeba jednak smaru... Wydaje mi si�, �e przez bram� w stron� Nowego Obozu mo�na si� wydosta�, u�ywaj�c przemiany w chrz�szcza. Tylko sk�d ja to do cholery wezm�?");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);	
					Doc_PrintLine	( nDocID,  1, "28.05"					);
					Doc_PrintLines	( nDocID,  1, "Chyba w ko�cu wykombinowa�em, jak st�d uciec!"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Oceni�em wysoko�� tych desek nad wej�ciem do kopalni i my�l�, �e jestem w stanie na nie skoczy�. P�niej chyba zdo�am wdrapa� si� na g�r� po ska�ach. St�d widz� tam jakie� krzewy. Je�eli tylko mnie nie zauwa��, to mam szans� si� st�d wydosta�, nie ko�cz�c ze strza�� we �bie.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PamietnikKannaha (C_ITEM) 
{	
	name 					=	"Pami�tnik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Pami�tnik";
	TEXT[0]				=	"Znalaz�em go przy martwym paladynie";
	TEXT[1]				=	"w opuszczonym klasztorze.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_PamietnikKannaha;
};

func void Use_PamietnikKannaha ()
{   
 
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
				Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
				
				//1.Seite
				Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
				Doc_PrintLine	( nDocID,  0, ""					);										
				Doc_PrintLine	( nDocID,  0, ""					);										
				Doc_PrintLines	( nDocID,  0, "- | - | - | - | -");
				Doc_PrintLine	( nDocID,  0, ""					);										
				Doc_PrintLines	( nDocID,  0, "28.05");
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Dzisiejszy dzie� nie b�dzie kolejnym nudnym dniem na warcie. Dzisiaj ma si� sta� to, co od dawna planowali�my z Hann�. Pomog� tej biednej kobiecie rozprawi� si� raz na zawsze z natr�tnym gwa�cicielem i ju� nigdy nie b�dzie jej nachodzi�. Mam nadziej�, �e nikt nam w tym nie przeszkodzi i bezpiecznie pozb�dziemy si� tego drania.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "- | - | - | - | -");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
					
				//2.Seite
				Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "- | - | - | - | -");
				Doc_PrintLines	( nDocID,  0, ""					);										
				Doc_PrintLines	( nDocID,  1, "31.05"	);
				Doc_PrintLines	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Tamt� noc zapami�tam na zawsze. Nie pisn� nic Rudolfowi. Jego �ona z pewno�ci� nie chcia�aby tego."	);
				Doc_PrintLines	( nDocID,  1, "");
				Doc_PrintLines	( nDocID,  1, "- | - | - | - | -");
				Doc_Show		( nDocID );
				

					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CorKalom_Book (C_ITEM)
{
	name 					=	"Ksi�ga Kaloma";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Ksi�ga Kaloma";
	
	TEXT[2] 				=  "Znalaz�em t� ksi�g� w jakim�";
	TEXT[3] 				=  "tajnym laboratorium.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseCorKalomBook;
};

var int UseCorKalomBookOneTime;
FUNC VOID UseCorKalomBook()
{
	if (UseCorKalomBookOneTime == FALSE)
	{
		WillKnowKalomBook = TRUE;
		UseCorKalomBookOneTime = TRUE;
		if (npc_knowsinfo(hero,DIA_NASZ_024_BaalOrun_BadaniaCorCaloma)) {
			B_LogEntry (TOPIC_BadaniaCaloma, "W tajnym laboratorium znalaz�em pami�tnik Cor Kaloma.");
		};
	};

	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager
				Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
				Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 
				
				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Za�o�yli�my ob�z. Teraz b�d� m�g� zg��bia� tajniki alchemii. Przepisy gildii alchemik�w stoj� przede mn� otworem. Musz� odnale�� reszt�."	);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Bractwo nabiera kszta�tu. Dzi�ki bagiennemu zielu zbieranemu w okolicach obozu, mog� sporz�dza� mikstury ��cz�ce mnie ze �ni�cym." );
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Dokona�em wielkiego odkrycia. Jad pe�zaczy ma niezwykle silne dzia�anie pobudzaj�ce zmys�y." );

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Mikstura z �uwaczek pe�zacza jest za s�aba, by nawi�za� bezpo�redni kontakt ze �ni�cym."	);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Zg�osi� si� do mnie jaki� 'wielki bohater', kt�ry przyni�s� mi jaja pe�zaczy. Spr�buj� uwarzy� z nich mikstur�."	);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Uda�o si�! Y'Berion odczyta� znaki dzi�ki temu wywarowi. �ni�cy jest demonem s�u��cym Beliarowi. Skoro tak, to Beliar jest te� moim panem. Wyruszam do orkowego miasta. Tylko tam odnajd� mojego mistrza."	);

				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Zagadka_Adanos (C_Item)
{
	name 				=	"Zw�j prawdy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Zagadka_Adanos;
	scemeName			=	"MAP";
	description			= 	name;
	
	TEXT[0]				=	"Dziwne pismo, kt�re da� mi Adanos.";
};
func void Use_Zagadka_Adanos ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Sp�jrz na wod� i na mg��,"	);
					Doc_PrintLines	( nDocID,  0, "a czy widzisz te� wie��?"						);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wejd� do �rodka, otw�rz drzwi.");
					Doc_PrintLines	( nDocID,  0, "Star� map� zabierz mi."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Oddam skarb sw�j jednemu."						);
					Doc_PrintLines	( nDocID,  0, "On go da bogu memu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_FreeMine (C_Item)
{
	name 				=	"Nuty";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_FreeMine;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_FreeMine  ()
{   
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "FreeMine.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_AyanList (C_Item)
{
	name 				=	"List od Ayana";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_AyanList;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_AyanList  ()
{   
	
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

				Doc_PrintLine	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Willu,"	);
				Doc_PrintLines	( nDocID,  0, ""						);
				Doc_PrintLines	( nDocID,  0, "Nie wiem, czy jeszcze pami�tasz, co robi�em, zanim zaprosi�e� mnie do twierdzy. Chcia�em zbada� orkowy cmentarz, do kt�rego nie ma dost�pu. Kiedy b�dziesz mia� troch� czasu, zajrzyj do mnie. Wpad�em na pewien pomys�, dlatego wyrusz�, zanim wr�cisz, a potem razem spr�bujemy przeszuka� cmentarz.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
			
				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Lista_Mikstur (C_Item)
{
	name 				=	"Lista mikstur";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Lista_Mikstur;
	scemeName			=	"MAP";
	description			= 	"Lista mikstur";
};
func void Use_Lista_Mikstur ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "20 esencji leczniczych,"	);
					Doc_PrintLine	( nDocID,  0, "10 ekstrakt�w leczniczych,"						);
					Doc_PrintLine	( nDocID,  0, "10 esencji many,"	);
					Doc_PrintLine	( nDocID,  0, "3 mikstury szybko�ci."	);
					Doc_PrintLine	( nDocID,  0, ""    );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, ""     );
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, ""      	);
					Doc_PrintLine	( nDocID,  0, ""       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Matt_Kartka (C_Item)
{
	name 				=	"Kartka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Matt_Kartka;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[1] = "Zapisano na niej dziwne s�owa.";
};
func void Use_Matt_Kartka ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ".ezreifo w ano�o�z a�atsoz akzceiwo azswreiP");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "!aineim�az ag�top saw an einy�ps hceiN");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ClueMirror (C_Item)
{
	name 				=	"Pognieciona kartka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ClueMirror;
	scemeName			=	"MAP";
	description			= 	name;
};

func void Use_ClueMirror()
{
	var int Document;
	Document =	Doc_CreateMap		();
				Doc_SetPages		(Document, 1);
				Doc_SetPage 		(Document, 0, "ClueMirror.tga", TRUE);  // TRUE = scale to fullscreen
//				Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
				Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
				Doc_Show			(Document);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_StaryPergaminOrc1 (C_Item)
{
	name 				=	"Stary pergamin";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"itwr_scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_StaryPergaminOrc1;
	scemeName			=	"MAP";
	description			= 	"Stary pergamin str. 1";
};
func void Use_StaryPergaminOrc1 ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Dzie� 1"	);
					Doc_PrintLines	( nDocID,  0, "No to utkn��em. Nie zeskocz� st�d, nawet si� nie wychylam. To przez m�j paniczny l�k wysoko�ci. Wci�� nie pojmuj�, po co w og�le pr�bowa�em si� tu dosta�. Odczekam chwil� - mo�e kto� mnie dostrzegnie albo us�yszy."						);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "Dzie� 2"	);
					Doc_PrintLines	( nDocID,  0, "Orkowie mnie ignoruj� czy nie rozumiej�? A mo�e s� g�usi i �lepi? Cholera, zaczynam si� niepokoi�..."	);
					Doc_PrintLine	( nDocID,  0, ""    );
					Doc_PrintLine	( nDocID,  0, "Dzie� 4"  );
					Doc_PrintLines	( nDocID,  0, "Dobrze, �e zabra�em ze sob� troch� jedzenia i wody. Ci�gle kombinuj�, jakby si� st�d wydosta�. Orkowie dalej nie reaguj� na moje sygna�y."  );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_StaryPergaminOrc2 (C_Item)
{
	name 				=	"Stary pegramin";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"itwr_scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_StaryPergaminOrc2;
	scemeName			=	"MAP";
	description			= 	"Stary pergamin str. 2";
};
func void Use_StaryPergaminOrc2 ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Dzie� 10"     );
					Doc_PrintLines	( nDocID,  0, "Ko�cz� mi si� zapasy. Jeden z ork�w mnie dopatrzy�, ale nic poza tym. Przekaza� tylko co� wodzowi i przychodzi� wieczorami popatrze� jak 'zdycham'.");
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, "Dzie� 13"      	);
					Doc_PrintLines	( nDocID,  0, "G�upota ludzka i fatalne kontakty z orkami doprowadz� mnie do �mierci? Nie tak wyobra�a�em sobie m�j koniec. Oby kiedy� orkowie i ludzie si� pogodzili."       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Dzie� 14"						);
					Doc_PrintLines	( nDocID,  0, "Je�li kto� kiedykolwiek mnie odnajdzie, niech ma w �wiadomo�ci, �e nie jestem jedyn� ofiar� nieprzyjacielskich stosunk�w orkowo-ludzkich. M�j brat zgin�� podobnie - wyg�odzony i pobity. Szlag by was trafi� przekl�ci orkowie!"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_List_Keroloth (C_Item)
{
	name 				=	"List do Gestatha";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_List_Keroloth;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_List_Keroloth ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Gestath,"	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "czas wyr�n�� ork�w co do jednego."	);
					Doc_PrintLine	( nDocID,  0, "Potrzebuj� Twoich ludzi na mury twierdzy."	);
					Doc_PrintLine	( nDocID,  0, "Maj�c tak doskona�ych strzelc�w,"    );
					Doc_PrintLine	( nDocID,  0, "bez problemu rozgromiliby�my ich szeregi.");
					Doc_PrintLine	( nDocID,  0, "Walka wr�cz to ju� nasza sprawa..."  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, "Potrzebuj� jak najwi�cej ludzi."  );
					Doc_PrintLine	( nDocID,  0, "Przy�lij ich do Kanionu Trolli."     );				
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, ""      	);
					Doc_PrintLine	( nDocID,  0, "Keroloth"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_List_AranOrkowie (C_Item)
{
	name 				=	"Orkowa notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_List_AranOrkowie;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_List_AranOrkowie ()
{
	B_Say (self, self, "$CANTREADTHIS");	
	AI_PlayAni(self,"T_DONTKNOW");	
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_List_Jaszczuroludzie (C_Item)
{
	name 				=	"Notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_List_Jaszczuroludzie;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Znaleziona u �r�d�a zamro�onej";
	TEXT[1]				=	"rzeki w g�rach.";
	
};
func void Use_List_Jaszczuroludzie ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Uga!"	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Kamashi potrzebowa� g�owa wszystkie ludzie-dow�dca."	);
					Doc_PrintLine	( nDocID,  0, "Ugosh przynie�� to Kamashi."	);
					Doc_PrintLine	( nDocID,  0, "Pallum-Bo, ty si� zaj�� Gestath, ja Keroloth."    );
					Doc_PrintLine	( nDocID,  0, "Pallum-Bo przynie�� to Ugosh i Kamashi szcz�liwy."  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, "�pieszy� si�, Kamashi z�y."  );
					Doc_PrintLine	( nDocID,  0, "Uga!"     );
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, ""      	);
					Doc_PrintLine	( nDocID,  0, "Ugosh"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ListBandyci		(C_Item)
{
	name 				=	"Rozkazy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ListBandyci;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"Zabra�em ten list";
	TEXT[3]				= 	"bandytom z Opuszczonej Kopalni.";

	
};
func void Use_ListBandyci ()
{   

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Ch�opaki, musicie koniecznie znale�� s�aby punkt w obozie tych ca�ych my�liwych. Swoj� drog� to oczy�cili�my ten grobowiec obok obozu, ale to ch��d jest naszym najwi�kszym wrogiem. Przez t� lodow� krain� w pobli�u, musimy dawa� wi�cej �arcia niewolnikom...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "     Nod");
				Doc_Show		(nDocID);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZezwolenieBandyci		(C_Item)
{
	name 				=	"Zezwolenie";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ZezwolenieBandyci;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"Zezwolenie na widzenie si� z Nodem.";
	
};

func void Use_ZezwolenieBandyci ()
{   

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLines	(nDocID,  0, "Zezwalam bandycie Willowi na widzenie si� z szefem.");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Podpisano,");
				Doc_PrintLines	(nDocID,  0, "Frut"								);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLine	(nDocID,  0, ""											);
				Doc_Show		(nDocID);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Niewolnicy		(C_Item)
{
	name 				=	"Papier dla Gobby'ego";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Niewolnicy;
	scemeName			=	"MAP";
	description			=  	name;
	
	TEXT[2]				= 	"Papier, dzi�ki kt�remu Gobby da mi niewolnik�w.";
	
};

func void Use_Niewolnicy ()
{   

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLines	(nDocID,  0, "Gobby, daj temu bandycie niewolnika.");
				Doc_PrintLines	(nDocID,  0, "Swoj� drog� nasi ch�opcy st�sknili si� za twoimi tekstami...");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Podpisano,");
				Doc_PrintLines	(nDocID,  0, "Frut"								);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, ""														);
				Doc_PrintLine	(nDocID,  0, ""											);
				Doc_Show		(nDocID);
		
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItWr_PradawnePismo_1		(C_Item)
{
	name 				=	"Pradawne pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PradawnePismo_1;
	scemeName			=	"MAP";
	description			=  	name;
	
};

var int Use_PradawnePismo_1_OneTime;
func void Use_PradawnePismo_1 ()
{   
 	if (Use_PradawnePismo_1_OneTime == FALSE)

 	{
	 	Log_CreateTopic (TOPIC_Niedostepny_Klif, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Niedostepny_Klif, LOG_RUNNING);
		B_LogEntry (TOPIC_Niedostepny_Klif,"Klif niedaleko obozu bandyt�w jest ogrodzony magiczn� barier�. Ciekawe, co si� tam kryje?"); 
		Use_PradawnePismo_1_OneTime = TRUE;
	};

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Kimkolwiek jeste�, m�wi� ci:");
				Doc_PrintLines	(nDocID,  0, "nie otworzysz ukrytych drzwi!");
				Doc_PrintLines	(nDocID,  0, "Moc �ywio��w mieszka tam,");
				Doc_PrintLines	(nDocID,  0, "s� pot�ne, m�wi� wam!");
				Doc_PrintLines	(nDocID,  0, "Szukaj krypt, by pot�nym by�,"								);
				Doc_PrintLines	(nDocID,  0, "mo�e ci uda si� wiecznie �y�...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_Show		(nDocID);
		
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Fexo (C_Item)
{
	name 				=	"Fexo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Fexo;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_Fexo ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Cz�owiek, kt�ry o�ywi� Star� Kopalni� i w�tek na bagnie. Stworzon� przeze mnie 'r�bank�' za palisad� zamieni� na opowie�� o biednych duszach n�kanych przez Kazmina i nadchodz�ce 'Za�mienie'.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "'To AV mnie wyko�czy!'");
					Doc_PrintLines	( nDocID,  0, "'Gdzie do cholery s� te g�upie ko�ci?!'");
					Doc_PrintLines	( nDocID,  0, "--- Pi�ciu braci'");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Mghej4 (C_Item)
{
	name 				=	"Maciey";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Mghej4;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_Mghej4 ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Multibetatester, od samego pocz�tku, do samego ko�ca. Przechodzi� pierwsze misje lata temu, gdy na zamku stacjonowali jeszcze nieusuni�ci paladyni! Wielkie podzi�kowania r�wnie� za kilkana�cie godzin sp�dzonych w Spacerze na poprawianiu ro�linno�ci oraz stworzeniu orkowego obozu na pla�y.");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PreriowyScierwojad (C_Item)
{
	name 				=	"Preriowy �cierwojad";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PreriowyScierwojad;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_PreriowyScierwojad ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Za model 3D zniszczonego Bractwa �ni�cego i za kilka czarnych rob�t w skryptach. Dzi�ki!");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TheKetrab (C_Item)
{
	name 				=	"TheKetrab";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_TheKetrab;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_TheKetrab ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Gdybym wiedzia�, ile godzin sp�dz� przy stworzeniu tej modyfikacji, to bym si� za to nigdy nie zabra�. Chocia� mo�e dobrze, �e nie wiedzia�em..."	);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "-> i tak suma czas�w gry wszystkich konsument�w b�dzie mniejsza!"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "..."						);
					Doc_PrintLines	( nDocID,  0, "..."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Bogu (C_Item)
{
	name 				=	"Bogu";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Bogu;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_Bogu ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Gdyby nie Ty, ten mod by�by co najmniej dwa razy gorszy i dobrze o tym wiesz. Ten dzik poprawi� multum b��d�w, z kt�rymi sobie nie radzi�em i wprowadzi� wiele innowacji skryptowych. Tylko dzi�ki niemu uda�o si� to uko�czy� w 2019 roku.");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Simen (C_Item)
{
	name 				=	"Simen";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Simen;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_Simen ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Nale�y Ci si�, zawodowy krytyku i narzekaczu! Z radami tego pana, 'Ucieczka' sta�a si� bardziej logiczna, ciekawsza i bugoodporna. Ile jeszcze modyfikacji uratujesz przed wydaniem jako niedorobionych?");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Mchuable (C_Item)
{
	name 				=	"Mchuable";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Mchuable;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_Mchuable ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Te 2500 kwestii chyba na zawsze zostanie w Twojej g�owie, co? W mojej r�wnie�. I przycinanie tego, nazywanie ich i przypominanie o robocie :) Wykona�e� kawa� dobrej roboty. Brawo!");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
};

// **********************************************
// . . . . . . . . . . Czary . . . . . . . . . .
// **********************************************

INSTANCE It_Heart_IceCube (C_Item)
{
    name                 =    "Serce lodowego golema";

    mainflag             =    ITEM_KAT_RUNE;
    flags                 =    ITEM_MULTI;

    value                 =    Value_Ru_IceCube;

    visual                =    "ItAt_IceGolemHeart.3DS";
    material            =    MAT_STONE;

    spell                =     SPL_ICECUBE;
    cond_atr[2]           =    ATR_MANA_MAX;
    cond_value[2]          =    0;

    wear                =     WEAR_EFFECT;
    effect                =    "SPELLFX_WEAKGLIMMER";

    description            =    name;
    TEXT    [0]            =    "Zakl�cie: Bry�a lodu";
    TEXT    [1]            =    "Obra�enia od magii: 20 + aktualna mana";
    TEXT    [2]            =    "Dodatkowe obra�enia:";
    TEXT    [3]            =    NAME_Sec_Duration;                COUNT    [3]        =    SPL_TIME_FREEZE;
    TEXT    [4]            =    NAME_DamagePerSec;                COUNT    [4]        =    SPL_FREEZE_DAMAGE;
    TEXT    [5]            =    NAME_Value;                        COUNT    [5]        =    value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportMysliwi (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalHolyBolt.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportMysliwi;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja do obozu my�liwych";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportOrcTown(C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalHolyBolt.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOrcTown;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja do orkowego miasta";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportLowcy (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalLightHeal.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportLowcy;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja do �owc�w ork�w";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportBandyci (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalLight.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportBandyci;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja do obozu bandyt�w";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportTwierdza (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalTeleportSecret.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportTwierdza;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja do twierdzy";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportOzywieniec (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"RuneStoneMoje1.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOzywieniec;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Kamie� teleportacyjny na drug� stron� rzeki";
	
	TEXT	[0]			=	"Ayan rzuci� go do rzeki.";			
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportAlchemicy (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"RuneStoneMoje2.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportAlchemicy;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja";
	
	TEXT	[0]			=	"Znaleziona za bajorem obok wie�y.";			
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportPrzelecz (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"RuneStoneMoje3.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPrzelecz;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja";
	
	TEXT	[0]			=	"Ukryta na prze��czy.";			
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportRockcamp (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalHolyBolt.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRockcamp;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja na po�udniowy-wsch�d";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TeleportBagno (C_Item) 
{
	name 				=	NAME_Teleport;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalHolyBolt.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportBagno;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleportacja na bagno";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TrfMeatbug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItNa_TrfMeatbug_Item.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfGiantBug;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Przemiana w chrz�szcza";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TrfGolem (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfGiantRat;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Przemiana w kamiennego golema";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TrfSwampDrone (C_Item)
{
	name 				=	"Przemiana w bagiennego trutnia";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItNa_TrfBagTruten_Item.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfSheep;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Przemiana w bagiennego trutnia";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_SummonStraznik (C_Item)
{
	name 				=	"Tajemniczy zw�j";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalLight;

	visual				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonStraznik;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	name;
	
	TEXT	[0]			=	"";
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_PalLIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Inflate (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItSc_MassDeath.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_Inflate;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Nadmuchaj";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GroupHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItSc_MassDeath.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_GroupHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Ulecz towarzyszy";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Grow (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItSc_MassDeath.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_Grow;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Powi�kszenie";

	TEXT	[0]			=	"Z�o�y�em ten zw�j z fragment�w"	;
	TEXT	[1]			=	"znalezionych na bagnie."	;

	TEXT	[3]			=	NAME_Mana_needed;			
	COUNT	[3]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Oswojenie(C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Sc_Charm;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Oswojenie;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Oswojenie";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;

	TEXT	[3]			=	"Zakl�cie powoduje neutralne zachowanie";
	TEXT	[4]			=	"zwierz�cia wzgl�dem rzucaj�cego.";
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CreatePortal (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalDestroyEvil.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_CreatePortal;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Stw�rz portal 1";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GotoPortal (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalDestroyEvil.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_GotoPortal;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Przenie� do portalu 1";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CreatePortal2 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalDestroyEvil.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_CreatePortal2;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Stw�rz portal 2";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GotoPortal2 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	100;
	
	visual				=	"ItRu_PalDestroyEvil.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_GotoPortal2;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Przenie� do portalu 2";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

// **********************************************
// . . . . . . . . . . Zbroje . . . . . . . . . .
// **********************************************


INSTANCE ITNA_GUR_M (C_Item)
{
	name 					=	"Szata guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"GURM.3ds";
	visual_change 			=	"Hum_GurM_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};


INSTANCE ITNA_Cook_Armor (C_Item)
{
	name 					=	"Str�j kucharza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Smith.3ds";
	visual_change 			=	"HUM_COOK_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITNA_BAN_L (C_Item)
{
	name 					=	"Lekki pancerz bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	300;

	wear 					=	WEAR_TORSO;

	visual 					=	"SLDL.3ds";
	visual_change 			=	"Hum_SldL_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITNA_Nov_L (C_Item)
{
	name 					=	"Szata nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"NOVL.3ds";
	visual_change 			=	"Hum_NovL_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITNA_OUT_L (C_Item)
{
	name 					=	"Lekki pancerz my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	400;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_M.3ds";
	visual_change 			=	"Armor_OUT_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_OUT_M (C_Item)
{
	name 					=	"�redni pancerz my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	600;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_H.3ds";
	visual_change 			=	"Armor_OUT_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_OUT_H (C_Item)
{
	name 					=	"Ci�ki pancerz my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_M.3DS";
	visual_change 			=	"Armor_OUT_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_OUT_S (C_Item)
{
	name 					=	"Wzmocniona zbroja my�liwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT]	= 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	20;

	value 					=	1500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_Crawler.3ds";
	visual_change 			=	"Armor_Djg_Crawler.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_OUT_ULTRA (C_Item)
{
	name 					=	"Pancerz wielkiego �owczego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT]	= 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	20;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_Crawler.3ds";
	visual_change 			=	"Armor_OUT_ULTRA.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};




// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_BAN_M (C_Item)
{
	name 					=	"Pancerz bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_M.3ds";
	//visual_change 			=	"Armor_Sld_M.asc";
	visual_change = "ARMOR_BANNEW_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_BAN_H (C_Item)
{
	name 					=	"Ci�ki pancerz bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_H.3ds";
	//visual_change 			=	"Armor_Sld_H.asc";
	visual_change = "ARMOR_BANNEW_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_L (C_Item)
{
	name 					=	"Lekki pancerz �owcy ork�w";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	400;

	wear 					=	WEAR_TORSO;

	// stare
	//visual 					=	"ItAr_Ranger_ADDON.3ds";
	//visual_change 			=	"Armor_Ranger_ADDON.asc";
	
	// to ma sens -> zostalo im duzo takich zbroi, czesc z lowcow to knechci z fortu
	visual 					=	"ItAr_MIL_L.3DS";
	visual_change 			=	"Armor_Mil_L.asc";
	
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;	
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_M (C_Item)
{
	name 					=	"Ci�ki pancerz �owcy ork�w";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	600;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bloodwyn_ADDON.3ds";
	visual_change 			=	"Armor_OrcHunter.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_H (C_Item)
{
	name 					=	"Zbroja �owcy ork�w";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3ds";
	visual_change 			=	"Armor_Djg_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_S_Will (C_Item)
{
	name 					=	"Ci�ka zbroja �owcy ork�w";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT]	= 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	20;

	value 					=	1500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_M.3ds";
	visual_change 			=	"DJG_H_NOHELMET.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_S (C_Item)
{
	name 					=	"Ci�ka zbroja �owcy ork�w";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT]	= 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	20;

	value 					=	1500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_M.3ds";
	visual_change 			=	"Armor_Djg_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_DJG_ULTRA (C_Item)
{
	name 					=	"Zbroja z pancerza orka-elity";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT]	= 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	20;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_M.3ds";
	visual_change 			=	"PAL_ORC.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ITNA_ARMOR_ANCIENT (C_Item)
{
	name 					=	"Elitarny Pancerz Pradawnych";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	30;

	value 					=	10000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Raven_ADDON.3ds";
	visual_change 			=	"Armor_PRADAWNI.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_UkrytaZbroja (C_Item)
{
	name 					=	"Ukryta Zbroja";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	20;

	value 					=	VALUE_ITAR_DJG_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bloodwyn_ADDON.3ds";
	visual_change 			=	"Armor_Djg_X.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ItNa_PancerzKrolewski (C_Item)
{
	name 					=	"Pancerz stra�y kr�lewskiej";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bloodwyn_ADDON.3ds";
	visual_change 			=	"Armor_Krolewski.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// **********************************************
// . . . . . . . . . . Pasy . . . . . . . . . .
// **********************************************

INSTANCE  ItNa_PasMysliwego (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	250;

	visual 			=	"ItMi_Belt_05.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasMysliwego;
	on_unequip		=	UnEquip_ItNa_PasMysliwego;

	description		=  "Pas my�liwego";
	
	TEXT[1]			= NAME_ADDON_BONUS_BOW;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_ADDON_BONUS_1H;
	COUNT[2]		= 5;
	//TEXT[3]			= "Bonus tylko dla my�liwych.";		
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasMysliwego()
{
	//if (self.guild == GIL_OUT)
	//{
		B_AddFightSkill (self, NPC_TALENT_BOW, 10);
		B_AddFightSkill (self, NPC_TALENT_1H, 5);
	//};
};
FUNC VOID UnEquip_ItNa_PasMysliwego()
{
	//if (self.guild == GIL_OUT)
	//{
		B_AddFightSkill (self, NPC_TALENT_BOW, -10);
		B_AddFightSkill (self, NPC_TALENT_1H, -5);
	//};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PasStalowejReki (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_MIL_01;

	visual 			=	"ItMi_Belt_03.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasStalowejReki;
	on_unequip		=	UnEquip_ItNa_PasStalowejReki;

	description		=  "Pas stalowej r�ki";

	TEXT[1]			=	NAME_Prot_Edge;			
	COUNT[1]		= 	Belt_Prot_01;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	Belt_Prot_01;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasStalowejReki()
{
	self.protection[PROT_EDGE]  += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;

};
FUNC VOID UnEquip_ItNa_PasStalowejReki()
{
	self.protection[PROT_EDGE]  -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_PasLowcyOrkow (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_10.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasLowcyOrkow;
	on_unequip		=	Unequip_ItNa_PasLowcyOrkow;

	description		=  "Pas �owcy ork�w";

	TEXT[1]			=	NAME_ADDON_BONUS_1H;			
	COUNT[1]		= 	5;
	TEXT[2]			=	NAME_ADDON_BONUS_2H;		
	COUNT[2]		= 	5;
	//TEXT[3]			=	"Bonus tylko dla �owc�w ork�w.";		

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasLowcyOrkow()
{
	//if (self.guild == GIL_DJG)
	//{
		B_AddFightSkill (self, NPC_TALENT_1H, 5);
		B_AddFightSkill (self, NPC_TALENT_2H, 5);
	//};
};
FUNC VOID UnEquip_ItNa_PasLowcyOrkow()
{
	//if (self.guild == GIL_DJG)
	//{
		B_AddFightSkill (self, NPC_TALENT_1H, -5);
		B_AddFightSkill (self, NPC_TALENT_2H, -5);
	//};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_SzarfaSniacego (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_09.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_SzarfaSniacego;
	on_unequip		=	UnEquip_ItNa_SzarfaSniacego;

	description		=  "Szarfa �ni�cego";

	TEXT[1]			=	NAME_Bonus_ManaMax;			
	COUNT[1]		= 	25;

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_SzarfaSniacego()
{
	Npc_ChangeAttribute(self, ATR_MANA_MAX, + 25 );
};
FUNC VOID UnEquip_ItNa_SzarfaSniacego()
{
	Npc_ChangeAttribute(self, ATR_MANA_MAX, - 25 );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_PasBandyty (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_11.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasBandyty;
	on_unequip		=	UnEquip_ItNa_PasBandyty;

	description		=  "Pas Bandyty";

	TEXT[1]			=	NAME_Bonus_Str;			
	COUNT[1]		= 	5;
	TEXT[2]			=	NAME_Prot_Edge;			
	COUNT[2]		= 	10;

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasBandyty()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, + 5 );
	self.protection[PROT_EDGE]  += 10;
};
FUNC VOID UnEquip_ItNa_PasBandyty()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, - 5 );
	self.protection[PROT_EDGE]  -= 10;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

INSTANCE  ItNa_PasMadrosci (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasMadrosci;
	on_unequip		=	UnEquip_ItNa_PasMadrosci;

	description		=  "Pas m�dro�ci";

	TEXT[1]			=	NAME_Bonus_Str;			
	COUNT[1]		= 	3;
	TEXT[2]			=	NAME_Bonus_Dex;		
	COUNT[2]		= 	3;
	TEXT[3]			=	NAME_Bonus_ManaMax;
	COUNT[3]		= 	2;

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasMadrosci()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, +3 );
	Npc_ChangeAttribute(self, ATR_DEXTERITY, +3 );
	Npc_ChangeAttribute(self, ATR_MANA_MAX, +2 );
};
FUNC VOID UnEquip_ItNa_PasMadrosci()
{
	Npc_ChangeAttribute(self, ATR_STRENGTH, -3 );
	Npc_ChangeAttribute(self, ATR_DEXTERITY, -3 );
	Npc_ChangeAttribute(self, ATR_MANA_MAX, -2 );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

INSTANCE  ItNa_PasZawodowcow (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_11.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasZawodowcow;
	on_unequip		=	UnEquip_ItNa_PasZawodowcow;

	description		=  "Pas zawodowc�w";

	TEXT[1]			=	NAME_ADDON_BONUS_BOW;			
	COUNT[1]		= 	10;
	TEXT[2]			=	NAME_Prot_Point;		
	COUNT[2]		= 	10;
	TEXT[3]			=	NAME_Bonus_HpMax;
	COUNT[3]		= 	20;

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasZawodowcow()
{
	B_AddFightSkill (self, NPC_TALENT_BOW, 10);
	self.protection[PROT_POINT]  += 10;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
};
FUNC VOID UnEquip_ItNa_PasZawodowcow()
{
	B_AddFightSkill (self, NPC_TALENT_BOW, -10);
	self.protection[PROT_POINT]  -= 10;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 20;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

INSTANCE  ItNa_PasMistrzowski (C_Item)
{
	name 			=	NAME_Addon_Belt;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_BELT|ITEM_MULTI;

	value 			=	Value_ItBE_Addon_Leather_01;

	visual 			=	"ItMi_Belt_10.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItNa_PasMistrzowski;
	on_unequip		=	UnEquip_ItNa_PasMistrzowski;

	description		=  "Pas mistrzowski";

	TEXT[1]			=	NAME_ADDON_BONUS_2H;			
	COUNT[1]		= 	10;
	TEXT[2]			=	NAME_Bonus_Str;		
	COUNT[2]		= 	15;
	TEXT[3]			=	NAME_Bonus_HpMax;
	COUNT[3]		= 	40;

	TEXT[5]			=   NAME_Value;
	COUNT[5]		=   value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		= INVCAM_ENTF_MISC2_STANDARD;
	
};
FUNC VOID Equip_ItNa_PasMistrzowski()
{
	B_AddFightSkill (self, NPC_TALENT_2H, 10);
	Npc_ChangeAttribute(self, ATR_STRENGTH, + 15 );
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 40;
};
FUNC VOID UnEquip_ItNa_PasMistrzowski()
{
	B_AddFightSkill (self, NPC_TALENT_2H, -10);
	Npc_ChangeAttribute(self, ATR_STRENGTH, - 15 );
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 40;
};


// **********************************************
// . . . . . . . . . . Mikstury . . . . . . . . . .
// **********************************************

//----- HEALTH -----
INSTANCE ItNa_SakwaMikstur_Health (C_Item)
{
	name 				=	"Sakwa mikstur";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_PaczkaMikstur_Health;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_PaczkaMikstur_Health ()
{
	CreateInvItems (hero,ItPo_Health_01, 12);
	CreateInvItems (hero,ItPo_Health_02, 5);

};

//----- MANA -----
INSTANCE ItNa_SakwaMikstur_Mana (C_Item)
{
	name 				=	"Sakwa mikstur";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_PaczkaMikstur_Mana;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_PaczkaMikstur_Mana ()
{
	CreateInvItems (hero,ItPo_Mana_01, 8);
	CreateInvItems (hero,ItPo_Health_01, 5);
	CreateInvItems (hero,ItPo_Health_02, 2);

};

//----- POWER -----
INSTANCE ItNa_SakwaMikstur_Power (C_Item)
{
	name 				=	"Sakwa mikstur";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_PaczkaMikstur_Power;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_PaczkaMikstur_Power ()
{
	CreateInvItems (hero,ItPo_Health_01, 3);
	CreateInvItems (hero,ItPo_Perm_Health, 1);
	CreateInvItems (hero,ItPo_Perm_STR, 1);
	CreateInvItems (hero,ItPo_Perm_DEX, 2);

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_WywarVachuta(C_Item)
{
	name 			=	"Wywar Vachuta";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	0;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseJabol;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PoteznyWywar(C_Item)
{
	name 			=	"Wywar";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	0;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseJabol;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Jabol(C_Item)
{
	name 			=	"Jabol";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseJabol;
	scemeName		=	"POTIONFAST";

	description		= 	"Jabol";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	1;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;

};

func void UseJabol()
{
	if (Npc_IsPlayer(self)) {
		DrunkTrinken += 1;
	};

	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
		B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	5);	
		//Npc_ChangeAttribute	(self, ATR_HITPOINTS,	5);
		PercentHealSelf(5,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
var int RyzowkaOneTime;
INSTANCE ItNa_Ryzowka (C_Item)
{
	name 			=	"Ry��wka";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	20;	

	visual 			=	"ItFo_Booze_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRyzowka;
	scemeName		=	"POTIONFAST";

	description		= 	name;
			
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

func void UseRyzowka()
{
	if (Npc_IsPlayer(self)) {
		DrunkTrinken += 1;
	};

	if (RyzowkaOneTime == FALSE) {
		
		hero.lp+=1;
		PrintS_Ext("Punkty nauki +1", RGBA(255,255,255,0));
		RyzowkaOneTime = TRUE;
	};
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
var int WyciagJagodyMax;
INSTANCE ItNa_WyciagJagody (C_Item)
{
	name 			=	"Wyci�g z jag�d";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWyciagJagody;
	scemeName		=	"POTIONFAST";

	description		= 	"Wyci�g z jag�d";
			
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_LousHammer;

};

func void UseWyciagJagody()
{
	if (Npc_IsPlayer(self)) {
		DrunkTrinken += 1;
	};

	WyciagJagodyMax = WyciagJagodyMax + 1;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
var int WyciagGrzybyMax;
INSTANCE ItNa_WyciagGrzyby (C_Item)
{
	name 			=	"Wyci�g z grzyb�w";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWyciagGrzyby;
	scemeName		=	"POTIONFAST";

	description		= 	"Wyci�g z grzyb�w";
			
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_LousHammer;

};

func void UseWyciagGrzyby()
{
	if (Npc_IsPlayer(self)) {
		DrunkTrinken += 1;
	};

	WyciagGrzybyMax = WyciagGrzybyMax + 1;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Odtrutka(C_Item)
{
	name 			=	"Odtrutka";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ITNA_ODTRUTKA.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseOdtrutka;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	//effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Odtrutka";
	
	TEXT[1]			= 	"Zwalcza ka�d� trucizn�.";				
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

FUNC VOID UseOdtrutka()
{ 

	OdtrutkaEverUsed = TRUE;


	AI_PlayAni  (self,"T_MAGRUN_2_FEASHOOT");
	/*
	if(buff_has(self,Poison10HP))	{
		Buff_RemoveAll(self,Poison10HP);
	};

	if(buff_has(self,Poison5HP)) {
		Buff_RemoveAll(self,Poison5HP);
	};
	
	if(buff_has(self,Poison1HP)){
		Buff_RemoveAll(self,Poison1HP);
	};
	*/

	PoisonStop();
	
	Wld_PlayEffect("Spellfx_Lightstar_Orange",  self, self, 0, 0, 0, FALSE );
	Snd_Play ("MFX_HEAL_CAST"); 
	AI_PlayAni  (self,"T_FEASHOOT_2_STAND");

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_TruciznaDaryl(C_Item)
{
	name 			=	"Trucizna Daryla";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItNa_Trucizna.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTruciznaDaryla;
	scemeName		=	"POTIONFAST";

	description		= 	name;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

var int Kopalnia_Trucizna_Wypite;
FUNC VOID UseTruciznaDaryla()
{ 
    //AI_StartState		(self, ZS_MagicSleep, 0, "");
    AI_PlayAniBS (self,	"T_STAND_2_VICTIM_SLE", BS_LIE );
	
	B_LogEntry(TOPIC_Ben_taktyki, "Trucizna faktycznie przesta�a dzia�a�, chocia� dalej czuj� si� fatalnie. Wydosta�em si� na zewn�trz! Teraz pod os�on� nocy musz� uciec z tego obozu...");
	Log_SetTopicStatus (TOPIC_Ben_taktyki, LOG_SUCCESS);
	B_GivePlayerXP(100);
	
	// przeniesione do funkcji z zaciemnieniem
	// Npc_SwitchInventory_Kopalnia(self);
	
	UcieklesZKopalni = TRUE;
	
	Kopalnia_Trucizna_Uzyte = TRUE;
	Fade_Status = 1;
	ff_applyonce(Kopalnia_Trucizna);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Trucizna(C_Item)
{
	name 			=	"Trucizna";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItNa_Trucizna.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTrucizna;
	scemeName		=	"POTIONFAST";

	//wear			= 	WEAR_EFFECT;
	
	description		= 	name;
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	//COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	50;
};

FUNC VOID UseTrucizna()
{ 

	AI_PlayAni  (self,"T_MAGRUN_2_FEASHOOT");
	Wld_PlayEffect("Spellfx_Lightstar_Orange",  self, self, 0, 0, 0, FALSE );
	Snd_Play ("MFX_HEAL_CAST"); 
	AI_PlayAni  (self,"T_FEASHOOT_2_STAND");
	
	if(Npc_IsPlayer(self)) {
		//TruciznaFunction1();
		//buff_apply(hero,Poison10HP);
		Poison10HPStart();
	}
	
	else {
		self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS]/2;
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_OrkowaMikstura(C_Item)
{
	name 			=	"Orkowa mikstura";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	100;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseOrkowaMikstura;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	name;
	
	TEXT[1]			= 	"";				
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	50;
};

FUNC VOID UseOrkowaMikstura()
{ 
	Wld_PlayEffect ("spellFX_Whirlwind_COLLIDE", hero, hero, 0, 0, 0, FALSE);
	//AI_StartState		(hero, ZS_Whirlwind, 0, "");
	hero.attribute[0] = hero.attribute[0]/2;
	//B_MagicHurtNpc (oth, slf, 65); //115 Schaden reicht genau f�r einen Lurker.
	Wld_SendTrigger ("MOVER_ORCCITY_20");
	Wld_SendTrigger ("MOVER_ORCCITY_21");
	Wld_SendTrigger ("MOVER_ORCCITY_22");
	Wld_InsertNpc	(MinecrawlerWarrior,"NASZ_ORCCITY_SECOND_21");
	Wld_InsertNpc	(MinecrawlerWarrior,"NASZ_ORCCITY_SECOND_21");
	Wld_InsertNpc	(MinecrawlerWarrior,"NASZ_ORCCITY_SECOND_22");
	Wld_InsertNpc	(MinecrawlerWarrior,"NASZ_ORCCITY_SECOND_22");


};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_RykSmoka(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Speed;	

	visual 			=	"ItPo_Speed.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_RykSmoka;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Ryk smoka";
	TEXT[1]			= 	"Zwi�ksza si�� o 50.";
	
	TEXT[3]			= 	NAME_Sec_Duration;				
	COUNT[3]		= 	120;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItNa_RykSmoka()
	{
		HeroDrankStrPotion = TRUE;
		ff_applyonceext(StrPotion,1000,-1);
		
	};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CienCieniostwora(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Speed;	

	visual 			=	"ItPo_Speed.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_CienCieniostwora;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Cie� cieniostwora";
	TEXT[1]			= 	"Zwi�ksza zr�czno�� o 50.";
	
	TEXT[3]			= 	NAME_Sec_Duration;				
	COUNT[3]		= 	120;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItNa_CienCieniostwora()
	{
		HeroDrankDexPotion = TRUE;
		ff_applyonceext(DexPotion,1000,-1);
		
	};
	
// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZmoraGwardzisty(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Speed;	

	visual 			=	"ItPo_Speed.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_ZmoraGwardzisty;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Zmora gwardzisty";
	TEXT[1]			= 	"Dodaje wszystkie umiej�tno�ci z�odziejskie.";
	
	TEXT[3]			= 	NAME_Sec_Duration;				
	COUNT[3]		= 	120;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItNa_ZmoraGwardzisty()
	{
		HeroDrankBDTPotion = TRUE;
		ff_applyonceext(BDTPotion,1000,-1);
		
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MiksturaUspokajajaca (C_Item)
{
	name 			=	"Mikstura uspokajaj�ca";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"itmi_holywater.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_Uspokajajaca;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Mikstura Uspokajaj�ca";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

FUNC VOID UseItNa_Uspokajajaca()
{
	// ponoc glupio wyglada
	//AI_PlayAni (self, "S_SUCKENERGY_VICTIM");
	// TODO przeniesc ta animacje z G1
	AI_PlayAni(self,"T_PSI_VICTIM");
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KropleDuszy(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Speed;	

	visual 			=	"ItAt_DragonBlood.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_KropleDuszy;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Krople duszy";
	TEXT[1]			= 	"Czyni tego, kto j� wypije";
	TEXT[1]			= 	"nie�miertelnym...";
	
	TEXT[3]			= 	NAME_Sec_Duration;				
	COUNT[3]		= 	120;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItNa_KropleDuszy()
	{
		HeroDrankCheatPotion = TRUE;
		ff_applyonceext(CheatPotion,1000,-1);
		Snd_Play ("DEM_Warn");
	};



// **********************************************
// . . . . . . . . . . Strza�y . . . . . . . . . .
// **********************************************

const string ARROWS_NORMAL = "U�ywasz zwyk�e strza�y";
const string ARROWS_SHARP = "U�ywasz ostre strza�y";
const string ARROWS_FIRE = "U�ywasz ogniste strza�y";
const string ARROWS_ICE = "U�ywasz lodowe strza�y";

const string ARROWS_YOU_USE_ALREADY = "Ju� u�ywasz tych strza�!";
const string ARROWS_ON_CBOW = "Strza� nie mo�na na�o�y� na kusz�!";
const string ARROWS_NO_BOW = "Brak wyposa�onego �uku!";

const string BOLTS_NORMAL = "U�ywasz zwyk�e be�ty";
const string BOLTS_SHARP = "U�ywasz ostre be�ty";

const string BOLTS_YOU_USE_ALREADY = "Ju� u�ywasz tych be�t�w!";
const string BOLTS_ON_BOW = "Be�t�w nie mo�na na�o�y� na �uk!";
const string BOLTS_NO_CBOW = "Brak wyposa�onej kuszy!";

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItRw_Arrow(C_Item)
{
	name 				=	"Strza�a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	Value_Pfeil;

	on_state[0]			=   Use_ZwyklaStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= value;
};

FUNC void Use_ZwyklaStrzala()
{
	CreateInvItems(self,ItRw_Arrow,1);
	
	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_BOW)
		{
			if(BowMunition == NormalArrow)
			{
				PrintS_Ext(ARROWS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(ARROWS_NORMAL, RGBA(255,255,255,0));
				BowMunition = NormalArrow;
				RangedWeapon.munition = ItRw_Arrow;
			};
		}
		else
		{
			PrintS_Ext(ARROWS_ON_CBOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(ARROWS_NO_BOW, RGBA(255,255,255,0));
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItRw_Bolt(C_Item)
{
	name 				=	"Be�t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	Value_Bolzen; // 1
	
	on_state[0]			=   Use_NormalBolt;
	scemeName			=	"MAPSEALED";

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= value;
};

FUNC void Use_NormalBolt()
{
	CreateInvItems(self,ItRw_Bolt,1);
	
	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_CROSSBOW)
		{
			if(CBowMunition == NormalBolt)
			{
				PrintS_Ext(BOLTS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(BOLTS_NORMAL, RGBA(255,255,255,0));
				CBowMunition = NormalBolt;
				RangedWeapon.munition = ItRw_Bolt;
			};
		}
		else
		{
			PrintS_Ext(BOLTS_ON_BOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(BOLTS_NO_CBOW, RGBA(255,255,255,0));
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItRw_SharpBolt(C_Item)
{
	name 				=	"Ostry be�t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_SharpBolt;
	scemeName			=	"MAPSEALED";

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]				= 	"Obra�enia + 10";
	TEXT[5]				= 	NAME_Value;				COUNT[5]	= value;
};

FUNC void Use_SharpBolt()
{
	CreateInvItems(self,ItRw_SharpBolt,1);
	
	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_CROSSBOW)
		{
			if(CBowMunition == SharpBolt)
			{
				PrintS_Ext(BOLTS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(BOLTS_SHARP, RGBA(255,255,255,0));
				CBowMunition = SharpBolt;
				RangedWeapon.munition = ItRw_SharpBolt;
			};
		}
		else
		{
			PrintS_Ext(BOLTS_ON_BOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(BOLTS_NO_CBOW, RGBA(255,255,255,0));
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_OgnistaStrzala(C_Item)
{
	name 				=	"Ognista strza�a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_OgnistaStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_Arrow.3ds";
	
	effect				=	"SPELLFX_FIREARROW";
	
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]			    = 	"Obra�enia magiczne + 30";
	TEXT[5]				= 	NAME_Value;						COUNT[5]	= value;
};

FUNC void Use_OgnistaStrzala()
{
	CreateInvItems(self,ItNa_OgnistaStrzala,1);
	
	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_BOW)
		{
			if(BowMunition == FireArrow)
			{
				PrintS_Ext(ARROWS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(ARROWS_FIRE, RGBA(255,255,255,0));
				BowMunition = FireArrow;
				RangedWeapon.munition = ItNa_OgnistaStrzala;
			};
		}
		else
		{
			PrintS_Ext(ARROWS_ON_CBOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(ARROWS_NO_BOW, RGBA(255,255,255,0));
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_OstraStrzala(C_Item)
{
	name 				=	"Ostra strza�a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_OstraStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_Arrow.3ds";
	
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]				=	"Obra�enia + 30";
	TEXT[5]				= 	NAME_Value;				COUNT[5]	= value;
};

FUNC void Use_OstraStrzala()
{
	CreateInvItems(self,ItNa_OstraStrzala,1);
	
	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_BOW)
		{
			if(BowMunition == SharpArrow)
			{
				PrintS_Ext(ARROWS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(ARROWS_SHARP, RGBA(255,255,255,0));
				BowMunition = SharpArrow;
				RangedWeapon.munition = ItNa_OstraStrzala;
			};
		}
		else
		{
			PrintS_Ext(ARROWS_ON_CBOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(ARROWS_NO_BOW, RGBA(255,255,255,0));
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_LodowaStrzala(C_Item)
{
	name 				=	"Lodowa strza�a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_LodowaStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_IceArrow.3ds";
	
	material 			=	MAT_WOOD;
	
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	name;
	TEXT[2]				= 	"Obra�enia magiczne + 30";
	TEXT[5]				= 	NAME_Value;					COUNT[5]	= value;
};

FUNC void Use_LodowaStrzala()
{
	CreateInvItems(self,ItNa_LodowaStrzala,1);

	if(NPC_HasEquippedRangedWeapon(hero))
	{
		var C_ITEM RangedWeapon; RangedWeapon = NPC_GetEquippedRangedWeapon(hero);
		if(RangedWeapon.flags & ITEM_BOW)
		{
			if(BowMunition == IceArrow)
			{
				PrintS_Ext(ARROWS_YOU_USE_ALREADY, RGBA(255,255,255,0));
			}
			else
			{
				PrintS_Ext(ARROWS_ICE, RGBA(255,255,255,0));
				BowMunition = IceArrow;
				RangedWeapon.munition = ItNa_LodowaStrzala;
			};
		}
		else
		{
			PrintS_Ext(ARROWS_ON_CBOW, RGBA(255,255,255,0));
		};
	}
	else
	{
		PrintS_Ext(ARROWS_NO_BOW, RGBA(255,255,255,0));
	};
};




// **********************************************
// . . . . . . . . . . R�ne . . . . . . . . . .
// **********************************************

instance ItNa_Empty(C_Item)
{
	// stary spos�b na pioruny w dowolnym miejscu (Ayan Orc)
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	material = MAT_METAL;
	description = name;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Ratford_Pierscien(C_Item)
{
	name = "Z�oty pier�cie�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_GoldRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItNa_Ratford_Naczynie(C_Item)
{
	name = "Srebrne naczynie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverChalice;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

INSTANCE ItNa_Ratford_Puchar(C_Item)
{
	name = "Srebrny puchar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItNa_Ratford_Talerz(C_Item)
{
	name = "Srebrny talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverPlate;
	visual = "ItMi_SilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItNa_Ratford_Skrzyneczka(C_Item)
{
	name = "Skrzynka z kosztowno�ciami";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaZBronia (C_Item)
{
	name 				=	"Paczka z broni�";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;
	value 				=	0;
	visual 				=	"nw_city_weapon_bag_01.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaZZywnoscia (C_Item)
{
	name 				=	"Paczka z �ywno�ci�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_PaczkaZZywnoscia;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;
	COUNT[5]	= value;
};

FUNC VOID Use_PaczkaZZywnoscia ()
{
	CreateInvItems (hero,ItfoMutton, 3);
	CreateInvItems (hero,ItFo_Bread, 2);
	CreateInvItems (hero,ItFo_Water, 1);

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaMikstur (C_Item)
{
	name 				=	"Paczka mikstur";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_PaczkaMikstur;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_PaczkaMikstur ()
{
	CreateInvItems (hero,ItPo_Health_01, 14);
	CreateInvItems (hero,ItPo_Health_02, 7);
	CreateInvItems (hero,ItPo_Mana_01, 6);
	CreateInvItems (hero,ItPo_Speed, 2);

	B_LogEntry (TOPIC_Udar_mikstury,"Ten dra� chcia� mnie oszuka�! W paczce brakuje mikstur."); 
	Kirgo_Oszust = TRUE;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaGoth(C_Item)
{
	name 				=	"Paczka mieczy jednor�cznych";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	value 				=	0;
	visual 				=	"ItMi_Packet.3ds";
	material 			=	 MAT_LEATHER;	
	description			= 	name;
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNA_RabonSakwa_MIS(C_Item)
{
	name 				=	"Sk�rzany mieszek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseRabonSakwa;
	
	description			= 	"Sk�rzany mieszek Rabona";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseRabonSakwa ()
{
	B_PlayerFindItem (ItMi_Nugget,10); 
	B_LogEntry (TOPIC_Rabon_sakwa,"W sakwie Rabona znajdowa�o si� 10 bry�ek magicznej rudy. To strasznie dziwne, jak na bandyt�... Wypada wyja�ni� t� spraw�.");   
	Rabon_Sakwa = TRUE;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_WyszlifowanaRuda(C_Item)
{
	name = "Wyszlifowana ruda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Nugget;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[0] = "Przerobiona bry�ka rudy przez Sattara, ci�ko dostrzec";
	text[1] = "na niej �lady jakiejkolwiek ingerencji w struktur�.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Beczulka(C_Item)
{
	name = "Beczu�ka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "OC_BARREL_MINI.3ds";
	material = MAT_WOOD;
	
	description = "Beczu�ka ry��wki";
	
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_ZapasowaPila(C_Item)
{
	name = "Zapasowa pi�a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Saw;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaJana(C_Item)
{
	name 				=	"Paczka Jana";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Paczka pe�na jakich� dziwnych narz�dzi.";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaLukora(C_Item)
{
	name 				=	"Ksi�ga Lukora";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItWr_Book_01.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Ksi��ka jest tak brudna i poklejona,";
	TEXT[3]				=	"�e nie spos�b j� otworzy� i przeczyta�.";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_NalewkaFerros(C_Item)
{
	name 				=	"Nalewka dla Ferosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItMi_Rum_02.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KropleFerros(C_Item)
{
	name 				=	"Krople dla Ferosa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItMi_Flask.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_MagicznaMoneta(C_Item)
{
	name = "Magiczna moneta";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KufelPiwa (C_Item)
{	
	name 				=	"Piwo";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Beer;

	description			= 	"Kufel piwa";
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Beer;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Beer;
		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaZiela (C_Item)
{
	name 				=	"Paczka bagiennego ziela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	NAME;
	TEXT[2]				= 	"Z daleka czu� zapach bagiennego ziela...";
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Innos_Posazek(C_Item)
{
	name = "Wyj�tkowy Pos��ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_SkoraOrkowegoPsa (C_Item)
{
	name 				=	"Sk�ra orkowego psa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItAt_WolfFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_BlackWolfFur (C_Item)
{
	name 				=	"Sk�ra czarnego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_IceWolfFur (C_Item)
{
	name 				=	"Sk�ra lodowego wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItAt_SheepFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_GigantSkora (C_Item)
{
	name 				=	"Sk�ra trolla giganta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_TrollBlackFur;

	visual 				=	"ItAt_TrollFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// WillMaUbranySpeedRing;
// 1 ma ubrany, 0 nie ma ubrany
INSTANCE ItNa_SpeedRing(C_ITEM)
{
   name      =    "Pier�cie� Szybko�ci";
   mainflag   =   ITEM_KAT_MAGIC;
   flags      =   ITEM_RING;
   value      =   0;
   visual      =   "ItRi_Prot_Total_01.3ds";
   visual_skin   =   0;
   material   =   MAT_METAL;
   on_equip   =   Speed1;
   on_unequip   =   Speed2;
   wear      =  WEAR_EFFECT;
   effect      =   "SPELLFX_ITEMGLIMMER"; 
   description   =   name;
   TEXT [1]   =   "";
   INV_ZBIAS   =   INVCAM_ENTF_RING_STANDARD;
   INV_ROTZ   =   INVCAM_Z_RING_STANDARD;
   INV_ROTX   =   INVCAM_X_RING_STANDARD;
};
var int SpeedView;
FUNC VOID Speed1()
{
	WillMaUbranySpeedRing = 1;
	ff_applyonceext(SpeedRing,1000,-1);
	if (secSpeedRing > 0)
	{
		Mdl_ApplyOverlayMDS   (self,"HUMANS_SPRINT.MDS");
		var int min; min = Hlp_GetMinFromSec(secSpeedRing);
		var string str; str = "Pozosta�o: ";
		if (min == 0) {
			str = ConcatStrings(str,IntToString(secSpeedRing));
			str = ConcatStrings(str," sekund");
		} else {
			str = ConcatStrings(str,IntToString(min));
			if (min == 1) { str = ConcatStrings(str," minuta"); }
			else if (min <= 4) { str = ConcatStrings(str," minuty"); }
			else { str = ConcatStrings(str," minut"); };
		};
		
		PrintScreen	(str,-1,-1, "font_old_20_white.tga",2);

	}
	else
	{
		PrintScreen	("Pier�cie� nie jest na�adowany.", -1,-1, "font_old_20_white.tga",2);
		if(FF_Active(SpeedRing))
		{
			ff_remove(SpeedRing);
		};
	};
};

FUNC VOID Speed2()
{
   WillMaUbranySpeedRing = 0;
   if(FF_Active(SpeedRing))
	{
		ff_remove(SpeedRing);
	};
   Mdl_RemoveOverlayMDS   (self,"HUMANS_SPRINT.MDS");
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_ZabiKorzen (C_Item)
{	
	name 				=	"�abi korze�";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	30;

	visual 				=	"ItPl_Dex_Herb_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ItNa_ZabiKorzen;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_Mana;
	COUNT[1]			= 	5;	
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Dex_Herb_01;
};
	FUNC VOID USE_ItNa_ZabiKorzen ()
	{
		PercentHealSelf(5,ATR_MANA);
	};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Chmiel(C_Item)
{	
	name 				=	"Chmiel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	7;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	7;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_RzecznePnacze(C_Item)
{	
	name 				=	"Rzeczne pn�cze";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	7;

	visual 				=	"ItPl_Weed.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	7;
};

/******************************************************************************************/
INSTANCE ItNa_LuskaBestii (C_Item)
{
	name 				=	"�uska bestii";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerPlate;

	visual 				=	"ItAt_CrawlerPlate.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"Poro�ni�ta grub� tkank�.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Drzewny_Porost(C_Item)
{	
	name 				=	"Drzewny porost";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_02;

	visual 				=	"ItPl_Mushroom_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Drzewny_Porost;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	5;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	Value_Mushroom_02;
};

	func void Use_Drzewny_Porost ()
	{			
		PercentHealSelf(5,ATR_HITPOINTS);
	};




// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_JajoZebacza (C_Item)
{
	name 				=	"Jajo z�bacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION; 

	value 				=	20;

	visual 				=	"ItAt_SwampdragonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Butelka (C_Item)
{	
	name 				=	"Butelka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
//	TEXT[1]				= 	NAME_Bonus_HP;		
//	COUNT[1]			= HP_Water;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Aran_Lekarstwo (C_Item)
{
	name 			=	"Lekarstwo";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"ItMi_Rum_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_Aran_Lekarstwo;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Lekarstwo";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

FUNC VOID UseItNa_Aran_Lekarstwo()
{
	if(LEKARSTWO_NIEZABIJA == TRUE){
		AI_StartState	(self, ZS_MagicSleep, 0, "");
		AI_PlayAni (self, "SLEEP"); 
		AI_StopFX	(self, "VOB_MAGICBURN");	
		NPC_StopAni (self,"SLEEP");
	};
	if(LEKARSTWO_NIEZABIJA == FALSE){		
		B_KillNpc(self);
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Wrzod_Lekarstwo (C_Item)
{
	name 			=	"Lekarstwo";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"ItMi_Rum_02.3ds";
	material 		=	MAT_GLAS;
	//on_state[0]		=	UseItNa_Aran_Lekarstwo;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Lekarstwo";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Miecz_Wywar (C_Item)
{
	name 			=	"Wywar";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"ItMi_Rum_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMieczWywar;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	name;
	
	TEXT[1]			= 	"Wywar z w�owej sk�ry";		
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

FUNC VOID UseMieczWywar()
{
	Wld_PlayEffect("VOB_MAGICBURN",  self, self, 0, 0, 0, FALSE );
	AI_StartState	(self, ZS_MagicSleep, 0, "");
	AI_PlayAni (self, "SLEEP"); 
	AI_StopFX	(self, "VOB_MAGICBURN");	
	NPC_StopAni (self,"SLEEP");
	
	PrintScreen	("Si�a i zr�czno��: +3", -1, -1, FONT_SCREEN, 2);
	hero.attribute[ATR_STRENGTH] += 3;
	hero.attribute[ATR_DEXTERITY] += 3;
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_WodaSwiecona_Adanos(C_Item)
{
	name = "Woda �wi�cona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[0] = "Pochodzi ze �r�de� w pobli�u Geldern.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_KorthRaport(C_Item)
{
	name = "Raport";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Matt_List(C_Item)
{
	name = "Orkowy list";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_RaportEraka(C_Item)
{
	name = "Raport Eraka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_JenkinsRaport(C_Item)
{
	name = "Raport";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MiesoTopielca (C_Item)
{	
	name 				=	"Mi�so topielca";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bacon;
	
	visual 				=	"ItFo_Bacon.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_MiesoTopielca;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Bacon;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bacon;

};
FUNC VOID Use_MiesoTopielca()
{
	PercentHealSelf(HP_Bacon,ATR_HITPOINTS);	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_JezykTopielca (C_Item)
{
	name 				=	"J�zyk topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WaranFiretongue;

	visual 				=	"ItAt_WaranFiretongue.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PazurWscieklegoTopielca (C_Item)
{
	name 				=	"Pazur w�ciek�ego topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_LurkerClaw;

	visual 				=	"ItAt_LurkerClaw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KoscBrata (C_Item)
{
	name 				=	"Ko��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SkeletonBone;

	visual 				=	"ItAt_SkeletonBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"Ko�� szkieletu jednego z pi�ciu braci.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KoscWargJehen (C_Item)
{
	name 				=	"P�kni�ta ko��";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SkeletonBone;

	visual 				=	"ItAt_SkeletonBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Krysztal(C_Item)
{
	name = "Kryszta�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	//visual = "ItMi_Rockcrystal.3ds";
	visual = "ItNa_Crystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Fajka(C_Item)
{
	name = "Fajka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "itmi_stuff_pipe_01.3DS";
	scemeName = "JOINT";
	on_state[0] = Use_Fajka;
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Use_Fajka()
{
	CreateInvItems(self,ItNa_Fajka,1);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// TODO: dac to gdzies do bractwa
INSTANCE ItNa_Posazek_1(C_Item)
{
	name = "Pos��ek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	visual = "itmi_stuff_idol_sleeper_01.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
// TODO: dac to gdzies do bractwa
INSTANCE ItNa_Posazek_2(C_Item)
{
	name = "Pos��ek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	visual = "itmi_stuff_idol_ogront_01.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KrysztalAdanosa(C_Item)
{
	name = "Kryszta�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	effect = "SPELLFX_CROSSBOW";
	//effect = "SPELLFX_MANAPOTION";
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KoloZebate(C_Item)
{
	name = "Ko�o z�bate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Stuff_GearWheel_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_DuchSkull(C_Item)
{
	name = "Szcz�tki przyjaciela Shrata";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CzarnyKamien (C_Item)
{
	name = "Czarny kamie�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Zapewne b�dzie pasowa� do piedesta�u";
	text[2] = "w g��wnej sali zatopionej wie�y Xardasa.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_NiebieskiKamien(C_Item)
{
	name = "Niebieski kamie�";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Zapewne b�dzie pasowa� do piedesta�u";
	text[2] = "w g��wnej sali zatopionej wie�y Xardasa.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MiesoDzika (C_Item)
{	
	name 				=	"Surowe mi�so dzika";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bacon;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_MiesoDzika;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 10;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= 5;

};
FUNC VOID Use_MiesoDzika()
{
	PercentHealSelf(10,ATR_HITPOINTS);
};


INSTANCE ItNa_FriedMushroom_01(C_Item)
{	
	name 				=	"Sma�ony piekielnik";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_01;

	visual 				=	"ItPl_Mushroom_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ItNa_FriedMushroom_01;
	scemeName			=	"FOOD";

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Mushroom_01*2;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Mushroom_01;
};

func void Use_ItNa_FriedMushroom_01 ()
{			
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_01*2);
	PercentHealSelf(HP_Mushroom_01*2,ATR_HITPOINTS);
	
	if (Npc_IsPlayer (self))
	{
		Dunkelpilz_Bonus = Dunkelpilz_Bonus + 1;
		
		if (Dunkelpilz_Bonus == 50)  
		{
			B_RaiseAttribute	(self, ATR_MANA_MAX, 5);
			//Npc_ChangeAttribute	(self, ATR_MANA, 5);
			PercentHealSelf(5,ATR_MANA);
			Snd_Play	("LevelUp");
			Dunkelpilz_Bonus = 0;
		};
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_FriedMushroom_02(C_Item)
{	
	name 				=	"Sma�ony du�y grzyb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_02;

	visual 				=	"ItPl_Mushroom_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ItNa_FriedMushroom_02;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Mushroom_02*2;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	Value_Mushroom_02;
};

func void Use_ItNa_FriedMushroom_02 ()
{			
	PercentHealSelf(HP_Mushroom_02*2,ATR_HITPOINTS);
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_02*2);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PotrawkaZChrzaszcza (C_Item)
{	
	name 				=	"Potrawka z chrz�szcza";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_ItNa_PotrawkaZChrzaszcza;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 30;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

FUNC VOID Use_ItNa_PotrawkaZChrzaszcza()
{
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	30);
	PercentHealSelf(8,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PotrawkaDlaGerolda (C_Item)
{	
	name 				=	"Potrawka dla Gerolda";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	//on_state[0]			=	Use_ItNa_PotrawkaZChrzaszcza;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 30;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Losos (C_Item)
{	
	name 				=	"�oso�";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish*2;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Losos;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Fish;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish*2;

};

var int LososBonus;
FUNC VOID Use_Losos()
{
	
	PercentHealSelf(HP_Fish,ATR_HITPOINTS);
	
	if (Npc_IsPlayer (self))
	{
		LososBonus = LososBonus + 1;

		if (LososBonus == 2)  
		{
			B_RaiseAttribute	(self, ATR_MANA_MAX, 1);
			PercentHealSelf(1,ATR_MANA);
			//Npc_ChangeAttribute	(self, ATR_MANA, 1);
			Snd_Play	("LevelUp");
			LososBonus = 0;
		};
	};
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_FriedFish (C_Item)
{	
	name 				=	"Sma�ona ryba";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish*2;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_FriedFish;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Fish*4;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish*2;

};

FUNC VOID Use_FriedFish()
{
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fish*4);
	PercentHealSelf(12,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_WywarRoslinaLecznicza (C_Item)
{	
	name 				=	"Wywar z ro�liny leczniczej";

	mainflag 			=	ITEM_KAT_POTIONS;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_WywarRoslinaLecznicza;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Health_Herb_01 * 2;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;
};

FUNC VOID Use_WywarRoslinaLecznicza()
{
	//Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_01 * 2);
	PercentHealSelf(HP_Health_Herb_01 * 2,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_WywarZieleLecznicze (C_Item)
{	
	name 				=	"Wywar z zi� leczniczych";

	mainflag 			=	ITEM_KAT_POTIONS;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_WywarZieleLecznicze;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Health_Herb_02 * 2;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;
};

FUNC VOID Use_WywarZieleLecznicze()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_02 * 2);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_WywarKorzenLeczniczy (C_Item)
{	
	name 				=	"Wywar z korzenia leczniczego";

	mainflag 			=	ITEM_KAT_POTIONS;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_WywarKorzenLeczniczy;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Health_Herb_03 * 2;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;
};

FUNC VOID Use_WywarKorzenLeczniczy()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Health_Herb_03 * 2);
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_MrokPolnocy (C_Item)
{
	name = "Mrok P�nocy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 40;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Joint;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Smar (C_Item)
{
	name 				=	"Smar";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pitch;

	visual 				=	"ItMi_Moleratlubric.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KopalnianyGrzyb(C_Item)
{	
	name 				=	"Kopalniany grzyb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	0;

	visual 				=	"ItPl_Mushroom_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_ItNa_KopalnianyGrzyb;
	scemeName			=	"FOOD";

	TEXT[0]				=	"Silnie toksyczny grzyb. By� mo�e jaki� alchemik";
	TEXT[1]				=	"b�dzie zdolny uwarzy� z niego jaki� nap�j.";
	
	description			= 	name;
	
};

func void Use_ItNa_KopalnianyGrzyb ()
{			
	//buff_apply(self,Poison1HP);
	Poison1HPStart();
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PieczenSnafa (C_Item)
{	
	name 				=	"Piecze� Snafa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Meat;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_PieczenSnafa;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= 50;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Meat;

};

FUNC VOID Use_PieczenSnafa()
{
	PercentHealSelf(20,ATR_HITPOINTS);
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
//----- G1Swords -----
INSTANCE G1Swords (C_Item)
{
	name 				=	"Miecze przeniesione z G1";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_G1Swords;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_G1Swords ()
{
	CreateInvItems (hero,ItMw_1H_Mace_02, 1);
	CreateInvItems (hero,ItMw_2H_Axe_Old_03, 1);
	CreateInvItems (hero,ItMw_2H_Axe_Old_01, 1);
	CreateInvItems (hero,ItMw_1H_Sword_Long_03, 1);
	CreateInvItems (hero,ItMw_1H_Sword_05, 1);
	CreateInvItems (hero,ItMw_1H_Sword_04, 1);
	CreateInvItems (hero,ItMw_1H_Sword_02, 1);
	CreateInvItems (hero,ItMw_1H_Sword_Short_02, 1);

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Snaf_Przepis (C_Item)
{
	name 				=	"Przepis na potrawk� z chrz�szczy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Przepis na potrawk� z chrz�szczy";
	TEXT[2]				= 	"Prawdopodobnie nale�y do Snafa.";
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaWiedzy		(C_Item)
{
	name 				=	"Ksi�ga wiedzy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Book_02_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_KsiegaWiedzy;
	scemeName			=	"MAPSEALED";
	description			=  	name;

	TEXT[0]					=   "Wiedza zawarta w ksi�dze zwi�ksza punkty nauki.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
};

func void Use_KsiegaWiedzy ()
{   
	Snd_Play ("LEVELUP");
	PrintScreen ("PN +2", -1, 50, "font_old_20_white.tga", 3);
	hero.lp = hero.lp + 2;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_FragmentZwoju (C_Item)
{
	name 				=	"Fragment zwoju";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItNa_FragmentListu.3DS";
	material 			=	MAT_LEATHER;
	description			= 	name;
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_SakwaTed (C_Item)
{
	name 				=	"Sakwa my�liwego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaGwozdzi (C_Item)
{
	name 				=	"Paczka gwo�dzi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_JehenPaczkaZFutrami (C_Item)
{
	name 				=	"Paczka z futrami";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_JehenPaczkaZMiesem (C_Item)
{
	name 				=	"Paczka z mi�sem";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaMalychGwozdzi (C_Item)
{
	name 				=	"Paczka ma�ych gwo�dzi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PieczenDlaGotha(C_Item)
{
	name = "Piecze� dla Gotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	description = name;
};
