var int D3D11_enabled;
func void CheckDx11()
{
	var int lib; lib = LoadLibrary("ddraw.dll");
    
	if (lib) 
	{
		var int adr; adr = GetProcAddress(lib, "GDX_AddPointLocator");
    
       if (adr) 
	   {
           D3D11_enabled = true;
       }
	   else
	   {
		 D3D11_enabled = false;
	   };
	};

};

func void ResizeDialogBox()
{	
	if(!MEM_StackPos){
	MEM_InitGlobalInst();
	};
	
	if(!InfoManager_HasFinished())
	{	
		var int ptr; ptr = MEM_ReadInt(MEMINT_oCInformationManager_Address+28);
		var int res; res = Print_Screen[PS_X];// STR_ToInt (MEM_GetGothOpt ("VIDEO", "zVidResFullscreenX"));
		
		//if(D3D11_enabled)
		//{
		//	res = res  *2;
		//};
		
		MEM_WriteInt (ptr+64, res);
		MEM_WriteInt (ptr+56, 0);
	};
};
