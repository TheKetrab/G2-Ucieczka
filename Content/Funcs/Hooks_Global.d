// "magic constants"
const int oCNpc__FightAttackMelee = 6811328;
const int oCAIHuman__PC_Diving = 6921312;
const int oCNpc__DoTakeVob = 7621056;
const int Inv_Draw = 7369071;
const int oCNpc__OnTouch = 	7647008;
const int oCGame__HandleEvents = 7324016;
const int oCGame__GetHeroStatus = 7089424;
const int oCZoneMusic__s_herostatus = 10111520;
const int oCMobContainer__EndInteraction = 7477584;
const int oCNpc__OpenSteal =  7742512;
const int oCNpc__fighting = 6815920;
const int oCNpc__FindNextFightAction = 6805120;
const int oCNpc__ProcessNpc = 7595136;
const int oCGame__TestKeys = 7329120;
const int oCNpc__CheckRunningFightAnis = 6815248;
const int oCNpc__EV_AttackLeft = 7668064;
const int oCNpc__EV_AttackRight = 7668064;
const int oCNpc__EV_AttackRun  = 7673808;
const int oCNpc__EV_AttackForward  = 7664640;


func void OnTouch(/*oCNpc* this, zCVob* touchvob*/)
{
	if(!ECX/*this*/ || !(ESP+4)/*touchvob*/) { return; };
	
	var c_npc sleeper; sleeper =  _^(MEM_READINT(ESP+4));
	if(Hlp_GetInstanceID(sleeper) == Hlp_GetInstanceID(MeatBug) && MEM_READINT(ESP+4) != ECX)
	{
		B_KillNpc(sleeper);
		if(ECX == MEM_READINT(_hero)/*pointer to player*/)
		{
			B_GivePlayerXP(sleeper.level*10);
		
		};
		Release(sleeper);
		return;
	};

	if(Npc_IsInState	(sleeper, ZS_MM_Rtn_Sleep))
	{
		//AI_PlayAniBS (sleeper, "T_SLEEP_2_STAND", BS_STAND);
		Npc_ClearAIQueue(sleeper);
		//Npc_SetTarget (sleeper, hero);
		AI_StartState (sleeper, ZS_MM_Attack, 1, "");
	};
	
	Release(sleeper);
};


func void DisableStealBodyStateCheck()
{
    const int oCNpc_OpenSteal_JzBS                      =     7742946;     // .text:007625E2
    const int oCNpc_CheckSpecialSituations_JzBS         =     7741461;     // .text:00762015
    if ((MEM_ReadInt(oCNpc_OpenSteal_JzBS)              == -125631116) &&  // JZ SHORT +5; CMP EAX, imm8
        (MEM_ReadInt(oCNpc_CheckSpecialSituations_JzBS) ==  -75299468)) {  // JZ SHORT +5; CMP EBX, imm8
        MemoryProtectionOverride(oCNpc_OpenSteal_JzBS,              4);
        MemoryProtectionOverride(oCNpc_CheckSpecialSituations_JzBS, 4);
        MEM_WriteByte(oCNpc_OpenSteal_JzBS,                       235);    // JMP SHORT
        MEM_WriteByte(oCNpc_CheckSpecialSituations_JzBS,          235);    // JMP SHORT
    };
};

func void OpenSteal()
{
	DisableStealBodyStateCheck();
	CALL__thiscall(MEM_READINT(_hero),oCNpc__OpenSteal);
};

func void HandleEvents_hook(/*int key*/)
{
	if(MEM_READINT(ESP+4/*key*/)== KEY_LSHIFT && !IsOpenedDeadNpc)
	{
		if(!NpcIsFighting(hero) && !C_NpcIsDown(hero) && HLP_Is_oCNpc(MEM_READINT(MEM_READINT(_hero)+2476/*player->focus_vob*/)))
		{
			var c_npc slf; slf = _^(MEM_READINT(MEM_READINT(_hero)+2476));
			
			if(Npc_IsInState(slf, ZS_Unconscious) || Npc_IsDead   	(slf))
			{
				QuickLoot(slf,hero);
				Release(slf);
			};		
		
		};
	};
};



//var int v;
func void Inv_Draw_Hook()
{
    var c_item itm; itm = _^ (MEM_ReadInt (ESP+324+4));
	var int iptr; iptr = MEM_ReadInt (ESP+324+4);
    var int InstID; InstID = Hlp_GetInstanceID(itm);
    if(itm.mainflag ==    ITEM_KAT_FOOD /*|| itm.mainflag     ==    ITEM_KAT_POTIONS*/)
    {
        var int txtPtr;  txtPtr = _@s(itm.text);
        if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,1),  NAME_Bonus_HP))
        {
            itm.text[1] = "Premia % punktów trafieñ:";
        }
        else if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,1),  NAME_Bonus_Mana))
        {
            itm.text[1] = "Premia % punktów many:";
        };
        if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,2),  NAME_Bonus_Mana))
        {
            if(InstID == Hlp_GetInstanceID(ItFo_Beer) || InstID == Hlp_GetInstanceID(ItFo_Booze) || InstID == Hlp_GetInstanceID(ItFo_Wine) || InstID == Hlp_GetInstanceID(ItFo_Milk) || InstID == Hlp_GetInstanceID(ItNa_FriedMushroom_01) || InstID == Hlp_GetInstanceID(ItPl_BluePlant))
            {
                itm.text[2] = "Premia % punktów many:";
            };
        };
		MEM_Free(txtPtr);
    };
};

func void RemoveChestKeyOnExit()
{
	if(MEM_ReadInt(ESP+4) != MEM_ReadInt(_hero) || !Hlp_Is_oCMobContainer(ECX) || !Hlp_Is_oCMobDoor(ECX)){
		return;
	};
	
	var oCMobLockable m; m = _^(ECX);
	
	if(m._oCMobInter_bitfield = m._oCMobInter_bitfield  |  oCMobLockable_bitfield_locked) {
		return;
	};
	
	if(STR_LEN(m.keyInstance))
	{
		var int key; key = MEM_FindParserSymbol(STR_Upper(m.keyInstance));
		
		if(Npc_HasItems(hero,key))
		{
			/*if(MEM_ReadInt(key+348)/*oCItem->flags*//* & ITEM_MISSION){
				return;
			};*/
			Npc_RemoveInvItems(hero,key,Npc_HasItems(hero,key));
			PrintS_Ext(ConcatStrings("Usuniêto: ", m.keyInstance), RGBA(255,255,255,0));
			//m.keyInstance = "";
			Release(key);
		};
	};
};

func void SaveDis()
{
	if(!SavingDisabled)
	{
		PrintS_Ext("Wy³¹czono mo¿liwoœæ zapisywania!", RGBA(255, 0, 0, 1));
		DisableSave();
	};
};
func void SaveEnb()
{
	if(SavingDisabled)
	{
		PrintS_Ext("W³¹czono mo¿liwoœæ zapisywania!", rgba(46, 204, 113, 1));
		AllowSaving();
	};
};

func void DynamicSaveSystem()
{

	if(STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice")))
	{
		if (MEM_ReadInt(oCZoneMusic__s_herostatus) >= 2) //&& (Npc_GetDistToNpc(slf,hero) < 500))/* || Npc_IsInState	(hero, ZS_Unconscious)*/
		{
			SaveDis();
		}
		else
		{
			SaveEnb();
		};
	}
	else
	{
		if(SavingDisabled)
		{
			PrintS_Ext("W³¹czono mo¿liwoœæ zapisywania!", rgba(46, 204, 113, 1));
			AllowSaving();
		};
	};


};

func void HeroStatusFix()
{
	if (MEM_ReadInt(oCZoneMusic__s_herostatus) == 1)
	{
		MEM_WriteInt(oCZoneMusic__s_herostatus,2);
	};
};

func void DisableFocusOfDeadNPCsWithEmptyInventory() {
    const int once = 0;
    if (once) {
        return;
    };
    once = 1;

    // Safety check in case later versions of the System Pack add this functionality
    const int oCNpc__CollectFocusVob_deadNpc = 7552709; //0x733EC5
    const int expected[6] = { 28870027, -1065025536, 13995791, -2135228416, -385875968, 203 };
    if (!MEM_CompareBytes(oCNpc__CollectFocusVob_deadNpc-14, _@(expected), 4*6)) {
        MEM_Warn("Opcode integrity-check failed. This feature must have been already implemented by someone else.");
        return;
    };

    // Overwrite opcode with hook
    MemoryProtectionOverride(oCNpc__CollectFocusVob_deadNpc, 5);
    MEM_WriteInt(oCNpc__CollectFocusVob_deadNpc,    -1869574000); // 4 x nop: 0x90909090
    MEM_WriteByte(oCNpc__CollectFocusVob_deadNpc+4, ASMINT_OP_nop);

    HookEngineF(oCNpc__CollectFocusVob_deadNpc, 5, _DisableFocusOfDeadNPCsWithEmptyInventory);
};
func void _DisableFocusOfDeadNPCsWithEmptyInventory()
{
    // Get dead focus NPC
    var oCNpc npc; npc = _^(EBP);
    var int invPtr; invPtr = _@(npc.inventory2_vtbl);

    // Check if inventory is empty
    const int oCNpcInventory__IsEmpty = 7393696; //0x70D1A0
    const int one = 1;
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(one)); // Ignore equipped (ITEM_ACTIVE)
        CALL_IntParam(_@(one)); // Ignore armor (ITEM_KAT_ARMOR)
        CALL__thiscall(_@(invPtr), oCNpcInventory__IsEmpty);
        call = CALL_End();
    };

    // Change vob type for different focus priority
    if (CALL_RetValAsInt()) {
        // Inventory empty: Set invalid zTVobType -> focus priority = -1 (ignored)
        EBX = -1; // zTVobType_none
    } 
	else {
        // Inventory not empty: Set mob zTVobType -> low focus priority (this is the "original" code)
        EBX = 128; // zTVobType_mob
   };
 };

func void VobSetVisual(var int vobPtr, var string str) 
{
	const int zCVob__SetVisual = 6301312; //602680
	
	CALL_zStringPtrParam(str);
	CALL__thiscall(vobPtr, zCVob__SetVisual);
};

func void SHIELD_EQUIP()
{
	if(!ECX || !MEM_ReadInt(ESP+4)) {return;};
	
	var c_item itm; itm = _^(MEM_ReadInt(ESP+4));
	if(itm.flags & ITEM_SHIELD)
	{
		if(ECX == MEM_ReadInt(_hero))
		{
			if (!WalkaTarcza)
			{
				MEM_WriteInt(ESP+4,0);
				PrintScreen("Brak odpowiedniej umiejêtnoœci.",-1,YPOS_LevelUp,FONT_ScreenSmall,2);
				AI_PlayAni(hero,"T_DONTKNOW");
				hero.aivar[AIV_TARCZA] = false;
				return;
			};
		};
		var int ptr; ptr = MEM_ReadInt(ESP+4);
		VobSetVisual(ptr,itm.visual);	
	};
};
const int oCNpc__UpdateSlots = 7645648;
func void UpdateStaffSlot()
{
	if(!ECX) {return;};
	
	//var c_npc slf; slf = _^(ECX);
	var int slotvob; slotvob =  GetItemSlot_(ECX,"ZS_STAFF");
	
	if(!slotvob) {return;};
	
	oCNpc_SetToSlotPosition_(ECX, slotvob, "ZS_CROSSBOW");
};

const int oCNpcInventory__HandleEvent = 7397440;

func void oCNpcInventory_HandleEvent_hook()
{
	if(!ECX) { return;};
	
	var int nptr; nptr = MEM_ReadInt(ECX+160);
	
	if(nptr != MEM_ReadInt(_hero)) {return;};
	

	if(MEM_ReadInt(ESP+4) == MEM_GetKey("keyAction") || MEM_ReadInt(ESP+4) ==  MEM_GetSecondaryKey("keyAction"))
	{
		var int ptr; ptr = Inv_GetSelectedItem(ECX);
		if(!ptr) {return;};
		
		var c_item itm; itm = _^(ptr);	
		
		if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(Itna_kostur_urshaka))
		{	
			var c_npc slf; slf = _^(nptr);
			MEM_WriteInt(ESP+4,-1);
			EAX = -1;
			if(!itm.hp)
			{
				if (!oCNpc_GetInvSlot_(nptr, "ZS_STAFF"))
				{
					oCNpc_CreateInvSlot_(nptr, "ZS_STAFF");
				};
				
				Wld_InsertItem(Hlp_GetInstanceID(itm),MEM_GetAnyWP());
				var zCTree newTreeNode; newTreeNode = _^(MEM_World.globalVobTree_firstChild);
				var int itmPtr; itmPtr = newTreeNode.data;
				oCNpc_PutInSlot(slf, "ZS_STAFF", itmPtr, true);
				var int vob; vob = GetItemSlot(slf,"ZS_STAFF");
				itm.flags = itm.flags | ITEM_ACTIVE;
				itm.hp = 1;
			}
			else
			{
				oCNpc_RemoveFromSlot(slf, "ZS_STAFF", itmPtr, true);
				itm.flags = itm.flags & ~ ITEM_ACTIVE;
				itm.hp = 0;
			};
			
		};	
	};
};

func void Hooks_Global()
{
	InitDamage();
	RandomScreen_Init();
	const int hooks = 0;
	if(!hooks){
		
		DisableFocusOfDeadNPCsWithEmptyInventory();
		
		HookEngineF(oCNpc__UpdateSlots,6,UpdateStaffSlot);
		HookEngineF(oCNpcInventory__HandleEvent,6,oCNpcInventory_HandleEvent_hook);
		HookEngineF(oCNpc__EquipItem,        7, SHIELD_EQUIP);
		HookEngineF(oCNpc__ProcessNpc,6,SneakHuntingBoost); 
		
		HookEngineF(oCGame__TestKeys,6,CheckMarvin);
		
		HookEngineF(oCNpc__CloseDeadNpc,5,CloseDeadNpc);
		HookEngineF(oCNpc__OpenDeadNpc,6,OpenDeadNpc);
		HookEngineF(oCGame__GetHeroStatus,5,DynamicSaveSystem);
		//HookEngineF(6908240,6,DynamicSaveSystem);
		//HookEngineF(6927088,6,sneak);
		HookEngineF(oCNpc__fighting,7,HeroStatusFix);
		HookEngineF(oCNpc__FindNextFightAction,7,HeroStatusFix);
		HookEngineF(oCNpc__CheckRunningFightAnis,5,HeroStatusFix);
	    HookEngineF (oCNpc__EV_AttackLeft, 6, HeroStatusFix); //left
		HookEngineF (oCNpc__EV_AttackRight, 7, HeroStatusFix); //right
		HookEngineF (oCNpc__EV_AttackRun, 7, HeroStatusFix); //run
		HookEngineF (oCNpc__EV_AttackForward, 6, HeroStatusFix); //combo
		//HookEngineF(7385232,6,sneak); //steal handleevents
		//HookEngineF(7384544,7,sneak);
		
		//HookEngineF(7742512,7,sneak);
		//nie, mo¿e do aoe
		//HookEngineF(7013824,7,sneak);
		
		//HookEngineF(7011824,5,sneak);
		//HookEngineF(6562848,6,test);
		//HookEngineF(6908240,6,test);
		//const int oCMobContainer__EndInteraction = 7477584;
		//HookEngineF(oCMobContainer__EndInteraction,6,RemoveChestKeyOnExit);
		
		HookEngineF(oCNpc__EV_DrawWeapon,6,PrintMunitionType); 
		HookEngineF(oCNpc__EV_DrawWeapon1,5,PrintMunitionType);
		HookEngineF(oCNpc__EV_DrawWeapon2,6,PrintMunitionType); 
		
		HookEngineF(oCNpc__EV_RemoveWeapon,  7, RemovePrintedMunitionType);
		HookEngineF(oCNpc__EV_RemoveWeapon1, 7,RemovePrintedMunitionType);
		HookEngineF(oCNpc__EV_RemoveWeapon2, 6,RemovePrintedMunitionType); 

		HookEngineF(oCNpc__FightAttackMelee,6,ZmienStylWalki); 
			
		HookEngineF(oCAIHuman__PC_Diving,6,TakeItemsDuringDiving); 

		HookEngineF(oCNpc__DoTakeVob,6,TakeFocusVob_hook);	

		
		HookEngineF(Inv_Draw, 6,  Inv_Draw_Hook);
		
		HookEngineF(oCNpc__OnTouch, 5, OnTouch);
		
		HookEngineF(oCGame__HandleEvents,7,HandleEvents_hook);
	
		
		
		hooks = true;
	};


};

	