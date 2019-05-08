const int 	QS_LockKeyWeapon_Delay	= 500; 
const int 	QS_RenderWorld 			= 0;	// zCWorld*
var int 	QS_BackgroundView;				// zCView*
var int 	QS_Data[10];					// CSlot*

var int 	QS_UseLastItem_Fix;		// Don't remove map etc. from Quickslot after Use
var int 	QS_LastWeaponSlot;		// 'keyWeapon' use this to use weapon from last slot
var int 	QS_KeyWeapon_Locked;	// fix for pressing 'keyWeapon'
var int 	QS_LastSpell_Item;		// fix for change spell to next spell from quickslot

class CSlot
{
	var int itemPtr; 
	var int itemInst;
	var int pView;
	var int pViewText;
};
INSTANCE CSlot@(CSlot);

// Init constants
const int QS_LeGo_Flags = LeGo_HookEngine		// For engine hooks
						| LeGo_PrintS			// For function "PrintS"
						| LeGo_View				// For zCView objects
						| LeGo_FrameFunctions;	// 'keyWeapon' fix
						
const int QuickSlot_Inited = 0;		

// Engine const
const int EV_DRAWWEAPON 	= 0;	// enum TWeaaponSubType	
const int EV_REMOVEWEAPON 	= 3;	// enum TWeaaponSubType	

// Adresy
const int zfactory						= 9276912; // 0x008D8DF0
const int zCConsole__cur_console 		= 11221316;// 0x00AB3944

const int oCGame__UpdateResolution		= 7089664; 	// 0x006C2E00
const int oCGame__UpdateResolution_Len	= 5; 		// 0x05


const int zCObjectFactory__CreateWorld 	= 5947120; // 0x005ABEF0
const int zCView__InsertItem 			= 8043216; // 0x007ABAD0
const int zCView__RemoveItem 			= 8043792; // 0x007ABD10
const int zCView__anx					= 8019584; // 0x007A5E80
const int zCView__any					= 8019648; // 0x007A5EC0
const int zCView__Print					= 8034880; // 0x007A9A40
const int zCView__PrintCX				= 8035920; // 0x007A9E50
const int zCView__SetPos            	= 8025520; // 0x007A75B0
const int zCView__ClrPrintwin         	= 8036672; // 0x007AA140

// oCNpc
const int oCNpc__CanUseItem				= 7543216; 	// 0x007319B0
const int oCNpc__EquipFarWeapon			= 7578384;	// 0x0073A310
const int oCNpc__CanDrawWeapon 			= 6817216; 	// 0x006805C0
const int oCNpc__HasMagic				= 7590784; 	// 0x0073D380
const int oCNpc__GetSlotItem			= 7544720; 	// 0x00731F90
const int oCNpc__IsMunitionAvailable	= 7587552; 	// 0x0073C6E0
const int oCNpc__CanUse					= 7543216;		// 0x007319B0
const int oCNpc__ClearEM 				= 7627776;  //0x746400

// Others
const int oCMsgManipulate__oCMsgManipulate	= 7768384;	// 0x00768940
const int oCMsgUseItem__oCMsgUseItem		= 7764752;	// 0x00767B10
const int oCMsgWeapon__oCMsgWeapon 			= 7759824;	// 0x007667D0
const int zCEventManager__OnMessage 		= 7889792; 	// 0x00786380
const int oCMagBook__GetSelectedSpell 		= 4683648;	// 0x00477780
const int oCMagBook__GetSpellItem 			= 4692992;	// 0x00479C00
const int oCMagBook__Register				= 4676528;	// 0x00475BB0	(oCItem*)
const int oCMagBook__DeRegister 			= 4676800;	// 0x00475CC0	(oCItem*)
const int zCModel__IsAnimationActive 		= 5727888; 	// 0x00576690
const int oCItemContainer__IsOpen 			= 7377408; 	// 0x00709200

const int zCArray__array_offset			= 0;  	// 0x00
const int zCArray__numAlloc_offset		= 4;  	// 0x04
const int zCArray__numInArray_offset	= 8;  	// 0x08

const int oCMagBook__items_offset 		= 12; 	// 0x0C
const int oCMsgManipulate__sizeof 		= 124; 	// 0x7C
const int oCMsgUseItem__sizeof 			= 80; 	// 0x50
const int oCMsgWeapon__sizeof 			= 80; 	// 0x50

const int zCWorld__bIsInventoryWorld_offset 			= 136;	// 0x88

// HookEngine lens & numBytes
const int oCMag_Book_SpellCast_Check_SpellBook_NumBytes = 5; // 0x05
const int oCItemContainer_Number_CheckFlag_NumBytes 	= 5; // 0x05
const int oCItemContainer_Draw_PrintText_Len 			= 6; // 0x06
const int oCItemContainer_Draw_NF_posX_Len 				= 7; // 0x07
const int oCItemContainer_Draw_FF_posX_Len 				= 5; // 0x05
const int oCNpcInventory__HandleEvent_Len 				= 6; // 0x06	
const int oCAIHuman__PC_WeaponMove_Len					= 6; // 0x06
const int oCMag_Book_SpellCast_Len 						= 7; // 0x07
const int oCNpc__OpenInventory_Len						= 6; // 0x06
const int oCGame__HandleEvent_Len 						= 7; // 0x07	
const int oCNpc__SetAsPlayer_Len						= 6; // 0x06
const int oCGame__RenderX_Len							= 6; // 0x06

// HookEngine
const int oCMag_Book_SpellCast_Check_SpellBook	= 4680906; // 0x00476CCA
const int oCItemContainer_Number_CheckFlag_2 	= 7373305; // 0x007081F9
const int oCItemContainer_Number_CheckFlag 		= 7372881; // 0x00708051
const int oCItemContainer_Draw_PrintText 		= 7372051; // 0x00708191
const int oCItemContainer_Draw_NF_posX 			= 7373201; // 0x00708191
const int oCItemContainer_Draw_FF_posX			= 7373635; // 0x00708343
const int oCAIHuman__PC_WeaponMove				= 6922464; // 0x0069A0E0
const int oCMag_Book_SpellCast 					= 4679584; // 0x004767A0
const int oCGame__HandleEvent	 				= 7324016; // 0x006FC170
const int oCNpc__SetAsPlayer					= 7612064; // 0x007426A0
			
// Small engine functions
func int QS_IsInvOpen()
{
	var oCNpc her; her = Hlp_GetNpc(hero);
	CALL__thiscall(_@(her.inventory2_vtbl), oCItemContainer__IsOpen);
	return CALL_RetValAsInt();
};

func void QS_UnlockKeyWeapon(){
	QS_KeyWeapon_Locked = false;
	FF_Remove(QS_UnlockKeyWeapon);
};

func void QS_LockKeyWeapon() {
	QS_KeyWeapon_Locked = TRUE;
	FF_ApplyOnceExt(QS_UnlockKeyWeapon, QS_LockKeyWeapon_Delay, 1);
};

func void QS_WriteNOP(var int address, var int numBytes)
{
	if(!IsHooked(address))	{
		return;
	};
	MemoryProtectionOverride(address, numBytes);
	repeat(i, numBytes); var int i;
		MEM_WriteByte(address+i, ASMINT_OP_nop);
	end;
};
