//by SiemaczyS
func void oCNpc_UseItem(var c_npc slf, var int ItemInst) 
{
	if (!Npc_HasItems (slf, ItemInst)) {
		CreateInvItems (slf, ItemInst, 1);
    };
	
	if (!Npc_GetInvItem(slf, ItemInst)) {
	 return;
	};
	
	CALL_PtrParam(_@(item));
    CALL__thiscall(_@(slf), MEMINT_SwitchG1G2(6916112, 7584784)); 
};