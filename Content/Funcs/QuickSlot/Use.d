//var int inUse[10];
func void QS_RemoveWeapon()
{
	var int ptr; ptr = QS_oCMsgWeapon_Create(EV_REMOVEWEAPON, 0);
	QS_OnMessage (ptr);
};

func void QS_DrawWeapon(var int mode)
{	
	//var int ptr; ptr = QS_oCMsgWeapon_Create(EV_DRAWWEAPON, mode);
	//AI_StandUpQuick 		(hero);
	/*var c_item w; w = Npc_GetEquippedMeleeWeapon(hero);
	if(w.flags & ( ITEM_2HD_SWD |ITEM_2HD_AXE ))
	{
		if  (GetItemSlot(hero, "ZS_LONGSWORD") != Hlp_GetInstanceID(w))
		{
			oCNpc_UnequipItem(hero,  Hlp_GetInstanceID(w));
		};
	}
	else
	{
		if  (GetItemSlot(hero, "ZS_SWORD") !=  Hlp_GetInstanceID(w))
		{
			oCNpc_UnequipItem(hero,  Hlp_GetInstanceID(w));
		};
	};*/
	
	//CALL__thiscall(_@(hero),oCNpc__ClearEM);
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
//FUNC C_Item Npc_GetEquippedMeleeWeapon 	(VAR C_NPC n0 ) { };
// FUNC C_Item Npc_GetEquippedRangedWeapon (VAR C_NPC n0 ) { };
//virtual void __thiscall zCModel::StopAnimation(zSTRING const &) 	0x005765F0
func void StopAni(var int model, var string ani)
{
	CALL_zStringPtrParam(ani);
	CALL__thiscall(model,5727728);
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
