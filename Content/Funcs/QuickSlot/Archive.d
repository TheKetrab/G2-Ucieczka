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