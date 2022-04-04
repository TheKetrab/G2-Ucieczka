
func void AI_Function_NI(var c_npc slf, var func function, var int param1, var int param2) {
    var int s; s = SB_New();
    SB ("NI ");
    SBi(param1);
    SB (" ");
    SBi(param2);
    SB (" ");
    SBi(MEM_GetFuncID(function));
    _AI_Function(slf, SB_ToString());
    SB_Destroy();
};

// U12 -> Uwaga! W AI_Function z LeGo dopisany przypadek obs³uguj¹cy NNII
func void Druzyna(var C_NPC slf, var int add)
{
	var int slfInst; slfInst = Hlp_GetInstanceID(slf);
	AI_Function_NI(hero,_Druzyna, slfInst, add);
};

func void _Druzyna(var C_NPC slf, var int add) //dodawanie lub odejmowanie goœcia z dru¿yny
{
	Print(slf.name);
	
	if (slf.guild > 16) { // <-- czyli jesli nie jest czlowiekiem
		slf.aivar[AIV_PARTYMEMBER]=TRUE; // bedzie partymemberem do smierci, wiec nie trzeba wylaczac
		return; // zeby nie modyfikowal licznika stanu druzyny
	};

	// ----- ----- ----- ----- -----

	if (add == 1) {
		if (slf.aivar[AIV_PARTYMEMBER] == FALSE) { StanDruzyny += 1; };
		slf.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	
	else if (add == 0) {
		if (slf.aivar[AIV_PARTYMEMBER] == TRUE) { StanDruzyny -= 1; };
		slf.aivar[AIV_PARTYMEMBER] = FALSE;
	}
	
	else {
		Print(ConcatStrings("Unknown state 'add' in 'Druzyna' func: ",IntToString(add)));
	};
	
	var string dru_tekst;
	dru_tekst = "Stan dru¿yny: ";
	dru_tekst = ConcatStrings(dru_tekst,IntToString(StanDruzyny));
	PrintS_Ext(dru_tekst, RGBA(255,255,255,0));
	PrintS_Ext(" ", RGBA(255,255,255,0));
	
	//PrintScreen (dru_tekst, -1, 50, FONT_ScreenSmall, 2);
};


func void ZwiekszDruzyne (var int ile) //zwiekszanie zmiennej
{
	StanDruzyny+=ile;

	var string dru_tekst;
	dru_tekst = "Stan dru¿yny: ";
	dru_tekst = ConcatStrings(dru_tekst,IntToString(StanDruzyny));
	PrintScreen (dru_tekst, -1, 50, FONT_ScreenSmall, 2);
};
