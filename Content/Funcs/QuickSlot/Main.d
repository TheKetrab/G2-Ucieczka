func int QS_anx(var int x) { return ViewPtr_anx(getPtr(QS_BackgroundView), x); };
func int QS_any(var int y) { return ViewPtr_any(getPtr(QS_BackgroundView), y); };

func int QS_GetSlotItem(var int nr)
{
	var int slotPtr; slotPtr = MEM_ReadStatArr(QS_Data, nr); 
	if(!slotPtr) {
		return 0;
	};
	var CSlot slot; slot = get (slotPtr);
	return slot.itemPtr;
};

func int QS_GetSlotByItem(var int iPtr)
{
	repeat(i, 10); var int i;
		var int itemPtr; itemPtr = QS_GetSlotItem(i);
		if(itemPtr == iPtr)	{
			return i;
		};
	end;
	return -1;
};


func void QS_AI_EquipWeapon	(var int itemPtr)
{
	var int flags; flags = MEM_ReadInt(itemPtr+oCItem__Flags_Offset);
	var c_item i; i = _^(itemPtr);
	var c_item itm; 
	var int ptr; 
	 
	 if(i.mainflag == ITEM_KAT_NF)
	{
		itm =  Npc_GetEquippedMeleeWeapon(hero);
		ptr = _@(itm);
		if( ptr != itemPtr)
		{
			oCNpc_UnequipItem(hero, ptr);
			itm.flags = itm.flags & ~ ITEM_ACTIVE;
		};
	}
	else
	{
		itm =  Npc_GetEquippedRangedWeapon(hero);
		ptr = _@(itm);
		if( ptr != itemPtr)
		{
			oCNpc_UnequipItem(hero, ptr);
			itm.flags = itm.flags & ~ ITEM_ACTIVE;
		};
	};
	
	AI_Function_I(hero, QS_EquipWeapon, itemPtr);
};


func void QS_CreateSlot(var int nr, var int itemPtr)
{
	MEM_Info(ConcatStrings("SlotID: ", inttostring(nr)));
	MEM_Info("QS_CreateSlot #1");
	if(!itemPtr) { return; };
	MEM_Info("QS_CreateSlot #2");
	
	var int slotHndl; 	slotHndl = new (CSlot@);		MEM_Info("QS_CreateSlot #3");
	var CSlot slot;		slot		= get (slotHndl);	MEM_Info("QS_CreateSlot #4");
	
	var int x;		 	x 		= QS_GetPosX(nr);	
	var oCItem it; 		it		= _^(itemPtr);
	MEM_Info("QS_CreateSlot #5");
	
	if(it.mainflag 			==	ITEM_KAT_DOCS)
	{
		QS_SlotSize = 50;
	}
	else
	{
		QS_SlotSize = 60;
	};
	
	var int pView; pView = View_CreateCenter(	QS_anx(x), 	QS_any(QS_SlotPosY),
												QS_anx(QS_SlotSize), QS_any(QS_SlotSize));
	MEM_Info("QS_CreateSlot #6");
	slot.itemPtr 	= itemPtr;
	slot.itemInst 	= it.instanz;
	slot.pView 		= pView;
	slot.pViewText 	= pView;
	MEM_Info("QS_CreateSlot #7");
	MEM_WriteStatArr	(QS_Data, 		nr, slotHndl);
	MEM_Info("QS_CreateSlot #8");
	pView = 0;
	
	if(it.mainflag == ITEM_KAT_NF || it.mainflag == ITEM_KAT_FF)
	{
		QS_AI_EquipWeapon(itemPtr);
	};
};

func void QS_RemoveSlot(var int nr)
{
	var int slotPtr; slotPtr = MEM_ReadStatArr(QS_Data, nr); 	MEM_Info("QS_RemoveSlot #1");
	if(!Hlp_IsValidHandle(slotPtr)) {
		return;
	};	MEM_Info("QS_RemoveSlot #2");
	var CSlot slot; slot = get (slotPtr);
	MEM_Info("QS_RemoveSlot #3");
	
	if(nr == QS_LastWeaponSlot)	{ QS_LastWeaponSlot = -1; };
	
	var int pView;	 	pView 		= slot.pView;
	var int pViewText; 	pViewText 	= slot.pViewText;
	
	
	var int itm; itm = QS_GetSlotItem(nr);
	var c_item i; i = _^(itm);
	if(i.mainflag == ITEM_KAT_NF || i.mainflag == ITEM_KAT_FF) //QS_AI_EquipWeapon	(var int itemPtr)QS_GetSlotItem
	{
		//QS_UnEquipWeapon(itemPtr);
		var int itemPtr; itemPtr = QS_GetSlotItem(nr);
		oCNpc_UnEquipItem(hero,itemPtr);
	};
	
	MEM_Info("QS_RemoveSlot #4");
	if(Hlp_IsValidHandle(pView)){
		View_Delete(pView);
	};
MEM_Info("QS_RemoveSlot #5");
	if(Hlp_IsValidHandle(pViewText)){
		View_Delete(pViewText);
	};
MEM_Info("QS_RemoveSlot #6");
	MEM_WriteStatArr	(QS_Data, 		nr, 0);MEM_Info("QS_RemoveSlot #7");
	release (slotPtr);MEM_Info("QS_RemoveSlot #8");
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

func int QS_CanPutInSlot(var int itemPtr)
{
	
	var c_item it; it  = _^(itemPtr);
	
	if(((it.mainflag == ITEM_KAT_NF) && !(it.flags & ITEM_SHIELD))			// Walka wr�cz
	|| (it.flags & (ITEM_BOW | ITEM_CROSSBOW)) 		// Bro� dystansowa
	|| ((it.flags & ITEM_SHIELD) && WalkaTarcza)		// Tarcze
	|| (it.mainflag == ITEM_KAT_RUNE)				// Magia
	|| (STR_Len(it.scemeName)))						// Przedmioty u�ytkowe
	{
		return true;
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
			AI_Function_I	(hero, QS_ClearMagBook, magBook);	
			AI_Function_II	(hero, QS_RegisterRune, magBook, itemPtr);
		
			AI_PrintS		(hero, spellName);
		};
	}
	else
	{
		QS_HideWeapon	(her);
		AI_Function_II	(hero, QS_RegisterRune, magBook, itemPtr);
		QS_DrawWeapon	(FMODE_MAGIC);
		
		AI_PrintS(hero, spellName);
	};
};

func void QS_UseWeapon(var int itemPtr, var int bIsRanged)
{
	var oCNpc her; 	her = Hlp_GetNpc(hero);
	var C_ITEM it; 	it 	= _^(itemPtr);
	var C_ITEM hlp;
	if(!bIsRanged)
	{
		//CALL__thiscall(_@(hero),oCNpc__ClearEM);
		if(Npc_HasReadiedWeapon(hero) || her.fmode == FMODE_MAGIC || her.fmode == FMODE_FIST)
		{
			hlp = Npc_GetReadiedWeapon(hero);
			QS_HideWeapon(her);			
			if(_@(hlp) != itemPtr)
			{
				if(!(it.flags & ITEM_ACTIVE))	{
					QS_AI_EquipWeapon(itemPtr);
				};			
				QS_DrawWeapon(FMODE_MELEE);
			};
		}
		else if(Npc_HasEquippedMeleeWeapon(hero))
		{
			hlp = Npc_GetEquippedMeleeWeapon(hero);
			
			if(_@(hlp) == itemPtr)	{	
				QS_DrawWeapon(FMODE_MELEE);
			} else if(_@(hlp) != itemPtr) {
				QS_AI_EquipWeapon(itemPtr);
				QS_DrawWeapon(FMODE_MELEE);
			};		
		}
		else
		{	
			QS_AI_EquipWeapon	(itemPtr);
			QS_DrawWeapon		(FMODE_MELEE);		
		};
	}	
	else
	{
		if(Npc_HasReadiedWeapon(hero) || her.fmode == FMODE_MAGIC || her.fmode == FMODE_FIST)
		{
			hlp = Npc_GetReadiedWeapon(hero);	
			QS_HideWeapon(her);
			
			if(_@(hlp) != itemPtr)
			{
				if(!(it.flags & ITEM_ACTIVE))	{
					QS_AI_EquipWeapon(itemPtr);
				};
				
				QS_DrawWeapon_Far(itemPtr);
			};
		}
		else if(Npc_HasEquippedRangedWeapon(hero))
		{
			hlp = Npc_GetEquippedRangedWeapon(hero);	
			if(_@(hlp) == itemPtr)	{		
				QS_DrawWeapon_Far(itemPtr);
			} else if(_@(hlp) != itemPtr) {
				
				QS_AI_EquipWeapon(itemPtr);	
				QS_DrawWeapon_Far(itemPtr);
			};		
		}
		else
		{
			QS_AI_EquipWeapon	(itemPtr);
			QS_DrawWeapon_Far	(itemPtr);		
		};
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
	var oCItem it; it 	= _^(itemPtr);
		
	if(!Npc_HasItems(hero, it.instanz))
	{
		return;
	};
	var int bCanDraw; bCanDraw = QS_CanDrawWeapon();
	if(!bCanDraw) { return; }; 
	CALL__thiscall(_@(hero),oCNpc__ClearEM);
	if(STR_Len(it.scemeName))
	{
		QS_UseMisc(her, it);
	}
	else if(it.mainflag == ITEM_KAT_NF)
	{
		AI_StandUpQuick		(hero);
		QS_UseWeapon(itemPtr, false);
		QS_LastWeaponSlot = i;

	} 
	else if (it.flags & (ITEM_BOW | ITEM_CROSSBOW))
	{
		QS_UseWeapon(itemPtr, true);
		QS_LastWeaponSlot = i;
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
		QS_LastWeaponSlot = i;
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


func void QS_RenderSlot(var int idx)
{
	if(!QS_RenderWorld) {
		MEM_Error("QS_RenderWorld is null!");
		return;
	};
	
	var int slotHndl; 	slotHndl 	= MEM_ReadStatArr(QS_Data, idx); 	
	if(!Hlp_IsValidHandle(slotHndl)){
		return;
	};
	
	var CSlot slot; 	slot 		= get (slotHndl);
	var int pItem; 		pItem 		= slot.itemPtr;
	var int pView; 		pView 		= slot.pView;
	var int pViewText;	pViewText 	= slot.pViewText; 
	
	if(!pItem 
	|| !Hlp_IsValidHandle(pView)  
	|| !Hlp_IsValidHandle(pViewText))
	{
		MEM_Error(ConcatStrings("RenderSlot pItem or pView or pViewText is null! idx: ", IntToString(idx)));
		
		MEM_Info(ConcatStrings("pItem: ", 		IntToString(pItem)));
		MEM_Info(ConcatStrings("pView: ", 		IntToString(pView)));
		MEM_Info(ConcatStrings("pViewText: ", 	IntToString(pViewText)));
		return; 
	};
	
	var oCItem it; it = _^(pItem);
	
	// Remove item 
	 if(!Npc_HasItems(hero, it.instanz)){ 
		QS_RemoveSlot(idx);
		return;
	};
	
	pView 		= getPtr(pView);
	pViewText 	= getPtr(pViewText);
	
	// Render slot 
	ViewPtr_InsertItem	(getPtr(QS_BackgroundView), pView);	

	oCItem_Render		(pItem, QS_RenderWorld, pView, FLOATNULL);	
	ViewPtr_Render		(pView);
	
	// Draw numbers
	QS_AddText(pViewText, idx, it.amount, it.instanz);	
	
	ViewPtr_RemoveItem	(getPtr(QS_BackgroundView), pView);
};

// Per Frame loop
func void QS_RenderHook()
{
	if(!QS_RenderOnScreen())	{
		return;
	};
	
	var int posY; posY = 8192 - Print_ToVirtual(140, PS_Y); 
	if(QS_IsInvOpen()) {
		posY = QS_posY_OpenInv;
	};
	
	// Set position
	ViewPtr_SetPos		(getPtr(QS_BackgroundView), -1, posY);
	
	ViewPtr_InsertItem	(MEM_ReadInt(screen), getPtr(QS_BackgroundView));	
	ViewPtr_Render		(getPtr(QS_BackgroundView));
	
	QS_RenderSlot(1);	QS_RenderSlot(2);	QS_RenderSlot(3);	
	QS_RenderSlot(4);	QS_RenderSlot(5);	QS_RenderSlot(6);	
	QS_RenderSlot(7);	QS_RenderSlot(8);	QS_RenderSlot(9);	
	QS_RenderSlot(0);
	
	ViewPtr_RemoveItem	(MEM_ReadInt(screen), getPtr(QS_BackgroundView));	
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


func void QS_KeyWeapon_Hook()
{
	var int pressed; pressed = MEM_ReadInt(ESP + 4);
	if(!pressed) { return; };
		
	if(hero.guild < GIL_SEPERATOR_HUM)
	{
		MEM_WriteInt(ESP + 4, false);	
		var oCNpc her; her = Hlp_GetNpc(hero);
		if(!QS_CanUseItem(her)) { return; };
		
		if(QS_LastWeaponSlot != -1)	{
			QS_UseItem(QS_LastWeaponSlot);
		} else {
			QS_DrawFist();
		};
	};
};

func void QS_SwitchHeroFix()
{
	if(!Hlp_IsValidHandle(QS_BackgroundView))	{
		return;
	};
	
	var C_NPC slf; 	slf 	= _^(ECX);
	var C_ITEM it;	
	if(Npc_HasEquippedMeleeWeapon(slf))
	{
		it = Npc_GetEquippedMeleeWeapon(slf);
		QS_PutSlot(slf, 1, _@(it));
	};
	
	if(Npc_HasEquippedRangedWeapon(slf))
	{
		it = Npc_GetEquippedRangedWeapon(slf);
		QS_PutSlot(slf, 2, _@(it));
	};
	
	if(Npc_HasReadiedWeapon(slf))
	{
		it = Npc_GetReadiedWeapon(slf);
		
		var int slot; slot = 1;
		if(it.flags & (ITEM_BOW | ITEM_CROSSBOW))	{
			slot = 2;
		};
		
		QS_PutSlot(slf, slot, _@(it));
	};
};

const int QS_FirstTime = 0;
const int Sneak_Speed_Default_Startup = 0;
func void QSEquipWeaponFirstTimeFix()
{
	if(Hlp_IsValidNpc(hero) && !Npc_HasEquippedMeleeWeapon(hero)) {ff_Remove(QSEquipWeaponFirstTimeFix); return;};
	
	var c_item w; w = Npc_GetEquippedMeleeWeapon(hero);
	var int ptr; ptr = _@(w);
	
	if(Hlp_IsValidNpc(hero) && !Sneak_Speed_Default_Startup)
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
	
	if(ptr && Hlp_IsValidHandle(QS_BackgroundView))
	{
		QS_PutSlot(hero, 1, ptr);
		ff_Remove(QSEquipWeaponFirstTimeFix);
		QS_FirstTime = true;
	};
};



func void QS_SpellCast_GetSpell()
{
	var oCNpc her;			her = Hlp_GetNpc(hero);
	if(ECX != her.mag_book) { return; };
	QS_LastSpell_Item = QS_GetSpellItem(her.mag_book);
};

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
	var oCNpc her; her = Hlp_GetNpc(hero);
	QS_ClearMagBook(her.mag_book);
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