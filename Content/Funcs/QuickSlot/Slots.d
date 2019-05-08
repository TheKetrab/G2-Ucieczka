func int QS_anx(var int x) { return ViewPtr_anx(getPtr(QS_BackgroundView), x); };
func int QS_any(var int y) { return ViewPtr_any(getPtr(QS_BackgroundView), y); };


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
	
	if(((it.mainflag == ITEM_KAT_NF) && !(it.flags & ITEM_SHIELD))			// Walka wręcz
	|| (it.flags & (ITEM_BOW | ITEM_CROSSBOW)) 		// Broń dystansowa
	|| ((it.flags & ITEM_SHIELD) && WalkaTarcza)		// Tarcze
	|| (it.mainflag == ITEM_KAT_RUNE)				// Magia
	|| (STR_Len(it.scemeName)))						// Przedmioty użytkowe
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
