/*
 * This file is part of CatInv.
 * Copyright (C) 2018-2020  mud-freak (@szapp)
 *
 * CatInv is free software: you can redistribute it and/or
 * modify it under the terms of the MIT License.
 * On redistribution this notice must remain intact and all copies must
 * identify the original author.
 */


/*
 * Wrapper for zCListSort<oCItem>::`scalar deleting destructor'
 */
func void CatInv_DeleteListSortFromPool(var int list, var int purge) {
    const int call = 0;
    const int one = -1; // Set all bits, because char
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(one));
        CALL__thiscall(_@(list), zCListSort_oCItem____scalar_deleting_destructor);
        call = CALL_End();
    };
    if (purge) {
        List_DestroyS(list);
    } else {
        var zCListSort l; l = _^(list);
        l.next = 0;
    };
};


/*
 * Get category offset as defined in Gothic.ini (GAME.invCatOrder)
 * The variable int invCatOrder[9] contains the position (array value) of each category (array key).
 */
func int CatInv_GetCatID(var int offset) {
    // The "all" category
    if (!offset) {
        return 0;
    };

    // Skip "NONE" category
    offset += (offset > MEM_ReadInt(invCatOrder));

    repeat(i, INV_CAT_MAX + 1); var int i;
        if (MEM_ReadIntArray(invCatOrder, i) == offset-1) {
            return i;
        };
    end;

    // Should never be reached
    return 0;
};


/*
 * Check if container supports categories as defined in Gothic.ini (GAME.invCatG1Mode)
 */
func int CatInv_SupportCat(var int container) {
    if (!CatInv_G1Mode) {
        return TRUE;
    };

    var oCItemContainer con; con = _^(container);
    return con.right;
};


/*
 * Reset the inventory to full view (category == 0)
 */
func int CatInv_Reset(var int container) {
    var int container_vtbl; container_vtbl = MEM_ReadInt(container);
    if (container_vtbl == oCNpcInventory___vftable) {
        var oCNpcInventory npcInv; npcInv = _^(container);
        if (npcInv._oCItemContainer_contents != _@(npcInv.inventory_Compare)) {
            CatInv_DeleteListSortFromPool(npcInv._oCItemContainer_contents, 1); // Some nodes are in zCMemListPool
            npcInv._oCItemContainer_contents = _@(npcInv.inventory_Compare);
        };
    } else if (container_vtbl == oCStealContainer___vftable) {
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL__thiscall(_@(container), oCStealContainer__CreateList);
            call = CALL_End();
        };
    } else if (container_vtbl == oCNpcContainer___vftable) {
        var oCItemContainer npcCon; npcCon = _^(container);
        var zCListSort l; l = _^(npcCon.contents);
        if (l.next) {
            CatInv_DeleteListSortFromPool(l.next, 1); // Some nodes are in zCMemListPool
            l.next = 0;
        };
        const int call2 = 0;
        if (CALL_Begin(call2)) {
            CALL__thiscall(_@(container), oCNpcContainer__CreateList);
            call2 = CALL_End();
        };
    } else if (container_vtbl == oCItemContainer___vftable) {
        if (_CatInv_BackupList) {
            var oCItemContainer itmCon; itmCon = _^(container);
            CatInv_DeleteListSortFromPool(itmCon.contents, 1); // Some nodes are in zCMemListPool
            itmCon.contents = _CatInv_BackupList;
            _CatInv_BackupList = 0;
        };
    };
    return container_vtbl;
};


/*
 * Intercept creation of trading and dead inventory
 */
func void CatInv_ManipulateCreateList() {
    var C_Item itm; itm = _^(ECX);
    if (itm.mainflag == ITEM_KAT_ARMOR) && (!CatInv_SP18Armor) {
        EAX = 1;
    } else if (CatInv_G1Mode) {
        // Always full inventory in G1 mode
        EAX = 0;
    } else if (!CatInv_ActiveCategory) {
        // 'All' category
        EAX = 0;
    } else if (itm.mainflag & MEM_ReadStatArr(INV_CAT_GROUPS, CatInv_GetCatID(CatInv_ActiveCategory))) {
        // Check if item is in active inventory category
        EAX = 0;
    } else {
        // Wrong category
        EAX = 1;
    };
};


/*
 * Scroll to top
 */
func void CatInv_ResetOffset(var int container) {
    var oCItemContainer con; con = _^(container);
    con.selectedItem -= con.offset;
    con.offset = 0;
};
func void CatInv_SetSelectionFirst(var int container) {
    CatInv_ResetOffset(container);
    var oCItemContainer con; con = _^(container);
    con.selectedItem = 0;
};


/*
 * Scroll to bottom
 */
func void CatInv_SetMaxOffset(var int container, var int selLastItem) {
    var oCItemContainer con; con = _^(container);

    // Calling this engine function is faster than counting in Daedalus
    var int numItems;
    var int contents; contents = con.contents;
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PutRetValTo(_@(numItems));
        CALL__thiscall(_@(contents), zCListSort_oCItem___GetNumInList);
        call = CALL_End();
    };

    var int numRows; numRows = (numItems-1)/con.maxSlotsCol + 1;
    con.offset = (numRows - con.maxSlotsRow) * con.maxSlotsCol;
    if con.offset < 0 {
        con.offset = 0;
    };

    if (selLastItem) {
        con.selectedItem = numItems-1;
    } else {
        con.selectedItem += con.offset;
    };
};
func void CatInv_SetSelectionLast(var int container) {
    CatInv_SetMaxOffset(container, TRUE);
};


/*
 * Update the inventory to category view
 */
func void CatInv_Update(var int container) {
    var int container_vtbl; container_vtbl = CatInv_Reset(container);
    if (!CatInv_ActiveCategory) {
        return;
    };

    if (container_vtbl == oCNpcInventory___vftable) {
        var oCNpcInventory npcInv; npcInv = _^(container);

        npcInv._oCItemContainer_contents = List_CreateS(0);
        var zCListSort list0; list0 = _^(npcInv._oCItemContainer_contents);
        list0.compareFunc = npcInv.inventory_Compare;

        _CatInv_CurrentList = npcInv._oCItemContainer_contents;
        if (npcInv.inventory_next) {
            List_ForFS(npcInv.inventory_next, CatInv_AddItem);
        };
    } else if (container_vtbl == oCItemContainer___vftable) {
        if (CatInv_G1Mode) {
            return;
        };

        var oCItemContainer itmCon; itmCon = _^(container);
        if (_CatInv_BackupList) {
            CatInv_DeleteListSortFromPool(_CatInv_BackupList, 1); // Some nodes are in zCMemListPool
        };
        _CatInv_BackupList = itmCon.contents;
        var zCListSort backupList; backupList = _^(_CatInv_BackupList);

        itmCon.contents = List_CreateS(0);
        var zCListSort list; list = _^(itmCon.contents);
        list.compareFunc = backupList.compareFunc;

        _CatInv_CurrentList = itmCon.contents;
        if (backupList.next) {
            List_ForFS(backupList.next, CatInv_AddItem);
        };
    };
};
func void CatInv_AddItem(var int listPtr) {
    var zCListSort l; l = _^(listPtr);
    var C_Item itm; itm = _^(l.data);
    if (itm.mainflag & MEM_ReadStatArr(INV_CAT_GROUPS, CatInv_GetCatID(CatInv_ActiveCategory))) {
        List_AddS(_CatInv_CurrentList, l.data);
    };
};
func void CatInv_UpdateAll() {
    var int list; list = MEM_ReadInt(s_openContainers_next);
    while(list);
        var zCList l; l = _^(list);
        CatInv_Update(l.data);
        if (CatInv_SupportCat(l.data)) {
            CatInv_ResetOffset(l.data);
        };
        list = l.next;
    end;
};


/*
 * Set the inventory category
 */
func int CatInv_SetCategory(var int pos) {
    var int invNewCategory; invNewCategory = pos;
	
	// G2U12: jesli wylaczona opcja, to zawsze category=0
	if (!STR_ToInt(MEM_GetGothOpt("UCIECZKA", "CatInvEnabled"))) {
		invNewCategory = 0;
	} else if (invNewCategory < CatInv_G1Mode) {
        invNewCategory = CatInv_G1Mode;
    } else if (invNewCategory >= INV_CAT_MAX) {
        invNewCategory = INV_CAT_MAX-1;
    };

    if (invNewCategory == CatInv_ActiveCategory) {
        return FALSE;
    };
    CatInv_ActiveCategory = invNewCategory;

    CatInv_UpdateAll();
    return TRUE;
};


/*
 * Change the inventory category
 */
func int CatInv_ShiftCategory(var int offset) {
    return CatInv_SetCategory(CatInv_ActiveCategory + offset);
};


/*
 * Set the inventory to the first category ('all')
 */
func int CatInv_SetCategoryFirst() {
    return CatInv_SetCategory(CatInv_G1Mode);
};


/*
 * Set the inventory to the last category
 */
func int CatInv_SetCategoryLast() {
    return CatInv_SetCategory(INV_CAT_MAX-1);
};


/*
 * Intercept opening/closing of any oCItemContainer
 */
func void CatInv_Open() {

	// G2U12
	if (!STR_ToInt(MEM_GetGothOpt("UCIECZKA", "CatInvEnabled"))) {
		CatInv_SetCategory(0);
	};

    // Reset active category when trading or looting
    var oCItemContainer container; container = _^(ECX);
    if (container.vtbl != oCNpcInventory___vftable) {
        if (!CatInv_G1Mode) {
            CatInv_SetCategoryFirst();
        };
        CatInv_SetSelectionFirst(ECX);

        // Reset selection and offset of player inventory
        var oCNpc her; her = Hlp_GetNpc(hero);
        CatInv_SetSelectionFirst(_@(her.inventory2_vtbl));
    };

    CatInv_Update(ECX);
};
func void CatInv_Close() {
    if (Hlp_IsValidNpc(hero)) {
        var int i; i = CatInv_Reset(ESI);
    };
};
