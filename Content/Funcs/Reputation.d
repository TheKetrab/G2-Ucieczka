var int RepBandyci_OneTime;
var int RepLowcy_OneTime;
var int RepMysliwi_OneTime;

// ----- REPUTACJA -----

var int rep_lowcy_s;
var int rep_mysliwi_s;
var int rep_bandyci_s;

const int REP_LOWCY=1;
const int REP_MYSLIWI=2;
const int REP_BANDYCI=3;

// ***** ***** DODAJ REPUTACJE ***** *****
FUNC VOID DodajReputacje(var int ile, var int ukogo){
 var string rep_tekst;
 if(ukogo==1){
  rep_tekst = "Reputacja u ³owców orków: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_lowcy_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_lowcy_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_lowcy_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
  PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
  
  if (rep_lowcy_s >= 100) && (RepLowcy_OneTime == FALSE)	{
		RepLowcy_OneTime = TRUE;
		AddAchievement(Acv20Title,Acv20Content);
	};
 }
 else if(ukogo==2){
  rep_tekst = "Reputacja u myœliwych: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_mysliwi_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_mysliwi_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_mysliwi_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
  PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
  
  if (rep_mysliwi_s >= 100) && (RepMysliwi_OneTime == FALSE)	{
		RepMysliwi_OneTime = TRUE;
		AddAchievement(Acv20Title,Acv20Content);
	};
 }
 else if(ukogo==3){
  rep_tekst = "Reputacja u bandytów: ";
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_bandyci_s));
  rep_tekst = ConcatStrings(rep_tekst,"+");
  rep_tekst = ConcatStrings(rep_tekst,IntToString(ile));
  rep_tekst = ConcatStrings(rep_tekst,"=");
  rep_bandyci_s+=ile;
  rep_tekst = ConcatStrings(rep_tekst,IntToString(rep_bandyci_s));
  rep_tekst = ConcatStrings(rep_tekst,".");
  //PrintScreen (rep_tekst, -1, 50, FONT_ScreenSmall, 2);
   PrintS_Ext(rep_tekst, RGBA(255,255,255,0));
  
	if (rep_bandyci_s >= 100) && (RepBandyci_OneTime == FALSE)	{
		RepBandyci_OneTime = TRUE;
		Snd_Play ("LEVELUP");
		PrintS_Ext("Premia za maksimum reputacji: +2 PN", RGBA(255,255,255,0));
		hero.lp = hero.lp + 2;
	};
 };
};


// ***** ***** PRINT MISSING REP ***** *****
func void PrintMissingRep(var int ile_potrzeba, var int ukogo) {

	var int your_rep;
	
	if (ukogo == REP_LOWCY) { your_rep = rep_lowcy_s; }
	else if (ukogo == REP_MYSLIWI) { your_rep = rep_mysliwi_s; }
	else if (ukogo == REP_BANDYCI) { your_rep = rep_bandyci_s; }
	else { /* ERROR */ your_rep = 0; };

	//PrintScreen	(ConcatStrings("Brakuje reputacji: ",IntToString(ile_potrzeba-your_rep)), -1, 45, FONT_ScreenSmall, 2);
	 PrintS_Ext(ConcatStrings("Brakuje reputacji: ",IntToString(ile_potrzeba-your_rep)), RGBA(255,255,255,0));
};

// ***** ***** REP ENOUGH ***** *****
func int RepEnough(var int ile, var int ukogo) {

	if (ukogo == REP_LOWCY) && (rep_lowcy_s >= ile) {
		return TRUE;
	};
	
	if (ukogo == REP_MYSLIWI) && (rep_mysliwi_s >= ile) {
		return TRUE;
	};

	if (ukogo == REP_BANDYCI) && (rep_bandyci_s >= ile) {
		return TRUE;
	};

	return FALSE;
};