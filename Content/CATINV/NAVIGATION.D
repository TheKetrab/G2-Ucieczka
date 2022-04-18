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
 * Find first item in list that is non-active
 */
func int CatInv_NextNonActiveItem(var int list, var int max) {
    var int i; i = 0;
    var zCListSort l;
    while((list) && (i < max));
        l = _^(list);
        if (Hlp_Is_oCItem(l.data)) {
            var C_Item itm; itm = _^(l.data);
            if ((itm.flags & ITEM_ACTIVE) != ITEM_ACTIVE) {
                break;
            };
            i += 1;
        };
        list = l.next;
    end;
    return i;
};


/*
 * Find last item in list that is non-active
 */
func int CatInv_LastNonActiveItem(var int list, var int max) {
    var int i; i = 0;
    var int j; j = max;
    var zCListSort l;
    while((list) && (i < max));
        l = _^(list);
        if (Hlp_Is_oCItem(l.data)) {
            var C_Item itm; itm = _^(l.data);
            if ((itm.flags & ITEM_ACTIVE) != ITEM_ACTIVE) {
                j = i;
            };
            i += 1;
        };
        list = l.next;
    end;
    return j;
};


/*
 * Intercept moving the selection to the right ("next")
 */
func void CatInv_Right() {
    var oCItemContainer container; container = _^(ESI);
    var int switchView; switchView = 0; // -1 = no, 1 = yes, 0 = auto
    var int selLastCol; selLastCol = TRUE;

    if (CatInv_G1Mode) && (MEM_ReadInt(oCNpc__game_mode)) {
        // No action in steal/dead inventory in G1 mode
        switchView = 0;
    } else if (MEM_KeyPressed(KEY_LSHIFT)) || (MEM_KeyPressed(KEY_RSHIFT)) {
        // Quick-switch category
        switchView = -1;
        selLastCol = FALSE;
        var int dump; dump = CatInv_ShiftCategory(1);
    } else if (CatInv_ChangeOnLast) {
        // Calling this engine function is faster than counting in Daedalus
        var int numItems;
        var int contents; contents = container.contents;
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_PutRetValTo(_@(numItems));
            CALL__thiscall(_@(contents), zCListSort_oCItem___GetNumInList);
            call = CALL_End();
        };

        if (((container.selectedItem+1) % container.maxSlotsCol) == 0) || (container.selectedItem+1 >= numItems) {
            if (!CatInv_G1Mode) || (container.right) {
                // Switch category if at edge of inventory window
                if (CatInv_ShiftCategory(1)) {
                    switchView = -1;
                };
            };
        } else if (container.m_bManipulateItemsDisabled) {
            // Switch category if all items after the selection are active (equipped) in trading
            var int colToGo; colToGo = container.maxSlotsCol - ((container.selectedItem+1) % container.maxSlotsCol);
            var int list; list = List_NodeS(container.contents, (container.selectedItem+1 /* First list element empty */
                                                                                       +1 /* Moving selection */
                                                                                       +1 /* Counts from 1 */));
            if (CatInv_NextNonActiveItem(list, colToGo) == colToGo) {
                if (!CatInv_G1Mode) || (container.right) {
                    if (CatInv_ShiftCategory(1)) {
                        switchView = -1;
                    };
                };
            };
        };
    };

    if (switchView == -1) {
        if (selLastCol) {
            // Move selection to the last column
            container.selectedItem += container.maxSlotsCol - (container.selectedItem % container.maxSlotsCol) - 1;
        };

        // Update temporary memory of container properties (later restored onto container)
        MEM_WriteInt(ESP+12, container.selectedItem);
        MEM_WriteInt(ESP+8, container.offset);

        // Prevent switching view or moving selection into next row
        MEM_WriteByte(oCItemContainer__NextItem_check1, ASMINT_OP_nop);
        MEM_WriteByte(oCItemContainer__NextItem_check1+1, ASMINT_OP_jmp);
        MEM_WriteByte(oCItemContainer__NextItem_check2, /*84*/ 132);  // jz
    } else if (switchView == 1) {
        // Force switch view
        MEM_WriteByte(oCItemContainer__NextItem_check1, /*EB*/ 235);  // short jmp
        MEM_WriteByte(oCItemContainer__NextItem_check1+1, 35);        // Bytes
        MEM_WriteByte(oCItemContainer__NextItem_check2, /*85*/ 133);  // jnz
    } else {
        // Default (auto): Move selection to next row or switch view if applicable
        MEM_WriteByte(oCItemContainer__NextItem_check1, /*0F*/ 15);   // jge
        MEM_WriteByte(oCItemContainer__NextItem_check1+1, /*8D*/ 141);
        MEM_WriteByte(oCItemContainer__NextItem_check2, /*85*/ 133);  // jnz
    };
};


/*
 * Intercept moving the selection to the left ("previous")
 */
func void CatInv_Left() {
    var oCItemContainer container; container = _^(ESI);
    var int switchView; switchView = 0; // -1 = no, 1 = yes, 0 = auto

    if (CatInv_G1Mode) && (MEM_ReadInt(oCNpc__game_mode)) {
        // No action in steal/dead inventory in G1 mode
        switchView = 0;
    } else if (MEM_KeyPressed(KEY_LSHIFT)) || (MEM_KeyPressed(KEY_RSHIFT)) {
        // Quick-switch category
        switchView = -1;
        var int dump; dump = CatInv_ShiftCategory(-1);
    } else if (CatInv_ChangeOnLast) {
        if ((container.selectedItem % container.maxSlotsCol) == 0) || (container.selectedItem <= 0) {
            // Switch category if at edge of inventory window
            if (CatInv_ShiftCategory(-1)) {
                switchView = -1;
            };
        } else if (container.m_bManipulateItemsDisabled) {
            // Check if skipping active items in front of the selection
            var int colToGo; colToGo = container.selectedItem - (container.selectedItem % container.maxSlotsCol);
            var int list; list = List_NodeS(container.contents, (colToGo+1 /* First list element empty */
                                                                        +1 /* Counts from 1 */));
            if (CatInv_NextNonActiveItem(list, container.selectedItem) + colToGo == container.selectedItem) {
                if (CatInv_ShiftCategory(-1)) {
                    switchView = -1;
                };
            };
        };
    };

    if (switchView == -1) {
        // Update temporary memory of container properties (later restored onto container)
        MEM_WriteInt(ESP+16, container.selectedItem); // esp+24h-14h
        MEM_WriteInt(ESP+12, container.offset); // esp+24h-18h

        // Prevent switching view or moving selection into next row
        MEM_WriteByte(oCItemContainer__PrevItem_check1, ASMINT_OP_nop);
        MEM_WriteByte(oCItemContainer__PrevItem_check1+1, ASMINT_OP_jmp);
        MEM_WriteByte(oCItemContainer__PrevItem_check2, /*84*/ 132);  // jz
    } else if (switchView == 1) {
        // Force switch view
        MEM_WriteByte(oCItemContainer__PrevItem_check1, /*EB*/ 235);  // short jmp
        MEM_WriteByte(oCItemContainer__PrevItem_check1+1, 34);        // Bytes
        MEM_WriteByte(oCItemContainer__PrevItem_check2, /*85*/ 133);  // jnz
    } else {
        // Default (auto): Move selection to next row or switch view if applicable
        MEM_WriteByte(oCItemContainer__PrevItem_check1, /*0F*/ 15);   // jle
        MEM_WriteByte(oCItemContainer__PrevItem_check1+1, /*8E*/ 142);
        MEM_WriteByte(oCItemContainer__PrevItem_check2, /*85*/ 133);  // jnz
    };
};


/*
 * Switch to next open container
 */
func int CatInv_SwitchContainer(var int container) {
    // Disable switching for left-only inventory modes
    if (MEM_ReadInt(oCNpc__game_mode)) {
        return 0;
    };

    var oCItemContainer con; con = _^(container);
    var int dir; dir = -con.right; // To the left if dir < 0, to the right otherwise

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(dir));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(container), oCItemContainer__ActivateNextContainer);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Check if a key binding is toggled (== pressed once)
 */
func int CatInv_KeyBindingIsToggled(var int keyStroke, var int keyBinding) {
    var int zptr; zptr = MEM_ReadInt(zCInput_zinput);
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(keyStroke));
        CALL_IntParam(_@(keyBinding));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(zptr), zCInput__IsBindedToggled);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Check (additional) key strokes for most container types
 */
func void CatInv_HandleEvent(var int keyStroke, var int container) {
    var int dump;
    if (keyStroke == KEY_HOME) {
        if (MEM_KeyPressed(KEY_LSHIFT))
        || (MEM_KeyPressed(KEY_RSHIFT)) {
            // Only when not in G1 mode in steal/dead inventory
            if (!CatInv_G1Mode) || (!MEM_ReadInt(oCNpc__game_mode)) {
                dump = CatInv_SetCategoryFirst();
            };
        } else {
            CatInv_SetSelectionFirst(container);
        };
    } else if (keyStroke == KEY_END) {
        if (MEM_KeyPressed(KEY_LSHIFT))
        || (MEM_KeyPressed(KEY_RSHIFT)) {
            // Only when not in G1 mode in steal/dead inventory
            if (!CatInv_G1Mode) || (!MEM_ReadInt(oCNpc__game_mode)) {
                dump = CatInv_SetCategoryLast();
            };
        } else {
            CatInv_SetSelectionLast(container);
        };
    } else if (CatInv_KeyBindingIsToggled(keyStroke, zOPT_GAMEKEY_WEAPON)) {
        dump = CatInv_SwitchContainer(container);
    };
};
func void CatInv_HandleEventEDI() {
    CatInv_HandleEvent(EDI, ESI);
};
func void CatInv_HandleEventEBX() {
    var int viewDiaItmCon;
    if (MEM_ReadInt(EBP+oCViewDialogTrade_right_offset)) {
        viewDiaItmCon = MEM_ReadInt(EBP+oCViewDialogTrade_containerRight_offset);
    } else {
        viewDiaItmCon = MEM_ReadInt(EBP+oCViewDialogTrade_containerLeft_offset);
    };
    CatInv_HandleEvent(EBX, MEM_ReadInt(viewDiaItmCon+oCViewDialogItemContainer_itemContainer_offset));
};


/*
 * Check (additional) key strokes for oCNpcInventory (special case)
 */
func void CatInv_HandleEventNpcInventory() {
    EAX = CatInv_KeyBindingIsToggled(ESI, zOPT_GAMEKEY_WEAPON);
    if (EAX) {
        EAX = !CatInv_SwitchContainer(EBP);
    } else if (ESI == KEY_HOME) {
        if (MEM_KeyPressed(KEY_LSHIFT))
        || (MEM_KeyPressed(KEY_RSHIFT)) {
            // Only when not in G1 mode in steal/dead inventory
            if (!CatInv_G1Mode) || (!MEM_ReadInt(oCNpc__game_mode)) {
                EAX = CatInv_SetCategoryFirst();
            };
        } else {
            CatInv_SetSelectionFirst(EBP);
        };
        EAX = 0;
    } else if (ESI == KEY_END) {
        if (MEM_KeyPressed(KEY_LSHIFT))
        || (MEM_KeyPressed(KEY_RSHIFT)) {
            // Only when not in G1 mode in steal/dead inventory
            if (!CatInv_G1Mode) || (!MEM_ReadInt(oCNpc__game_mode)) {
                EAX = CatInv_SetCategoryLast();
            };
        } else {
            CatInv_SetSelectionLast(EBP);
        };
        EAX = 0;
    };

    // Exit function with true if EAX == 0, otherwise restore default behavior if EAX == 1
    MEM_WriteByte(oCNpcInventory__HandleEvent_keyWeaponJZ, /*0x12*/ 18 + !EAX * 2);
};


/*
 * Prevent dislocation of mob camera while pressing keyWeapon to switch the container
 */
func void CatInv_DelayMobCamera() {
    const int call = 0;
    if (CALL_Begin(call)) {
        // CALL_RetValIsFloat();
        CALL_IntParam(_@(zOPT_GAMEKEY_WEAPON));
        CALL__thiscall(_@(ECX), zCInput_Win32__GetState);
        CALL_PutRetValTo(_@(EAX));

        CALL__cdecl(__ftol);

        call = CALL_End();
    };

    var int timer;
    if (!EAX) {
        // Key not pressed
        timer = 0;
    } else if (timer < 500) {
        // Key has to have been pressed for 200 ms
        EAX = 0;
        timer += MEM_Timer.frameTime;
    };
};


/*
 * Check if any non-active items are to the left/right
 */
func void CatInv_ClampCategory() {
    var oCItemContainer container; container = _^(ESI);
    var C_Item itm; itm = _^(ECX);
    EAX = 0;

    if (!container.m_bManipulateItemsDisabled) {
        return;
    };

    if ((itm.flags & ITEM_ACTIVE) != ITEM_ACTIVE) {
        return;
    };

    // First, check for non-active items to the right ("next")
    var int list; list = List_NodeS(container.contents, (container.selectedItem+1 /* First list element is empty */
                                                                               +1 /* List_NodeS counts from 1 */));
    var int numItems; numItems = List_LengthS(list);
    var int iPos; iPos = CatInv_NextNonActiveItem(list, numItems);

    if (iPos != numItems) {
        // Found non-active item: Select it
        container.selectedItem += iPos;
        return;
    };

    // If unsuccessful, check for items to the left ("previous")
    list = List_NodeS(container.contents, 1 /* First list element is empty */
                                         +1 /* List_NodeS counts from 1 */);
    iPos = CatInv_LastNonActiveItem(list, container.selectedItem);
    if (iPos != container.selectedItem) {
        // Found non-active item: Select it
        container.selectedItem = iPos;
        return;
    };

    // Else: No non-active items found: Disable selection
    container.selectedItem = -1;
};
