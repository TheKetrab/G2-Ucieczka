func void ResizeDialogBox()
{	
	if(!MEM_StackPos){
	MEM_InitGlobalInst();
	};
	
	if(!InfoManager_HasFinished())
	{	
		var int ptr; ptr = MEM_ReadInt(MEMINT_oCInformationManager_Address+28);
		MEM_WriteInt (ptr+64, STR_ToInt (MEM_GetGothOpt ("VIDEO", "zVidResFullscreenX")));
		MEM_WriteInt (ptr+56, 0);
	};
};
