
func void Druzyna (var C_NPC slf) //dodawanie lub odejmowanie goœcia z dru¿yny
{
	if(slf.guild > 16) { // <-- czyli jesli nie jest czlowiekiem
		slf.aivar[AIV_PARTYMEMBER]=TRUE; // bedzie partymemberem do smierci, wiec nie trzeba wylaczac
		return; // zeby nie modyfikowal licznika stanu druzyny
	};

	if(slf.aivar[AIV_PARTYMEMBER]==TRUE){
		slf.aivar[AIV_PARTYMEMBER]=FALSE;
		StanDruzyny-=1;
	}
	else{
		slf.aivar[AIV_PARTYMEMBER]=TRUE;
		StanDruzyny+=1;
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
