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
 * Re-implementation of oCNpcContainer::IsEmpty, which is an "abandoned", bugged function
 */
func int CatInv_NpcContainerIsEmpty(var int container, var int includeEquipped, var int includeArmor) {
    var oCNpcInventory con; con = _^(container);
    if (con.owner) {
        var oCNpc owner; owner = _^(con.owner);
        var int list; list = _@(owner.inventory2_inventory_Compare);
        var zCListSort l; l = _^(list);
        if (l.next) {
            while(list);
                l = _^(list);
                if (Hlp_Is_oCItem(l.data)) {
                    var C_Item itm; itm = _^(l.data);
                    if (includeEquipped || ((itm.flags & ITEM_ACTIVE) != ITEM_ACTIVE))
                    && (includeArmor || (itm.mainflag != ITEM_KAT_ARMOR)) {
                        return FALSE;
                    };
                };
                list = l.next;
            end;
        };
    };
    return TRUE;
};


/*
 * Intercept auto-closing of dead inventory once supposedly empty
 */
func void CatInv_PreventCloseDeadInv() {
    if (CatInv_NpcContainerIsEmpty(ESI, 0, 0)) {
        // Previously overwritten by hook
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL__thiscall(_@(ECX), oCNpc__CloseDeadNpc);
            call = CALL_End();
        };
    };
};


/*
 * Reset category on opening dead inventory
 */
func void CatInv_DeadResetCategory() {
    if (!CatInv_G1Mode) {
        CatInv_SetCategoryFirst();
    };
};
