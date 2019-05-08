func void QS_AddText(var int pView, var int nr, var int amount, var int instanz)
{
	// Delete text:
	CALL__thiscall(pView, zCView__ClrPrintwin);
	
	// Print slot nr!
	//ViewPtr_Print(pView, 1500, 1024, IntToString(nr));
	
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
