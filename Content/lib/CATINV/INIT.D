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
 * Initialization function
 */
func void CatInv_Init() {
    // Basic
    HookEngineF(oCItemContainer__OpenPassive, 7, CatInv_Open);
    HookEngineF(oCItemContainer__Close, 6, CatInv_Close);

    // Going right
    MemoryProtectionOverride(oCItemContainer__PrevItem_check1, 2);
    MemoryProtectionOverride(oCItemContainer__NextItem_check2, 1);
    HookEngineF(oCItemContainer__NextItem_check0, 5, CatInv_Right);

    // Going left
    MemoryProtectionOverride(oCItemContainer__PrevItem_check1, 2);
    MemoryProtectionOverride(oCItemContainer__PrevItem_check2, 1);
    HookEngineF(oCItemContainer__PrevItem_check0, 5, CatInv_Left);

    // Register extended key strokes (HOME/END for first/last category and keyWeapon for switching container)
    HookEngineF(oCItemContainer__HandleEvent_last, 6, CatInv_HandleEventEDI);
    HookEngineF(oCNpcContainer__HandleEvent_last, 6, CatInv_HandleEventEDI);
    HookEngineF(oCStealContainer__HandleEvent_last, 6, CatInv_HandleEventEDI);
    HookEngineF(oCViewDialogTrade__HandleEvent_last, 6, CatInv_HandleEventEBX);

    // Update on removing item
    HookEngineF(oCItemContainer__Remove_removeListNode, 5, CatInv_ContainerRemove);
    HookEngineF(oCNpcInventory__Remove_removeListNode, 5, CatInv_NpcInvRemove);
    HookEngineF(oCNpcInventory__RemoveByPtr_removeListNode, 5, CatInv_NpcInvRemoveByPtr);
    HookEngineF(oCNpcInventory__RemoveItem_removeListNode, 5, CatInv_NpcInvRemoveItem);

    // Update on inserting item
    HookEngineF(oCItemContainer__Insert_insertListNode, 5, CatInv_ContainerInsert);
    HookEngineF(oCNpcInventory__Insert_insertListNode, 6, CatInv_NpcInvInsert);

    // Reset category before opening dead inventory
    HookEngineF(oCNpc__OpenDeadNpc_setupInv, 6, CatInv_DeadResetCategory);

    // Draw category
    HookEngineF(oCItemContainer__DrawCategory_end, 5, CatInv_DrawCategory);

    if (!CatInv_Initialized) {
        // Handle equipped (active) items in trading menu
        MemoryProtectionOverride(oCItemContainer__CheckSelectedItem_isActive, 5);
        MEM_WriteByte(oCItemContainer__CheckSelectedItem_isActive, ASMINT_OP_nop);
        MEM_WriteInt(oCItemContainer__CheckSelectedItem_isActive+1, ASMINT_OP_add4ESP);
        HookEngineF(oCItemContainer__CheckSelectedItem_isActive, 5, CatInv_ClampCategory);
        MemoryProtectionOverride(oCItemContainer__CheckSelectedItem_isActiveP, 1);
        MEM_WriteByte(oCItemContainer__CheckSelectedItem_isActiveP, ASMINT_OP_shortJmp);

        // Revert changes of SystemPack 1.8 (Armor_unlock_in_trade, Armor_unlock_in_npc)
        if (MEM_ReadInt(oCStealContainer__CreateList_isArmor_sp18) == 0) {
            MemoryProtectionOverride(oCStealContainer__CreateList_isArmor_sp18, 4);
            MEM_WriteInt(oCStealContainer__CreateList_isArmor_sp18, /*0F 01 00 00*/ 271);
            CatInv_SP18Armor = TRUE;
        };
        if (MEM_ReadByte(oCNpcContainer__CreateList_isArmor_sp18) == 0) {
            MemoryProtectionOverride(oCNpcContainer__CreateList_isArmor_sp18, 1);
            MEM_WriteByte(oCNpcContainer__CreateList_isArmor_sp18, /*1A*/ 26);
            CatInv_SP18Armor = TRUE;
        };

        // Manipulate trading inventory
        MemoryProtectionOverride(oCStealContainer__CreateList_isArmor, 5);
        MEM_WriteByte(oCStealContainer__CreateList_isArmor, ASMINT_OP_nop);
        MEM_WriteInt(oCStealContainer__CreateList_isArmor+1, ASMINT_OP_add4ESP);
        HookEngineF(oCStealContainer__CreateList_isArmor, 5, CatInv_ManipulateCreateList);

        // Manipulate dead inventory
        MemoryProtectionOverride(oCNpcContainer__CreateList_isArmor, 5);
        MEM_WriteByte(oCNpcContainer__CreateList_isArmor, ASMINT_OP_nop);
        MEM_WriteInt(oCNpcContainer__CreateList_isArmor+1, ASMINT_OP_add4ESP);
        HookEngineF(oCNpcContainer__CreateList_isArmor, 5, CatInv_ManipulateCreateList);

        // Prevent closing dead inventory if actually non-empty
        MemoryProtectionOverride(oCNpcContainer__HandleEvent_isEmpty, 5);
        MEM_WriteByte(oCNpcContainer__HandleEvent_isEmpty, ASMINT_OP_nop);
        MEM_WriteInt(oCNpcContainer__HandleEvent_isEmpty+1, ASMINT_OP_nop4times);
        HookEngineF(oCNpcContainer__HandleEvent_isEmpty, 5, CatInv_PreventCloseDeadInv);

        // Register extended key strokes (HOME/END for first/last category and keyWeapon for switching container)
        MemoryProtectionOverride(oCNpcInventory__HandleEvent_keyWeaponJZ, 1);
        MemoryProtectionOverride(oCNpcInventory__HandleEvent_keyWeapon, 8);
        MEM_WriteInt(oCNpcInventory__HandleEvent_keyWeapon, ASMINT_OP_nop4times);
        MEM_WriteInt(oCNpcInventory__HandleEvent_keyWeapon+4, ASMINT_OP_nop4times);
        HookEngineF(oCNpcInventory__HandleEvent_keyWeapon, 8, CatInv_HandleEventNpcInventory);

        // Delay the mob camera switch
        MemoryProtectionOverride(oCAIHuman__ChangeCamModeBySituation_switchMobCam, 8);
        MEM_WriteInt(oCAIHuman__ChangeCamModeBySituation_switchMobCam, ASMINT_OP_add4ESP);
        MEM_WriteInt(oCAIHuman__ChangeCamModeBySituation_switchMobCam+4, ASMINT_OP_nop4times);
        HookEngineF(oCAIHuman__ChangeCamModeBySituation_switchMobCam, 8, CatInv_DelayMobCamera);

        CatInv_Initialized = 1;
    };

    // Introducing the INI entries if not present
    if (!MEM_GothOptExists("GAME", "invCatChangeOnLast")) {
        MEM_SetGothOpt("GAME", "invCatChangeOnLast", "1"); // G2U12: default set to 1: more intuitive
    };
    if (!MEM_GothOptExists("GAME", "invCatG1Mode")) {
        MEM_SetGothOpt("GAME", "invCatG1Mode", "1"); // G2U12: default set to 1
    };
    CatInv_ChangeOnLast = !!STR_ToInt(MEM_GetGothOpt("GAME", "invCatChangeOnLast"));
    CatInv_G1Mode       = !!STR_ToInt(MEM_GetGothOpt("GAME", "invCatG1Mode"));

    // Do not show 'all' category
    if (CatInv_G1Mode) && (!CatInv_ActiveCategory) {
        CatInv_ActiveCategory += 1;
    };
};
