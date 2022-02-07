
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
   
   //na wszelki wypadek + mo¿na to te¿ u¿yæ dla innych npc
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
				txt = ConcatStrings("Spl¹drowa³eœ: ",slf.name);
				
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
		//TODO:  czy to zostawiæ lub usun¹æ hooka i przenisæ na dó³?? / bogu 
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
			PrintScreen("£uki i kusze: +1",-1,-1,FONT_Screen,2);
		};
		
		if (IloscTrafionychStrzalWTarcze == 3)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("£uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 7)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("£uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 15)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("£uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
		
		if (IloscTrafionychStrzalWTarcze == 31)
		{
			B_RaiseFightTalent(hero,NPC_TALENT_CROSSBOW,1);
			B_RaiseFightTalent(hero,NPC_TALENT_BOW,1);
			Snd_Play ("LEVELUP");
			PrintScreen("£uki i kusze: +1",-1,-1,FONT_Screen,2);
		};	
	};

};

var int WillBylZapalisada;
func void TRIGGER_INORC ()
{
	// UWAGA: ten trigger Spacerowy chyba nie dzia³a,
	// taka sama funkcja jest wywo³ywana w ticktocku 1s
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
		B_LogEntry (TOPIC_OrcCity_In, "Dobra, otworzy³em kraty. A przede mn¹ coœ jak... orkowe miasto.");
	};

	Wld_SendTrigger ("MOVER_ORCCITY_06");
	Wld_SendTrigger ("MOVER_ORCCITY_07");
};



/*func void TruciznaFunction1 ()
{
	if (WillZatruty < 1) {
		WillZatruty = 1;
		//PrintScreen	("zatruty 1", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta³eœ otruty!", -1,-1, "font_old_20_white.tga",2);
		Snd_Play ("TRUCIZNA");
	};
};

func void TruciznaFunction2 ()
{
	if (WillZatruty < 2) {
		WillZatruty = 2;
		//PrintScreen	("zatruty 2", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta³eœ otruty!", -1,-1, "font_old_20_white.tga",2);
		Snd_Play ("TRUCIZNA");
	};
};

func void TruciznaFunction3 ()
{
	if (WillZatruty < 3) {
		WillZatruty = 2;
		//PrintScreen	("zatruty 3", -1,-1, FONT_ScreenSmall,3);
		PrintScreen	("Zosta³eœ otruty!", -1,-1, "font_old_20_white.tga",2);
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
	name 				=	"Pierœcieñ Wiernoœci";

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
		// ³uki +5
		self.HitChance[NPC_TALENT_BOW] +=5;
	};
};

func void UnEquip_ItNa_Wiernosc() {

	if (self.guild == GIL_OUT) {
		// ³uki -5
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

	description			= "Pierœcieñ g³odu";
	
	TEXT[0]				= "Wykuty z nieznanego materia³u, w chwili kiedy za³o¿ysz";
	TEXT[1]				= "go na d³oñ, wyczuwasz wokó³ siebie tajemnicz¹ aurê,";
	TEXT[2]				= "która muska twoj¹ duszê.";
	
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

	description			= "Pierœcieñ zarazy";
	
	TEXT[0]				= "Materia³, z którego zosta³ stworzony, pozostaje";
	TEXT[1]				= "dla ciebie zagadk¹. Je¿eli odwa¿ysz siê za³o¿yæ go";
	TEXT[2]				= "na d³oñ, zaczniesz odczuwaæ lekki dyskomfort,";
	TEXT[3]				= "tak jakby toczy³a ciê jakaœ choroba.";

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
	
	TEXT[0]				= "Ciê¿ki w dotyku, kiedy go nosisz czujesz siê tak jakby";
	TEXT[1]				= "zawieszono ci kamieñ na szyi. Zdaje siê, ¿e straci³eœ";
	TEXT[2]				= "czêœæ witalnych si³ w zamian za inne korzyœci...";
	
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

	description		=  "Pas œmierci";

	TEXT[0]			=	"Wystarczy z³apaæ go w d³onie, aby odczuæ lodowaty";			
	TEXT[1]			=	"oddech chwytaj¹cy tw¹ duszê w objêcia. Odczuwasz";
	TEXT[2]			= "niepokój, tak jakby ktoœ przeszed³ po twoim grobie.";

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

	description			= "Pierœcieñ Arto";
	
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

	description			= "Pierœcieñ Blizny";
	
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
	Text[0]		=	"Przywo³uje ducha Kurgana.";
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
	name 		=	"Ostrze ³owcy";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_AXE;				//flaga
	material 	=	MAT_METAL;				//materia³

	value 		=	1000;					//wartoœæ

	on_equip	=	Equip_ItNa_OstrzeLowcy;
	on_unequip	=	UnEquip_ItNa_OstrzeLowcy;
	
	damageTotal  	= 	80;					//obra¿enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra¿eñ
	range    	=  	120;					//zasiêg

	cond_atr[2]   	=	ATR_STRENGTH;				//si³a/zrêcznoœæ
	cond_value[2]  	=	80;					//ile potrzeba
	visual 		=	"ItMw_065_1h_sword_bastard_03.3DS";	//wygl¹d

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
	name 				=	"Ma³a maczuga";  

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
	name 		=	"Miecz œwiat³a";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_SWD;				//flaga
	material 	=	MAT_METAL;				//materia³

	value 		=	700;					//wartoœæ

	damageTotal = 	66;					//obra¿enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra¿eñ
	range    	=  	100;					//zasiêg

	cond_atr[2]   	=	ATR_STRENGTH;				//si³a/zrêcznoœæ
	cond_value[2]  	=	72;					//ile potrzeba
	visual 		=	"ItNa_MieczSwiatla.3DS";	//wygl¹d

	description	= name;
	TEXT[0]		= "Niewiarygodnie cieñkie ostrze pokryte jest œwiec¹c¹ substancj¹.";
	TEXT[2]		= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItNa_Zmija (C_Item)
{	
	name 		=	"¯mija";				//nazwa

	mainflag 	=	ITEM_KAT_NF;				//do czego?
	flags 		=	ITEM_SWD;				//flaga
	material 	=	MAT_METAL;				//materia³

	value 		=	700;					//wartoœæ

	damageTotal = 	53;					//obra¿enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra¿eñ
	range    	=  	100;					//zasiêg

	cond_atr[2]   	=	ATR_STRENGTH;				//si³a/zrêcznoœæ
	cond_value[2]  	=	44;					//ile potrzeba
	visual 		=	"ItNa_Zmija.3DS";	//wygl¹d

	description	= name;
	TEXT[0]		= "";
	TEXT[2]		= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 	= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	TEXT[4] 	= NAME_OneHanded;
	TEXT[5]		= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_02 (C_Item)
{	
	name 		=	"Æwiekowana maczuga";				//nazwa

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
	name 				=	"Stary sêdzia";  

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
	name 				=	"Stary topór bojowy";  

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
	name 				=	"Miecz nienawiœci";

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
	name 				=	"Miecz sêdziego";

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
	name 				=	"Ch³opski miecz";

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
	material 	=	MAT_METAL;				//materia³

	value 		=	700;					//wartoœæ

	damageTotal = 	53;					//obra¿enia
	damagetype 	=	DAM_EDGE;				//rodzaj obra¿eñ
	range    	=  	100;					//zasiêg

	cond_atr[2]   	=	ATR_STRENGTH;				//si³a/zrêcznoœæ
	cond_value[2]  	=	44;					//ile potrzeba
	visual 		=	"ItNa_Zmija.3DS";	//wygl¹d

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
	name 				=	"Rêka Trolla";  

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
	TEXT[0]				= "Ta broñ nie zosta³a wykuta dla cz³owieka.";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= 300;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_DJG_Crossbow(C_Item)
{
	name 				=	"Kusza ³owcy";

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
	name 				=	"Ciê¿ka kusza ³owcy";

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
	name 				=	"Kusza ³owcy orków";

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
	name 				=	"Œmieræ Pradawnych";

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
	name 				=	"Zabójca Pradawnych";

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
	name 				=	"Miecz ³owcy"; 

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
	name 				=	"Ramiê ³owcy";  

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
	name 				=	"Dwurêczniak ³owcy";  

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
	name 				=	"Topór myœliwego";  

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
	name 				=	"Myœliwski rozpruwacz";  

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
	name 				=	"Ciê¿ki miecz bandyty";  

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
	name 				=	"Z³oty sztylet";  

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
	TEXT[1]				= "Zadaje obra¿enia od ognia.";
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
	TEXT[1]				= "Zadaje obra¿enia od zimna.";
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
	TEXT[1]				= "Zadaje obra¿enia od wiatru.";
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
	name 				=	"G³os Susan";

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
	name 				=	"K³ujec";  

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
	name 				=	"Jêzyk topielca";  //NUR MILIZ

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
	name 					=	"Pierœcieñ wiernoœci";

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
	
	TEXT[0] = "Mój pierœcieñ wiernoœci.";
	
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
	name 					=	"Pierœcieñ grubego myœliwego";

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
	
	TEXT[0] = "Pierœcieñ uodparnia posiadacza na przewrócenie";
	TEXT[1] = "przez zêbacze, pe³zacze i inne potwory.";
		
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
	name 					=	"Pierœcieñ Asasyna";

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
	
	TEXT[0] = "Pierœcieñ uodparnia posiadacza na otrucie przez potwory.";
		
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
	name 				=	"Kawa³ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du¿ego, ozdobnego pierœcienia.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_Artefakt_Moc (C_ITEM)
{
	name 				=	"Kawa³ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du¿ego, ozdobnego pierœcienia.";
	INV_ZBIAS			= 	INVCAM_ENTF_MISC5_STANDARD;

};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_Artefakt_Odpornosc (C_ITEM)
{
	name 				=	"Kawa³ek artefaktu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"KawalekArtefaktu.3DS"; 
	material 			=	MAT_METAL;

	description			= 	name;

	TEXT	[0]			=	"Fragment du¿ego, ozdobnego pierœcienia.";
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
	TEXT	[0]			=	"Klucz do niedostêpnego klifu.";
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

    description                = "Pierœcieñ si³y";
    
    TEXT[2]                    = NAME_Bonus_Str;
    COUNT[2]                = Ri_Strg02;
    TEXT[3]                    = "Nagrawerowano na nim symbol Magów ognia.";
    TEXT[5]                    = NAME_Value;
    COUNT[5]                = value;
        
    INV_ZBIAS                = INVCAM_ENTF_RING_STANDARD;
    INV_ROTZ                = INVCAM_Z_RING_STANDARD;
    INV_ROTX                = INVCAM_X_RING_STANDARD;
    
};
 

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE  ItNa_OkoSwiata(C_Item)
{
	name 			=	"Oko Œwiata";

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

	description		= "Oko Œwiata";
	
	TEXT[2]			= "Ten amulet czyni posiadacza silniejszym,";
	TEXT[3]			= "zrêczniejszym i m¹drzejszym.";
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

	description		= "Oko myœliwego";
	
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

	description		=  "Nale¿a³ do piêciu braci";

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
	name 					=	"Ksiêga statystyk I";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi¹¿ka pokazuj¹ca status";
	TEXT[3] 				=  "reputacji w obozach.";

	on_state[0]				=	Use_ItNa_KsiegaReputacji;
};

FUNC VOID Use_ItNa_KsiegaReputacji()
{		
	var int nDocID;

var string REP1; REP1 = "*u ³owców orków: ";		   REP1 = ConcatStrings(REP1,IntToString(rep_lowcy_s));
var string REP2; REP2 = "*u myœliwych: ";		   REP2 = ConcatStrings(REP2,IntToString(rep_mysliwi_s));
var string REP3; REP3 = "*u bandytów: ";		   REP3 = ConcatStrings(REP3,IntToString(rep_bandyci_s));

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



				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
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
	name 					=	"Ksiêga statystyk II";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi¹¿ka pokazuj¹ca iloœæ";
	TEXT[3] 				=  "pokonanych przeze mnie potworów.";

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
				var string PokonaneScavenger; PokonaneScavenger = "Œcierwojady: "; PokonaneScavenger = ConcatStrings(PokonaneScavenger,IntToString(PokonaneScavenger_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneScavenger);
				var string PokonaneMeatbug; PokonaneMeatbug = "Chrz¹szcze: "; PokonaneMeatbug = ConcatStrings(PokonaneMeatbug,IntToString(PokonaneMeatbug_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneMeatbug);
				var string PokonaneMinecrawler; PokonaneMinecrawler = "Pe³zacze: "; PokonaneMinecrawler = ConcatStrings(PokonaneMinecrawler,IntToString(PokonaneMinecrawler_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneMinecrawler);
				var string PokonaneBloodfly; PokonaneBloodfly = "Krwiopijce: "; PokonaneBloodfly = ConcatStrings(PokonaneBloodfly,IntToString(PokonaneBloodfly_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneBloodfly);
				var string PokonaneSwampDrone; PokonaneSwampDrone = "Bagienne trutnie: "; PokonaneSwampDrone = ConcatStrings(PokonaneSwampDrone,IntToString(PokonaneSwampDrone_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSwampDrone);
				var string PokonaneWaran; PokonaneWaran = "Jaszczury: "; PokonaneWaran = ConcatStrings(PokonaneWaran,IntToString(PokonaneWaran_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneWaran);
				var string PokonaneShadowbeast; PokonaneShadowbeast = "Cieniostwory: "; PokonaneShadowbeast = ConcatStrings(PokonaneShadowbeast,IntToString(PokonaneShadowbeast_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneShadowbeast);
				var string PokonaneSwampShark; PokonaneSwampShark = "Wê¿e b³otne: "; PokonaneSwampShark = ConcatStrings(PokonaneSwampShark,IntToString(PokonaneSwampShark_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSwampShark);
				var string PokonaneTroll; PokonaneTroll = "Trolle: "; PokonaneTroll = ConcatStrings(PokonaneTroll,IntToString(PokonaneTroll_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneTroll);
				var string PokonaneSnapper; PokonaneSnapper = "Zêbacze: "; PokonaneSnapper = ConcatStrings(PokonaneSnapper,IntToString(PokonaneSnapper_Liczba));
				Doc_PrintLines   ( nDocID,  0, PokonaneSnapper);


				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				var string PokonaneDragonSnapper; PokonaneDragonSnapper = "Smocze zêbacze: "; PokonaneDragonSnapper = ConcatStrings(PokonaneDragonSnapper,IntToString(PokonaneDragonSnapper_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneDragonSnapper);

				var string PokonaneBloodhound; PokonaneBloodhound = "Ogary: "; PokonaneBloodhound = ConcatStrings(PokonaneBloodhound,IntToString(PokonaneBloodhound_Liczba));
				Doc_PrintLines   ( nDocID,  1, PokonaneBloodhound);
				var string PokonaneOrcBiter; PokonaneOrcBiter = "K¹sacze: "; PokonaneOrcBiter = ConcatStrings(PokonaneOrcBiter,IntToString(PokonaneOrcBiter_Liczba));
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
	name 					=	"Ksiêga statystyk III";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi¹¿ka pokazuj¹ca moje osi¹gniêcia.";
	TEXT[3] 				=  "";

	on_state[0]				=	Use_ItNa_KsiegaOsiagniec;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaBosow (C_ITEM)
{
	name 					=	"Ksiêga statystyk IV";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi¹¿ka zawieraj¹ca opis";
	TEXT[3] 				=  "lokalizacji wszystkich bossów.";

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
				Doc_PrintLines   ( nDocID,  0, "1. Du¿a polna bestia: w jaskini obok starej bramy na terytoria orków.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss1Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonana"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywa"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "2. Krzywy ognik: po drugiej stronie niezamarzniêtego jeziora obok Nowego Obozu.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss2Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);
				
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "3. Pan cienia, Garrel: dawne le¿e smoka bagiennego.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss3Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");			
				Doc_PrintLines   ( nDocID,  0, "4. Nieznany: prowadzi do niego teleport na 'niedostêpnym klifie'.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss4Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);

				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, "5. Kamashi: centralna jaskinia w Nowym Obozie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss5Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  0, BossStatus);


				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages

				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
			
				Doc_PrintLines   ( nDocID,  1, "6. Samiec pe³zaczy: w opuszczonej kopalni obok wie¿y Xardasa.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss6Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");				
				Doc_PrintLines   ( nDocID,  1, "7. O¿ywieniec: stra¿nik potê¿nego zwoju w zapomnianej dolinie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss7Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "8. Pan cieniostworów: w jaskini przed Obozem na Bagnie.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss8Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "9. Stary trup: szkielet ³ucznik w Wie¿y Mgie³.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss9Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLine	( nDocID,  1, "");
				Doc_PrintLines   ( nDocID,  1, "10. Kulompus: stra¿nik skrzyni w skrytce na prze³êczy. Kolce broni¹ce dostêpu do ko³owrotu mo¿na zdezaktywowaæ czterema przyciskami w okolicy.");
				BossStatus = "**";
				BossStatus = ConcatStrings(BossStatus,"Status: ");
				if (Boss10Killed == TRUE) { BossStatus = ConcatStrings(BossStatus,"pokonany"); } else { BossStatus = ConcatStrings(BossStatus,"¿ywy"); };
				Doc_PrintLines	( nDocID,  1, BossStatus);

				Doc_PrintLines	( nDocID,  1, " "					);


				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaZmiennych (C_ITEM)
{
	name 					=	"Ksiêga statystyk V";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	
	TEXT[2] 				=  "Ksi¹¿ka pokazuj¹ca stan ró¿nych";
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

				var string run; run = "Przebieg³eœ: ";
				run = ConcatStrings(run,IntToString(VST_Kilometers));
				run = ConcatStrings(run," km, ");
				run = ConcatStrings(run,IntToString(VST_Meters));
				run = ConcatStrings(run," m");
				
				Doc_PrintLines   ( nDocID,  0, run);
				Doc_PrintLine   ( nDocID,  0, "");
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Czas pod wod¹: ",IntToString(DivingTime)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Podniesione zardzewia³e miecze: ",IntToString(ZardzewialeMieczePodniesione)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Z³amane wytrychy: ",IntToString(ZlamaneWytrychy)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("U¿yte ró¿ne zaklêcia: ",IntToString(WillUzyteZaklecia)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Zjedzone ró¿ne roœliny: ",IntToString(EatenPlants)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Przespane godziny: ",IntToString(SleptHours)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Wypite butelki alkoholu: ",IntToString(DrunkTrinken)));
				Doc_PrintLines   ( nDocID,  0, ConcatStrings("Zdeptane chrz¹szcze: ",IntToString(zdeptane_chrzaszcze)));

				
				Doc_Show		( nDocID );
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

// wlasciciel 'n' napisa³ przepis 'n+1'
//            | w³aœciciel	| gdzie?								| przepis na:	
// Uroboros 1 | Dairick		| nad kopalni¹							| ---
// Uroboros 2 | Hyglas		| pod mostem pod rockcamp				| Cieñ cieniostwora
// Uroboros 3 | Karrok		| na szczycie wodospadow (najpierw		| Lekarstwo uspokajaj¹ce
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
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros I";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Znalaz³em jak¹œ star¹ ksiêgê. Autor napisa³, ¿e piêciu mistrzów alchemii spisa³o swoje autorskie przepisy. Na nastêpnej stronie widnieje wskazówka..."); 
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
					Doc_PrintLines	( nDocID,  0, "Jestem wiêŸniem w Kolonii Karnej. Zosta³em tu wrzucony za otrucie króla. Ju¿ jako m³okos zg³êbia³em tajniki alchemii, a jest to sztuka umo¿liwiaj¹ca przetrwanie. By³o nas piêciu takich 'mistrzów alchemii'. Ka¿dy z nas powierzy³ swój przepis kolejnemu, aby kiedyœ pojawi³ siê ktoœ, kto zbierze wszystkie i stanie siê naszym nastêpc¹.");
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
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros II";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Mam przepis na miksturê znacznie wzmacniaj¹c¹ zrêcznoœæ! Oraz nastêpn¹ wskazówkê..."); 
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
					Doc_PrintLines	( nDocID,  0, "By³ pewien myœliwy, który polowa³ specjalnie dla mnie i przynosi³ mi trofea. Za¿yczy³ sobie, bym uwarzy³ coœ, co wzmocni jego zrêcznoœæ. Sprosta³em proœbie.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Cieñ cieniostwora:");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "-6 roœlin leczniczych");
					Doc_PrintLines	( nDocID,  0, "-goblinie jagody");
					Doc_PrintLines	( nDocID,  0, "-rdest polny");
					Doc_PrintLines	( nDocID,  0, "-róg cieniostwora");
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
					Doc_PrintLines	( nDocID,  1, "A czym¿e jest mapa, która prowadzi donik¹d?"					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "~Pan Karrok");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros3 (C_ITEM) 
{	
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros III";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Kolejna ksiêga podaje przepis na lekarstwo uspokajaj¹ce, mocniejsze ni¿ bagienne ziele."); 
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
					Doc_PrintLines	( nDocID,  0, "Minê³o ju¿ kilka lat, odk¹d przeprowadzam testy na ludziach. Mawiaj¹, ¿e nie ma nic lepszego na uspokojenie od bagiennego ziela. Myl¹ siê - mój Pan, aby móc torturowaæ goñców wrogów, musia³ ich uspokajaæ.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Lekarstwo uspokajaj¹ce:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-2 ¿abie korzenie");
					Doc_PrintLines	( nDocID,  0, "-10 piekielników");
					Doc_PrintLines	( nDocID,  0, "-zêbate ziele");
					Doc_PrintLines	( nDocID,  0, "-siarka");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Mistrz Hyglas");
	
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "A czy pójdziesz za mn¹ do orkowej œwi¹tyni? 'Tej w centrum Górniczej Doliny? Tak, pójdê' - powiedzia³em, ale z przekonaniem, ¿e ju¿ nigdy stamt¹d nie wrócê."	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Imonez");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros4 (C_ITEM) 
{	
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros IV";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksiêga czwarta podaje przepis na 'ryk smoka'."); 
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
					Doc_PrintLines	( nDocID,  0, "Zanim smoki wyginê³y, paladyni poucinali im jêzyki. Robili z nich mikstury, które czyni³y ich silniejszymi. Mimo ¿e smoków ju¿ nie ma, to uda³o mi siê uwarzyæ coœ, co chocia¿ na chwilê podnosi poziom si³y. Chocia¿ robi siê j¹ z ognistego jaszczura, to w³aœnie...");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ryk smoka:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-ogniste ziele");
					Doc_PrintLines	( nDocID,  0, "-3 du¿e grzyby");
					Doc_PrintLines	( nDocID,  0, "-jêzyk ognistego jaszczura");
					Doc_PrintLines	( nDocID,  0, "-wêgiel");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Pan Karrok");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "Wszed³em miêdzy mg³y. Rzuci³em ksi¹¿kê w górê."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "~Kalom");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Uroboros5 (C_ITEM) 
{	
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros V";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksiêga pi¹ta podaje przepis na 'zmorê gwardzisty'."); 
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
					Doc_PrintLines	( nDocID,  0, "Pamiêtam nakaz króla o wzmo¿eniu stra¿y. Wszystkim z³odziejom ¿y³o siê trudniej. Znalaz³em jednak sposób na pomoc moim znajomym.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zmora gwardzisty:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-goblinie jagody");
					Doc_PrintLines	( nDocID,  0, "-2 rdesty polne");
					Doc_PrintLines	( nDocID,  0, "-bry³ka z³ota");
					Doc_PrintLines	( nDocID,  0, "-smo³a");
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
	name 					=	"Stara ksiêga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Uroboros VI";
	TEXT	[0]				=	"Wygl¹da, jakby mia³a siê rozlecieæ.";
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
		B_LogEntry (TOPIC_Gildia_Alchemikow,"Ksiêga szósta podaje przepis na 'krople duszy'."); 
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
					Doc_PrintLines	( nDocID,  0, "A czy ty wiesz, jak nie umrzeæ?");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Krople duszy:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "-per³a");
					Doc_PrintLines	( nDocID,  0, "-rum");
					Doc_PrintLines	( nDocID,  0, "-rdest polny");
					Doc_PrintLines	( nDocID,  0, "-bry³ka rudy");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "~Kalom");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_PrintLines	( nDocID,  1, "Nic nigdy siê nie koñczy. Jako ostatni z wielkich alchemików czujê siê najwiêkszy z nich. Teraz, jako najpotê¿niejszy guru w Bractwie, s³awi¹ mnie tytu³em:"					);
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
		B_LogEntry (TOPIC_bogowie_work, "Chyba znalaz³em ksiêgê, o któr¹ chodzi³o Beliarowi. S¹ tu jakieœ dziwne s³owa...");
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
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
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
		B_LogEntry (TOPIC_kopalnia,"W obozie przed kopalni¹, za kapliczk¹ Beliara znalaz³em jakieœ zapiski o sposobie ucieczki."); 
		Use_HowToEscape_OneTime = TRUE;
	};

	var int nDocID;
		
	nDocID = 	Doc_Create		();
				Doc_SetPages	(nDocID,  1);
				Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
				Doc_SetFont		(nDocID, -1, FONT_Book);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID,  0, "Chyba w koñcu wykombinowa³em jak st¹d uciec!");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Mam kilka pomys³ów:");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Mo¿na otworzyæ bramê do lasu - potrzeba jednak jakiegoœ smaru...");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Wydaje mi siê, ¿e przez bramê w stronê Nowego Obozu");
				Doc_PrintLines	(nDocID,  0, "mo¿na siê wydostaæ, u¿ywaj¹c przemiany w chrz¹szcza. Tylko sk¹d ja to do cholery wezmê?");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Oceni³em wysokoœæ tych desek nad wejœciem do kopalni");
				Doc_PrintLines	(nDocID,  0, "i myœlê, ¿e jestem w stanie na nie skoczyæ.");
				Doc_PrintLines	(nDocID,  0, "PóŸniej chyba zdo³am wdrapaæ siê na górê po ska³ach. St¹d widzê tam jakieœ krzewy.");
				Doc_PrintLines	(nDocID,  0, "Je¿eli tylko mnie nie zauwa¿¹, to mam szansê siê st¹d wydostaæ, nie koñcz¹c ze strza³¹ we ³bie.");

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
		B_LogEntry (TOPIC_kopalnia,"W obozie przed kopalni¹, za kapliczk¹ Beliara, znalaz³em jakieœ zapiski o sposobie ucieczki."); 
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
					Doc_PrintLines	( nDocID,  0, "Zamknêli mnie. Prowadz¹ jakieœ nielegalne wydobycie rudy...");
					Doc_PrintLine	( nDocID,  0, ""		);
					Doc_PrintLine	( nDocID,  0, "05.05"		);
					Doc_PrintLines	( nDocID,  0, "Mo¿na otworzyæ bramê do lasu - potrzeba jednak smaru... Wydaje mi siê, ¿e przez bramê w stronê Nowego Obozu mo¿na siê wydostaæ, u¿ywaj¹c przemiany w chrz¹szcza. Tylko sk¹d ja to do cholery wezmê?");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);	
					Doc_PrintLine	( nDocID,  1, "28.05"					);
					Doc_PrintLines	( nDocID,  1, "Chyba w koñcu wykombinowa³em, jak st¹d uciec!"	);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Oceni³em wysokoœæ tych desek nad wejœciem do kopalni i myœlê, ¿e jestem w stanie na nie skoczyæ. PóŸniej chyba zdo³am wdrapaæ siê na górê po ska³ach. St¹d widzê tam jakieœ krzewy. Je¿eli tylko mnie nie zauwa¿¹, to mam szansê siê st¹d wydostaæ, nie koñcz¹c ze strza³¹ we ³bie.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PamietnikKannaha (C_ITEM) 
{	
	name 					=	"Pamiêtnik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Pamiêtnik";
	TEXT[0]				=	"Znalaz³em go przy martwym paladynie";
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
				Doc_PrintLines	( nDocID,  0, "Dzisiejszy dzieñ nie bêdzie kolejnym nudnym dniem na warcie. Dzisiaj ma siê staæ to, co od dawna planowaliœmy z Hann¹. Pomogê tej biednej kobiecie rozprawiæ siê raz na zawsze z natrêtnym gwa³cicielem i ju¿ nigdy nie bêdzie jej nachodzi³. Mam nadziejê, ¿e nikt nam w tym nie przeszkodzi i bezpiecznie pozbêdziemy siê tego drania.");
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
				Doc_PrintLines	( nDocID,  1, "Tamt¹ noc zapamiêtam na zawsze. Nie pisnê nic Rudolfowi. Jego ¿ona z pewnoœci¹ nie chcia³aby tego."	);
				Doc_PrintLines	( nDocID,  1, "");
				Doc_PrintLines	( nDocID,  1, "- | - | - | - | -");
				Doc_Show		( nDocID );
				

					
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_CorKalom_Book (C_ITEM)
{
	name 					=	"Ksiêga Kaloma";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Ksiêga Kaloma";
	
	TEXT[2] 				=  "Znalaz³em tê ksiêgê w jakimœ";
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
			B_LogEntry (TOPIC_BadaniaCaloma, "W tajnym laboratorium znalaz³em pamiêtnik Cor Kaloma.");
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
				Doc_PrintLines	( nDocID,  0, "Za³o¿yliœmy obóz. Teraz bêdê móg³ zg³êbiaæ tajniki alchemii. Przepisy gildii alchemików stoj¹ przede mn¹ otworem. Muszê odnaleŸæ resztê."	);
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Bractwo nabiera kszta³tu. Dziêki bagiennemu zielu zbieranemu w okolicach obozu, mogê sporz¹dzaæ mikstury ³¹cz¹ce mnie ze Œni¹cym." );
				Doc_PrintLine	( nDocID,  0, ""					);
				Doc_PrintLines	( nDocID,  0, "Dokona³em wielkiego odkrycia. Jad pe³zaczy ma niezwykle silne dzia³anie pobudzaj¹ce zmys³y." );

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Mikstura z ¿uwaczek pe³zacza jest za s³aba, by nawi¹zaæ bezpoœredni kontakt ze Œni¹cym."	);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Zg³osi³ siê do mnie jakiœ 'wielki bohater', który przyniós³ mi jaja pe³zaczy. Spróbujê uwarzyæ z nich miksturê."	);
				Doc_PrintLine	( nDocID,  1, ""					);
				Doc_PrintLines	( nDocID,  1, "Uda³o siê! Y'Berion odczyta³ znaki dziêki temu wywarowi. Œni¹cy jest demonem s³u¿¹cym Beliarowi. Skoro tak, to Beliar jest te¿ moim panem. Wyruszam do orkowego miasta. Tylko tam odnajdê mojego mistrza."	);

				Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Zagadka_Adanos (C_Item)
{
	name 				=	"Zwój prawdy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Zagadka_Adanos;
	scemeName			=	"MAP";
	description			= 	name;
	
	TEXT[0]				=	"Dziwne pismo, które da³ mi Adanos.";
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
					Doc_PrintLines	( nDocID,  0, "Spójrz na wodê i na mg³ê,"	);
					Doc_PrintLines	( nDocID,  0, "a czy widzisz te¿ wie¿ê?"						);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "WejdŸ do œrodka, otwórz drzwi.");
					Doc_PrintLines	( nDocID,  0, "Star¹ mapê zabierz mi."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Oddam skarb swój jednemu."						);
					Doc_PrintLines	( nDocID,  0, "On go da bogu memu."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
				Doc_PrintLines	( nDocID,  0, "Nie wiem, czy jeszcze pamiêtasz, co robi³em, zanim zaprosi³eœ mnie do twierdzy. Chcia³em zbadaæ orkowy cmentarz, do którego nie ma dostêpu. Kiedy bêdziesz mia³ trochê czasu, zajrzyj do mnie. Wpad³em na pewien pomys³, dlatego wyruszê, zanim wrócisz, a potem razem spróbujemy przeszukaæ cmentarz.");
				Doc_PrintLines	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
			
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
					Doc_PrintLine	( nDocID,  0, "10 ekstraktów leczniczych,"						);
					Doc_PrintLine	( nDocID,  0, "10 esencji many,"	);
					Doc_PrintLine	( nDocID,  0, "3 mikstury szybkoœci."	);
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
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
	TEXT[1] = "Zapisano na niej dziwne s³owa.";
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
					Doc_PrintLines	( nDocID,  0, ".ezreifo w ano¿o³z a³atsoz akzceiwo azswreiP");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "!aineimæaz agêtop saw an einy³ps hceiN");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLine	( nDocID,  0, "Dzieñ 1"	);
					Doc_PrintLines	( nDocID,  0, "No to utkn¹³em. Nie zeskoczê st¹d, nawet siê nie wychylam. To przez mój paniczny lêk wysokoœci. Wci¹¿ nie pojmujê, po co w ogóle próbowa³em siê tu dostaæ. Odczekam chwilê - mo¿e ktoœ mnie dostrzegnie albo us³yszy."						);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, "Dzieñ 2"	);
					Doc_PrintLines	( nDocID,  0, "Orkowie mnie ignoruj¹ czy nie rozumiej¹? A mo¿e s¹ g³usi i œlepi? Cholera, zaczynam siê niepokoiæ..."	);
					Doc_PrintLine	( nDocID,  0, ""    );
					Doc_PrintLine	( nDocID,  0, "Dzieñ 4"  );
					Doc_PrintLines	( nDocID,  0, "Dobrze, ¿e zabra³em ze sob¹ trochê jedzenia i wody. Ci¹gle kombinujê, jakby siê st¹d wydostaæ. Orkowie dalej nie reaguj¹ na moje sygna³y."  );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLine	( nDocID,  0, "Dzieñ 10"     );
					Doc_PrintLines	( nDocID,  0, "Koñcz¹ mi siê zapasy. Jeden z orków mnie dopatrzy³, ale nic poza tym. Przekaza³ tylko coœ wodzowi i przychodzi³ wieczorami popatrzeæ jak 'zdycham'.");
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, "Dzieñ 13"      	);
					Doc_PrintLines	( nDocID,  0, "G³upota ludzka i fatalne kontakty z orkami doprowadz¹ mnie do œmierci? Nie tak wyobra¿a³em sobie mój koniec. Oby kiedyœ orkowie i ludzie siê pogodzili."       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Dzieñ 14"						);
					Doc_PrintLines	( nDocID,  0, "Jeœli ktoœ kiedykolwiek mnie odnajdzie, niech ma w œwiadomoœci, ¿e nie jestem jedyn¹ ofiar¹ nieprzyjacielskich stosunków orkowo-ludzkich. Mój brat zgin¹³ podobnie - wyg³odzony i pobity. Szlag by was trafi³ przeklêci orkowie!"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLine	( nDocID,  0, "czas wyr¿n¹æ orków co do jednego."	);
					Doc_PrintLine	( nDocID,  0, "Potrzebujê Twoich ludzi na mury twierdzy."	);
					Doc_PrintLine	( nDocID,  0, "Maj¹c tak doskona³ych strzelców,"    );
					Doc_PrintLine	( nDocID,  0, "bez problemu rozgromilibyœmy ich szeregi.");
					Doc_PrintLine	( nDocID,  0, "Walka wrêcz to ju¿ nasza sprawa..."  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, "Potrzebujê jak najwiêcej ludzi."  );
					Doc_PrintLine	( nDocID,  0, "Przyœlij ich do Kanionu Trolli."     );				
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, ""      	);
					Doc_PrintLine	( nDocID,  0, "Keroloth"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
	TEXT[0]				=	"Znaleziona u Ÿród³a zamro¿onej";
	TEXT[1]				=	"rzeki w górach.";
	
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
					Doc_PrintLine	( nDocID,  0, "Kamashi potrzebowaæ g³owa wszystkie ludzie-dowódca."	);
					Doc_PrintLine	( nDocID,  0, "Ugosh przynieœæ to Kamashi."	);
					Doc_PrintLine	( nDocID,  0, "Pallum-Bo, ty siê zaj¹æ Gestath, ja Keroloth."    );
					Doc_PrintLine	( nDocID,  0, "Pallum-Bo przynieœæ to Ugosh i Kamashi szczêœliwy."  );
					Doc_PrintLine	( nDocID,  0, ""  );
					Doc_PrintLine	( nDocID,  0, "Œpieszyæ siê, Kamashi z³y."  );
					Doc_PrintLine	( nDocID,  0, "Uga!"     );
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, ""   );
					Doc_PrintLine	( nDocID,  0, ""      	);
					Doc_PrintLine	( nDocID,  0, "Ugosh"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
	
	TEXT[2]				= 	"Zabra³em ten list";
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
				Doc_PrintLines	(nDocID,  0, "Ch³opaki, musicie koniecznie znaleŸæ s³aby punkt w obozie tych ca³ych myœliwych. Swoj¹ drog¹ to oczyœciliœmy ten grobowiec obok obozu, ale to ch³ód jest naszym najwiêkszym wrogiem. Przez tê lodow¹ krainê w pobli¿u, musimy dawaæ wiêcej ¿arcia niewolnikom...");
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
	
	TEXT[2]				= 	"Zezwolenie na widzenie siê z Nodem.";
	
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
				Doc_PrintLines	(nDocID,  0, "Zezwalam bandycie Willowi na widzenie siê z szefem.");
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
	
	TEXT[2]				= 	"Papier, dziêki któremu Gobby da mi niewolników.";
	
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
				Doc_PrintLines	(nDocID,  0, "Swoj¹ drog¹ nasi ch³opcy stêsknili siê za twoimi tekstami...");
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
		B_LogEntry (TOPIC_Niedostepny_Klif,"Klif niedaleko obozu bandytów jest ogrodzony magiczn¹ barier¹. Ciekawe, co siê tam kryje?"); 
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
				Doc_PrintLines	(nDocID,  0, "Kimkolwiek jesteœ, mówiê ci:");
				Doc_PrintLines	(nDocID,  0, "nie otworzysz ukrytych drzwi!");
				Doc_PrintLines	(nDocID,  0, "Moc ¿ywio³ów mieszka tam,");
				Doc_PrintLines	(nDocID,  0, "s¹ potê¿ne, mówiê wam!");
				Doc_PrintLines	(nDocID,  0, "Szukaj krypt, by potê¿nym byæ,"								);
				Doc_PrintLines	(nDocID,  0, "mo¿e ci uda siê wiecznie ¿yæ...");
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
					Doc_PrintLines	( nDocID,  0, "Cz³owiek, który o¿ywi³ Star¹ Kopalniê i w¹tek na bagnie. Stworzon¹ przeze mnie 'r¹bankê' za palisad¹ zamieni³ na opowieœæ o biednych duszach nêkanych przez Kazmina i nadchodz¹ce 'Zaæmienie'.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "'To AV mnie wykoñczy!'");
					Doc_PrintLines	( nDocID,  0, "'Gdzie do cholery s¹ te g³upie koœci?!'");
					Doc_PrintLines	( nDocID,  0, "--- Piêciu braci'");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Multibetatester, od samego pocz¹tku, do samego koñca. Przechodzi³ pierwsze misje lata temu, gdy na zamku stacjonowali jeszcze nieusuniêci paladyni! Wielkie podziêkowania równie¿ za kilkanaœcie godzin spêdzonych w Spacerze na poprawianiu roœlinnoœci oraz stworzeniu orkowego obozu na pla¿y.");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PreriowyScierwojad (C_Item)
{
	name 				=	"Preriowy œcierwojad";

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
					Doc_PrintLines	( nDocID,  0, "Za model 3D zniszczonego Bractwa Œni¹cego i za kilka czarnych robót w skryptach. Dziêki!");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Gdybym wiedzia³, ile godzin spêdzê przy stworzeniu tej modyfikacji, to bym siê za to nigdy nie zabra³. Chocia¿ mo¿e dobrze, ¿e nie wiedzia³em..."	);
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "-> i tak suma czasów gry wszystkich konsumentów bêdzie mniejsza!"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "..."						);
					Doc_PrintLines	( nDocID,  0, "..."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Gdyby nie Ty, ten mod by³by co najmniej dwa razy gorszy i dobrze o tym wiesz. Ten dzik poprawi³ multum b³êdów, z którymi sobie nie radzi³em i wprowadzi³ wiele innowacji skryptowych. Tylko dziêki niemu uda³o siê to ukoñczyæ w 2019 roku.");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Nale¿y Ci siê, zawodowy krytyku i narzekaczu! Z radami tego pana, 'Ucieczka' sta³a siê bardziej logiczna, ciekawsza i bugoodporna. Ile jeszcze modyfikacji uratujesz przed wydaniem jako niedorobionych?");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
					Doc_PrintLines	( nDocID,  0, "Te 2500 kwestii chyba na zawsze zostanie w Twojej g³owie, co? W mojej równie¿. I przycinanie tego, nazywanie ich i przypominanie o robocie :) Wykona³eœ kawa³ dobrej roboty. Brawo!");
					Doc_PrintLines	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, " ----- ----- ----- ----- ----- ");
					Doc_PrintLines	( nDocID,  0, ""); // TODO jakas notka od niego
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
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
    TEXT    [0]            =    "Zaklêcie: Bry³a lodu";
    TEXT    [1]            =    "Obra¿enia od magii: 20 + aktualna mana";
    TEXT    [2]            =    "Dodatkowe obra¿enia:";
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

	description			= 	"Teleportacja do obozu myœliwych";
	
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

	description			= 	"Teleportacja do ³owców orków";
	
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

	description			= 	"Teleportacja do obozu bandytów";
	
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

	description			= 	"Kamieñ teleportacyjny na drug¹ stronê rzeki";
	
	TEXT	[0]			=	"Ayan rzuci³ go do rzeki.";			
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
	
	TEXT	[0]			=	"Znaleziona za bajorem obok wie¿y.";			
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
	
	TEXT	[0]			=	"Ukryta na prze³êczy.";			
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

	description			= 	"Teleportacja na po³udniowy-wschód";
	
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

	description			=	"Przemiana w chrz¹szcza";

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
	name 				=	"Tajemniczy zwój";

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

	description			=	"Powiêkszenie";

	TEXT	[0]			=	"Z³o¿y³em ten zwój z fragmentów"	;
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

	TEXT	[3]			=	"Zaklêcie powoduje neutralne zachowanie";
	TEXT	[4]			=	"zwierzêcia wzglêdem rzucaj¹cego.";
	
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

	description			= 	"Stwórz portal 1";
	
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

	description			= 	"Przenieœ do portalu 1";
	
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

	description			= 	"Stwórz portal 2";
	
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

	description			= 	"Przenieœ do portalu 2";
	
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
	name 					=	"Strój kucharza";

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
	name 					=	"Lekki pancerz myœliwego";

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
	name 					=	"Œredni pancerz myœliwego";

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
	name 					=	"Ciê¿ki pancerz myœliwego";

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
	name 					=	"Wzmocniona zbroja myœliwego";

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
	name 					=	"Pancerz wielkiego ³owczego";

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
	name 					=	"Ciê¿ki pancerz bandyty";

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
	name 					=	"Lekki pancerz ³owcy orków";

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
	name 					=	"Ciê¿ki pancerz ³owcy orków";

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
	name 					=	"Zbroja ³owcy orków";

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
	name 					=	"Ciê¿ka zbroja ³owcy orków";

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
	name 					=	"Ciê¿ka zbroja ³owcy orków";

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
	name 					=	"Pancerz stra¿y królewskiej";

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

	description		=  "Pas myœliwego";
	
	TEXT[1]			= NAME_ADDON_BONUS_BOW;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_ADDON_BONUS_1H;
	COUNT[2]		= 5;
	//TEXT[3]			= "Bonus tylko dla myœliwych.";		
	
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

	description		=  "Pas stalowej rêki";

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

	description		=  "Pas ³owcy orków";

	TEXT[1]			=	NAME_ADDON_BONUS_1H;			
	COUNT[1]		= 	5;
	TEXT[2]			=	NAME_ADDON_BONUS_2H;		
	COUNT[2]		= 	5;
	//TEXT[3]			=	"Bonus tylko dla ³owców orków.";		

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

	description		=  "Szarfa Œni¹cego";

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

	description		=  "Pas m¹droœci";

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

	description		=  "Pas zawodowców";

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
	name 			=	"Ry¿ówka";

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
	name 			=	"Wyci¹g z jagód";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWyciagJagody;
	scemeName		=	"POTIONFAST";

	description		= 	"Wyci¹g z jagód";
			
	
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
	name 			=	"Wyci¹g z grzybów";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWyciagGrzyby;
	scemeName		=	"POTIONFAST";

	description		= 	"Wyci¹g z grzybów";
			
	
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
	
	TEXT[1]			= 	"Zwalcza ka¿d¹ truciznê.";				
	
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
	
	B_LogEntry(TOPIC_Ben_taktyki, "Trucizna faktycznie przesta³a dzia³aæ, chocia¿ dalej czujê siê fatalnie. Wydosta³em siê na zewn¹trz! Teraz pod os³on¹ nocy muszê uciec z tego obozu...");
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
	//B_MagicHurtNpc (oth, slf, 65); //115 Schaden reicht genau für einen Lurker.
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
	TEXT[1]			= 	"Zwiêksza si³ê o 50.";
	
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

	description		= 	"Cieñ cieniostwora";
	TEXT[1]			= 	"Zwiêksza zrêcznoœæ o 50.";
	
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
	TEXT[1]			= 	"Dodaje wszystkie umiejêtnoœci z³odziejskie.";
	
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
	name 			=	"Mikstura uspokajaj¹ca";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	50;	

	visual 			=	"itmi_holywater.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItNa_Uspokajajaca;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Mikstura Uspokajaj¹ca";
	
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
	TEXT[1]			= 	"Czyni tego, kto j¹ wypije";
	TEXT[1]			= 	"nieœmiertelnym...";
	
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
// . . . . . . . . . . Strza³y . . . . . . . . . .
// **********************************************

const string ARROWS_NORMAL = "U¿ywasz zwyk³e strza³y";
const string ARROWS_SHARP = "U¿ywasz ostre strza³y";
const string ARROWS_FIRE = "U¿ywasz ogniste strza³y";
const string ARROWS_ICE = "U¿ywasz lodowe strza³y";

const string ARROWS_YOU_USE_ALREADY = "Ju¿ u¿ywasz tych strza³!";
const string ARROWS_ON_CBOW = "Strza³ nie mo¿na na³o¿yæ na kuszê!";
const string ARROWS_NO_BOW = "Brak wyposa¿onego ³uku!";

const string BOLTS_NORMAL = "U¿ywasz zwyk³e be³ty";
const string BOLTS_SHARP = "U¿ywasz ostre be³ty";

const string BOLTS_YOU_USE_ALREADY = "Ju¿ u¿ywasz tych be³tów!";
const string BOLTS_ON_BOW = "Be³tów nie mo¿na na³o¿yæ na ³uk!";
const string BOLTS_NO_CBOW = "Brak wyposa¿onej kuszy!";

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItRw_Arrow(C_Item)
{
	name 				=	"Strza³a";

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
	name 				=	"Be³t";

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
	name 				=	"Ostry be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_SharpBolt;
	scemeName			=	"MAPSEALED";

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]				= 	"Obra¿enia + 10";
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
	name 				=	"Ognista strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_OgnistaStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_Arrow.3ds";
	
	effect				=	"SPELLFX_FIREARROW";
	
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]			    = 	"Obra¿enia magiczne + 30";
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
	name 				=	"Ostra strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_OstraStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_Arrow.3ds";
	
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[2]				=	"Obra¿enia + 30";
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
	name 				=	"Lodowa strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;
	
	on_state[0]			=   Use_LodowaStrzala;
	scemeName			=	"MAPSEALED";
	
	visual 				=	"ItRw_IceArrow.3ds";
	
	material 			=	MAT_WOOD;
	
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	name;
	TEXT[2]				= 	"Obra¿enia magiczne + 30";
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
// . . . . . . . . . . Ró¿ne . . . . . . . . . .
// **********************************************

instance ItNa_Empty(C_Item)
{
	// stary sposób na pioruny w dowolnym miejscu (Ayan Orc)
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	material = MAT_METAL;
	description = name;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Ratford_Pierscien(C_Item)
{
	name = "Z³oty pierœcieñ";
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
	name = "Skrzynka z kosztownoœciami";
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
	name 				=	"Paczka z broni¹";
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
	name 				=	"Paczka z ¿ywnoœci¹";

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

	B_LogEntry (TOPIC_Udar_mikstury,"Ten drañ chcia³ mnie oszukaæ! W paczce brakuje mikstur."); 
	Kirgo_Oszust = TRUE;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_PaczkaGoth(C_Item)
{
	name 				=	"Paczka mieczy jednorêcznych";
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
	name 				=	"Skórzany mieszek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseRabonSakwa;
	
	description			= 	"Skórzany mieszek Rabona";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseRabonSakwa ()
{
	B_PlayerFindItem (ItMi_Nugget,10); 
	B_LogEntry (TOPIC_Rabon_sakwa,"W sakwie Rabona znajdowa³o siê 10 bry³ek magicznej rudy. To strasznie dziwne, jak na bandytê... Wypada wyjaœniæ tê sprawê.");   
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
	text[0] = "Przerobiona bry³ka rudy przez Sattara, ciê¿ko dostrzec";
	text[1] = "na niej œlady jakiejkolwiek ingerencji w strukturê.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_Beczulka(C_Item)
{
	name = "Beczu³ka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "OC_BARREL_MINI.3ds";
	material = MAT_WOOD;
	
	description = "Beczu³ka ry¿ówki";
	
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};



// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_ZapasowaPila(C_Item)
{
	name = "Zapasowa pi³a";
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
	TEXT[2]				= 	"Paczka pe³na jakichœ dziwnych narzêdzi.";
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaLukora(C_Item)
{
	name 				=	"Ksiêga Lukora";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;


	visual 				=	"ItWr_Book_01.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Ksi¹¿ka jest tak brudna i poklejona,";
	TEXT[3]				=	"¿e nie sposób j¹ otworzyæ i przeczytaæ.";
	
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
	TEXT[2]				= 	"Z daleka czuæ zapach bagiennego ziela...";
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_Innos_Posazek(C_Item)
{
	name = "Wyj¹tkowy Pos¹¿ek Innosa";
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
	name 				=	"Skóra orkowego psa";

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
	name 				=	"Skóra czarnego wilka";

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
	name 				=	"Skóra lodowego wilka";

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
	name 				=	"Skóra trolla giganta";

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
   name      =    "Pierœcieñ Szybkoœci";
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
		var string str; str = "Pozosta³o: ";
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
		PrintScreen	("Pierœcieñ nie jest na³adowany.", -1,-1, "font_old_20_white.tga",2);
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
	name 				=	"¯abi korzeñ";

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
	name 				=	"Rzeczne pn¹cze";

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
	name 				=	"£uska bestii";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerPlate;

	visual 				=	"ItAt_CrawlerPlate.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"Poroœniêta grub¹ tkank¹.";
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
	name 				=	"Jajo zêbacza";

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
	
	TEXT[1]			= 	"Wywar z wê¿owej skóry";		
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
	
	PrintScreen	("Si³a i zrêcznoœæ: +3", -1, -1, FONT_SCREEN, 2);
	hero.attribute[ATR_STRENGTH] += 3;
	hero.attribute[ATR_DEXTERITY] += 3;
	
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
instance ItNa_WodaSwiecona_Adanos(C_Item)
{
	name = "Woda Œwiêcona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[0] = "Pochodzi ze Ÿróde³ w pobli¿u Geldern.";
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
	name 				=	"Miêso topielca";

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
	name 				=	"Jêzyk topielca";

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
	name 				=	"Pazur wœciek³ego topielca";

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
	name 				=	"Koœæ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SkeletonBone;

	visual 				=	"ItAt_SkeletonBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"Koœæ szkieletu jednego z piêciu braci.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KoscWargJehen (C_Item)
{
	name 				=	"Pêkniêta koœæ";

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
	name = "Kryszta³";
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
	name = "Pos¹¿ek";
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
	name = "Pos¹¿ek";
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
	name = "Kryszta³";
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
	name = "Ko³o zêbate";
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
	name = "Szcz¹tki przyjaciela Shrata";
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
	name = "Czarny kamieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Zapewne bêdzie pasowa³ do piedesta³u";
	text[2] = "w g³ównej sali zatopionej wie¿y Xardasa.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_NiebieskiKamien(C_Item)
{
	name = "Niebieski kamieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Zapewne bêdzie pasowa³ do piedesta³u";
	text[2] = "w g³ównej sali zatopionej wie¿y Xardasa.";
	text[5] = NAME_Value;
	count[5] = value;
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_MiesoDzika (C_Item)
{	
	name 				=	"Surowe miêso dzika";

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
	name 				=	"Sma¿ony piekielnik";

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
	name 				=	"Sma¿ony du¿y grzyb";

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
	name 				=	"Potrawka z chrz¹szcza";

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
	name 				=	"£osoœ";

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
	name 				=	"Sma¿ona ryba";

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
	name 				=	"Wywar z roœliny leczniczej";

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
	name 				=	"Wywar z zió³ leczniczych";

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
	name = "Mrok Pó³nocy";
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

	TEXT[0]				=	"Silnie toksyczny grzyb. Byæ mo¿e jakiœ alchemik";
	TEXT[1]				=	"bêdzie zdolny uwarzyæ z niego jakiœ napój.";
	
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
	name 				=	"Pieczeñ Snafa";

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
	name 				=	"Przepis na potrawkê z chrz¹szczy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Przepis na potrawkê z chrz¹szczy";
	TEXT[2]				= 	"Prawdopodobnie nale¿y do Snafa.";
};

// ***** ***** ***** ***** ***** ***** ***** ***** ***** *****
INSTANCE ItNa_KsiegaWiedzy		(C_Item)
{
	name 				=	"Ksiêga wiedzy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Book_02_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_KsiegaWiedzy;
	scemeName			=	"MAPSEALED";
	description			=  	name;

	TEXT[0]					=   "Wiedza zawarta w ksiêdze zwiêksza punkty nauki.";
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
	name 				=	"Sakwa myœliwego";

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
	name 				=	"Paczka gwoŸdzi";

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
	name 				=	"Paczka z miêsem";

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
	name 				=	"Paczka ma³ych gwoŸdzi";

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
	name = "Pieczeñ dla Gotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	description = name;
};
