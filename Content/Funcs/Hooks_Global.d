// "magic constants"
const int oCNpc__FightAttackMelee = 6811328;
const int oCAIHuman__PC_Diving = 6921312;
const int oCNpc__DoTakeVob = 7621056;
const int Inv_Draw = 7369071;
const int oCNpc__OnTouch = 	7647008;
const int oCGame__HandleEvents = 7324016;
const int oCGame__GetHeroStatus = 7089424;
const int oCZoneMusic__s_herostatus = 10111520;
//const int oCMobContainer__EndInteraction = 7477584;


func void Sneak_hook()
{
	 const int done = 0;
	 if(!done)
	 {
		HookEngineF(7595136,6,SneakHuntingBoost); 
		done = true;
	 };

};

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
		//Release(sleeper);
		//return;
	};

	if(Npc_IsInState	(sleeper, ZS_MM_Rtn_Sleep))
	{
		//AI_PlayAniBS (sleeper, "T_SLEEP_2_STAND", BS_STAND);
		Npc_ClearAIQueue(sleeper);
		//Npc_SetTarget (sleeper, hero);
		AI_StartState (sleeper, ZS_MM_Attack, 1, "");
	};
	
	//Release(sleeper);

};

func void HandleEvents_hook(/*int key*/)
{
	if(MEM_READINT(ESP+4/*key*/)== KEY_LSHIFT)
	{
		if(!NpcIsFighting(hero) && HLP_Is_oCNpc(MEM_READINT(MEM_READINT(_hero)+2476/*player->focus_vob*/)))
		{
			var c_npc slf; slf = _^(MEM_READINT(MEM_READINT(_hero)+2476));
			
			if(Npc_IsDead(slf) || Npc_IsInState(slf,ZS_Unconscious))
			{
				QuickLoot(slf,hero);
	
			};		
		
		};
	};
	if(MEM_READINT(ESP+4) == KEY_1 || MEM_READINT(ESP+4) == KEY_2 || MEM_READINT(ESP+4) == KEY_3 || MEM_READINT(ESP+4) == KEY_4 ||MEM_READINT(ESP+4) == KEY_5 || MEM_READINT(ESP+4) == KEY_6 || MEM_READINT(ESP+4) ==  KEY_7 || MEM_READINT(ESP+4) ==  KEY_8 || MEM_READINT(ESP+4) == KEY_9 || MEM_READINT(ESP+4) == KEY_0 )
	{
		//QS_AddItem(1, 1);
		//var int v; v = View_Create/*CenterPxl*/(2048, 2048, 6144, 6144);
		//View_Open(v);
		//oCItem_Render( _@(ITMW_1H_BLESSED_01), QS_World, View_GetPtr(v), floatNULL);
		//Print("abc");
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
            itm.text[1] = "Premia % punktów trafień:";
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
    };
	var int i; i = 0;
	repeat(i,10);
		//qs_new^slot(i, iptr);
	end;
	//var int v; v = view_create(2048, 2048, 6144, 6144);
	//oCItem_Render(iPtr, QS_World, View_GetPtr(v), floatNULL);
    

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
            PrintS_Ext(ConcatStrings("Usunięto: ", m.keyInstance), RGBA(255,255,255,0));
            //m._oCMobLockable_keyInstance = "";
            Release(key);
        };
    };
}; 

func void SaveDis()
{
	if(!SavingDisabled)
	{
		PrintS_Ext("Wyłączono możliwość zapisywania!", RGBA(255, 0, 0, 1));
		DisableSave();
	};
	
};
func void SaveEnb()
{
	if(SavingDisabled)
	{
		PrintS_Ext("Włączono możliwość zapisywania!", rgba(46, 204, 113, 1));
		AllowSaving();
	};
};

func void DynamicSaveSystem()
{
	//if(!ESI) { return; };
	//Print(slf.name);
	//Print(IntToString(slf));
	//Print(IntToString(MEM_ReadInt(oCZoneMusic__s_herostatus)));
	//Print(self.name);
	if((STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice"))))
	{
		if (MEM_ReadInt(oCZoneMusic__s_herostatus) >= 2) //&& (Npc_GetDistToNpc(slf,hero) < 500))/* || Npc_IsInState	(hero, ZS_Unconscious)*/
		{
			SaveDis();
		}
		//TODO bogu
		else if(MEM_ReadInt(oCZoneMusic__s_herostatus) == 1 )
		{
		
		}
		else
		{
			SaveEnb();
		};
	};
	SaveEnb();


};

func void onTradeLeft() {
	
	var int value; value = MEM_ReadInt(ESP+20); // itm.value * multiplier
	MEM_WriteInt(ESP+20, 123); // set new value
	var oCItem itm; itm = _^(EBX); //Get the item
	var oCNpc npc; npc = _^(MEM_InformationMan.npc); // Get the NPC
	Print(itm.name);
};
func void onTradeRight() {
	
	var int value; value = MEM_ReadInt(ESP+20); // itm.value * multiplier
	MEM_WriteInt(ESP+20, 123); // set new value
	var oCItem itm; itm = _^(EBX); //Get the item
	var oCNpc npc; npc = _^(MEM_InformationMan.npc); // Get the NPC
	Print(itm.name);
};


func void sneak()
{

};

func void Hooks_Global()
{
	InitDamage();
	RandomScreen_Init();
	Marvin_Hook();
	Sneak_hook();
	const int hooks = 0;
	if(!hooks){
		HookEngineF(oCNpc__CloseDeadNpc,5,LukorBook);
		HookEngineF(oCGame__GetHeroStatus,5,DynamicSaveSystem);
		HookEngineF(6908240,6,DynamicSaveSystem);
		//HookEngineF(6283664,!1,afdh);
		//HookEngineF(6927088,6,sneak);
		//nie, mo?e do aoe
		//HookEngineF(7013824,7,sneak);
		
		//HookEngineF(7011824,5,sneak);
		//HookEngineF(6562848,6,test);
		//HookEngineF(6908240,6,test);
		//const int oCViewDialogTrade__OnTransferLeftX = 6863312; //0x68B9D0
		//HookEngineF(oCViewDialogTrade__OnTransferLeftX, 6, onTradeLeft);
		//const int oCViewDialogTrade__OnTransferRightX = 6863632; //0x68B9D0
		//HookEngineF(oCViewDialogTrade__OnTransferLeftX, 7, onTradeRight);
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

		
		HookEngineF(Inv_Draw,                 6,  Inv_Draw_Hook);
		
		HookEngineF(oCNpc__OnTouch, 5, OnTouch);
		
		HookEngineF(oCGame__HandleEvents,7,HandleEvents_hook);
	
		
		
		hooks = true;
	};


};

	