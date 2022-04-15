instance saveMenuItem (zCMenuItem);


const INT IT_ONLY_OUT_GAME      = 256;
var int SavingDisabled;
const int s_bUseQuickSave_address = 9118160; //0x8B21D0 


func void DisableSave() {
	
		//MENU_STATUS
		var int saveMenuItemPtr;
		saveMenuItemPtr = MEM_GetMenuItemByString ("MENUITEM_MAIN_SAVEGAME_SAVE");
		//"MENU_ITEM_STATUS_HEADING"
		if (!saveMenuItemPtr) {
			//wtf?
			var string err; err = "EnforceSavingPolicy: MENUITEM_MAIN_SAVEGAME_SAVE not found!?";
			Print (err); PrintDebug (err);
			return;
		};
		
		MEM_AssignInst (saveMenuItem, saveMenuItemPtr);

  
        saveMenuItem.m_parItemFlags = saveMenuItem.m_parItemFlags | IT_ONLY_OUT_GAME;
        
		 //Quicksave
         MEM_WriteInt (s_bUseQuickSave_address, 0);
		
        
        if (!SavingDisabled) {
            SavingDisabled = TRUE;
		};
};
		
func void AllowSaving()
{
	
		//MENU_STATUS
		var int saveMenuItemPtr;
		saveMenuItemPtr = MEM_GetMenuItemByString ("MENUITEM_MAIN_SAVEGAME_SAVE");
		//"MENU_ITEM_STATUS_HEADING"
		if (!saveMenuItemPtr) {
			//wtf?
			var string err; err = "EnforceSavingPolicy: MENUITEM_MAIN_SAVEGAME_SAVE not found!?";
			Print (err); PrintDebug (err);
			return;
		};
	   
		 MEM_AssignInst (saveMenuItem, saveMenuItemPtr);
   
		saveMenuItem.m_parItemFlags = saveMenuItem.m_parItemFlags &~ IT_ONLY_OUT_GAME;
	    //Quicksave
        MEM_WriteInt (s_bUseQuickSave_address, 1);

        if (SavingDisabled) {
            SavingDisabled = 0;	
		};
    
}; 