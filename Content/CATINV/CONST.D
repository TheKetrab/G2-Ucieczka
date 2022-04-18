/*
 * This file is part of CatInv.
 * Copyright (C) 2018-2020  mud-freak (@szapp)
 *
 * CatInv is free software: you can redistribute it and/or
 * modify it under the terms of the MIT License.
 * On redistribution this notice must remain intact and all copies must
 * identify the original author.
 */


const int invCatOrder                                           =  9137120; //0x8B6BE0
const int oCItemContainer___vftable                             =  8635564; //0x83C4AC
const int oCItemContainer__ActivateNextContainer                =  7381328; //0x70A150
const int oCItemContainer__NextItem_check1                      =  7378846; //0x70979E
const int oCItemContainer__NextItem_check2                      =  7379134; //0x7098BE
const int oCItemContainer__PrevItem_check1                      =  7379779; //0x709B43
const int oCItemContainer__PrevItem_check2                      =  7380061; //0x709C5D
//const int oCNpc__CloseDeadNpc                                   =  7744320; //0x762B40
const int oCNpc__game_mode                                      = 11216848; //0xAB27D0
const int oCNpcContainer___vftable                              =  8635972; //0x83C644
const int oCNpcContainer__CreateList                            =  7386480; //0x70B570
const int oCNpcInventory___vftable                              =  8636180; //0x83C714
const int oCNpcInventory__HandleEvent_keyWeaponJZ               =  7402077; //0x70F25D
const int oCStealContainer___vftable                            =  8635764; //0x83C574
const int oCStealContainer__CreateList                          =  7384544; //0x70ADE0
const int s_openContainers_next                                 = 11210712; //0xAB0FD8
const int zCListSort_oCItem____scalar_deleting_destructor       =  7378480; //0x709630
const int zCListSort_oCItem___GetNumInList                      =  7409952; //0x711120
const int zCListSort_oCItem___InsertSort                        =  7409824; //0x7110A0
const int zCListSort_oCItem___Remove                            =  7869424; //0x7813F0
const int zCInput__IsBindedToggled                              =  5031024; //0x4CC470
const int zCInput_Win32__GetState                               =  5066032; //0x4D4D30
const int __ftol                                                =  8195912; //0x7D0F48
//const int zCView__anx                                           =  8019584; //0x7A5E80
const int zCView__Blit                                          =  8020928; //0x7A63C0
//const int zCView__ClrPrintwin                                   =  8036672; //0x7AA140
const int zCView__FontSize                                      =  8034832; //0x7A9A10
//const int zCView__InsertItem                                    =  8043216; //0x7ABAD0
const int zCView__PrintCXY                                      =  8036400; //0x7AA030
//const int zCView__RemoveItem                                    =  8043792; //0x7ABD10
const int zCView__SetAlphaBlendFunc                             =  8020080; //0x7A6070
//const int zCView__SetFontColor                                  =  8034576; //0x7A9910
//const int zCView__SetPos                                        =  8025520; //0x7A75B0
//const int zCView__SetSize                                       =  8026016; //0x7A77A0
const int zCView__SetTransparency                               =  8020064; //0x7A6060
const int CatInv_DefaultHeightAddr                              = 11210600; //0xAB0F68
const int CatInv_DefaultWidthAddr                               = 11210664; //0xAB0FA8
const int CatInv_BaseBlendFuncAddr    /*zRND_ALPHA_FUNC_BLEND*/ =  8635512; //0x83C478
const int CatInv_DefaultAlphaFuncAddr /*zRND_ALPHA_FUNC_BLEND*/ =  8635536; //0x83C490
const int CatInv_FontColorAddr        /* Default: white */      = 11210944; //0xAB10C0
const int CatInv_TitleTextureAddr     /* "INV_TITLE.TGA" */     = 11210968; //0xAB10D8
const int CatInv_BackTextureAddr[6] = {
    /* strInv_back           */    /* "INV_BACK.TGA"           */ 11210788, //0xAB1024
    /* strInv_back_container */    /* "INV_BACK_CONTAINER.TGA" */ 11210408, //0xAB0EA8
    /* strInv_back_plunder   */    /* "INV_BACK_PLUNDER.TGA"   */ 11210896, //0xAB1090
    /* strInv_back_steal     */    /* "INV_BACK_STEAL.TGA"     */ 11210852, //0xAB1064
    /* strInv_back_buy       */    /* "INV_BACK_BUY.TGA"       */ 11210748, //0xAB0FFC
    /* strInv_back_sell      */    /* "INV_BACK_SELL.TGA"      */ 11210832  //0xAB1050
};

/* Hooks */
const int oCAIHuman__ChangeCamModeBySituation_switchMobCam      =  6935573; //0x69D415
const int oCItemContainer__CheckSelectedItem_isActive           =  7378665; //0x7096E9
const int oCItemContainer__CheckSelectedItem_isActiveP          =  7378700; //0x70970C
const int oCItemContainer__Close                                =  7376717; //0x708F4D
const int oCItemContainer__DrawCategory_end                     =  7368195; //0x706E03
const int oCItemContainer__HandleEvent_last                     =  7383647; //0x70AA5F
const int oCItemContainer__Insert_insertListNode                =  7377878; //0x7093D6
const int oCItemContainer__NextItem_check0                      =  7378787; //0x709763
const int oCItemContainer__OpenPassive                          =  7374544; //0x7086D0
const int oCItemContainer__PrevItem_check0                      =  7379750; //0x709B26
const int oCItemContainer__Remove_removeListNode                =  7378055; //0x709487
const int oCNpc__OpenDeadNpc_setupInv                           =  7744024; //0x762A18
const int oCNpcContainer__CreateList_isArmor                    =  7386805; //0x70B6B5
const int oCNpcContainer__CreateList_isArmor_sp18               =  7386813; //0x70B6BD
const int oCNpcContainer__HandleEvent_isEmpty                   =  7387581; //0x70B9BD
const int oCNpcContainer__HandleEvent_last                      =  7387309; //0x70B8AD
const int oCNpcInventory__Insert_insertListNode                 =  7391400; //0x70C8A8
const int oCNpcInventory__Remove_removeListNode                 =  7393192; //0x70CFA8
const int oCNpcInventory__RemoveByPtr_removeListNode            =  7392546; //0x70CD22
const int oCNpcInventory__RemoveItem_removeListNode             =  7392311; //0x70CC37
const int oCNpcInventory__HandleEvent_keyWeapon                 =  7402065; //0x70F251
const int oCStealContainer__CreateList_isArmor                  =  7384900; //0x70AF44
const int oCStealContainer__CreateList_isArmor_sp18             =  7384909; //0x70AF4D
const int oCStealContainer__HandleEvent_last                    =  7385640; //0x70B228
const int oCViewDialogTrade__HandleEvent_last                   =  6862542; //0x68B6CE

const int oCViewDialogTrade_containerLeft_offset                =  12; //0x00C
const int oCViewDialogTrade_containerRight_offset               =  16; //0x010
const int oCViewDialogTrade_right_offset                        =  20; //0x014
const int oCViewDialogItemContainer_itemContainer_offset        = 256; //0x100

const int zOPT_GAMEKEY_WEAPON  = 8;

const int INV_MODE_PLAYER      = 0;
const int INV_MODE_MOB         = 1;
const int INV_MODE_DEAD        = 2;
const int INV_MODE_STEAL       = 3;
const int INV_MODE_TRADE_LEFT  = 4;
const int INV_MODE_TRADE_RIGHT = 5;

const int INV_CAT_GROUPS[INV_CAT_MAX] = {
    0,                                        // All
    ITEM_KAT_NF | ITEM_KAT_FF | ITEM_KAT_MUN, // INV_WEAPON  COMBAT
    ITEM_KAT_ARMOR,                           // INV_ARMOR   ARMOR
    ITEM_KAT_RUNE,                            // INV_RUNE    RUNE
    ITEM_KAT_MAGIC,                           // INV_MAGIC   MAGIC
    ITEM_KAT_FOOD,                            // INV_FOOD    FOOD
    ITEM_KAT_POTIONS,                         // INV_POTION  POTION
    ITEM_KAT_DOCS,                            // INV_DOC     DOCS
    ITEM_KAT_NONE | ITEM_KAT_LIGHT            // INV_MISC    OTHER
};


const int ASMINT_OP_nop4times = -1869574000; //0x90909090
const int ASMINT_OP_add4ESP   = -1878735741; //83 C4 04 90   add  esp, 4h
const int ASMINT_OP_shortJmp  =         235; //0xEB

const int CatInv_SP18Armor    = 0; // Indicate whether SystemPack has unlocked armors

var   int CatInv_ActiveCategory;
const int _CatInv_CurrentList = 0;
const int _CatInv_BackupList  = 0; // Only for oCItemContainer (NPCs handled differently)

const int CatInv_Initialized  = 0; // Global in case used elsewhere
const int CatInv_ChangeOnLast = 0;
const int CatInv_G1Mode       = 0;
