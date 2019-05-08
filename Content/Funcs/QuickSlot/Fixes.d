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
