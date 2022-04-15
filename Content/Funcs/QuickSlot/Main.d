func int QS_anx(var int x) { return ViewPtr_anx(getPtr(QS_BackgroundView), x); };
func int QS_any(var int y) { return ViewPtr_any(getPtr(QS_BackgroundView), y); };


func int IsItemActive(var int itemPtr)
{
	if(!itemPtr){return 0;};
	
	var int flags; flags = MEM_ReadInt(itemPtr+oCItem__Flags_Offset);
	
	return flags & ITEM_ACTIVE;
};



func void QS_AI_EquipWeapon	(var int itemPtr)
{
	var c_item i; i = _^(itemPtr);
	var c_item itm; 
	var int ptr; 
	 
	if(i.mainflag == ITEM_KAT_NF)
	{
		itm =  Npc_GetEquippedMeleeWeapon(hero);
	}
	else
	{
		itm =  Npc_GetEquippedRangedWeapon(hero);
	};
	ptr = _@(itm);
	if( ptr != itemPtr)
	{
		oCNpc_UnequipItem(hero, ptr);
	};	
	
	AI_Function_I(hero, QS_EquipWeapon, itemPtr);
};

func void QS_CreateSlot(var int nr, var int itemPtr)
{
	// MEM_Info(ConcatStrings("SlotID: ", inttostring(nr)));
	if(!itemPtr) { return; };
	
	var int slotHndl; 	slotHndl = new (CSlot@);
	var CSlot slot;		slot		= get (slotHndl);
	
	var int x;		 	x 		= QS_GetPosX(nr);	
	var oCItem it; 		it		= _^(itemPtr);
	
	if(it.mainflag 			==	ITEM_KAT_DOCS)
	{
		QS_SlotSize = 50;
	}
	else
	{
		if(it.mainflag == ITEM_KAT_RUNE)
		{
			if(heroSwitch == false)
			{
				var oCNpc her; her = Hlp_GetNpc(hero);
				var int magBook; magBook = her.mag_book;
				
				if(magBook)
				{
				
					var oCMag_Book book; book = _^(magBook);
					
					//spells must be > 0 && < 10
					
					book.nextregister = nr;
					
					if(book.nextregister == 0){ book.nextregister = 1;};
					
					
					QS_RegisterRune(magbook,itemPTr);
					
					
					//QS_RegisterRune(magbook,itemPTr);
				};
			};

			//AI_Function_II	(hero, QS_RegisterRune, magBook, itemPtr);
		};
		
		QS_SlotSize = 60;
	};
	

	
	var int pView; pView = View_CreateCenter(	QS_anx(x), 	QS_any(QS_SlotPosY),
												QS_anx(QS_SlotSize), QS_any(QS_SlotSize));
	slot.itemPtr 	= itemPtr;
	slot.itemInst 	= it.instanz;
	slot.pView 		= pView;
	slot.pViewText 	= pView;
	MEM_WriteStatArr	(QS_Data, 		nr, slotHndl);
	pView = 0;
	/*
	if(Npc_HasEquippedWeapon(hero) && (it.mainflag == ITEM_KAT_NF || it.mainflag == ITEM_KAT_FF))
	{
		QS_AI_EquipWeapon(itemPtr);
	};*/
};




func void QS_RemoveSlot(var int nr)
{
	var int slotPtr; slotPtr = MEM_ReadStatArr(QS_Data, nr);
	if(!Hlp_IsValidHandle(slotPtr)) {
		return;
	};
	var CSlot slot; slot = get (slotPtr);
	
	//if(nr == QS_LastWeaponSlot)	{ QS_LastWeaponSlot = -1; };
	
	var int pView;	 	pView 		= slot.pView;
	var int pViewText; 	pViewText 	= slot.pViewText;
	
	var c_item itm; itm = _^(slot.itemPtr);
	
	if(heroSwitch == false )
	{
		//oCNpc_UnequipItem(hero,itm);
		//Engine_Npc_EquipItem(hero,slot.itemPtr);
		QS_DeregisterSpell(slot.itemPtr);
	};

	//AI_Function_I(hero, QS_DeregisterSpell, slot.itemPtr);
	
	
	//var int itm; itm = QS_GetSlotItem(nr);
	//var c_item i; i = _^(itm);

	if(Hlp_IsValidHandle(pView)){
		View_Delete(pView);
	};

	if(Hlp_IsValidHandle(pViewText)){
		View_Delete(pViewText);
	};

	MEM_WriteStatArr	(QS_Data, 		nr, 0);
	release (slotPtr);
};

func int QS_GetFirstSpell(var oCNpc her)
{
	var C_ITEM it;
	repeat(i, 10); var int i; 
		var int itemPtr; itemPtr = QS_GetSlotItem(i);
		if(itemPtr)	{
				if(itemPtr == QS_LastSpell_Item){
					continue;
				};
		
			it = _^(itemPtr);
			if(it.mainflag == ITEM_KAT_RUNE)	{
				return i;
			};
		};
	end;
	return -1;
};

func int IsHelmet(var c_item itm)
{
	var int instID; instID = Hlp_GetInstanceID(itm);
	if(instID == Hlp_GetInstanceID(ITNA_KolczugaRycerza))
	||(instID == Hlp_GetInstanceID(ITNA_HelmBarda))
	||(instID == Hlp_GetInstanceID(ITNA_RogatyHelm))
	||(instID == Hlp_GetInstanceID(ITNA_HelmSniacego))
	||(instID == Hlp_GetInstanceID(ITNA_TwardyHelmWojownika))
	||(instID == Hlp_GetInstanceID(ITNA_Maska_Kruka))
	||(instID == Hlp_GetInstanceID(ITNA_DJG_ULTRA_HELMET))
	||(instID == Hlp_GetInstanceID(ITNA_KapturMysliwego))
	||(instID == Hlp_GetInstanceID(ITNA_DjgHelmet))
	{
		return true;
	};
	return false;
	//if()
};
func int QS_CanPutInSlot(var int itemPtr)
{
	if(!itemPtr){ return 0; };
	
	
	var c_item it; it  = _^(itemPtr);

	
	if((!IsHelmet(it) && ((it.mainflag == ITEM_KAT_NF) ))			// Walka wrecz
	|| (it.flags & (ITEM_BOW | ITEM_CROSSBOW)) 		// Bron dystansowa
	|| (it.mainflag == ITEM_KAT_RUNE)				// Magia
	|| (STR_Len(it.scemeName))						// Przedmioty u?ytkowe
	|| (it.flags & ITEM_TORCH))						// Przedmioty u?ytkowe					
	{
		return true;
	};
	
	if(it.flags & ITEM_SHIELD)
	{
		if(!WalkaTarcza)
		{
			PrintScreen("Brak odpowiedniej umiejêtnoœci.",-1,YPOS_LevelUp,FONT_ScreenSmall,2);
			AI_PlayAni(hero,"T_DONTKNOW");
			hero.aivar[AIV_TARCZA] = false;
			return false;
		}
		else
		{
			return true;
		};
	};
	
	return false;
};

func void QS_PutSlot(var c_npc slf, var int nr, var int itemPtr)
{

	if(!QS_CanPutInSlot(itemPtr)){
		return;
	};
		
	if(!QS_CanEquipItem(slf, itemPtr)) {
		return;
	};

	
	var int slotItem; 		slotItem 		= QS_GetSlotItem(nr);
	var int removeSlot_idx; removeSlot_idx 	= QS_GetSlotByItem(itemPtr);
	
	// Safe - remove slot nr
	QS_RemoveSlot(nr);
	
	if(slotItem) {		
		if(slotItem != itemPtr) {		
			if(removeSlot_idx != -1)  {
				QS_RemoveSlot(removeSlot_idx);
			};		
			QS_CreateSlot(nr, itemPtr);
		};	
	} else {	
		if(removeSlot_idx != -1)  {
			QS_RemoveSlot(removeSlot_idx);
		};	
		QS_CreateSlot(nr, itemPtr);
	};

	var c_item it; it = _^(itemptr);
	var c_item pIt; var int slot; var int pItem; 
	if(it.mainflag == ITEM_KAT_NF)
	{
		 pIt = Npc_GetEquippedMeleeWeapon(hero);
	}
	else
	{
		 pIt = Npc_GetEquippedRangedWeapon(hero);
	}; 
	if(it.mainflag == ITEM_KAT_NF&& it.flags &~ ITEM_SHIELD){slot = 1; pItem = QS_GetSlotItem(1);}
	else{slot = 2; pItem = QS_GetSlotItem(2);};
	
	var int pWeap; pWeap = _@(pIt);
	if(pWeap == itemPtr && nr!=slot)
	{
		QS_RemoveSlot(slot);
		oCNpc_UnEquipItem(hero,pWeap);
	};
	
	
		//if(!pItem && Npc_HasEquippedMeleeWeapon(hero))
			//{
				/*var int ii; repeat(ii,10);
					var int ptr; ptr = QS_GetSlotItem(ii);
					if(pWeap == ptr)
					{
						var int s; s = QS_GetSlotByItem(ptr);
						QS_RemoveSlot(s);
						QS_CreateSlot(slot,pWeap);
					};
				end;*/
			//};
	

};


func void QS_RemoveWeapon()
{
	var int ptr; ptr = QS_oCMsgWeapon_Create(EV_REMOVEWEAPON, 0);
	QS_OnMessage (ptr);
};

func void QS_DrawWeapon(var int mode)
{	
	var int ptr; ptr = QS_oCMsgWeapon_Create(EV_DRAWWEAPON, mode);
	QS_OnMessage (ptr);
	
	
};

func void QS_HideWeapon(var oCNpc her)
{
	if(her.fmode)	{
		QS_RemoveWeapon();
		if(her.fmode == FMODE_MAGIC){
			AI_Function_I(hero, QS_ClearMagBook, her.mag_book);
		};
	};	
};

func void QS_DrawWeapon_Far(var int itemPtr)
{
	
	if(QS_IsMunitionAvailable(itemPtr))	{
		QS_DrawWeapon(FMODE_FAR);
	};
};


//00479B70
func int QS_GetSpellKey(var oCNpc her,var int itemPtr)
{
	var int magBook; magBook = her.mag_Book;
	
	if(!magbook){return 0;};
	
	
	var int nr;
	
	CALL_PtrParam(_@(nr));
	CALL_PtrParam(itemPtr);
	
	CALL__thiscall(magBook,4692848);
	
	return nr;
	
};
func void QS_SetFrontSpell(var oCNpc her, var int itemPtr)
{
	var int magbook; magbook = her.mag_Book;
	
	if(!magbook){return;};
	
	if(!QS_IsItemInMagBook(magbook,itemPTr))
	{
		QS_RegisterRune(magbook,itemPTr);
	};
	
	var int nr; nr = QS_GetSpellKey(her,itemPtr);
	
	var int ptr; ptr = QS_oCMsgMagic_SetFrontSpell(nr);
	
	QS_OnMessage(ptr);
};

func void QS_UseMagic(var oCNpc her, var int itemPtr)
{
	// Magbook doesn't exist!
	var int magBook; magBook = her.mag_Book;
	if(!magBook) {
		return;
	};
	
	var int itHlp;			itHlp 		= QS_GetSpellItem(magBook);	// oCItem*
	var C_ITEM it; 			it 			= _^(itemPtr);			
	var string spellName; 	spellName 	= MEM_ReadStatStringArr(TXT_SPELLS, it.spell);
	

	
	// Hero is in fmode
	if(her.fmode == FMODE_MAGIC && itHlp)
	{
		if(itHlp == itemPtr)	
		{
			QS_HideWeapon(her);
		} 
		else
		{
			QS_SetFrontSpell(her,itemptr);
			//AI_Function_I	(hero, QS_ClearMagBook, magBook);	
			//AI_Function_II	(hero, QS_RegisterRune, magBook, itemPtr);
		
			AI_PrintS		(hero, spellName);
		};
	}
	else
	{
		QS_HideWeapon	(her);
		//AI_Function_II	(hero, QS_RegisterRune, magBook, itemPtr);
		QS_SetFrontSpell(her,itemptr);
		QS_DrawWeapon	(FMODE_MAGIC);
		
		AI_PrintS(hero, spellName);
	};
};


func void QS_AI_CreateItem	(var int inst)
{
	CreateInvItems(hero, inst, 1);
	QS_UseLastItem_Fix = inst;
};

func void QS_AI_Removetem	(var int inst)
{
	if(Npc_HasItems(hero, inst))
	{
		Npc_RemoveInvItems(hero, inst, 1);
		QS_UseLastItem_Fix = FALSE;
	};
};

func void QS_UseMisc(var oCNpc her, var oCItem it)
{
	var int bFix; bFix = 0;
	QS_HideWeapon		(her);
	AI_StandUpQuick		(hero);
	if(it.amount == 1)	{ AI_Function_I	(hero, QS_AI_CreateItem, it.instanz); 	bFix = true; 	};
	AI_UseItem			(hero, it.instanz);
	if(bFix) 			{ AI_Function_I	(hero, QS_AI_Removetem, it.instanz); 	bFix = false;	};	
};

func void QS_DrawFist()
{
	if(QS_KeyWeapon_Locked) { return; };
	QS_LockKeyWeapon	();
	
	var oCNpc her; her = Hlp_GetNpc	(hero);
	if(her.fmode)
	{	
		QS_HideWeapon(her);
		return;
	};
	QS_DrawWeapon(FMODE_FIST);
};

func void QS_UseTorch(var int itemPtr)
{
	CALL_PtrParam	(itemPtr);
	CALL__thiscall	(_@(hero), oCNpc__UseItem);
};
func void QS_EquipWeaponn(var oCItem it)
{
	if (it.mainflag == ITEM_KAT_NF) {
			EquipWeapon(hero, Hlp_GetInstanceID(it));
		}
		else {
			CALL_PtrParam(_@(it));
			CALL__thiscall(_@(hero), oCNpc__EquipFarWeapon);
		};
};
func void QS_UseWeapon(var oCItem it, var int i)
{
	
	var c_item pIt; var int slot; var int pItem; 
	if(it.mainflag == ITEM_KAT_NF)
	{
		 pIt = Npc_GetEquippedMeleeWeapon(hero);
	}
	else
	{
		 pIt = Npc_GetEquippedRangedWeapon(hero);
	};
	
	if(it.mainflag == ITEM_KAT_NF&& it.flags &~ ITEM_SHIELD){slot = 1; pItem = QS_GetSlotItem(1);}
	else{slot = 2; pItem = QS_GetSlotItem(2);};
	
	if(Hlp_GetInstanceID(pIt)!=Hlp_GetInstanceID(it) && !Npc_HasReadiedWeapon(hero) && !hero.weapon)
		{
			var int itemPtr; itemPtr = _@(it);
			if(it.flags & ITEM_SHIELD)
			{
				var c_item ite; ite = Npc_GetEquippedMeleeWeapon(hero);
				if(ite.flags & (ITEM_SWD | ITEM_AXE))
				{
					AI_Function_I(hero, QS_EquipWeapon, itemPtr);
				}
				else
				{
					PrintS("Za³ó¿ broñ jednorêczn¹ przed u¿yciem tarczy!");
				};
				return;
			};
			if(pItem )
			{
				QS_RemoveSlot(i);
				oCNpc_UnEquipItem(hero,pItem);
				QS_CreateSlot(i,pItem);
				QS_CreateSlot(slot,itemPtr);
			}
			else
			{
				//oCNpc_UnEquipItem(hero,pItem);
				QS_RemoveSlot(i);
				QS_CreateSlot(slot,itemPtr);
			};
			//QS_EquipWeapon(it);
			QS_AI_EquipWeapon(itemPtr);
		};
			
		
};


//int __thiscall oCMobInter::HasUseWithItem(oCNpc *) 	0x0071DB60 	
const int oCMobInter__StartInteraction = 7476608;
const int oCItem__MainFlag_Offset						= 340;
func void QS_MobInteractionFix()
{
	var int pNpc; pNpc = MEM_ReadInt(ESP+4);
	var int pHero; pHero = MEM_ReadInt(_hero);
	if(pNpc!= pHero)
	{
		return;
	};
	var string useWithItem; useWithItem = MEM_ReadString(ECX+420);
	if(STR_LEN(useWithItem))
	{
		var int i; i = 0;
		repeat(i,10);
			var int pItem; pItem = QS_GetSlotItem(i);
			if(pItem)
			{
				var string instanceName; instanceName = MEM_ReadString(pItem + 16);
				if(Hlp_StrCmp(instanceName,useWithItem))
				{
					QS_RemoveSlot(i);
					var string name; name = MEM_ReadString(pItem+292);
					//TODO: czy to potrzebne? / bogu
					if (Hlp_StrCmp(name,"Kilof")) { Npc_RemoveInvItems(hero,ItMw_2H_Axe_L_01,1); };
					MEM_Info(ConcatStrings(name," jest potrzebny do interakcji. Zosta³ usuniêty z QS."));
					var int mainflags; mainflags = MEM_ReadInt(pItem+oCItem__MainFlag_Offset);
					if(mainflags &  (ITEM_KAT_NF |  ITEM_KAT_FF))
					{
						/*var c_item itm; itm = Npc_GetEquippedMeleeWeapon(hero);
						if (!Hlp_IsValidItem(itm))
						{
							itm = Npc_GetEquippedRangedWeapon(hero);
						};
						if(Hlp_IsValidItem(itm))
						{
							var int pItm; pItm = _@(itm);
							oCNpc_UnEquipItem(hero,pItm);
						};*/
					};
				};
			};
		end;
	};
};


func void QS_UseItem(var int i)
{
	var oCNpc her; her 	= Hlp_GetNpc(hero);
	var int itemPtr; itemPtr = QS_GetSlotItem(i);
	
	if (!QS_CanUseItem(her))
	{
		return;
	};
	
	if(!itemPtr)
	{
		
		if(!Npc_HasEquippedMeleeWeapon(hero)){
			QS_DrawFist();
		};
		return;
	};
	
	if(QS_CanEquipItem(hero,itemPtr) == false)
	{
		return;
	};
	
	var oCItem it; it 	= _^(itemPtr);

	

	if(!Npc_HasItems(hero, it.instanz))
	{
		return;
	};
	
	var int slotPtr; slotPtr = MEM_ReadStatArr(QS_Data, i);
	if(!Hlp_IsValidHandle(slotPtr)) {
		return;
	};
	var CSlot slot; slot = get (slotPtr);
	
	
	if(!Hlp_IsValidItem(it))
    {    
        Npc_GetInvItem(hero,slot.itemInst);      
        
        if(Hlp_IsValidItem(item))
        {
            slot.itemPtr =  _@(item);
            
            it = _^(slot.itemPtr);
        }
        else
        {
            if(her.interactitem != slot.itemPtr)
            {
                QS_RemoveSlot(i);
                return;
            }
            else
            {
                slot.itemPtr = her.interactitem;
                it = _^(slot.itemPtr);
            };
        };
        
    };
	
	
	var int bCanDraw; bCanDraw = QS_CanDrawWeapon();
	if(!bCanDraw) { return; }; 
	
	
	if(STR_Len(it.scemeName))
	{
		QS_UseMisc(her, it);
	}
	else if(it.mainflag == ITEM_KAT_NF)
	{
		QS_UseWeapon(it,i);
		//QS_LastWeaponSlot = i;

	} 
	else if (it.mainflag == ITEM_KAT_FF)
	{
		QS_UseWeapon(it,i);
		//QS_LastWeaponSlot = i;
	}
	else if(it.flags & ITEM_TORCH)
	{
		QS_HideWeapon		(her);
		AI_StandUpQuick		(hero);
		AI_Function_I(hero, QS_UseTorch, itemPtr);
	}
	else if(it.mainflag == ITEM_KAT_RUNE)
	{
		QS_UseMagic	(her, itemPtr);
		//QS_LastWeaponSlot = i;
	};
};


func void QS_AddText(var int pView, var int nr, var int amount, var int instanz)
{
	CALL__thiscall(pView, zCView__ClrPrintwin);
	
	// Print it amount	
	if(amount > 1 && (QS_UseLastItem_Fix != instanz))	{
		CALL_zStringPtrParam(IntToString(amount));
		CALL_IntParam		(5000);
		CALL__thiscall		(pView, zCView__PrintCX);
	};
	
	ViewPtr_InsertItem(getPtr(QS_BackgroundView), pView);	
	
	ViewPtr_Render(pView);
	ViewPtr_RemoveItem(getPtr(QS_BackgroundView), pView);
};

func c_item StackAssignItem(var c_item itm)
{
    MEM_PushInstParam(itm);
};


func void QS_RenderSlot(var int idx)
{


   if(!QS_RenderWorld) {
        MEM_Error("QS_RenderWorld is null!");
        return;
    };
    
    var int slotHndl;     slotHndl     = MEM_ReadStatArr(QS_Data, idx);     
    if(!Hlp_IsValidHandle(slotHndl)){
        return;
    };
    
    var CSlot slot;     slot         = get (slotHndl);
    var int pView;         pView         = slot.pView;
    var int pViewText;    pViewText     = slot.pViewText; 
    
    
    if(!slot.itemPtr
    || !Hlp_IsValidHandle(pView)  
    || !Hlp_IsValidHandle(pViewText))
    {
        MEM_Error(ConcatStrings("RenderSlot pItem or pView or pViewText is null! idx: ", IntToString(idx)));
        
        MEM_Info(ConcatStrings("pItem: ",         IntToString(slot.itemPtr)));
        MEM_Info(ConcatStrings("pView: ",         IntToString(pView)));
        MEM_Info(ConcatStrings("pViewText: ",     IntToString(pViewText)));
        return; 
    };
    
    var int itemInst; itemInst = slot.itemInst;
    
    if(!Npc_HasItems(hero, itemInst)){ 
        QS_RemoveSlot(idx);
        return;
    };
    
    
    var c_item it; it = _^(slot.itemPtr);
    
    
    if(!Hlp_IsValidItem(it))
    {    
        Npc_GetInvItem(hero,itemInst);      
        
        if(Hlp_IsValidItem(item))
        {
            slot.itemPtr =  _@(item);
            
            it = _^(slot.itemPtr);
        }
        else
        {
            var oCNpc her; her = Hlp_GetNpc(hero);
            if(her.interactitem != slot.itemPtr)
            {
                QS_RemoveSlot(idx);
                return;
            }
            else
            {
                slot.itemPtr = her.interactitem;
                it = _^(slot.itemPtr);
            };
        };
        
    };
    
    if(RenderOnScreen)
	{
		pView         = getPtr(pView);
		pViewText     = getPtr(pViewText);
		
		// Render slot 
		ViewPtr_InsertItem    (getPtr(QS_BackgroundView), pView);    

		oCItem_Render        (slot.itemPtr, QS_RenderWorld, pView, FLOATNULL);    
		ViewPtr_Render        (pView);
		
		// Draw numbers
		if(it.mainflag != ITEM_KAT_FF && it.mainflag != ITEM_KAT_NF )
		{
			var oCItem cppItm;
			cppItm = StackAssignItem(it);
			
			QS_AddText(pViewText, idx, cppItm.amount, cppItm.instanz);    
		};
		
		ViewPtr_RemoveItem    (getPtr(QS_BackgroundView), pView);
	};
};

var int qs_temp_disablestatus;

func int QS_CheckIfDisable()
{
	QS_HideKey1 = MEM_GetKey("keyHideQuickSlot");
	QS_HideKey2 = MEM_GetSecondaryKey("keyHideQuickSlot");
	
	qs_temp_disablestatus = DisableQuickSlot;
	
	DisableQuickSlot = STR_ToInt(MEM_GetGothOpt("UCIECZKA", "DisableQuickslot"));	
	
	if(DisableQuickSlot == true)
	{
		if(qs_temp_disablestatus == false)
		{
			MEM_CALLBYSTRING("QS_RemoveHooks");	
		};
		return true;
	}
	else
	{
		if(qs_temp_disablestatus == true)
		{
			var int ecx_bac; ecx_bac = ECX;
			MEM_CALLBYSTRING("QS_InitHooks");
			ECX = _@(hero);
			MEM_CALLBYSTRING("QS_SwitchHeroFix");
			ECX = ecx_bac;
		};
	};
	
	return false;
};

// Per Frame loop
func void QS_RenderHook()
{		
	var int isConsoleActive; isConsoleActive = MEM_ReadInt(zCConsole__cur_console);
	
	if (!MEM_Game.singleStep && !isConsoleActive && (Pressed(QS_HideKey1) || (Pressed(QS_HideKey2))))
	{
		DontRenderSlots = !DontRenderSlots;
	};
	
	RenderOnScreen = QS_RenderOnScreen();
	
	if(RenderOnScreen)	
	{
	
		var int posY; posY = 8192 - Print_ToVirtual(140, PS_Y); 
		if(QS_IsInvOpen()) {
			posY = QS_posY_OpenInv;
		};
		
		// Set position
		ViewPtr_SetPos		(getPtr(QS_BackgroundView), -1, posY);
		
		ViewPtr_InsertItem	(MEM_ReadInt(screen), getPtr(QS_BackgroundView));	
		ViewPtr_Render		(getPtr(QS_BackgroundView));
	};
		
	QS_RenderSlot(1);	QS_RenderSlot(2);	QS_RenderSlot(3);	
	QS_RenderSlot(4);	QS_RenderSlot(5);	QS_RenderSlot(6);	
	QS_RenderSlot(7);	QS_RenderSlot(8);	QS_RenderSlot(9);	
	QS_RenderSlot(0);
	
	if(RenderOnScreen)	
	{
		ViewPtr_RemoveItem	(MEM_ReadInt(screen), getPtr(QS_BackgroundView));	
	};
	
	var int weaponPtr;
	var int qs_weapPtr;
	var int weaponSlot;
	var c_item checkWeapon;
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		checkWeapon = Npc_GetEquippedMeleeWeapon(hero);
		weaponPtr = _@(checkWeapon);
		qs_weapPtr = QS_GetSlotItem(1);
		
		if(weaponPtr != qs_weapPtr)
		{
			QS_PutSlot(hero,1,weaponPtr);
		};
		
		if(IsItemActive(weaponPtr) == false)
		{
			QS_AI_EquipWeapon(weaponPtr);
		};
	};
	if(Npc_HasEquippedRangedWeapon(hero))
	{
		checkWeapon = Npc_GetEquippedRangedWeapon(hero);
		
		weaponPtr = _@(checkWeapon);
		qs_weapPtr = QS_GetSlotItem(2);
		
		if(weaponPtr != qs_weapPtr)
		{
			QS_PutSlot(hero,2,weaponPtr);
		};
		
		if(IsItemActive(weaponPtr) == false)
		{
			QS_AI_EquipWeapon(weaponPtr);
		};

	};
	if(Npc_HasReadiedWeapon(hero))
	{
		checkWeapon = Npc_GetReadiedWeapon(hero);
		
		if(checkWeapon.mainflag == ITEM_KAT_NF)
		{
			weaponSlot = 1;
		}
		else
		{
			weaponSlot = 2;
		};
		
		weaponPtr = _@(checkWeapon);
		qs_weapPtr = QS_GetSlotItem(weaponSlot);
		
		if(weaponPtr != qs_weapPtr)
		{
			QS_PutSlot(hero,weaponSlot,weaponPtr);
		};
		
		if(IsItemActive(weaponPtr) == false)
		{
			QS_AI_EquipWeapon(weaponPtr);
		};
	};
	
	/*var int pIt;
	if(Npc_HasEquippedMeleeWeapon(hero) || Npc_HasEquippedRangedWeapon(hero))
	{
		var int slot; slot = 1;
		pIt = QS_GetSlotItem(slot);
		var c_item itm; itm = Npc_GetEquippedMeleeWeapon(hero);
		if(!Hlp_IsValidItem(itm)) {slot = 2; itm = Npc_GetEquippedRangedWeapon(hero); pIt = QS_GetSlotItem(slot); };
		if(Hlp_IsValidItem(itm)) {
			if(!pIt )
			{
				var int ptr; ptr = _@(itm);
				QS_RemoveSlot(slot);
				QS_CreateSlot(slot,ptr);
			};
		};
	};*/
	/*else
	{
		if(!Npc_HasReadiedWeapon(hero))
		{
			pIt = QS_GetSlotItem(1);
			if(pIt)
			{
				QS_RemoveSlot(1);
			};
			pIt = QS_GetSlotItem(2);
			if(pIt)
			{
				QS_RemoveSlot(2);
			};
		};
	};*/
	
	
};

func void QS_DrawNumbersInInv()
{	
	var oCNpc her; her = Hlp_GetNpc(hero);
	if(EBP == _@(her.inventory2_vtbl)) 
	{	
		var int viewPtr; viewPtr = MEM_ReadInt(EBP + 128);
		var int itemPtr; itemPtr = ECX;
		
		if(viewPtr && itemPtr) {
			var int slotNr; slotNr = QS_GetSlotByItem(itemPtr);
			var int col; col = QS_GetSlotColor();
			
			var int instID; instID = MEM_ReadInt(itemPtr+816);
			if(instID == Hlp_GetInstanceID(ItNa_Kostur_Urshaka))
			{
				if(WillHasEquippedKostur)
				{
					ViewPtr_SetTexture(viewPtr, QS_SlotFrameInInvTexture);
				}
				else
				{
					ViewPtr_SetTexture(viewPtr, "QS_Alpha.TGA");
				};
				return;
			};
			
			if(slotNr != -1)
			{
				ViewPtr_SetTexture(viewPtr, QS_SlotFrameInInvTexture);
				
				// Set font color 
				CALL_PtrParam	(_@(col));
				CALL__thiscall	(viewPtr, zCView__SetFontColor);
				
				// Write slot nr
				ViewPtr_Print(viewPtr, 1024, 1024, IntToString(slotNr));
			} else	{
				ViewPtr_SetTexture(viewPtr, "QS_Alpha.TGA");
			};
		};
	};	
};

var int heroSwitch;

func void QS_Clear()
{
	var int i;
	repeat(i, 10); 
		QS_RemoveSlot(i);
	end;
};


func void QS_RestoreMagBook(var int npcPtr)
{

	var int mag_book; mag_book = MEM_ReadInt(npcPtr+2324);

	if(!mag_book){return;};
	
	var oCMag_Book book; book = _^(mag_book);
	
	var int j;
	
	var int n; n = book.spellitems_numInArray;
	var int n2; n2 = book.spells_numInArray;
	
	repeat(j,n);
	
		var int itm; itm = MEM_ReadIntArray(book.spellitems_array,j);
		
		//na wszelki wypadek
		if(j > n2 || n2 < j)
		{
			//deregister
			Engine_Npc_EquipItem(npcPtr,itm);
			continue;
		};
		
		
		var int spell; spell =  MEM_ReadIntArray(book.spells_array,j);
		
		var int nr; nr = MEM_ReadInt(spell+36);
		
		//spell keyNo > 0 && < 10
		if(nr == 1)
		{
			nr = 0;
		};
		
		
		QS_RemoveSlot(nr);
		QS_CreateSlot(nr,itm);

	end;

};

func int GetItemBySpell(var int spell)
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	var oCMag_Book book; book = _^(her.mag_book);
	
	var int n; n = book.spells_numInArray;
	var int i;
	repeat(i,n);
		
		var int ele; ele = MEM_ReadintArray(book.spells_array,i);
		
		if(ele == spell)
		{
			if(i > book.spellitems_numInArray || book.spellitems_numInArray < i) {return 0;};
			
			return MEM_ReadintArray(book.spellitems_array,i);
		};
	end;
	
	return 0;
};

func void QS_ValidMagBookNr()
{
	var int itm; itm = GetItemBySpell(EDX);
	
	if(itm)
	{
		esi = QS_GetSlotByItem(itm);
	};

};

func void QS_SwitchHeroFix()
{	
	
	
	if(!Hlp_IsValidHandle(QS_BackgroundView))	{
		return;
	};
	
	heroSwitch = true;
	
	QS_Clear();
	
	QS_RestoreMagBook(ECX);
	
	var C_NPC slf; 	slf 	= _^(ECX);
	var C_ITEM it;	
	if(Npc_HasEquippedMeleeWeapon(slf))
	{
		it = Npc_GetEquippedMeleeWeapon(slf);
		QS_CreateSlot(1, _@(it));
	};
	
	if(Npc_HasEquippedRangedWeapon(slf))
	{
		it = Npc_GetEquippedRangedWeapon(slf);
		QS_CreateSlot(2, _@(it));
	};
	
	if(Npc_HasReadiedWeapon(slf))
	{
		it = Npc_GetReadiedWeapon(slf);
		
		var int slot; slot = 1;
		if(it.flags & (ITEM_BOW | ITEM_CROSSBOW))	{
			slot = 2;
		};
		var int itemPtr; itemPtr = _@(it);
		QS_CreateSlot(slot, itemPtr);
	};
	
	
	
	heroSwitch = false;
};

const int QS_FirstTime = 0;
const int Sneak_Speed_Default_Startup = 0;
func void QSEquipWeaponFirstTimeFix()
{
	if(Hlp_IsValidNpc(hero) && !Npc_HasEquippedMeleeWeapon(hero)) {ff_Remove(QSEquipWeaponFirstTimeFix); return;};
	
	var c_item w; w = Npc_GetEquippedMeleeWeapon(hero);
	
	if(!Sneak_Speed_Default_Startup)
	{
		Set_AniSpeed(hero, STR_UPPER("s_sneakl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("s_sneakbl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("t_sneak_2_sneakbl"),Sneak_Anim_Speed);
		//Set_AniSpeed(oth, STR_UPPER("t_cbowsneak_2_bowsneakl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("t_bowsneak_2_bowsneakl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("s_cbowsneakl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("s_bowsneakl"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("t_sneakbl_2_sneak"),Sneak_Anim_Speed);
		Set_AniSpeed(hero, STR_UPPER("t_sneakbl_2_sneak"),Sneak_Anim_Speed);
		Sneak_Speed_Default_Startup = 1;
	};
	
	if(Hlp_IsValidItem(w) && Hlp_IsValidHandle(QS_BackgroundView))
	{
		var int ptr; ptr = _@(w);
		QS_PutSlot(hero, 1, ptr);
		ff_Remove(QSEquipWeaponFirstTimeFix);
		QS_FirstTime = true;
	};
};



func void QS_SpellCast_GetSpell()
{
	return;
	var oCNpc her;			her = Hlp_GetNpc(hero);
	if(ECX != her.mag_book) { return; };
	QS_LastSpell_Item = QS_GetSpellItem(her.mag_book);
};

//nieu¿ywane
func void QS_FixUseLastSpell()
{
	
	var oCNpc her; her = Hlp_GetNpc(hero);
	var int magBook; magBook = her.mag_book;
	if(!magBook) {
		return;
	};
	
	var int slot; 		slot 		= QS_GetFirstSpell	(her);
	var int itemSpell; 	itemSpell 	= 0;
	if(slot != -1)	{
		itemSpell = QS_GetSlotItem	(slot);
	};
	
	QS_ClearMagBook(magBook);
	
	if(itemSpell)	{
		QS_LastWeaponSlot = slot;
		QS_RegisterRune(her.mag_book, itemSpell);	
	} else {
		QS_HideWeapon(her);
	};
};

func void QS_OpenInventory()
{
	//return;
	//var oCNpc her; her = Hlp_GetNpc(hero);

	//QS_ClearMagBook(her.mag_book);

};

func void QS_UpdateResolution()
{
	if(Hlp_IsValidHandle(QS_BackgroundView))
	{		
		var int vSizeX; vSizeX = Print_ToVirtual(QS_SizeX, PS_X);
		var int vSizeY; vSizeY = Print_ToVirtual(QS_SizeY, PS_Y);
		
		View_Resize		(QS_BackgroundView, vSizeX, vSizeY);
		ViewPtr_SetPos	(getPtr(QS_BackgroundView), 4096 - (vSizeX / 2), 8000 - vSizeY);
	};
};

func void QS_RemoveInvNumber_NF()	{ if(EDI){ EDI = 20000; }; };
func void QS_RemoveInvNumber_FF()	{ if(EDX){ EDX = 20000; }; };

func void QS_RestorePointer()
{
	repeat(i, 10); var int i;
		var int slotHndl; slotHndl = MEM_ReadStatArr(QS_Data, i);
		if(Hlp_IsValidHandle(slotHndl))
		{
			var CSlot slot; slot = get(slotHndl);
			var int itemInst; itemInst = slot.itemInst;
			
			
			
			if(itemInst)	
			{
				if(Npc_GetInvItem(hero, itemInst))
				{
					slot.itemPtr = _@(item);
					//MEM_INFOBOX(item.name);
				}
				else
				{
					QS_RemoveSlot(i);
				};
			};
		};
	end;
};

func void QS_RestorePointer_Listener(var int state)
{
	if (state == GAMESTATE_SAVING || state == GAMESTATE_LOADED) {
        QS_RestorePointer();
	};
};

func void QS_RestoreData()
{
	QS_RestorePointer();
	GameState_AddListener(QS_RestorePointer_Listener);
};

func void QS_DisableKeyInit()
{
	if(!MEM_GothOptExists("KEYS","keyHideQuickSlot"))
	{
		MEM_SetGothOpt("KEYS","keyHideQuickSlot",QS_KEYSDATA);
	};
};