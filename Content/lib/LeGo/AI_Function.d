/***********************************\
             AI_Function
\***********************************/

//========================================
// [intern] Alias zu AI_Function
//========================================
func void _AI_Function(var c_npc slf, var string fnc) {
    AI_PlayAni(slf, ConcatStrings("CALL ", fnc));
};

//========================================
// Verzögert eine Funktion aufrufen
//========================================
func void AI_Function (var c_npc slf, var func function) {
    _AI_Function(slf, IntToString(MEM_GetFuncID(function)));
};
func void AI_Function_I(var c_npc slf, var func function, var int param) {
    var int s; s = SB_New();
    SB ("I ");
    SBi(param);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};
func void AI_Function_II(var c_npc slf, var func function, var int param1, var int param2) {
    var int s; s = SB_New();
    SB ("II ");
    SBi(param1);
    SB (" ");
    SBi(param2);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};
func void AI_Function_S(var c_npc slf, var func function, var string param) {
    var int s; s = SB_New();
    SB ("S ");
    SB (STR_Escape(param));
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};
func void AI_Function_SS(var c_npc slf, var func function, var string param1, var string param2) {
    var int s; s = SB_New();
    SB ("SS ");
    SB (STR_Escape(param1));
    SB (" ");
    SB (STR_Escape(param2));
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};
func void AI_Function_SI(var c_npc slf, var func function, var string param1, var int param2) {
    var int s; s = SB_New();
    SB ("SI ");
    SB (STR_Escape(param1));
    SB (" ");
    SBi(param2);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};
func void AI_Function_IS(var c_npc slf, var func function, var int param1, var string param2) {
    var int s; s = SB_New();
    SB ("IS ");
    SBi(param1);
    SB (" ");
    SB (STR_Escape(param2));
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};

//========================================
// [intern] Enginehook (MyLegoFuncs.d)
//========================================
// func void _AI_FUNCTION_EVENT() {
// };
