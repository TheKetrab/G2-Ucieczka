/***************************************\
----- Functions called from engine -----
\***************************************/

// Equip weapons 
func void QS_EquipWeapon(var int itemPtr)
{
	var oCItem it; 	it = _^(itemPtr);
	if(!Npc_GetInvItem(hero, it.instanz))	{
		MEM_Info("QS_EquipWeapon: failed to GetInvIntem!");
		return;
	};
	
	var int address; address = oCNpc__EquipWeapon;
	if(item.flags & (ITEM_BOW | ITEM_CROSSBOW)) {
		address = oCNpc__EquipFarWeapon;
	};
	
	CALL_PtrParam	(_@(item));
    CALL__thiscall	(_@(hero), address);	
};

// Check animation
func int QS_IsAniActive(var string aniName)
{
	aniName = STR_Upper(aniName);
	
	CALL__thiscall(_@(hero), 	oCNpc__GetModel);
	var int model;  	model = CALL_RetValAsPtr();
	
	CALL_zStringPtrParam(aniName);
	CALL__thiscall		(model, zCModel__IsAnimationActive);
	return CALL_RetValAsInt();
};

// Check (Player has munition for ranged weapon)
func int QS_IsMunitionAvailable(var int itemPtr)
{
	CALL_PtrParam	(itemPtr);
	CALL__thiscall	(_@(hero), oCNpc__IsMunitionAvailable);
	return CALL_RetValAsInt();
};

//void __thiscall oCNpc::ClearEM(void) 	0x00746400
//func void oCNpc__
// oCMsgWeapon - Constructor
func int QS_oCMsgWeapon_Create(var int event, var int mode)
{	
	//CALL__thiscall(_@(hero),em);
	var int ptr; ptr = MEM_Alloc(oCMsgWeapon__sizeof);
	CALL_PtrParam	(0);		// bUseFist = FALSE!
    CALL_PtrParam	(mode);		// Weapon mode 
    CALL_PtrParam	(event);	// Event type
    CALL__thiscall	(ptr, oCMsgWeapon__oCMsgWeapon);
	
	return ptr;
};

// Send message to AI - Queue
func void QS_OnMessage(var int message)
{
	var int EM; 		EM 		= MEMINT_VobGetEM(_@(hero));
	if(EM && message)
    {
		/*var int arrptr; arrPtr = MEM_ReadInt(EM+64); if(arrPtr){
		/*MEM_ArrayClear (arrptr);  Printi(sizeof(arrPtr));};*/
		
		CALL_PtrParam	(_@(hero));
		CALL_PtrParam	(message); 
		CALL__thiscall	(EM, zCEventManager__OnMessage);
	};
};

// Mag_Book functions
// Get selected spell as (oCSpell*)
func int QS_GetSelectedSpell(var int magBook)
{
	CALL__thiscall(magBook, oCMagBook__GetSelectedSpell);
	return CALL_RetValAsPtr();
};

// Convert oCSpell* to oCItem*
func int QS_GetSpellItem	(var int magBook)
{
	var int spellPtr; spellPtr = QS_GetSelectedSpell(magBook);
	if(!spellPtr)	{
		return 0;
	};
	
	CALL_PtrParam	(spellPtr);
	CALL__thiscall	(magBook, oCMagBook__GetSpellItem);
	return CALL_RetValAsPtr();	
};

// Clear mag_book
func void QS_ClearMagBook(var int magBook)
{
	var int arrPtr; 	arrPtr 	= MEM_ReadInt(magBook + oCMagBook__items_offset + zCArray__array_offset);  
	var int arrSize; 	arrSize = MEM_ReadInt(magBook + oCMagBook__items_offset + zCArray__numInArray_offset);
	
	if(!arrPtr || !arrSize) {
		MEM_Info("QS_ClearMagBook: Array pointer, or array size is null!");
		return;
	};
	
	repeat(i, arrSize); var int i;
		var int itemPtr; itemPtr = MEM_ReadInt(arrPtr + (4 * i));
		if(itemPtr)	{
		
			// Remove Rune flag
			var C_ITEM it; it = _^(itemPtr);
			it.flags = it.flags &~ ITEM_ACTIVE;
			
			CALL_PtrParam	(itemPtr);
			CALL__thiscall	(magBook, oCMagBook__DeRegister);	
		};
	end;
};

// Register new rune
func void QS_RegisterRune(var int magBook, var int itemPtr)
{
	// Rune must have flag active!
	var C_ITEM it; it = _^(itemPtr);
	it.flags = it.flags | ITEM_ACTIVE;
	
	CALL_IntParam	(true);
	CALL_PtrParam	(itemPtr);
	CALL__thiscall	(magBook, oCMagBook__Register);
};


