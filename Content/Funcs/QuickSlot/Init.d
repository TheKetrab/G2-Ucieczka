func void QS_InitHooks()
{
	// Fix hide weapon on using last spell
	QS_WriteNOP(oCMag_Book_SpellCast_Check_SpellBook, 
				oCMag_Book_SpellCast_Check_SpellBook_NumBytes);
		
	// Disable mag_book
	MemoryProtectionOverride(7577148, 5);
	MEM_WriteByte(7577148 + 0, 233);
	MEM_WriteByte(7577148 + 1, 229);
	MEM_WriteByte(7577148 + 2, 001);
	MEM_WriteByte(7577148 + 3, 000);
	MEM_WriteByte(7577148 + 4, 000);
	
	HookEngineF(oCGame__RenderX,
				oCGame__RenderX_Len,
				QS_RenderHook);	
				
	HookEngineF(oCGame__UpdateResolution,
				oCGame__UpdateResolution_Len,
				QS_UpdateResolution);
	
	HookEngineF(oCNpc__SetAsPlayer,
				oCNpc__SetAsPlayer_Len,
				QS_SwitchHeroFix);				
	
	HookEngineF(oCAIHuman__PC_WeaponMove,
				oCAIHuman__PC_WeaponMove_Len,
				QS_KeyWeapon_Hook);
					
	HookEngineF(oCNpc__OpenInventory,
				oCNpc__OpenInventory_Len,
				QS_OpenInventory);	
					
	HookEngineF(oCMag_Book_SpellCast_Check_SpellBook, 
				oCMag_Book_SpellCast_Check_SpellBook_NumBytes, 
				QS_FixUseLastSpell);		
							
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
	
	// Fix keyWeapon in using oCItemContainer
	HookEngineF(6914805 /*006982F5*/, 8, Hook_ReturnFalse); 						
	HookEngineF(6935581 /*0069D41D*/, 8, Hook_ReturnFalse);
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
	
	if(!QS_FirstTime)
	{
		FF_ApplyOnceExt (QSEquipWeaponFirstTimeFix, 250, -1);
	};
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

