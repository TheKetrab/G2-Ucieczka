var int D3D11_enabled;


// frees a library
func void FreeLibrary (var int ptr) {
	var int freelib;
	freelib = FindKernelDllFunction("FreeLibrary");

	if (!freelib) {
		return;
	};

	CALL_PtrParam(ptr);
	CALL__stdcall(freelib);
};


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
	   
	   FreeLibrary(lib);
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
		var int res; res = Print_Screen[PS_X];
	
		MEM_WriteInt (ptr+64, res);
		MEM_WriteInt (ptr+56, 0);
	};
};
