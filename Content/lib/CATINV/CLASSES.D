class oCItemContainer {
  var int    vtbl;                                            // 0x00
  var int    contents;                                        // 0x04 zCListSort<oCItem>*
  var int    npc;                                             // 0x08 oCNpc*
  var string titleText;                                       // 0x0C zSTRING
  var int    invMode;                                         // 0x20 int
  var int    selectedItem;                                    // 0x24 int
  var int    offset;                                          // 0x28 int
  var int    maxSlotsCol;                                     // 0x2C int
  var int    maxSlotsColScr;                                  // 0x30 int
  var int    maxSlotsRow;                                     // 0x34 int
  var int    maxSlotsRowScr;                                  // 0x38 int
  var int    maxSlots;                                        // 0x3C int
  var int    marginTop;                                       // 0x40 int
  var int    marginLeft;                                      // 0x44 int
  var int    frame;                                           // 0x48 zBOOL
  var int    right;                                           // 0x4C zBOOL
  var int    ownList;                                         // 0x50 zBOOL
  var int    prepared;                                        // 0x54 zBOOL
  var int    passive;                                         // 0x58 zBOOL
  var int    TransferCount;                                   // 0x5C zINT
  var int    viewTitle;                                       // 0x60 zCView*
  var int    viewBack;                                        // 0x64 zCView*
  var int    viewItem;                                        // 0x68 zCView*
  var int    viewItemActive;                                  // 0x6C zCView*
  var int    viewItemHightlighted;                            // 0x70 zCView*
  var int    viewItemActiveHighlighted;                       // 0x74 zCView*
  var int    viewItemInfo;                                    // 0x78 zCView*
  var int    viewItemInfoItem;                                // 0x7C zCView*
  var int    textView;                                        // 0x80 zCView*
  var int    viewArrowAtTop;                                  // 0x84 zCView*
  var int    viewArrowAtBottom;                               // 0x88 zCView*
  var int    rndWorld;                                        // 0x8C zCWorld*
  var int    posx;                                            // 0x90 int
  var int    posy;                                            // 0x94 int
  var int    m_bManipulateItemsDisabled;                      // 0x98 zBOOL
  var int    m_bCanTransferMoreThanOneItem;                   // 0x9C zBOOL
};                                                            // 0xA0 sizeof_oCItemContainer


class oCNpcInventory {
  //oCItemContainer {
  var int    vtbl;                                            // 0x00
  var int    _oCItemContainer_contents;                       // 0x04 zCListSort<oCItem>*
  var int    _oCItemContainer_npc;                            // 0x08 oCNpc*
  var string _oCItemContainer_titleText;                      // 0x0C zSTRING
  var int    _oCItemContainer_invMode;                        // 0x20 int
  var int    _oCItemContainer_selectedItem;                   // 0x24 int
  var int    _oCItemContainer_offset;                         // 0x28 int
  var int    _oCItemContainer_maxSlotsCol;                    // 0x2C int
  var int    _oCItemContainer_maxSlotsColScr;                 // 0x30 int
  var int    _oCItemContainer_maxSlotsRow;                    // 0x34 int
  var int    _oCItemContainer_maxSlotsRowScr;                 // 0x38 int
  var int    _oCItemContainer_maxSlots;                       // 0x3C int
  var int    _oCItemContainer_marginTop;                      // 0x40 int
  var int    _oCItemContainer_marginLeft;                     // 0x44 int
  var int    _oCItemContainer_frame;                          // 0x48 zBOOL
  var int    _oCItemContainer_right;                          // 0x4C zBOOL
  var int    _oCItemContainer_ownList;                        // 0x50 zBOOL
  var int    _oCItemContainer_prepared;                       // 0x54 zBOOL
  var int    _oCItemContainer_passive;                        // 0x58 zBOOL
  var int    _oCItemContainer_TransferCount;                  // 0x5C zINT
  var int    _oCItemContainer_viewTitle;                      // 0x60 zCView*
  var int    _oCItemContainer_viewBack;                       // 0x64 zCView*
  var int    _oCItemContainer_viewItem;                       // 0x68 zCView*
  var int    _oCItemContainer_viewItemActive;                 // 0x6C zCView*
  var int    _oCItemContainer_viewItemHightlighted;           // 0x70 zCView*
  var int    _oCItemContainer_viewItemActiveHighlighted;      // 0x74 zCView*
  var int    _oCItemContainer_viewItemInfo;                   // 0x78 zCView*
  var int    _oCItemContainer_viewItemInfoItem;               // 0x7C zCView*
  var int    _oCItemContainer_textView;                       // 0x80 zCView*
  var int    _oCItemContainer_viewArrowAtTop;                 // 0x84 zCView*
  var int    _oCItemContainer_viewArrowAtBottom;              // 0x88 zCView*
  var int    _oCItemContainer_rndWorld;                       // 0x8C zCWorld*
  var int    _oCItemContainer_posx;                           // 0x90 int
  var int    _oCItemContainer_posy;                           // 0x94 int
  var int    _oCItemContainer_m_bManipulateItemsDisabled;     // 0x98 zBOOL
  var int    _oCItemContainer_m_bCanTransferMoreThanOneItem;  // 0x9C zBOOL
  //}
  var int    owner;                                           // 0xA0 oCNpc*
  var int    packAbility;                                     // 0xA4 zBOOL
  //zCListSort<oCItem> {
  var int    inventory_Compare;                               // 0xA8 int(_cdecl*)(oCItem*,oCItem*)
  var int    inventory_data;                                  // 0xAC oCItem*
  var int    inventory_next;                                  // 0xB0 zCListSort<oCItem>*
  //}
  var string packString;                                      // 0xB4 zSTRING
  var int    maxSlots;                                        // 0xC8 int
};                                                            // 0xCC sizeof_oCNpcInventory
