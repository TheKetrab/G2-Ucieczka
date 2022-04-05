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
const int oCZoneMusic__GetHerostatus = 6562848;


func void OnTouch(/*oCNpc* this, zCVob* touchvob*/)
{
	if( !(ESP+4)/*touchvob*/) { return; };
	var int ptr; ptr  = MEM_READINT(ESP+4);
	if(!ptr) {return;};
	var c_npc sleeper; sleeper =  _^(ptr);
	if(Hlp_GetInstanceID(sleeper) == Hlp_GetInstanceID(MeatBug) && ptr != ECX)
	{
		sleeper.attribute[0]  = 0;
		if(ECX == MEM_READINT(_hero)/*pointer to player*/)
		{
			zdeptane_chrzaszcze += 1;
			B_GivePlayerXP(sleeper.level*10);
		
		};
		return;
	};

	if(Npc_IsInState	(sleeper, ZS_MM_Rtn_Sleep))
	{
		//AI_PlayAniBS (sleeper, "T_SLEEP_2_STAND", BS_STAND);
		Npc_ClearAIQueue(sleeper);
		//Npc_SetTarget (sleeper, hero);
		AI_StartState (sleeper, ZS_MM_Attack, 1, "");
	};

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

func int QS_IsClickedKey(var int key)
{
	var int i; i = 0; var int keyy; keyy =  KEY_1; 
	repeat(i,10);
		if(key!=keyy)
		{
			if(MEM_KeyPressed(keyy))
			{
				keyy+=1;
				return true;
			};
		};
		keyy+=1;
	end;
	return 0;
};
func int EQ_IsOpen()
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	CALL__thiscall(_@(her.inventory2_vtbl), oCItemContainer__IsOpen);
	return CALL_RetValAsInt();
	
};
func void HandleEvents_hook(/*int key*/)
{
	
	var int key; key = MEM_ReadInt(ESP+4);
	if(DisableQuickSlot == false)
	{
		if(key == KEY_1) 	{  if(EQ_IsOpen() && MEM_KeyPressed(key)){ 	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_2) 	{  if(EQ_IsOpen() && MEM_KeyPressed(key)){ 	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_3) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(3);	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_4) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(4);	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_5) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(5);	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_6) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(6);	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_7) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(7);	MEM_WriteInt(ESP + 4, -1);	};};
		if(key == KEY_8) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(8);	MEM_WriteInt(ESP + 4, -1); 	};};
		if(key == KEY_9) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(9);	MEM_WriteInt(ESP + 4, -1);	};};
		if(key == KEY_0) 	{  if(MEM_KeyPressed(key)&& !QS_IsClickedKey(key)){ QS_UseItem(0);	MEM_WriteInt(ESP + 4, -1); 	};};
	};

	if(MEM_READINT(ESP+4/*key*/)== KEY_LSHIFT && !IsOpenedDeadNpc)
	{
		var int heroPtr; heroPtr = MEM_READINT(_hero);
		var int fcsss; fcsss = MEM_READINT(heroPtr+2476/*player->focus_vob*/);
		if(!NpcIsFighting(hero) && !C_NpcIsDown(hero) && HLP_Is_oCNpc(fcsss))
		{
			var c_npc slf; slf = _^(fcsss);
			
			if(Npc_IsInState(slf, ZS_Unconscious) || Npc_IsDead   	(slf))
			{
				QuickLoot(slf,hero);
			};		
		
		};
	};
};


//var int v;
func void Inv_Draw_Hook()
{
   var int iptr; iptr = MEM_ReadInt (ESP+324+4);
   var c_item itm; itm = _^ (iptr);
    var int InstID; InstID = Hlp_GetInstanceID(itm);
    if(/*itm.mainflag ==    ITEM_KAT_FOOD*/ itm.mainflag     ==    ITEM_KAT_POTIONS)
    {
        if((InstID == Hlp_GetInstanceID(ItPo_Health_01)) || (InstID ==  Hlp_GetInstanceID(ItPo_Health_02)) || (InstID == Hlp_GetInstanceID(ItPo_Health_03)))
		{
			//var int txtPtr;  txtPtr = _@s(itm.text);
			//if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,1),  NAME_Bonus_HP))
			//{
				itm.text[1] = "Premia % punktów trafieñ:";
			//}
			//else if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,1),  NAME_Bonus_Mana))
			//{
				//itm.text[1] = "Premia % punktów many:";
			//};
			/*if (Hlp_StrCmp(MEM_ReadStringArray(txtptr,2),  NAME_Bonus_Mana))
			{
				if(InstID == Hlp_GetInstanceID(ItFo_Beer) || InstID == Hlp_GetInstanceID(ItFo_Booze) || InstID == Hlp_GetInstanceID(ItFo_Wine) || InstID == Hlp_GetInstanceID(ItFo_Milk) || InstID == Hlp_GetInstanceID(ItNa_FriedMushroom_01) || InstID == Hlp_GetInstanceID(ItPl_BluePlant))
				{
					itm.text[2] = "Premia % punktów many:";
				};
			};*/
			//MEM_Free(txtPtr);
		}
		else if ((InstID == Hlp_GetInstanceID(ItPo_Mana_01)) || (InstID ==  Hlp_GetInstanceID(ItPo_Mana_02)) || (InstID == Hlp_GetInstanceID(ItPo_Mana_03)))
		{
			itm.text[1] = "Premia % punktów many:";
		};
    };
};
//raczej siê nie przyda
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

func int Game_GetHeroStatus()
{
	var int ogame; ogame = MEM_ReadInt(MEMINT_oGame_Pointer_Address);
	CALL__thiscall(ogame,oCGame__GetHeroStatus);
	return CALL_RetValAsInt();
};

const func mm_attack_func = ZS_MM_ATTACK;
const func attack_func = ZS_ATTACK;
const int dword_AAD648_Adr = 11195976;
const int oCNpc__Enemy_Offset = 1176;
const int oCNpc__state_curState_valid_Offset = 1468;
const int oCNpc__state_curState_Idx_Offset = 1444;
const int oCNpc__state_nextState_Idx_Offset = 1504;
//const int zCArray__numInArray_Offset = 8;
func int IsHeroInDanger()
{
                        //zCArray<T>::numInArray;
    var int num; num = MEM_ReadInt(dword_AAD648_Adr+zCArray__numInArray_Offset);

    if(num)
    {
        var int playerPtr; playerPtr = MEM_ReadInt(_hero);
        
        if(playerPtr == 0){ return false; };        
        
        var int ele; 
        var int currStateIdx;
        var int nextStateIdx;

        var int arrPtr; arrPtr = MEM_ReadInt(dword_AAD648_Adr);
        var int i; i = 0;
        var int label; label = MEM_StackPos.position;
        if(i < num)
        {    
            ele = MEM_ReadIntArray(arrPtr,i);
            
			var int enemyPtr; enemyPtr = MEM_ReadInt(ele+oCNpc__Enemy_Offset);
            if(enemyPtr == playerPtr)
            {

                var int validCurrState; validCurrState = MEM_ReadInt(ele+oCNpc__state_curState_valid_Offset);
				if(validCurrState)
                {
                    currStateIdx = MEM_ReadInt(ele+oCNpc__state_curState_Idx_Offset);
                    if(currStateIdx == mm_attack_func || currStateIdx == attack_func)
                    {
                        return true;
                    };    
                }
                else
                {
                    nextStateIdx = MEM_ReadInt(ele+oCNpc__state_nextState_Idx_Offset);
                    if(nextStateIdx == mm_attack_func || nextStateIdx == attack_func)
                    {
                        return true;
                    };    
                };
            };
            
            i+=1;
            MEM_StackPos.position = label;
        };
    };
    return false;
};

func int HeroStatusFix()
{
	var int status; status = MEM_ReadInt(oCZoneMusic__s_herostatus);
	
	//zagro¿enie, nie walka, taka wartoœæ jest, gdy nie ma siê wyci¹gniêtej broni i atakuje nas przeciwnik
	//lub hp <=5 lub jest siê w portalu z nazw¹ WALD, wiêc trzeba to zignorowaæ 
	//i sprawdziæ czy faktycznie jest siê w zagro¿eniu
	if(status == 1) 
	{
		return IsHeroInDanger();
	}
	else
	{
		return status == 2;
	};
};

func void DynamicSaveSystem()
{
	MEM_SkyController.m_enuWeather = 1;
	if(STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice")))
	{
		if (HeroStatusFix()) //&& (Npc_GetDistToNpc(slf,hero) < 500))/* || Npc_IsInState	(hero, ZS_Unconscious)*/
		{
			SaveDis();
		}
		else
		{
			if(!OrcSawYou_Activated)
			{
				SaveEnb();
			};
		};
	}
	else
	{
		// Ca³y czas mo¿na zapisywaæ, chyba ¿e orc
		if (!OrcSawYou_Activated) {		
			AllowSaving();
		};
	};


};


// WYLACZENIE REAGOWANIA NA KRADZIEZ PO KODZIE 'INSERT' PRZEZ 30s
// void __cdecl Game_CreateInstance(class zSTRING &,class zSTRING &) 0x006CB7C0 = 7124928
const int cdecl__Game_CreateInstance = 7124928;
const int cdecl__Game_CreateInstance_Len = 6;

var int AssessTheftDisabled;
func void DisableAssessTheft() {
	AssessTheftDisabled = TRUE;
	ff_applyonceext(DisableAssessTheft_Timer,5000,-1);
};

var int DisableAssessTheft_i;
func void DisableAssessTheft_Timer() {
	DisableAssessTheft_i += 1;
	if (DisableAssessTheft_i >= 6) { // 6*5 = 30s
		AssessTheftDisabled = FALSE;
		DisableAssessTheft_i = 0;
		ff_remove(DisableAssessTheft_Timer);
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
	var int ptr; ptr = MEM_ReadInt(ESP+4);
	if(!ptr) { return; };
	
	var c_item itm; itm = _^(ptr);
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
		VobSetVisual(ptr,itm.visual);	
	};
};

const int oCItemContainer__GetSelectedItem = 7377600;
func int Inv_GetSelectedItem(var int eqPtr)
{
    CALL__thiscall(eqPtr,oCItemContainer__GetSelectedItem);
    return CALL_RetValAsPtr();
};

const int oCNpc__GetInvSlot = 7641824;
func int oCNpc_GetInvSlot_(var int slfPtr, var string slotName)
{
    slotName = Str_Upper(slotName);
    CALL_zStringPtrParam(slotName);
    CALL__thiscall(slfPtr,oCNpc__GetInvSlot);
    return CALL_RetValAsPtr();
};

const int oCNpc__SetToSlotPosition = 7640960;
func void oCNpc_SetToSlotPosition(var c_npc slf, var int vobPtr, var string slotName)
{
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
	CALL_PtrParam(vobPtr);
	CALL__thiscall(_@(slf),oCNpc__SetToSlotPosition);

};
func void oCNpc_SetToSlotPosition_(var int slfPtr, var int vobPtr, var string slotName)
{
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
	CALL_PtrParam(vobPtr);
	CALL__thiscall(slfPtr,oCNpc__SetToSlotPosition);

};

const int oCNpc__CreateInvSlot = 7641088;
const int oCNpc__DeleteInvSlot = 7641568;
func void oCNpc_CreateInvSlot(var c_npc slf, var string slotName)
{
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(_@(slf),oCNpc__CreateInvSlot);
};
func void oCNpc_CreateInvSlot_(var int slfPtr, var string slotName)
{
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(slfPtr,oCNpc__CreateInvSlot);
};
func void oCNpc_DeleteInvSlot(var c_npc slf, var string slotName)
{
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(_@(slf),oCNpc__DeleteInvSlot);
};

func int GetItemSlot_(var int slfPtr, var string slotName) 
{
    const int oCNpc__getitemslot = 7544560;
	slotName = Str_Upper(slotName);
	CALL_zStringPtrParam(slotName);
    CALL__thiscall (slfPtr, oCNpc__getitemslot);
    return CALL_RetValAsPtr();
};

/*
func int oCNpc_GetModel(var c_npc npc)
{
	const int oCNpc__GetModel = 7571232;
	CALL__thiscall(MEM_InstToPtr(npc), oCNpc__GetModel);
    return CALL_RetValAsPtr();
};*/
const int zCModel__SearchNode = 5758960;   //0x0057DFF0
const int zCModel__SetNodeVisual = 5739168;
func int zCVisual_LoadVisual(var string vis) 
{
	const int zCVisual__LoadVisual = 6318800; //0x00606AD0
	CALL_zStringPtrParam(STR_Upper(vis));
	CALL__cdecl(zCVisual__LoadVisual);
	
	return CALL_RetValAsPtr();
};

func int zCModel_SearchNode(var int model, var string node)
{
	CALL_zStringPtrParam(Str_Upper(node));
	CALL__thiscall(model, zCModel__SearchNode);
    return CALL_RetValAsInt();
};

func void SetNodeVisual(var c_npc pnpc, var string node, var string visual)   
{
	var int model; model = oCNpc_GetModel(pnpc);
	var int vis; vis = zCVisual_LoadVisual(visual);
	var int nde; nde = zCModel_SearchNode(model,node);
	CALL_IntParam(0);	
	CALL_PtrParam(vis);	
	CALL_PtrParam(nde); 
	CALL__thiscall(model, zCModel__SetNodeVisual);
};
/*
const int oCNpc__EquipArmor = 7578768;
func void hNpc_EquipArmor()
{
	var int ptr; ptr = MEM_ReadInt(ESP+4);
	var oCItem itm; itm = _^(ptr);
	if(itm.wear == WEAR_HEAD)
	{
		var int pHero; pHero = MEM_ReadInt(hero);
		if(ECX != pHero)
		{
			itm.mainflag = ITEM_KAT_NF;
		}
		else
		{
			itm.mainflag = ITEM_KAT_ARMOR;
		};

	};
	
};*/

const int oCNpc__UpdateSlots = 7645648;
func void UpdateStaffSlot()
{
	//var c_npc slf; slf = _^(ECX);
	var int slotvob; slotvob =  GetItemSlot_(ECX,"ZS_STAFF");
	//var int helmet; helmet = GetItemSlot_(ECX,"ZS_HELMET");
	

	if(!slotvob) {return;};
	
	oCNpc_SetToSlotPosition_(ECX, slotvob, "ZS_CROSSBOW");
};

const int oCNpc__PutInSlot_ucieczka = 7643760;

var int HelmetEquipped;
const int RuneIterator = 3;
const int oCNpcInventory__HandleEvent = 7397440;
func void oCNpcInventory_HandleEvent_hook()
{
	var int nptr; nptr = MEM_ReadInt(ECX+160);
	
	var int key; key = MEM_ReadInt(ESP + 4);
	var int keyWeapon_1; keyWeapon_1 = MEM_GetKey("keyWeapon");
	var int keyWeapon_2; keyWeapon_2 = MEM_GetSecondaryKey("keyWeapon");
	
	var int keyAction_1; keyAction_1 = MEM_GetKey("keyAction");
	var int keyAction_2; keyAction_2 = MEM_GetSecondaryKey("keyAction");	
	
	var int ptr; ptr = Inv_GetSelectedItem(ECX);
	if(!ptr) {
		return;
	};
	var int action; action = (key == MOUSE_BUTTONLEFT|| key == keyAction_1 || key == keyAction_2|| key ==  KEY_LCONTROL );
	var c_item itm; 
	var int isKostur; isKostur = Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_Kostur_UrShaka);
	if(action  || key == KEY_1)
	{
		itm = _^(ptr);
		if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItNa_Kostur_UrShaka))
		{	
			var c_npc slf; slf = _^(nptr);
			MEM_WriteInt(ESP+4,-1);
			
			if(!WillHasEquippedKostur)
			{
				if (!oCNpc_GetInvSlot_(nptr, "ZS_STAFF"))
				{
					oCNpc_CreateInvSlot_(nptr, "ZS_STAFF");
				};
				WillHasEquippedKostur = TRUE;
				ff_applyonceext(ZamekFunc,1000,-1);
				
				Wld_InsertItem(Hlp_GetInstanceID(itm),MEM_GetAnyWP());
				
				var zCTree newTreeNode; newTreeNode = _^(MEM_World.globalVobTree_firstChild);
				var int itmPtr; itmPtr = newTreeNode.data;
				
				//CALL_IntParam(true);
				//CALL_PtrParam(itmPtr);
				//CALL_zSTRINGPtrParam("ZS_STAFF");
				//CALL__thiscall(_@(slf),oCNpc__PutInSlot_ucieczka);
				oCNpc_PutInSlot(slf, "ZS_STAFF", itmPtr, true);
				

				//itm.flags = itm.flags | ITEM_ACTIVE;

			}
			else
			{
				var int vob; vob = GetItemSlot(slf,"ZS_STAFF");
				

				oCNpc_RemoveFromSlot(slf, "ZS_STAFF", vob, 0);
				//itm.flags = itm.flags & ~ ITEM_ACTIVE;
				WillHasEquippedKostur = FALSE;
				ff_remove(ZamekFunc);
			};
			
			return;
		};	
		
	};
	
	
	if(DisableQuickSlot == false)
	{
		//QS
	
		if(key == keyWeapon_1
		|| key == keyWeapon_2)
		{
			MEM_WriteInt(ESP + 4, -1);
			return;
		};
	};
	
	
	if(isKostur){return;};
	
	if((action 
	|| key == KEY_1 
	|| key == KEY_2)
	&& DisableQuickSlot == false
	)	
	{
		
		
		itm = _^(ptr);

			if(itm.flags & ITEM_SHIELD)
			{
				// KETRAB - zakladanie tarczy przez klawisz CTRL
				var c_item meleeWeap; meleeWeap = Npc_GetEquippedMeleeWeapon(hero);
				if(meleeWeap.flags & (ITEM_SWD | ITEM_AXE)) {
					AI_Function_I(hero, QS_EquipWeapon, ptr);
				} else {
					PrintS("Za³ó¿ broñ jednorêczn¹ przed u¿yciem tarczy!");
				};
				
				MEM_WriteInt(ESP+4,-1);  return;
			};
			if(itm.mainflag == ITEM_KAT_NF)
			{
			   QS_PutSlot(hero, 1, ptr);  MEM_WriteInt(ESP+4,-1);
				QS_AI_EquipWeapon(ptr);

			}
			else if(itm.mainflag == ITEM_KAT_FF)
			{
				QS_PutSlot(hero, 2, ptr); MEM_WriteInt(ESP+4,-1);
				QS_AI_EquipWeapon(ptr);

			}
			
				
				//MEM_WriteInt(ESP+4,-1);
		
			// KETRAB
			else if (itm.mainflag == ITEM_KAT_RUNE)
			{
				// jesli ten item byl juz gdzies w qs, to zostanie zwrocony
				// jego index zatem putslot zdejmie go z qs
				var int freeslot; freeslot = QS_GetFreeSlotNr(itm);
				if (freeslot != -1) {
					QS_PutSlot(hero, freeslot, ptr);  MEM_WriteInt(ESP+4,-1);
				};
			};

	};
		/*if(itm.mainflag == ITEM_KAT_RUNE)
		{
			if(key!= KEY_1 && key != KEY_2)
			{
				var int i; ptr; MEM_CALLByString("QS_GetSlotByItem");
				i = MEM_PopIntResult();
				
				if(itm.flags &~ ITEM_ACTIVE)
				{
					QS_PutSlot(hero, RuneIterator, ptr); MEM_WriteInt(ESP+4,-1);
					RuneIterator+=1;
					itm.flags & ITEM_ACTIVE;
				}
				else
				{
					if(i)
					{
						i;
						MEM_CALLByString("QS_RemoveSlot");
						RuneIterator-=1;
						itm.flags = itm.flags   &~ ITEM_ACTIVE;
					};
				};
			};
		};*/
		

	if(DisableQuickSlot == false)
	{
	
		//if(key == KEY_1) { QS_PutSlot(hero, 1, ptr); MEM_WriteInt(ESP+4,-1); }; 
		//if(key == KEY_2) { QS_PutSlot(hero, 2, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_3) { QS_PutSlot(hero, 3, ptr); MEM_WriteInt(ESP+4,-1);  }; 
		if(key == KEY_4) { QS_PutSlot(hero, 4, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_5) { QS_PutSlot(hero, 5, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_6) { QS_PutSlot(hero, 6, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_7) { QS_PutSlot(hero, 7, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_8) { QS_PutSlot(hero, 8, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_9) { QS_PutSlot(hero, 9, ptr); MEM_WriteInt(ESP+4,-1); }; 
		if(key == KEY_0) { QS_PutSlot(hero, 0, ptr); MEM_WriteInt(ESP+4,-1); }; 
	};
	
};
//void __thiscall oCNpc::EquipItem(class oCItem *) 	0x007323C0 	0 	7

func c_item AssignItem(var c_item itm)
{
    MEM_PushInstParam(itm);
};
/*
func void G_CheckItemConditions(var C_NPC slf, var C_Item itm,var int ptr)
{	
	var int bIsPlayer; bIsPlayer = Npc_IsPlayer(slf);
	var int slfMagCircle; slfMagCircle = Npc_GetTalentSkill(slf, NPC_TALENT_MAGE);
	

	if (itm.mag_circle > 0 && slfMagCircle < itm.mag_circle)
	{	
		G_CanNotCast(bIsPlayer, itm.mag_circle, slfMagCircle);
		EAX = 0;
		
		return;
	};
	
	//var int i; repeat(i, 3);	

		var int itmAtr; itmAtr = MEM_ReadStatArr(itm.cond_atr, 0);
		var int itmValue; itmValue = MEM_ReadStatArr(itm.cond_value, 0);
		var int slfAtrValue;
		
		if (itmAtr > 0 && itmValue > 0)
		{
			slfAtrValue = MEM_ReadStatArr(slf.attribute, itmAtr);
			
			if (slfAtrValue < itmValue)
			{		
				G_CanNotUse(bIsPlayer, itmAtr, itmValue);
				EAX = 0;
				
				return;
			};
		};		
		itmAtr = MEM_ReadStatArr(itm.cond_atr, 1);
		itmValue = MEM_ReadStatArr(itm.cond_value,1);
		
		if (itmAtr > 0 && itmValue > 0)
		{
			slfAtrValue = MEM_ReadStatArr(slf.attribute, itmAtr);
			
			if (slfAtrValue < itmValue)
			{		
				G_CanNotUse(bIsPlayer, itmAtr, itmValue);
				EAX = 0;
				
				return;
			};
		};
		itmAtr = MEM_ReadStatArr(itm.cond_atr, 2);
		itmValue = MEM_ReadStatArr(itm.cond_value,2);
		
		if (itmAtr > 0 && itmValue > 0)
		{
			slfAtrValue = MEM_ReadStatArr(slf.attribute, itmAtr);
			
			if (slfAtrValue < itmValue)
			{		
				G_CanNotUse(bIsPlayer, itmAtr, itmValue);
				EAX = 0;
				
				return;
			};
		};
	
	EAX = 1;
};

func void Hook_CheckItemConditions()
{
	var C_Npc slf; slf = _^(ECX);
	var int ptr; ptr = MEM_ReadInt(ESP + 4);
	if(!ptr){return;};
	var C_Item itm; itm = _^(ptr);
	self = Hlp_GetNpc(slf);
	item = _^(ptr);
	G_CheckItemConditions(slf, item,ptr);
};
//const int oCNpc__CanUse = 7543216;
func void CheckItemConditions_Init()
{
	const int initalized = false;
	
	if (!initalized)
	{
		ReplaceEngineFuncF(oCNpc__CanUse, 1, Hook_CheckItemConditions);
		
		initalized = true;
	};
};

*/
func void Npc_DoShootArrow_Hook()
{
	//var int isPlayer; isPlayer = ECX == MEM_ReadInt(_hero);
	var int isPlayer; isPlayer = ESI == MEM_ReadInt(_hero);
	if(isPlayer == false)
	{
		return;
	};
	
	TabukStrzelanie_Wystrzelenie_Hook();
	
};

const int oCNpc__EquipBestWeapon = 7663408;

func void oCNpc__EquipBestWeapon_Hook()
{
	var c_npc slf; slf = _^(ECX);
	
	if(slf.aivar[AIV_ChapterInv])
	{
		MEM_WriteInt(ESP+4,-1);
		
		//if(!Npc_HasEquippedMeeleWeapon())
		//{
			//AI_Engine_EquipWeapon(slf,itmw_1h_bau_mace,1);
		//};
	};
};




const int INV_MAX_ITEMS_addr = 8635508;
const int oCNpc__CopyTransformSpellInvariantValuesTo = 7590864;

//const int oCNpc__DoShootArrow_PostReturnConditions = 7620740;
const int oCNpc__DoShootArrow_PostReturnConditions = 7620745;
//const int oCNpc__IsMunitionAvailable = 7587552;

const int oCSpawnManager__CheckRemoveNpc_DeleteNpc = 7837169;

func void DeleteNpc_Check()
{
	//var oCNpc slf; slf = _^(ESI);
	var oCNpc slf; slf = _^(ECX);
	
	var int ref; ref = slf._zCObject_refCtr;
	
	Printi(ref);
	MEM_InfoBox("aaa");
	Print("delete");
	
	
};

const int oCAiHuman__BowMode = 6905600;

func void Hooks_Global()
{
	InitDamage();
	RandomScreen_Init();
	Install_Character_Menu_Hook() ;
	const int hooks = 0;
	if(!hooks){
		
		//HookEngineF(oCAiHuman__BowMode,6,MunitionChange);
		//HookEngineF(oCSpawnManager__CheckRemoveNpc_DeleteNpc,5,DeleteNpc_Check);
	//	HookEngineF(7837328,7,DeleteNpc_Check);
		HookEngineF(oCNpc__EquipBestWeapon,7,oCNpc__EquipBestWeapon_Hook);
		HookEngineF(oCNpc__DoShootArrow_PostReturnConditions,6,Npc_DoShootArrow_Hook);
		HookEngineF(cdecl__Game_CreateInstance,cdecl__Game_CreateInstance_Len,DisableAssessTheft);
		
		HookEngineF(oCNpc__CopyTransformSpellInvariantValuesTo,5,Transform);
		
				
		DisableFocusOfDeadNPCsWithEmptyInventory();
		HookEngineF(oCNpc__UpdateSlots,6,UpdateStaffSlot);
	//	CheckItemConditions_Init();
		HookEngineF(oCNpcInventory__HandleEvent,6,oCNpcInventory_HandleEvent_hook);
		HookEngineF(oCNpc__EquipItem,        7, SHIELD_EQUIP);
		HookEngineF(oCNpc__ProcessNpc,6,SneakHuntingBoost); 
		
		HookEngineF(oCGame__TestKeys,6,CheckMarvin);
		
		HookEngineF(oCNpc__CloseDeadNpc,5,CloseDeadNpc);
		HookEngineF(oCNpc__OpenDeadNpc,6,OpenDeadNpc);
		HookEngineF(oCGame__GetHeroStatus,5,DynamicSaveSystem);
		
		
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

	