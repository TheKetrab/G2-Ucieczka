func void QS_InitHooks()
{
	var int i;
	i = 0;
	
//	MemoryProtectionOverride(oCMag_Book_SpellCast_Check_SpellBook, oCMag_Book_SpellCast_Check_SpellBook_NumBytes);
	//repeat(i,oCMag_Book_SpellCast_Check_SpellBook_Oryginal_Bytes);
	//	MEM_WriteStatArr(oCMag_Book_SpellCast_Check_SpellBook_Oryginal_Bytes,i, MEM_ReadByte(oCMag_Book_SpellCast_Check_SpellBook+i));
		//MEM_WriteByte(oCMag_Book_SpellCast_Check_SpellBook+i,ASMINT_OP_nop);
	//end;
	
		
	// Disable mag_book
	/*MemoryProtectionOverride(7577148, 5);
	
	i = 0;
	repeat(i,5);
		
		MEM_WriteStatArr(DisableMagBook_Oryginal_Bytes,i, MEM_ReadByte(7577148+i));
		MEM_WriteByte(7577148 + i, MEM_ReadStatArr(DisableMagBook_New_Bytes,i));

	end;*/
	MemoryProtectionOverride(4676534,1);
	MoreMagBookSpells_Max = MEM_ReadInt(4676534);
	MEM_WriteByte(4676534,8);
	
	
	const int hasmagic_begin = 7372470;	//707EB6

	MemoryProtectionOverride(hasmagic_begin,13);
	
	i = 0;
	repeat(i, 13); 		
		MEM_WriteStatArr(RemoveSpellNr_Bytes,i,MEM_ReadInt(hasmagic_begin+i));
		MEM_WriteByte(hasmagic_begin+i, ASMINT_OP_nop);
	end;
	
	//MEM_WriteByte(hasmagic_begin+14,233);
	//MEM_WriteByte(hasmagic_begin+15,118);
	//MEM_WriteByte(hasmagic_begin+16,1);
	//MEM_WriteByte(hasmagic_begin+17,0);
	//MEM_WriteByte(hasmagic_begin+18,0);


	
	HookEngineF(oCGame__RenderX,
				oCGame__RenderX_Len,
				QS_RenderHook);	
				
	HookEngineF(oCGame__UpdateResolution,
				oCGame__UpdateResolution_Len,
				QS_UpdateResolution);
	
	HookEngineF(oCNpc__SetAsPlayer,
				oCNpc__SetAsPlayer_Len,
				QS_SwitchHeroFix);				
		
	HookEngineF(oCNpc__OpenInventory,
				oCNpc__OpenInventory_Len,
				QS_OpenInventory);	
					
	//HookEngineF(oCMag_Book_SpellCast_Check_SpellBook, 
				//oCMag_Book_SpellCast_Check_SpellBook_NumBytes, 
				//QS_FixUseLastSpell);		
							
	HookEngineF(oCMag_Book_SpellCast, 
				oCMag_Book_SpellCast_Len, 
				QS_SpellCast_GetSpell);
					
	// Draw quickslot numbers		
	HookEngineF(oCItemContainer_Draw_PrintText, 
				oCItemContainer_Draw_PrintText_Len, 
				QS_DrawNumbersInInv);	

	HookEngineF(oCItemContainer_Draw_NF_posX, 
				oCItemContainer_Draw_NF_posX_Len, 
				QS_RemoveInvNumber_NF);
					
	HookEngineF(oCItemContainer_Draw_FF_posX, 
				oCItemContainer_Draw_FF_posX_Len, 
				QS_RemoveInvNumber_FF);		
	//HookEngineF(oCMobInter__StartInteraction, 
			//	6, 
			//	QS_MobInteractionFix);	
	

	HookEngineF(4691849,7,QS_ValidMagBookNr);
	
	
	// Fix keyWeapon in using oCItemContainer
	HookEngineF(6914805 /*006982F5*/, 8, Hook_ReturnFalse); 						
	HookEngineF(6935581 /*0069D41D*/, 8, Hook_ReturnFalse);
	

	
	//DisableQuickSlot = 0;
};

func void QS_RemoveHooks()
{	
	var int i; 

	
	//MemoryProtectionOverride(7577148, 5);
	//repeat(i,DisableMagBook_Oryginal_Bytes_NumBytes);
		//byte = MEM_ReadStatArr(DisableMagBook_Oryginal_Bytes,i);
		//MEM_WriteByte(7577148+i,byte);
	//end;
	
	//MemoryProtectionOverride(4676534, 1);
	//Mem_WriteByte(4676534,10);
	
	MemoryProtectionOverride(4676534,1);
	MEM_WriteByte(4676534,MoreMagBookSpells_Max);
	
	i = 0;
	repeat(i, 13); 		
		MEM_WriteByte(hasmagic_begin+i, MEM_ReadStatArr(RemoveSpellNr_Bytes,i));
	end;
	
	
	RemoveHookF(oCGame__RenderX,
				oCGame__RenderX_Len,
				QS_RenderHook);	
				
	RemoveHookF(oCGame__UpdateResolution,
				oCGame__UpdateResolution_Len,
				QS_UpdateResolution);
	
	RemoveHookF(oCNpc__SetAsPlayer,
				oCNpc__SetAsPlayer_Len,
				QS_SwitchHeroFix);				
		
	RemoveHookF(oCNpc__OpenInventory,
				oCNpc__OpenInventory_Len,
				QS_OpenInventory);	
					
	//RemoveHookF(oCMag_Book_SpellCast_Check_SpellBook, 
				//oCMag_Book_SpellCast_Check_SpellBook_NumBytes, 
				//QS_FixUseLastSpell);		
							
	RemoveHookF(oCMag_Book_SpellCast, 
				oCMag_Book_SpellCast_Len, 
				QS_SpellCast_GetSpell);
					
	// Draw quickslot numbers		
	RemoveHookF(oCItemContainer_Draw_PrintText, 
				oCItemContainer_Draw_PrintText_Len, 
				QS_DrawNumbersInInv);	

	RemoveHookF(oCItemContainer_Draw_NF_posX, 
				oCItemContainer_Draw_NF_posX_Len, 
				QS_RemoveInvNumber_NF);
					
	RemoveHookF(oCItemContainer_Draw_FF_posX, 
				oCItemContainer_Draw_FF_posX_Len, 
				QS_RemoveInvNumber_FF);		
	//RemoveHookF(oCMobInter__StartInteraction, 
			//	6, 
			//	QS_MobInteractionFix);	
	
	// Fix keyWeapon in using oCItemContainer
	RemoveHookF(6914805 /*006982F5*/, 8, Hook_ReturnFalse); 						
	RemoveHookF(6935581 /*0069D41D*/, 8, Hook_ReturnFalse);
	
	RemoveHookF(4691849,7,QS_ValidMagBookNr);

	// Fix hide weapon on using last spell
	//MemoryProtectionOverride(oCMag_Book_SpellCast_Check_SpellBook, oCMag_Book_SpellCast_Check_SpellBook_NumBytes);
	//repeat(i,oCMag_Book_SpellCast_Check_SpellBook_NumBytes);
		// byte = MEM_ReadStatArr(oCMag_Book_SpellCast_Check_SpellBook_Oryginal_Bytes,i);
		//MEM_WriteByte(oCMag_Book_SpellCast_Check_SpellBook+i,byte);
	//end;
	
	//DisableQuickSlot = 1;
};


func void QS_InitBaseData()
{
	// Initialize zCView background object
	if(!Hlp_IsValidHandle(QS_BackgroundView))
	{
		QS_BackgroundView = View_CreateCenter(4096, 8000 - Print_ToVirtual(QS_SizeY, PS_Y),
											Print_ToVirtual(QS_SizeX, PS_X), 
											Print_ToVirtual(QS_SizeY, PS_Y));
											
		View_SetTexture(QS_BackgroundView, QS_BackgroundTexture);
	};
	
	// Init Render world
	if(!QS_RenderWorld)
	{
		// Create world
		CALL__thiscall(MEM_ReadInt(zfactory), zCObjectFactory__CreateWorld);
		QS_RenderWorld = CALL_RetValAsPtr();
		
		// Apply world only for inventory
		MEM_WriteInt (QS_RenderWorld + zCWorld__bIsInventoryWorld_offset, true);
	};
	
	//if(!QS_FirstTime)
	//{
		//FF_ApplyOnceExt (QSEquipWeaponFirstTimeFix, 250, -1);
	//};
};
				
func int QuickSlot_InitOnce()
{
	// Check LeGo flags
	if(!(_LeGo_Flags & (QS_LeGo_Flags)))
	{
		MEM_Error("Insufficient LeGo flags for QuickSlot.");
		return FALSE;
	};
	
	QS_InitHooks	();
	return TRUE;
};

func void QuickSlot_InitAlways()
{
	// Init base quickslot data
	QS_InitBaseData();
	
	// Restore items pointers
	QS_RestoreData();
	
	// Remove last spellItem
	QS_LastSpell_Item 	= 0;	
	
	// Remove 'keyWeapon' fix bug
	QS_KeyWeapon_Locked = 0;
	
	// On using last item, remove instance saved in this variable
	QS_UseLastItem_Fix 	= 0;
};

func void QuickSlot_Init()
{
	// Init one time per sesion
	if(!QuickSlot_Inited)
	{
		if(!QuickSlot_InitOnce())
		{
			MEM_Warn("Failed to initialize Quicklot");
			return;
		};
		QuickSlot_Inited = 1;
	};
	QuickSlot_InitAlways();
	MEM_Info("QuickSlot successfull inited!");
};

func void QuickSlot_OnLoadFirstWorld()
{
	// Initalize in "Startup_YouFirstWorldName"
	QS_LastWeaponSlot = -1;
};

