func void QS_HandleEvent_Inventory()
{	
	var int key; key = MEM_ReadInt(ESP + 4);
	var int keyWeapon_1; keyWeapon_1 = MEM_GetKey("keyWeapon");
	var int keyWeapon_2; keyWeapon_2 = MEM_GetSecondaryKey("keyWeapon");
	
	var int keyAction_1; keyAction_1 = MEM_GetKey("keyAction");
	var int keyAction_2; keyAction_2 = MEM_GetSecondaryKey("keyAction");	
	
	
	if(key == keyWeapon_1
	|| key == keyWeapon_2)
	{
		MEM_WriteInt(ESP + 4, -1);
		return;
	};
	
	CALL__thiscall(ECX, oCItemContainer__GetSelectedItem);	
	var int itemPtr;  itemPtr = CALL_RetValAsPtr();
	
	if(!itemPtr) {
		return;
	};
	
	if(key == MOUSE_BUTTONLEFT
	|| key == keyAction_1
	|| key == keyAction_2)	
	{
		var c_item it; it = _^(itemPtr);
		if(it.mainflag == ITEM_KAT_NF
		|| it.flags & ITEM_SHIELD)
		{
			if(QS_GetSlotItem(1))	{
				QS_RemoveSlot(1);
			};
		
			if(!(it.flags & ITEM_ACTIVE))
			{
				QS_PutSlot(hero, 1, itemPtr);
			};
		}
		else if(it.flags & (ITEM_BOW | ITEM_CROSSBOW))
		{
			if(QS_GetSlotItem(2))	{
				QS_RemoveSlot(2);
			};
		
			if(!(it.flags & ITEM_ACTIVE))
			{
				QS_PutSlot(hero, 2, itemPtr);
			};
		};
		return;
	};

	
	if(key == KEY_1) { QS_PutSlot(hero, 1, itemPtr); }; 
	if(key == KEY_2) { QS_PutSlot(hero, 2, itemPtr); }; 
	if(key == KEY_3) { QS_PutSlot(hero, 3, itemPtr); }; 
	if(key == KEY_4) { QS_PutSlot(hero, 4, itemPtr); }; 
	if(key == KEY_5) { QS_PutSlot(hero, 5, itemPtr); }; 
	if(key == KEY_6) { QS_PutSlot(hero, 6, itemPtr); }; 
	if(key == KEY_7) { QS_PutSlot(hero, 7, itemPtr); }; 
	if(key == KEY_8) { QS_PutSlot(hero, 8, itemPtr); }; 
	if(key == KEY_9) { QS_PutSlot(hero, 9, itemPtr); }; 
	if(key == KEY_0) { QS_PutSlot(hero, 0, itemPtr); }; 
};

func void QS_Game_HandleEvent()
{
	var int key; key = MEM_ReadInt(ESP + 4);
	
	if(key == KEY_1) 	{ QS_UseItem(1);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_2) 	{ QS_UseItem(2);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_3) 	{ QS_UseItem(3);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_4) 	{ QS_UseItem(4);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_5) 	{ QS_UseItem(5);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_6) 	{ QS_UseItem(6);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_7) 	{ QS_UseItem(7);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_8) 	{ QS_UseItem(8);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_9) 	{ QS_UseItem(9);	MEM_WriteInt(ESP + 4, -1); 	};
	if(key == KEY_0) 	{ QS_UseItem(0);	MEM_WriteInt(ESP + 4, -1); 	};
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






